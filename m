From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Mar 2017 14:56:03 +0000
Subject: [Buildroot] [Bug 9756] New: glibc fails to build on
 buildroot-sh4*-buildroot-linux-gnu
Message-ID: <bug-9756-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9756

            Bug ID: 9756
           Summary: glibc fails to build on
                    buildroot-sh4*-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

glibc fails to build on buildroot-{sh4,sh4a,sh4eb,sh4aeb}-buildroot-linux-gnu,
see below.

Tested on git as of today (2b2e216ee0cb6894b0012316c20da9291ce14458):
 - make menuconfig
 - Select sh4
 - Select "Build options -> libraries (both shared and static)"
 - Select "Toolchain -> C library (glibc)" (default version 2.24)
 - Select "Toolchain -> Enable C++ support"

Everything else is default. Trying other versions of glibc doesn't seem to make
any difference. It seems to happen on all sh4* variants apparently, though some
more testing might be required there. Host gcc is 6.3.0.

Log snippet:

a - inet/getsrvbynm.o
a - inet/getsrvbynm_r.o
a
-[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/libc_pic.a(dl-addr.os):
In function `_dl_addr_inside_object':
dl-addr.c:(.text+0x230): multiple definition of `_dl_addr_inside_object'
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/dl-allobjs.os:(.text+0x10f08):
first defined here
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/libc_pic.a(init-first.os):(.data+0x0):
multiple definition of `__libc_multiple_libcs'
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/dl-allobjs.os:(.bss+0x74):
first defined here
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/libc_pic.a(_itoa.os):
In function `_itoa':
_itoa.c:(.text+0xe0): multiple definition of `_itoa'
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/dl-allobjs.os:(.text+0x13474):
first defined here
collect2: error: ld returned 1 exit status
Makefile:349: recipe for target
'[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/librtld.map'
failed
make[3]: ***
[[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/librtld.map]
Error 1
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/bin/sh4-buildroot-linux-gnu-gcc
ldconfig.c -c -std=gnu11 -fgnu89-inline  -O2 -Wall -Werror -Wundef
-Wwrite-strings -fmerge-all-constants -frounding-math -Wstrict-prototypes
-Wold-style-definition -mieee  -D'SYSCONFDIR="/etc"' -D'LIBDIR="/usr/lib"'
-D'SLIBDIR="/lib"'        -I../include
-I[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf 
-I[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build 
-I../sysdeps/unix/sysv/linux/sh/sh4  -I../sysdeps/unix/sysv/linux/sh 
-I../sysdeps/sh/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread 
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv 
-I../sysdeps/unix/sh  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/sh/sh4/fpu  -I../sysdeps/sh/sh4  -I../sysdeps/sh 
-I../sysdeps/sh/soft-fp  -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/flt-32 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/lib/gcc/sh4-buildroot-linux-gnu/5.4.0/include
-isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/lib/gcc/sh4-buildroot-linux-gnu/5.4.0/include-fixed
-isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/sh4-buildroot-linux-gnu/sysroot/usr/include
 -D_LIBC_REENTRANT -include
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/libc-modules.h
-DMODULE_NAME=ldconfig -include ../include/libc-symbols.h       -o
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/ldconfig.o
-MD -MP -MF
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/ldconfig.o.dt
-MT
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/ldconfig.o
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/bin/sh4-buildroot-linux-gnu-gcc
pldd.c -c -std=gnu11 -fgnu89-inline  -O2 -Wall -Werror -Wundef -Wwrite-strings
-fmerge-all-constants -frounding-math -Wstrict-prototypes
-Wold-style-definition -mieee          -I../include
-I[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf 
-I[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build 
-I../sysdeps/unix/sysv/linux/sh/sh4  -I../sysdeps/unix/sysv/linux/sh 
-I../sysdeps/sh/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread 
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv 
-I../sysdeps/unix/sh  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/sh/sh4/fpu  -I../sysdeps/sh/sh4  -I../sysdeps/sh 
-I../sysdeps/sh/soft-fp  -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/flt-32 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/lib/gcc/sh4-buildroot-linux-gnu/5.4.0/include
-isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/lib/gcc/sh4-buildroot-linux-gnu/5.4.0/include-fixed
-isystem
[...]/buildroot-sh4-buildroot-linux-gnu/output/host/usr/sh4-buildroot-linux-gnu/sysroot/usr/include
 -D_LIBC_REENTRANT -include
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/libc-modules.h
-DMODULE_NAME=nonlib -include ../include/libc-symbols.h       -o
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/pldd.o
-MD -MP -MF
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/pldd.o.dt
-MT
[...]/buildroot-sh4-buildroot-linux-gnu/output/build/glibc-2.24/build/elf/pldd.o
 inet/getsrvbypt.o
a - inet/getsrvbypt_r.o
a - inet/getservent.o

-- 
You are receiving this mail because:
You are on the CC list for the bug.
