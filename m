From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 07:52:45 +0200
Subject: [Buildroot] uClibc checks capabilities of arm-linux-uclibc-gcc
	before it is	built.
Message-ID: <1184392365.4954.10.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see errors during the build of the uClibc-0.9.29 for generic arm.
I think this affects everything except x86 targets using
the native compiler.

During the build of uClibc using "make V=1" and make -d (for debug) in
package/uclibc/uclibc.mk I see:
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
make -j1 -C extra/config conf
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for i686-pc-linux-gnu
Reading makefiles...
Reading makefile `Makefile'...
Reading makefile `../../Rules.mak' (search path) (no ~ expansion)...
F?r upp barnprocessen 0x080929e0 (extra/config/conf) PID 10902 p?
kedjan.
Levande barnprocess 0x080929e0 (extra/config/conf) PID 10902 
Reading makefile `../../.config' (search path) (don't care) (no ~
expansion)...
/bin/sh: /usr/local/arm/gcc-4.2.0-uclibc-20070713/usr/bin/arm-linux-uclibc-gcc: No such file or directory
make[2]: /usr/local/arm/gcc-4.2.0-uclibc-20070713/usr/bin/arm-linux-uclibc-gcc: Command not found
make[2]: /usr/local/arm/gcc-4.2.0-uclibc-20070713/usr/bin/arm-linux-uclibc-gcc: Command not found
Reading makefile `Makefile.kconfig' (search path) (no ~ expansion)...

---------------------------------------------------------------------------


I think this is what causes the problem:
In "uClibc-0.9.29/extra/conf/Makefile" we find:

	include $(top_builddir)Rules.mak

In "$(top_builddir)Rules.mak" we find:

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	ifeq ($(TARGET_ARCH),arm)
		OPTIMIZATION+=-fstrict-aliasing
	[snip]
		CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call
check_gcc,-mtune=xscale,-mtune=strongarm110)
	[snip]
	endif
---------------------------------------------------------------------------
	
AND
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# A nifty macro to make testing gcc features easier
	check_gcc=$(shell \
		if $(CC) $(1) -S -o /dev/null -xc /dev/null > /dev/null 2>&1; \
		then echo "$(1)"; else echo "$(2)"; fi)
---------------------------------------------------------------------------
so CC at this point is defined to 
"/usr/local/arm/gcc-4.2.0-uclibc-20070713/usr/bin/arm-linux-uclibc-gcc"
but this is before the "arm-linux-uclibc-gcc" compiler is built...

The build completes, but I assume that "CPU_CFLAGS-$(CONFIG_ARM_XSCALE)"
is crap.



Best Regards
Ulf Samuelsson
