From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:15 +0100
Subject: [Buildroot] [PATCH 3/6] arch/arm: add option for FPv4 FPU
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <3d450412ff52439ace479474eddc5e90964e2626.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FPv4-SP FPU is a single-precision FPU with 16 double registers [0]
[1]. It is only available for cortex-m4 cores, and is known to gcc as
fpv4-sp-d16 (note that there is no leading 'v') since gcc-4.5 [2].

[0] https://en.wikipedia.org/wiki/ARM_Cortex-M#Cortex-M4
[1] https://developer.arm.com/docs/ddi0439/latest/floating-point-unit
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=639cb7b789a54bf78d6ae5e2644450f5eb1837a6

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 89db5fad08..b063ee33fd 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -40,6 +40,15 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+# FPv4 is always optional
+config BR2_ARM_CPU_MAYBE_HAS_FPV4
+	bool
+	select BR2_ARM_CPU_MAYBE_HAS_FPU
+
+config BR2_ARM_CPU_HAS_FPV4
+	bool
+	select BR2_ARM_CPU_HAS_FPU
+
 config BR2_ARM_CPU_HAS_FP_ARMV8
 	bool
 	select BR2_ARM_CPU_HAS_VFPV4
@@ -460,6 +469,7 @@ config BR2_ARM_ENABLE_NEON
 config BR2_ARM_ENABLE_VFP
 	bool "Enable VFP extension support"
 	depends on BR2_ARM_CPU_MAYBE_HAS_FPU
+	select BR2_ARM_CPU_HAS_FPV4 if BR2_ARM_CPU_MAYBE_HAS_FPV4
 	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
@@ -526,6 +536,7 @@ endchoice
 choice
 	prompt "Floating point strategy"
 	default BR2_ARM_FPU_FP_ARMV8 if BR2_ARM_CPU_HAS_FP_ARMV8
+	default BR2_ARM_FPU_FPV4D16 if BR2_ARM_CPU_HAS_FPV4
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
@@ -636,6 +647,14 @@ config BR2_ARM_FPU_NEON_VFPV4
 	  example on Cortex-A5 and Cortex-A7, support for VFPv4 and
 	  NEON is optional.
 
+config BR2_ARM_FPU_FPV4D16
+	bool "FPv4-D16"
+	depends on BR2_ARM_CPU_HAS_FPV4
+	help
+	  This option allows to use the FPv4-SP (single precision)
+	  floating point unit, as available in some ARMv7m processors
+	  (Cortex-M4).
+
 config BR2_ARM_FPU_FP_ARMV8
 	bool "FP-ARMv8"
 	depends on BR2_ARM_CPU_HAS_FP_ARMV8
@@ -769,6 +788,7 @@ config BR2_GCC_TARGET_FPU
 	default "vfpv4-d16"	if BR2_ARM_FPU_VFPV4D16
 	default "neon"		if BR2_ARM_FPU_NEON
 	default "neon-vfpv4"	if BR2_ARM_FPU_NEON_VFPV4
+	default "fpv4-sp-d16"   if BR2_ARM_FPU_FPV4D16
 	default "fp-armv8"	if BR2_ARM_FPU_FP_ARMV8
 	default "neon-fp-armv8"	if BR2_ARM_FPU_NEON_FP_ARMV8
 
-- 
2.14.1
