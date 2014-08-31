From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 31 Aug 2014 18:33:39 -0300
Subject: [Buildroot] [PATCH] toolchain-external: Add CodeSourcery Nios-II
	2014.05
Message-ID: <1409520819-1211-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new toolchain release fixes a number of issues found with the previous
one. In particular, the issues with fallocate64, prlimit64 and the
ill-installed linux headers seem to be fixed now.

Therefore, there's not need to sanitize the headers for this toolchain and some
packages should now build fine (e.g. fio).

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 toolchain/toolchain-external/Config.in             | 16 ++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b524ac7..150764f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -401,6 +401,21 @@ comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 an
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_PREFER_STATIC_LIB
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	bool "Sourcery CodeBench Nios-II 2014.05"
+	depends on BR2_nios2
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	help
+	  Sourcery CodeBench toolchain for the Nios-II architecture,
+	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51,
+	  glibc 2.19.90, gdb 7.7.50 and kernel headers 3.12.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	bool "Sourcery CodeBench Nios-II 2013.05"
 	depends on BR2_nios2
@@ -899,6 +914,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0955686..b2957d9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -296,6 +296,9 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2014.05-47-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.0.1
