From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:10 +0100
Subject: [Buildroot] [PATCH 7/8] arch/Config.in.arm: Add Cortex-A53 CPU
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <755b80299e8c9a69f116269c8f5a7a27ad464734.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Flax <flatmax@flatmax.org>

Adds the Cortex-A53 CPU to the target architecture variant choice. This
sets the toolchain to use Cortex-A53 as the target. The effect is that
various Cortex-A53 tunings are enabled for the compilation of packages.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c98efcd..592b097 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -191,6 +191,13 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+config BR2_cortex_a53
+	bool "cortex-A53"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
@@ -510,6 +517,9 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
+	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
+	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
+	default "cortex-a53+fp+simd" 	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.7.4
