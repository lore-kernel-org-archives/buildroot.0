From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:06:32 +0100
Subject: [Buildroot] [git commit] arch/mips: remove deprecated mips1/2/3/4
	support
Message-ID: <20141201190932.66DB97FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd45fe0efb678a8a674330ad46b7641a3284dff9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the support for generating mips1/2/3/4 code since it has been
deprecated for more than a year now.
Also remove the unnecessary kludges in packages for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips       |   12 ------------
 package/fdk-aac/Config.in |    4 ----
 package/uclibc/Config.in  |    4 ----
 3 files changed, 0 insertions(+), 20 deletions(-)

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
