From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Apr 2014 13:16:46 +0300
Subject: [Buildroot] [PATCH v3] ne10: bump version to 1.0.0
Message-ID: <748fce948e11980e6f5e0ed3a796c1c0b0d2b8bc.1398248206.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github helper while at it.

Depend on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4 so that the toolchain
wrapper will add -mfpu=neon, and avoid the following error:

.../include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h

Note that this error doesn't show in the build-end.log referenced below
because of the log lines limit.

Fixes:
http://autobuild.buildroot.net/results/a2c/a2ca3fe245e410a738f4b10631a1414696a0edea/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
	* Drop thumb dependency; instead, patch CMakeLists.txt to remove
	  hard-coded -mthumb
	* Explain the NEON dependency in the commit log

v2:
	* Drop the patch; the toolchain wrapper handles -mfloat-abi and -mfpu
	* Depend on neon and thumb to match upstream choice
---
 package/ne10/Config.in                             |  7 +++++-
 ...sts-don-t-hard-code-thumb-code-generation.patch | 27 ++++++++++++++++++++++
 package/ne10/ne10.mk                               | 10 ++++----
 3 files changed, 38 insertions(+), 6 deletions(-)
 create mode 100644 package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch

diff --git a/package/ne10/Config.in b/package/ne10/Config.in
index d0c4983ed588..8d375793dbab 100644
--- a/package/ne10/Config.in
+++ b/package/ne10/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NE10
 	bool "ne10"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_arm
+	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
 	help
 	  The Ne10 project has been set up to provide a set of common,
 	  useful functions which have been heavily optimized for the
@@ -10,3 +11,7 @@ config BR2_PACKAGE_NE10
 	  and NEON implementations.
 
 	  http://projectne10.github.io/Ne10/
+
+comment "ne10 needs a toolchain w/ neon"
+	depends on BR2_arm
+	depends on !(BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)
diff --git a/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch
new file mode 100644
index 000000000000..3402b5ae6bda
--- /dev/null
+++ b/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch
@@ -0,0 +1,27 @@
+From 00995e0b8a66fbd0eabd206188120bfc1ecdac59 Mon Sep 17 00:00:00 2001
+Message-Id: <00995e0b8a66fbd0eabd206188120bfc1ecdac59.1398245232.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 23 Apr 2014 12:21:37 +0300
+Subject: [PATCH] CMakeLists: don't hard code thumb code generation
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2c7f8d62a42b..cec614fba041 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -77,7 +77,7 @@ if(ANDROID_PLATFORM)
+       add_subdirectory(android/NE10Demo/jni)
+     endif()
+ elseif(GNULINUX_PLATFORM)
+-    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
++    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -march=armv7-a -mfpu=vfp3")
+     set(CMAKE_ASM_FLAGS "-mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
+ elseif(IOS_PLATFORM)
+     #set minimal target ios version.If not provided this option, Xcode
+-- 
+1.9.2
+
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 79b53b809d16..24411482e0a5 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-# We use a Git commit ID because the last tagged version is more than
-# one year old.
-NE10_VERSION = 88c18f02199947b2c8b57796f5a3ca53160aff96
-NE10_SITE = http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
+NE10_VERSION = v1.0.0
+NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
 NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
+NE10_CONF_OPT = -DGNULINUX_PLATFORM=ON
+
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-NE10_CONF_OPT = \
+NE10_CONF_OPT += \
 	-DNE10_BUILD_SHARED=ON
 endif
 
-- 
1.9.2
