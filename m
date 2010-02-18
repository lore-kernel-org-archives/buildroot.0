From: Drasko DRASKOVIC <drasko.draskovic@gmail.com>
Date: Thu, 18 Feb 2010 23:09:18 +0100
Subject: [Buildroot] Errors during building ARM7TDMI uClibc toolchain with
	Buildroot
In-Reply-To: <5ec3d7931002181403i291df481jca2f21bfa3e12083@mail.gmail.com>
References: <5ec3d7931002181403i291df481jca2f21bfa3e12083@mail.gmail.com>
Message-ID: <5ec3d7931002181409q19bf7addvf5cf836db6b87d08@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi gurus,
last several days I have been struggling with Buildroot in order to compile
cross-toolchain with uClibc for ARM7TDMI architecture.

I attached my Buildroot config (.config file) and uClibc config I am using.

Here are the difficulties I found and some questions:

1) I choose ARM7TDMI architecture, EABI

2) TARGET FILE FORMAT -- I had to choose STATIC FLAT
Not the FDPIC ELF given by default, as it is not supported by ARM7TDMI:
cc1: error: unrecognized command line option "-mfdpic"

QUESTION
Why do we even have a choice for 4 different file format, when only one of
offered can be compiled on MMU-less ARM7?

3) FORK breaks on uClibc compilation:

libc/unistd/daemon.c:58: error: 'fork' undeclared here (not in a function)
libc/unistd/daemon.c:58: warning: type defaults to 'int' in declaration of
'fork'
make[1]: *** [libc/unistd/daemon.os] Error 1
make[1]: Leaving directory
`/home/drasko/buildroot/output/toolchain/uClibc-0.9.30.2'
make: ***
[/home/drasko/buildroot/output/toolchain/uClibc-0.9.30.2/lib/libc.a] Error 2
drasko at Marx:~/buildroot$

WORKAROUND
drasko at Marx:~/buildroot$ make uclibc-menuconfig
uClibc development/debugging options  --->  Enter any extra CFLAGS to use to
build uClibc => -Dfork=vfork

QUESTION:
Why? uClibc 9.30 is broken? Malconfigured?

http://lists.busybox.net/pipermail/uclibc/2009-March/042129.html
http://lists.uclibc.org/pipermail/uclibc/2003-April/026938.html
http://lists.busybox.net/pipermail/buildroot/2006-October/012511.html

4) ERROR - very odd error with __uClibc_fini:
/home/drasko/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os): In
function `__uClibc_fini':
__uClibc_main.c:(.text+0x6c): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x74): undefined reference to `__fini_array_end'
/home/drasko/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os): In
function `__uClibc_main':
__uClibc_main.c:(.text+0x250): undefined reference to
`__preinit_array_start'
__uClibc_main.c:(.text+0x254): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x25c): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x260): undefined reference to `__init_array_end'
/home/drasko/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
./libgcc_s.so.1.tmp: hidden symbol `__fini_array_end' isn't defined
/home/drasko/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[3]: *** [libgcc_s.so] Error 1
make[3]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/arm-linux-uclibcgnueabi/libgcc'
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final'
make: ***
[/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/.compiled] Error 2
drasko at Marx:~/buildroot$

WORKAROUND
in uClibc config disable ctors and dtors support.

QUESTION:
Why is this necessary and what is the connection between these?


5) ERROR
In file included from
/home/drasko/buildroot/output/toolchain/gcc-4.3.4/libmudflap/mf-hooks1.c:58:
/home/drasko/buildroot/output/staging/usr/include/unistd.h:243: error: two
or more data types in declaration specifiers
make[5]: *** [mf-hooks1.lo] Error 1
make[5]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/arm-linux-uclibcgnueabi/libmudflap'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/arm-linux-uclibcgnueabi/libmudflap'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/arm-linux-uclibcgnueabi/libmudflap'
make[2]: *** [all-target-libmudflap] Error 2
make[2]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final'
make: ***
[/home/drasko/buildroot/output/toolchain/gcc-4.3.4-final/.compiled] Error 2
drasko at Marx:~/buildroot$ gvim naputak.txt
drasko at Marx:~/buildroot$

WORKAROUND
(in the buildroot main Makefile)
make menuconfig --> Toolchain --> Additional gcc options -->
--disable-libmudflap

QUESTION
Why this library has to be disabled?


6) ERROR cannot stat `/home/drasko/buildroot/output/target/usr/bin/ldd': No
such file or directory

make[1]: Entering directory
`/home/drasko/buildroot/output/toolchain/uClibc-0.9.30.2'
make[2]: Nothing to be done for `utils'.
make[2]: Nothing to be done for `utils_install'.
make[1]: Leaving directory
`/home/drasko/buildroot/output/toolchain/uClibc-0.9.30.2'
mkdir -p
/home/drasko/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/target_utils
install -c /home/drasko/buildroot/output/target/usr/bin/ldd \

/home/drasko/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/target_utils/ldd
install: cannot stat `/home/drasko/buildroot/output/target/usr/bin/ldd': No
such file or directory
make: *** [/home/drasko/buildroot/output/target/usr/bin/ldd] Error 1

WORKAROUND
drasko at Marx:~/buildroot$ touch
/home/drasko/buildroot/output/target/usr/bin/ldd
(like mentioned here http://sites.google.com/site/linuxonpspproject/)

QUESTION
What is happening here? Why ldd? We are building static (bare-metal)
toolchain...

7) ERROR:
/home/drasko/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ldconfig
-r /home/drasko/buildroot/output/target 2>/dev/null
make: *** [target-finalize] Error 127
drasko at Marx:~/buildroot$ ls
/home/drasko/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ldconfig
ls: cannot access
/home/drasko/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ldconfig:
No such file or directory
drasko at Marx:~/buildroot$

QUESTION
I have no idea how to solve this one. Why arm-linux-uclibcgnueabi-ldconfig
is missing/not created during build process

Many thanks and best regards,
Drasko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100218/97a18786/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17631 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100218/97a18786/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibC-0.9.30.2.config
Type: application/octet-stream
Size: 5696 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100218/97a18786/attachment-0003.obj>
