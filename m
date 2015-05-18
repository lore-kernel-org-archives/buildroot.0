From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 18 May 2015 11:24:43 -0300
Subject: [Buildroot] [PATCH v2 1/6] arm: update processor types
In-Reply-To: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1431959088-15257-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Cortex M3 variant. These microcontrollers don't support regular
ARM instructions and don't have an MMU.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 arch/Config.in                | 8 ++++----
 arch/Config.in.arm            | 5 +++++
 toolchain/toolchain-common.in | 6 ++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 06aff2c..8ff4a05 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -244,13 +244,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
+	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k || BR2_cortex_m3)
 	default BR2_BINFMT_FDPIC if BR2_bfin
-	default BR2_BINFMT_FLAT if BR2_m68k
+	default BR2_BINFMT_FLAT if BR2_m68k || BR2_cortex_m3
 
 config BR2_BINFMT_ELF
 	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
+	depends on !BR2_bfin && !BR2_m68k && !BR2_cortex_m3
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
@@ -269,7 +269,7 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_bfin || BR2_m68k || BR2_cortex_m3
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
 	  based on the original a.out format. It is widely used in environment
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f5d317b..44dd47c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -134,6 +134,10 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+config BR2_cortex_m3
+	bool "cortex-M3"
+	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
@@ -391,6 +395,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
+	default "cortex-m3"	if BR2_cortex_m3
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
 	default "strongarm"	if BR2_strongarm
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d50c908..d71b850 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -108,8 +108,10 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
-	default y if !BR2_bfin
+	bool "Enable MMU support"
+	depends on BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
+	depends on !BR2_cortex_m3 && !BR2_bfin
+	default y
 	help
 	  If your target has a MMU, you should say Y here.  If you
 	  are unsure, just say Y.
-- 
2.1.4
