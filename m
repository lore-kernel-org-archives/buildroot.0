From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 20 Aug 2009 20:53:33 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

The current external toolchain support doesn't appear to work correctly
for a multilib toolchain.  The library files are in different subdirectories
depending on the architecture.

For example, the CodeSourcery 2009q1-203 toolchain supports the following
library configurations (this is from the Getting_Started_Guide provided
with the toolchain):

1) ARMv5T - Little-Endian, Soft-Float, GLIBC
   Command-line option(s): default
   Sysroot subdirectory: ./
   Dynamic linker: lib/ld-linux.so.3

2) ARMv4T - Little-Endian, Soft-Float, GLIBC
   Command-line option(s): -march=armv4t
   Sysroot subdirectory: armv4t/
   Dynamic linker: lib/ld-linux.so.3

3) ARMv7-A Thumb-2, Little-Endian, Soft-Float, GLIBC
   Command-line option(s): -mthumb -march=arm7-a
   Sysroot subdirectory: thumb2/
   Dynamic linker: lib/ld-linux.so.3

Instead of finding the external toolchain sysroot directory by grep'ing
the output of the $(TARGET_CC) -v command it might be better to use that
as an indication that the toolchain does support sysroot.  The actual
directory location can then be found using the -print-sysroot option.

$ arm-none-linux-gnueabi-gcc -print-sysroot
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc
$ arm-none-linux-gnueabi-gcc -print-sysroot -march=armv4t
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/armv4t
$ arm-none-linux-gnueabi-gcc -print-sysroot -mthumb -march=armv7-a
/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/thumb2

This will allow the correct libraries to be copied to the staging
directory and avoid having to create a symlink to the directory
indicated by the --with-sysroot= configured option:

$ arm-none-linux-gnueabi-gcc -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=
/opt/codesourcery/arm-none-linux-gnueabi/libc

The -march= option also needs to be handled for the external
toolchain.  It appears to be done correctly in package/Makefile.in
when BR2_TOOLCHAIN_SOURCE is defined but not for external ones:

...
#########################################################################
ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
...
CC_TARGET_ARCH_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ARCH)))
...
ifneq ($(CC_TARGET_ARCH_),)
TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
endif
...
# else it's an external toolchain
#########################################################################
else
TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
...
endif
#########################################################################

The problem is I'm not really sure how to make the necessary changes.

Any ideas on how to make this work?

Regards,
Hartley
