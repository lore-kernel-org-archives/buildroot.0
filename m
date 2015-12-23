From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 21:28:06 +0100
Subject: [Buildroot] [PATCH RFC] arch: properly handle ARM processors with
	BR2_ARM_CPU_MAYBE_HAS_VFPVx
Message-ID: <1450902486-7776-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Certain ARM SoCs are not guaranteed to have a VFP. For example, on
Cortex-A9, the availability of a VFP is optional. Such ARM processors
select one of the BR2_ARM_CPU_MAYBE_HAS_VFPVx options to indicate the
potential availability of such FPUs.

Then, Config.in.arm provides a "choice" that allows to select which
floating point strategy to use. VFPv3 is provided as a possible
strategy when either the VFPv3 is guaranteed to be available
(BR2_ARM_CPU_HAS_VFPV3) or when it *might* be available
(BR2_ARM_CPU_MAYBE_HAS_VFPV3).

The problem is that once a given floating point strategy has been
selected, the BR2_ARM_CPU_HAS_VFPx symbol does not get enabled, even
if the selected floating point strategy clearly indicates that this
given VFP version is available.

Taking again the example of Cortex-A9, if you select the VFPv3
strategy, then BR2_ARM_CPU_HAS_VFPV2 and BR2_ARM_CPU_HAS_VFPV3 still
remain disabled.

Due to this, packages that use the BR2_ARM_CPU_HAS_VFPVx symbols
(currently ffmpeg, gstreamer1, mpg123 and nodejs) do not realize that
the processor has a VFP.

To solve this, we add an additional configuration choice, which allows
to select which VFP is available (if any) for the cases where we don't
know whether the processor has a VFP or not. So, you end up with three
things to choose:

 - The processor core, which defines if a VFP is available or might be
   available

 - The available VFP, in the case where the selection of the processor
   core doesn't allow to know if a VFP is available or not. This new
   configuration choice will select the appropriate
   BR2_ARM_CPU_HAS_VFPVx symbols so that packages looking at such
   symbols will find the right values.

 - The chosen floating point strategy.

We could have decided to merge the "available VFP" selection with the
"floating point strategy" selection, but this is not really possible
due to the wider set of possibilities offered in the "floating point
strategy": NEON, NEON/VFPv4, VFPv3-D13, etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 54 ++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 67ff384..ed6029a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -250,6 +250,48 @@ config BR2_ARM_ENABLE_NEON
 	  implementation has NEON support and you want to use it.
 
 choice
+	prompt "Available VFP"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	default BR2_ARM_ENABLE_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	default BR2_ARM_ENABLE_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	default BR2_ARM_ENABLE_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	help
+	  Your ARM processor might have a VFP, but it is optional, so
+	  Buildroot does not know whether it has one or not, and if
+	  so, which one. This choice lets you select which VFP
+	  generation your ARM processor has.
+
+config BR2_ARM_ENABLE_VFP_NONE
+	bool "No VFP"
+	help
+	  Select this option if your ARM processor has no floating
+	  point unit.
+
+config BR2_ARM_ENABLE_VFPV2
+	bool "VFPv2"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_VFPV2
+	help
+	  Select this option if your ARM processor has a VFPv2
+	  floating point unit.
+
+config BR2_ARM_ENABLE_VFPV3
+	bool "VFPv3"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	select BR2_ARM_CPU_HAS_VFPV3
+	  Select this option if your ARM processor has a VFPv3
+	  floating point unit.
+
+config BR2_ARM_ENABLE_VFPV4
+	bool "VFPv4"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_VFPV4
+	  Select this option if your ARM processor has a VFPv4
+	  floating point unit.
+
+endchoice
+
+choice
 	prompt "Floating point strategy"
 	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
@@ -269,7 +311,7 @@ config BR2_ARM_SOFT_FLOAT
 
 config BR2_ARM_FPU_VFPV2
 	bool "VFPv2"
-	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2
 	help
 	  This option allows to use the VFPv2 floating point unit, as
 	  available in some ARMv5 processors (ARM926EJ-S) and some
@@ -282,7 +324,7 @@ config BR2_ARM_FPU_VFPV2
 
 config BR2_ARM_FPU_VFPV3
 	bool "VFPv3"
-	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on BR2_ARM_CPU_HAS_VFPV3
 	help
 	  This option allows to use the VFPv3 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{8, 9}). This
@@ -298,7 +340,7 @@ config BR2_ARM_FPU_VFPV3
 
 config BR2_ARM_FPU_VFPV3D16
 	bool "VFPv3-D16"
-	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on BR2_ARM_CPU_HAS_VFPV3
 	help
 	  This option allows to use the VFPv3 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{8, 9}). This
@@ -313,7 +355,7 @@ config BR2_ARM_FPU_VFPV3D16
 
 config BR2_ARM_FPU_VFPV4
 	bool "VFPv4"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	help
 	  This option allows to use the VFPv4 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
@@ -328,7 +370,7 @@ config BR2_ARM_FPU_VFPV4
 
 config BR2_ARM_FPU_VFPV4D16
 	bool "VFPv4-D16"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	help
 	  This option allows to use the VFPv4 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
@@ -353,7 +395,7 @@ config BR2_ARM_FPU_NEON
 
 config BR2_ARM_FPU_NEON_VFPV4
 	bool "NEON/VFPv4"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	depends on BR2_ARM_CPU_HAS_NEON
 	help
 	  This option allows to use both the VFPv4 and the NEON SIMD
-- 
2.6.4
