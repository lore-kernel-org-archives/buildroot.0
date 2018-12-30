From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 15:16:12 +0100
Subject: [Buildroot] [PATCH 3/4] arch/arm: add armv8.2a cortex-based cores
In-Reply-To: <cover.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <4d7b62349a7cedd6d3762b39196a9069eb86297e.1546179362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The armv8.2a generation is a cumulative extension to armv8.1a.

Since gcc correctly enables the appropriate extensions based on the core
name, we don't really need to introduce a separate config for armv8.2a,
and we can piggyback on armv8a.

In theory, gcc supports those cores in arm mode. However, configuring
gcc thusly generates a non-working gcc that constantly whines:
    cc1: warning: switch -mcpu=cortex-a55 conflicts with -march=armv8.2-a switch

It is to be noted that the -march flag is internal to gcc. It is not
something that Buildroot did set when configuring gcc; Buildroot only
ever sets --with-cpu (not --with-arch).

Additionally, uClibc fails to build entirely (unsure if this is caused
by the above, or if it is a separate issue, though), with:
    #### Your compiler does not support TLS and you are trying to build uClibc-ng
    #### with NPTL support. Upgrade your binutils and gcc to versions which
    #### support TLS for your architecture. Do not contact uClibc-ng maintainers
    #### about this problem.

Glibc and musl have not been tested in arm mode, so maybe we could have
a toolchain that eventually works (or at least, pretends to be working),
but we decided it was not worth the effort.

Thus, we restrict those cores to AArch64 mode only.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Notes: those few packages that have a cortex-dependent option have been
checked to not require extending the list: at91bootstrap3, gst-omapfb,
kodi, nvidia-tegra23, and openblas. Only kvm-unit-tests may need it, but
it has not been done by lack of testing possibility.
---
 arch/Config.in.arm | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index bc1bb26582..e3c64d12ab 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -451,6 +451,28 @@ config BR2_vulcan
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 endif # BR2_ARCH_IS_64
+
+if BR2_ARCH_IS_64
+comment "armv8.2a cores"
+config BR2_cortex_a55
+	bool "cortex-A55"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+config BR2_cortex_a75
+	bool "cortex-A75"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+config BR2_cortex_a75_a55
+	bool "cortex-A75/A55 big.LITTLE"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+endif # BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -796,6 +818,10 @@ config BR2_GCC_TARGET_CPU
 	default "thunderx2t99"	if BR2_thunderx2t99
 	default "thunderx2t99p1"	if BR2_thunderx2t99p1
 	default "vulcan"	if BR2_vulcan
+	# armv8.2a
+	default "cortex-a55"	if BR2_cortex_a55
+	default "cortex-a75"	if BR2_cortex_a75
+	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.14.1
