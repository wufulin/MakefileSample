all: main

main:main.o stack.o maze.o
	gcc $^ -o $@

.PHONY:clean

clean:
	@echo "cleanning project"
	-rm main *.o *.d
	@echo "clean completed"

sources = main.c stack.c maze.c

include $(sources:.c=.d)

%.d: %.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$; \
	rm -f $@
