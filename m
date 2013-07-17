From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Jul 2013 12:39:15 -0300
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
Message-ID: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b2fe257..7fef04c 100644
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
@@ -286,7 +300,7 @@ endchoice
 
 choice
 	prompt "ARM instruction set"
-	depends on BR2_ARM_CPU_HAS_THUMB2
+	depends on BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
 	bool "ARM"
@@ -294,8 +308,18 @@ config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
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
@@ -306,7 +330,7 @@ endchoice
 
 config BR2_ARM_INSTRUCTIONS_ARM
 	def_bool y
-	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
+	depends on !(BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2)
 
 config BR2_ARCH
 	default "arm"	if BR2_arm
-- 
1.8.1.5
