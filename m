From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 01 Jul 2008 23:00:49 +0200
Subject: [Buildroot] libc build fails.
Message-ID: <1214946049.30879.5.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to compile gcc-4.3.1 for ARM (OABI) using uClibc 0.9.29.
During the build of libc.a, it crashes with the following error message:

<snip>
CC libc/sysdeps/linux/common/chdir.os
In file included from ./include/sys/param.h:22,
                 from libc/sysdeps/linux/common/chdir.c:13:
./include/limits.h:124:26: error: limits.h: No such file or directory
make[2]: *** [libc/sysdeps/linux/common/chdir.os] Error 1
make[1]: *** [lib/libc.so.0] Fel 2
make[1]: Leaving directory
`/home/ulf/projects/Buildroot/20080701/buildroot-arm/toolchain_build_arm/uClibc-0.9.29'
make: ***
[/home/ulf/projects/Buildroot/20080701/buildroot-arm/toolchain_build_arm/uClibc-0.9.29/lib/libc.a] Error 2

The missing files are located in
./uClibc_dev/usr/include/linux/limits.h
./uClibc_dev/usr/include/limits.h

----------------------
The part of uclibc.mk that does the build is:

$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial)
$(LIBFLOAT_TARGET)
	$(MAKE1) -C $(UCLIBC_DIR) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(HOSTCC)" \
		all
	touch -c $@

which is not mentioning ./uClibc_dev/ at all.

Any comments?
