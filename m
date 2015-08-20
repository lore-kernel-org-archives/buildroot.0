From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 20 Aug 2015 13:10:25 +0000
Subject: [Buildroot] Target/full GDB fails to build statically
Message-ID: <4881796E12491D4BB15146FE0209CE6465785322@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried to build gdb statically in latest Buildroot but with no luck.
My defconfig is:
----------------->8-----------------
BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
----------------->8-----------------

And that's what I see in the very end:
----------------->8-----------------
linux-thread-db.c:23:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>
                   ^
compilation terminated.
Makefile:1078: recipe for target 'linux-thread-db.o' failed
make[4]: *** [linux-thread-db.o] Error 1
make[4]: *** Waiting for unfinished jobs....
Makefile:8335: recipe for target 'all-gdb' failed
make[3]: *** [all-gdb] Error 2
Makefile:832: recipe for target 'all' failed
make[2]: *** [all] Error 2
----------------->8-----------------

Seeing that GDB is not disabled in case of BR2_STATIC_LIBS=y I had a hope it could
be built. But looks like something is broken.

I tried the same for ARC (where we use pretty recent gdb 7.9.1) and got exactly
the same result.

If BR2_PACKAGE_GDB_DEBUGGER is disabled gdbserver gets built perfectly fine.
----------------->8-----------------
$ file build/gdb-7.8.2/gdb/gdbserver/gdbserver 
build/gdb-7.8.2/gdb/gdbserver/gdbserver: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, not stripped
----------------->8-----------------

So whether we need to disable building of target/full gdb statically or somebody will need to look into it.
Given close relese of 2015.08 we may want to implement a former approach.

Still thought are much appreciated.

-Alexey
