From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Jul 2013 00:25:07 +0200
Subject: [Buildroot] [git commit] arch/arm: add support for thumb(1) mode
Message-ID: <20130718061512.4730A9A299@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79310d327586619866a672fbaecc5682a33a0937
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also adjust BR2_GCC_TARGET_MODE]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |   30 +++++++++++++++++++++++++++---
 1 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2a0cf45..c0fabb7 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,9 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_HAS_THUMB
+	bool
+
 config BR2_ARM_CPU_HAS_THUMB2
 	bool
 
@@ -43,28 +46,38 @@ choice
 
 config BR2_arm7tdmi
 	bool "arm7tdmi"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm720t
 	bool "arm720t"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm920t
 	bool "arm920t"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm922t
 	bool "arm922t"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm10t
 	bool "arm10t"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm1136jf_s_r0
 	bool "arm1136jf_s rev0"
 	select BR2_ARM_CPU_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm1136jf_s_r1
 	bool "arm1136jf_s rev1"
 	select BR2_ARM_CPU_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
@@ -99,6 +112,7 @@ config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 config BR2_xscale
 	bool "xscale"
+	select BR2_ARM_CPU_HAS_THUMB
 config BR2_iwmmxt
 	bool "iwmmxt"
 endchoice
@@ -287,7 +301,7 @@ endchoice
 
 choice
 	prompt "ARM instruction set"
-	depends on BR2_ARM_CPU_HAS_THUMB2
+	depends on BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
 	bool "ARM"
@@ -295,8 +309,18 @@ config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
 	  This option instructs the compiler to generate regular ARM
 	  instructions, that are all 32 bits wide.
 
+config BR2_ARM_INSTRUCTIONS_THUMB
+	bool "Thumb"
+	depends on BR2_ARM_CPU_HAS_THUMB
+	help
+	  This option instructions the compiler to generate Thumb
+	  instructions, which allows to mix 16 bits instructions and
+	  32 bits instructions. This generally provides a much smaller
+	  compiled binary size.
+
 config BR2_ARM_INSTRUCTIONS_THUMB2
 	bool "Thumb2"
+	depends on BR2_ARM_CPU_HAS_THUMB2
 	help
 	  This option instructions the compiler to generate Thumb2
 	  instructions, which allows to mix 16 bits instructions and
@@ -307,7 +331,7 @@ endchoice
 
 config BR2_ARM_INSTRUCTIONS_ARM
 	def_bool y
-	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
+	depends on !(BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2)
 
 config BR2_ARCH
 	default "arm"	if BR2_arm
@@ -381,4 +405,4 @@ config BR2_GCC_TARGET_FLOAT_ABI
 
 config BR2_GCC_TARGET_MODE
 	default "arm"		if BR2_ARM_INSTRUCTIONS_ARM
-	default "thumb"		if BR2_ARM_INSTRUCTIONS_THUMB2
+	default "thumb"		if BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2
