From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:14 +0100
Subject: [Buildroot] [PATCH 2/6] arch/arm: introduce generic FPU internal
 option
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <5ef50865f7d01e80a46e4f95c95916a6744d8250.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we consider that any VFP FPU is a superset of VFPv2, and thus
we use VFPv2 as a way to detect that a VFP is used.

However, for Cortex-M cores, the optional FPU is not a superset of
VFPv2; it is even not a VFP [0].

As a consequence, we can no longer consider VFPv2 as a indication that
an FPU is present.

So, we introduce two new internal options, BR2_ARM_CPU_MAYBE_HAS_FPU and
BR2_ARM_CPU_HAS_FPU, which we use to consider the presence of an FPU.

[0] https://en.wikipedia.org/wiki/ARM_Cortex-M#Cortex-M4

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 67f8a16737..89db5fad08 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -6,12 +6,21 @@ config BR2_ARM_CPU_HAS_NEON
 config BR2_ARM_CPU_MAYBE_HAS_NEON
 	bool
 
+# For some cores, the FPU is optional
+config BR2_ARM_CPU_MAYBE_HAS_FPU
+	bool
+
+config BR2_ARM_CPU_HAS_FPU
+	bool
+
 # for some cores, VFPv2 is optional
 config BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	bool
+	select BR2_ARM_CPU_MAYBE_HAS_FPU
 
 config BR2_ARM_CPU_HAS_VFPV2
 	bool
+	select BR2_ARM_CPU_HAS_FPU
 
 # for some cores, VFPv3 is optional
 config BR2_ARM_CPU_MAYBE_HAS_VFPV3
@@ -450,7 +459,7 @@ config BR2_ARM_ENABLE_NEON
 
 config BR2_ARM_ENABLE_VFP
 	bool "Enable VFP extension support"
-	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	depends on BR2_ARM_CPU_MAYBE_HAS_FPU
 	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
@@ -462,7 +471,7 @@ config BR2_ARM_ENABLE_VFP
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
-	default BR2_ARM_EABIHF if BR2_ARM_CPU_HAS_VFPV2
+	default BR2_ARM_EABIHF if BR2_ARM_CPU_HAS_FPU
 	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use. The Application Binary
@@ -496,7 +505,7 @@ config BR2_ARM_EABI
 
 config BR2_ARM_EABIHF
 	bool "EABIhf"
-	depends on BR2_ARM_CPU_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_FPU
 	help
 	  The EABIhf is an extension of EABI which supports the 'hard'
 	  floating point model. This model uses the floating point
@@ -520,7 +529,7 @@ choice
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
-	default BR2_ARM_SOFT_FLOAT if !BR2_ARM_CPU_HAS_VFPV2
+	default BR2_ARM_SOFT_FLOAT if !BR2_ARM_CPU_HAS_FPU
 
 config BR2_ARM_SOFT_FLOAT
 	bool "Soft float"
-- 
2.14.1
