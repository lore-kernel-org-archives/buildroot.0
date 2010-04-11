From: Andrew Porritt <aporritt@gogo-robot.com>
Date: Sun, 11 Apr 2010 14:03:28 +0100
Subject: [Buildroot] C++ support seems to break uClibc compilation
Message-ID: <000901cad977$63606dc0$2a214940$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

I've been trying to track down why re-running make after a successful
compilation of buildroot (version 2010.02) give errors, so I've been
stopping the compilation process at various points and restarting it. Each
time it restarts, it rebuilds uClibc first, which works fine until I restart
it after libstdc++ has been build and installed, then rebuilding uClibc
fails with:

 

  CC libc/stdlib/atexit.os

  CC libc/stdlib/system.os

  AR cr lib/libc.a

  STRIP -x -R .note -R .comment lib/libc.a

  AR cr lib/uclibc_nonshared.a

  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a

  AR cr libc/libc_so.a

  STRIP -x -R .note -R .comment libc/libc_so.a

  LD libuClibc-0.9.30-git.so

libc/libc_so.a(sigaction.os): In function `sigaction':

sigaction.c:(.text+0xa8): undefined reference to `__emutls_get_address'

collect2: ld returned 1 exit status

make[1]: *** [lib/libc.so] Error 1

make[1]: Leaving directory
`/home/jdoe/buildroot-2010.02/output/toolchain/uClibc-snapshot'

make: *** [/home/jdoe/buildroot-2010.02/output/staging/usr/lib/libc.a] Error
2

 

I'm building on an x86 for ARM, using GCC 4.4.x, a custom Linux Kernel
V2.6.33 and this nptl version of uClibc:

39548d72297a8c3d8d55e04b8240e4ce09913a82

Snapshot:

http://git.uclibc.org/uClibc/snapshot/uClibc-39548d72297a.tar.bz2

I've enabled large file support, IPv6, locale/i18n support, build/install
c++ compiler and libstdc++ and ARM VFPU and I've enabled the following
packages:

gettext

libintl

libiconv

libglib2

 

I've also added mono as a package, but at the point the toolchain breaks, it
hasn't been built yet.

 

I'm not sure why building the C++ compiler / libstdc++ should affect
building uClibc, but it seems to. Perhaps I should be using uClibc++, but
there's no option in buildroot.

 

Thanks.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100411/fadd1941/attachment.htm>
