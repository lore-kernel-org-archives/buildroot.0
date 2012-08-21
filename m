From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 09:35:27 +0200
Subject: [Buildroot] Best way of building for unknown architecture
In-Reply-To: <12889.25157.bm@smtp148.mail.ukl.yahoo.com>
References: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
 <20120817194310.25198340@skate>
 <12889.25157.bm@smtp148.mail.ukl.yahoo.com>
Message-ID: <20120821093527.2dd03b31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 20 Aug 2012 17:27:49 +0100,
Kevin Chadwick <ma1l1ists@yahoo.co.uk> a ?crit :

> This patch seems to add the --with-arch="armv7-m" and
> --with-tune="cortex-m3" when cortex-m3 is selected.

Correct.

> www.linux-arm.org/LinuxKernel/LinuxM3 suggests that the following
> should be added to build busybox
> 
> -mthumb -Wl,-elf2flt=-s -Wl,-elf2flt=16384

-mthumb can be added to the BR2_TARGET_OPTIMIZATION option, though at
some point, it might be good to add an option to build ARM code with
the ARM instruction set, or the Thumb instruction set, or the Thumb-2
instruction set.

The elf2flt option define the stack size, and we have a similar need
for Blackfin. Maybe we need to define a "Flat" ABI for ARM, and when
this option is enabled, offer an option to define the default stack
size passed to elf2flt.

> and I think
> 
> -mfloat-abi=soft might be a good idea for this cpu too

If you select BR2_PREFER_SOFT_FLOAT, then the compiler will be built to
generate soft float code by default, so there's nothing to do.

> I have successfully built arm binaries with the inbuilt toolchain
> manually using
> 
> -march=armv7-m -mtune=cortex-m3 -mthumb -mfloat-abi=soft
> 
> but the -Wl linker option flags fail and I am not sure how to add
> -mthumb and -mfloat-abi=soft to buildroot though it does already have
> --with-float=soft enabled?

Hum, I would have to test myself to give more details here.

> I wanted to test it so I extracted a fresh buildroot and pointed the
> external chain to the already built uclibc internal toolchain
> (built before patching with above) where I had selected NO_MMU before
> building.
> 
> When I ran make I got
> 
> Checking external toolchain settings
> MMU support available in C library, please enable BR2_USE_MMU
> 
> This chip has no MMU but does have an MPU, do I need to rebuild the
> toolchain with this patch, bypass/fix this error or enable MMU and
> select not to use MMU or something else?

It is due to the fact that the uClibc headers define __ARCH_USE_MMU__.
This is because uClibc has been built with MMU support. In fact, the
Buildroot toolchain backend for now doesn't support building non-MMU
toolchains. But it could probably be added relatively easily.

In toolchain/uClibc/uclibc.mk, you would have to tweak the
uClibc .config (like we already do for many options) so as to disable
the ARCH_USE_MMU uClibc option when BR2_USE_MMU is disabled.

Something along the lines of (completely untested):

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 9d0b6db..0eb11c0 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -245,6 +245,9 @@ ifneq ($(UCLIBC_TARGET_ENDIAN),)
                -e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
                $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_USE_MMU),)
+       $(SED) 's,.*ARCH_USE_MMU.*,# ARCH_USE_MMU is not set,g' $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ($(BR2_LARGEFILE),y)
        $(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
 else

However, besides this option, you will also probably need to adjust the
uClibc configuration to add support for FLAT binaries.

The no-MMU support for ARM is basically non-existent for now in
Buildroot, but I'm interested in having that integrated, so I'll try to
help you getting this working.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
