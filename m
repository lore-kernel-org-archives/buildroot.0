From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Dec 2014 11:16:59 -0300
Subject: [Buildroot] [PATCH 4/5] arch/mips: remove deprecated mips1/2/3/4
	support
In-Reply-To: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1417443420-31985-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the support for generating mips1/2/3/4 code since it has been
deprecated for more than a year now.
Also remove the unnecessary kludges in packages for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.mips       | 12 ------------
 package/fdk-aac/Config.in |  4 ----
 package/uclibc/Config.in  |  4 ----
 3 files changed, 20 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 18138de..7630503 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -9,18 +9,6 @@ choice
 	  64bit cabable: 3, 4, 64, 64r2
 	  non-64bit capable: 1, 2, 32, 32r2
 
-config BR2_mips_1
-	bool "mips I (generic)"
-	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED_SINCE_2013_11
-config BR2_mips_2
-	bool "mips II"
-	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED_SINCE_2013_11
-config BR2_mips_3
-	bool "mips III"
-	depends on BR2_DEPRECATED_SINCE_2013_11
-config BR2_mips_4
-	bool "mips IV"
-	depends on BR2_DEPRECATED_SINCE_2013_11
 config BR2_mips_32
 	bool "mips 32"
 	depends on !BR2_ARCH_IS_64
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 7922364..1ec59e1 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -5,9 +5,6 @@ config BR2_PACKAGE_FDK_AAC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh || BR2_sh64
-	# fdk-aac uses the 'msub' instruction whis is available only in
-	# mips32 and mips64 ISAs
-	depends on !(BR2_mips_1 || BR2_mips_2 || BR2_mips_3 || BR2_mips_4)
 
 	help
 	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
@@ -21,4 +18,3 @@ comment "fdk-aac needs a toolchain w/ C++"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh || BR2_sh64
-	depends on !(BR2_mips_1 || BR2_mips_2 || BR2_mips_3 || BR2_mips_4)
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 37f398a..290f19b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -216,10 +216,6 @@ config BR2_UCLIBC_MIPS_ABI
 config BR2_UCLIBC_MIPS_ISA
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
-	default 1 if BR2_mips_1
-	default 2 if BR2_mips_2
-	default 3 if BR2_mips_3
-	default 4 if BR2_mips_4
 	default MIPS32 if BR2_mips_32
 	default MIPS32R2 if BR2_mips_32r2
 	default MIPS64 if BR2_mips_64
-- 
2.0.4
