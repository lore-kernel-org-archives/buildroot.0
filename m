From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:16 +0100
Subject: [Buildroot] [PATCH 4/6] arch/arm: add options for FPv5 FPU
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <ef22f8dce8655ca8ba4f333b43c5df50108b7c32.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contrary to its older brother, the FPv5 comes in two flavours; single-
and double-precision [0] [1]. the two variants are only available for
cortex-m7 cores, and the two variants are known to gcc as fpv5-sp-d16
and fpv5-d16, respectively, since gcc-5 [2].

[0] https://en.wikipedia.org/wiki/ARM_Cortex-M#Cortex-M7
[1] https://developer.arm.com/docs/ddi0489/latest/floating-point-unit
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=a076f99fa702deac764f6e0441b9435ad999f521

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b063ee33fd..8fd11cc157 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -49,6 +49,15 @@ config BR2_ARM_CPU_HAS_FPV4
 	bool
 	select BR2_ARM_CPU_HAS_FPU
 
+# FPv5 is always optional
+config BR2_ARM_CPU_MAYBE_HAS_FPV5
+	bool
+	select BR2_ARM_CPU_MAYBE_HAS_FPV4
+
+config BR2_ARM_CPU_HAS_FPV5
+	bool
+	select BR2_ARM_CPU_HAS_FPV4
+
 config BR2_ARM_CPU_HAS_FP_ARMV8
 	bool
 	select BR2_ARM_CPU_HAS_VFPV4
@@ -469,6 +478,7 @@ config BR2_ARM_ENABLE_NEON
 config BR2_ARM_ENABLE_VFP
 	bool "Enable VFP extension support"
 	depends on BR2_ARM_CPU_MAYBE_HAS_FPU
+	select BR2_ARM_CPU_HAS_FPV5 if BR2_ARM_CPU_MAYBE_HAS_FPV5
 	select BR2_ARM_CPU_HAS_FPV4 if BR2_ARM_CPU_MAYBE_HAS_FPV4
 	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
@@ -536,6 +546,7 @@ endchoice
 choice
 	prompt "Floating point strategy"
 	default BR2_ARM_FPU_FP_ARMV8 if BR2_ARM_CPU_HAS_FP_ARMV8
+	default BR2_ARM_FPU_FPV5D16 if BR2_ARM_CPU_HAS_FPV5
 	default BR2_ARM_FPU_FPV4D16 if BR2_ARM_CPU_HAS_FPV4
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
@@ -655,6 +666,30 @@ config BR2_ARM_FPU_FPV4D16
 	  floating point unit, as available in some ARMv7m processors
 	  (Cortex-M4).
 
+config BR2_ARM_FPU_FPV5D16
+	bool "FPv5-D16"
+	depends on BR2_ARM_CPU_HAS_FPV5
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	help
+	  This option allows to use the FPv5-SP (single precision)
+	  floating point unit, as available in some ARMv7m processors
+	  (Cortex-M7).
+
+	  Note that if you want binary code that works on the earlier
+	  Cortex-M4, you should instead select FPv4-D16.
+
+config BR2_ARM_FPU_FPV5DPD16
+	bool "FPv5-DP-D16"
+	depends on BR2_ARM_CPU_HAS_FPV5
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	help
+	  This option allows to use the FPv5-DP (double precision)
+	  floating point unit, as available in some ARMv7m processors
+	  (Cortex-M7).
+
+	  Note that if you want binary code that works on the earlier
+	  Cortex-M4, you should instead select FPv4-D16.
+
 config BR2_ARM_FPU_FP_ARMV8
 	bool "FP-ARMv8"
 	depends on BR2_ARM_CPU_HAS_FP_ARMV8
@@ -789,6 +824,8 @@ config BR2_GCC_TARGET_FPU
 	default "neon"		if BR2_ARM_FPU_NEON
 	default "neon-vfpv4"	if BR2_ARM_FPU_NEON_VFPV4
 	default "fpv4-sp-d16"   if BR2_ARM_FPU_FPV4D16
+	default "fpv5-sp-d16"	if BR2_ARM_FPU_FPV5D16
+	default "fpv5-d16"	if BR2_ARM_FPU_FPV5DPD16
 	default "fp-armv8"	if BR2_ARM_FPU_FP_ARMV8
 	default "neon-fp-armv8"	if BR2_ARM_FPU_NEON_FP_ARMV8
 
-- 
2.14.1
