From: Flemming Madsen <madsenco@gmail.com>
Date: Wed, 17 Sep 2008 11:33:33 +0200
Subject: [Buildroot] Cannot build uclibc++ against toolchain
	(dl_iterate_phdr & __tls_get_addr)
Message-ID: <97e646690809170233k12f5ae5iad2048e8197a3ef8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

First of all: Thank you codepoet folks for all this wonderful stuff!

I am having touble building uclibc++ Upon linking the .so file i get the
output below.

It seems that the eh_globals.o and unwind-dw2-fde-glibc.o files are
extracted from gcc libraries, but that they contain references to functions
that are not part of uClibc (Not libc.so anyway)

I have tried to enable sjlj (setjmp() longjmp()) exceptions and new thread
libraries in the buildroot config but this does not seem to help.

I am using gcc 4.2.4 and uClibc 0.9.29 since these were the defaults (Full
.config attached)

Any help on this will be very much appreciated.

TIA
/Flemming


WRAPPER_INCLUDEDIR=-I../include ../bin/g++-uc  -Wall -Wno-trigraphs
-pedantic   -ansi  -Os -fPIC -o vector.o -c vector.cpp
arm-linux-uclibc-strip -x -R .note -R .comment vector.o
WRAPPER_INCLUDEDIR=-I../include ../bin/g++-uc  -Wall -Wno-trigraphs
-pedantic   -ansi  -Os -fPIC -o abi/abi.o -c abi/abi.cpp
arm-linux-uclibc-strip -x -R .note -R .comment abi/abi.o
arm-linux-uclibc-ar rcs libuClibc++.a algorithm.o associative_base.o
bitset.o char_traits.o complex.o del_op.o del_opnt.o del_opv.o del_opvnt.o
deque.o eh_alloc.o eh_globals.o exception.o fstream.o func_exception.o
iomanip.o ios.o iostream.o istream.o iterator.o limits.o list.o locale.o
map.o new_handler.o new_op.o new_opnt.o new_opv.o new_opvnt.o numeric.o
ostream.o queue.o set.o sstream.o stack.o stdexcept.o streambuf.o string.o
utility.o valarray.o vector.o abi/abi.o abi/libgcc_eh/gthr-gnat.o
abi/libgcc_eh/unwind-c.o abi/libgcc_eh/unwind-dw2-fde-glibc.o
abi/libgcc_eh/unwind-dw2.o abi/libgcc_eh/unwind-sjlj.o
abi/libsupc/cp-demangle.o abi/libsupc/eh_arm.o abi/libsupc/eh_aux_runtime.o
abi/libsupc/eh_call.o abi/libsupc/eh_catch.o abi/libsupc/eh_exception.o
abi/libsupc/eh_personality.o abi/libsupc/eh_term_handler.o
abi/libsupc/eh_terminate.o abi/libsupc/eh_throw.o abi/libsupc/eh_type.o
abi/libsupc/eh_unex_handler.o abi/libsupc/guard.o abi/libsupc/tinfo.o
abi/libsupc/tinfo2.o abi/libsupc/vec.o abi/libsupc/vterminate.o
arm-linux-uclibc-ranlib libuClibc++.a
arm-linux-uclibc-gcc -Wl,--warn-common -Wl,--warn-once -Wl,-z,combreloc
-Wl,-z,defs -nodefaultlibs -shared -Wl,-soname,libuClibc++.so.0 `echo ""`
-Wl,-s -o libuClibc++-0.2.2.so algorithm.o associative_base.o bitset.o
char_traits.o complex.o del_op.o del_opnt.o del_opv.o del_opvnt.o deque.o
eh_alloc.o eh_globals.o exception.o fstream.o func_exception.o iomanip.o
ios.o iostream.o istream.o iterator.o limits.o list.o locale.o map.o
new_handler.o new_op.o new_opnt.o new_opv.o new_opvnt.o numeric.o ostream.o
queue.o set.o sstream.o stack.o stdexcept.o streambuf.o string.o utility.o
valarray.o vector.o abi/abi.o abi/libsupc/cp-demangle.o abi/libsupc/eh_arm.o
abi/libsupc/eh_aux_runtime.o abi/libsupc/eh_call.o abi/libsupc/eh_catch.o
abi/libsupc/eh_exception.o abi/libsupc/eh_personality.o
abi/libsupc/eh_term_handler.o abi/libsupc/eh_terminate.o
abi/libsupc/eh_throw.o abi/libsupc/eh_type.o abi/libsupc/eh_unex_handler.o
abi/libsupc/guard.o abi/libsupc/tinfo.o abi/libsupc/tinfo2.o
abi/libsupc/vec.o abi/libsupc/vterminate.o abi/libgcc_eh/gthr-gnat.o
abi/libgcc_eh/unwind-c.o abi/libgcc_eh/unwind-dw2-fde-glibc.o
abi/libgcc_eh/unwind-dw2.o abi/libgcc_eh/unwind-sjlj.o
-L/opt/toolchain-stable/t26/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/ -lc
-lgcc -ldl -Wl,--as-needed -lgcc_s -Wl,--no-as-needed
eh_globals.o: In function `__cxa_get_globals':
eh_globals.cpp:(.text+0xc): undefined reference to `__tls_get_addr'
abi/libgcc_eh/unwind-dw2-fde-glibc.o: In function `_Unwind_Find_FDE':
unwind-dw2-fde-glibc.c:(.text+0x17b8): undefined reference to `
dl_iterate_phdr'
collect2: ld returned 1 exit status
make[1]: *** [libuClibc++-0.2.2.so] Error 1
make[1]: Leaving directory
`/home/fm/amplex/embedded/arm9/rootdisk/uclibcpp/uClibc++-0.2.2/src'
make: *** [all] Error
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080917/a429d2c7/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-config.gz
Type: application/x-gzip
Size: 4366 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080917/a429d2c7/attachment-0001.bin 
