From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 15:46:54 +0200
Subject: [Buildroot] [PATCH] arc: Fix warning if atomics are selected
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356D1ECC4@de02wembxa.internal.synopsys.com>
References: <1410353187-16974-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140910151910.2e29889e@free-electrons.com>
 <39A54937CC95F24AA2F794E2D2B66B1356D1ECC4@de02wembxa.internal.synopsys.com>
Message-ID: <20140910154654.64c4985a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Wed, 10 Sep 2014 13:28:59 +0000, Anton Kolesov wrote:

> defconfig is pretty simple:
> 
> BR2_arcle=y
> BR2_ARC_ATOMIC_EXT=y
> 
> When I do anything with such configuration (like savedefconfig or menuconfig), I observe the following warning:
> 
> warning: (BR2_ARC_ATOMIC_EXT) selects BR2_ARCH_HAS_ATOMICS 
> which has unmet direct dependencies (BR2_arm || BR2_armeb || BR2_aarch64 
> || BR2_avr32 || BR2_bfin || BR2_m68k || BR2_microblazeel || BR2_microblazebe
> || BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || BR2_nios2 ||
> BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_sh || BR2_sh64
> || BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_xtensa)
> 
> That is using current master branch.

There is indeed something weird going on here with the kconfig logic.
We have:

config BR2_ARCH_HAS_ATOMICS
	bool

in arch/Config.in, i.e defined for all architectures.

Then, most architectures (except ARC) are doing:

config BR2_ARCH_HAS_ATOMICS
	default y

because they all have atomic operations in all cases.

But ARC is just doing:

config BR2_ARC_ATOMIC_EXT
	bool "Atomic extension (LLOCK/SCOND instructions)"
	select BR2_ARCH_HAS_ATOMICS

But for some reason, kconfig decides that BR2_ARCH_HAS_ATOMICS is only
available for the other architectures, not ARC. Seems like the trick
used by Yann to declare the type of BR2_ARCH_HAS_ATOMICS in
arch/Config.in, and then its value in each individual
arch/Config.in.<foo> doesn't work when you do just a select.

One solution would be:

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 8a7f290..1173f41 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,7 +1,9 @@
 # Choise of atomic instructions presence
+config BR2_ARCH_HAS_ATOMICS
+       default y if BR2_ARC_ATOMIC_EXT
+
 config BR2_ARC_ATOMIC_EXT
        bool "Atomic extension (LLOCK/SCOND instructions)"
-       select BR2_ARCH_HAS_ATOMICS
 
 config BR2_ARCH
        default "arc"   if BR2_arcle

Which is basically very close to what you were proposing. But I'm still
not convinced, so I'm Cc'ing Yann to get an idea on what's going on here.

Thanks for the report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
