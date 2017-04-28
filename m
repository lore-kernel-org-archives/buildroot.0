From: J Evans <g4@novadsp.com>
Date: Fri, 28 Apr 2017 23:28:05 +0100
Subject: [Buildroot] [PATCH 1/2] ne10: bump to version 1.2.1. Remove
	obsolete patch file for modifying thumb code generation.
Message-ID: <1493418486-109149-1-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 ...sts-don-t-hard-code-thumb-code-generation.patch | 29 ----------------------
 package/ne10/Config.in                             |  6 ++---
 package/ne10/ne10.hash                             |  4 +--
 package/ne10/ne10.mk                               |  2 +-
 4 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
 mode change 100644 => 100755 package/ne10/Config.in
 mode change 100644 => 100755 package/ne10/ne10.hash
 mode change 100644 => 100755 package/ne10/ne10.mk

diff --git a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
deleted file mode 100644
index f140a60..0000000
--- a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9ff39800cec5f1dabba246b253794582d611bc6d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 20 Feb 2015 10:44:15 -0600
-Subject: [PATCH] CMakeLists: don't hard code thumb code generation
-
-Migrating to version 1.2.0
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fdf01ec..34ae26e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -84,7 +84,7 @@ if(ANDROID_PLATFORM)
-     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ar
-     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ranlib")
- elseif(GNULINUX_PLATFORM)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -march=armv7-a -mfpu=vfp3")
-     set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
- elseif(IOS_PLATFORM)
-     #set minimal target ios version.If not provided this option, Xcode
--- 
-1.9.1
-
diff --git a/package/ne10/Config.in b/package/ne10/Config.in
old mode 100644
new mode 100755
index 8d37579..ebd23a6
--- a/package/ne10/Config.in
+++ b/package/ne10/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NE10
 	bool "ne10"
-	depends on BR2_arm
-	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
+	depends on BR2_aarch64 || (BR2_arm && (BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4))
 	help
 	  The Ne10 project has been set up to provide a set of common,
 	  useful functions which have been heavily optimized for the
@@ -13,5 +12,4 @@ config BR2_PACKAGE_NE10
 	  http://projectne10.github.io/Ne10/
 
 comment "ne10 needs a toolchain w/ neon"
-	depends on BR2_arm
-	depends on !(BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)
+	depends on BR2_aarch64 || (BR2_arm && !(BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4))
diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
old mode 100644
new mode 100755
index db5b6f1..923e660
--- a/package/ne10/ne10.hash
+++ b/package/ne10/ne10.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-v1.2.0.tar.gz
+# Locally calculated after checking pgp signature
+sha256	dd1a96610c0692cc80154ae123edd5d25e6e0a3f81d0c16a96425f3ef57b9929	ne10-v1.2.1.tar.gz
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
old mode 100644
new mode 100755
index cb303bd..0da862c
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NE10_VERSION = v1.2.0
+NE10_VERSION = v1.2.1
 NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
 NE10_LICENSE = BSD-3-Clause or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
-- 
2.7.4
