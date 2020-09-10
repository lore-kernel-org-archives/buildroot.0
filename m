From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Sep 2020 12:05:36 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
Message-ID: <20200910120536.2431494d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As part of the https://toolchains.bootlin.com project, I've tried to
rebuild 175 toolchains on top of Buildroot 2020.08, and encountered a
number of failures, which are summarized below.

Damien, Alistair: there is an issue with the RISC-V 32-bit toolchain.
Could you have a look, and tell us if you have some suggestions?

ARC maintainers: all ARC toolchains are failing to build due to the use
of a recent gdb where gdbserver was moved to the top-level. However, it
doesn't seem to be that easy to build just gdbserver in those recent
gcc versions. I have posted a question about this on the gdb@ mailing
list: https://sourceware.org/pipermail/gdb/2020-September/048888.html.

Matt, there are some PowerPC64 build issues as well. Have you ever seen
them, do you have any hints?

There are also issues on other platforms, AArch64, x86-64, Microblaze, etc.

See below the full details:

AArch64
=======

- aarch64--musl--stable
  https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359478

  build failure while building gdb, with redefinitions of C library
  structures

ARC
===

All configurations are failing

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359481
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359482
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359483
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359484
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359485
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359487

Issue is caused by the recent version of gdb, where gdbserver has been
moved from gdb/gdbserver/ to gdbserver/. However, the story is not so
simple: you can't simply go in gdbserver/ and run ./configure from it,
that doesn't work anymore.

ARMv7-M
=======

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359529

Build failures while building afboot-stm32, most likely due to gcc
10.x emitting calls to memcpy().

Fixed by:

https://patchwork.ozlabs.org/project/buildroot/patch/20200910094608.1251382-1-thomas.petazzoni at bootlin.com/

Microblaze
==========

All the "bleeding edge" configurations fail to boot under Qemu.

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359536
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359538
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359540
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359542
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359544
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359546

PowerPC64 (big and little endian) Power 8
=========================================

Both the glibc stable and bleeding edge are failing to build libstdc++
in host-gcc-final. Interesingly, the musl configurations work fine.

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359625
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359626
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359621
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622

RISC-V ILP32D
=============

The only configuration (glibc) fails to build in glibc, with a bunch
of:

../sysdeps/unix/sysv/linux/riscv/sysdep.h:120:31: error: '__NR_futex' undeclared (first use in this function); did you mean '__futex'?
  120 | #define SYS_ify(syscall_name) __NR_##syscall_name

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359659

SPARCv8
=======

Fortran support related issue:

/builds/bootlin/toolchains-builder/build/opt/sparcv8--uclibc--stable-2020.08-1/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /builds/bootlin/toolchains-builder/build/opt/sparcv8--uclibc--stable-2020.08-1/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/lib/libgfortran.so: undefined reference to `__sync_bool_compare_and_swap_4'
collect2: error: ld returned 1 exit status

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359681
- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359683

SPARCv8 doesn't have __sync built-ins of 4 bytes, so probably we
should not allow Fortran support on SPARCv8 ?

x86-64
======

Issue happens only with the uClibc bleeding edge toolchain: it seems
like it cannot login into the system under Qemu. The login prompt
appears, but then it doesn't seem to work.

- https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359690


-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
