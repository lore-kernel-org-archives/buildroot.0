From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:35:25 +0100
Subject: [Buildroot] [git commit] package/nodejs: remove version choice
Message-ID: <20160208084431.2F22680444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75b7049281d11867ed6611a2a1a6a15dadb0b031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the choice of nodejs version.  Now automatically pick nodejs 0.10.x
for armv5 architectures only and the latest nodejs for all other
supported architectures.

Note that the removal of BR2_PACKAGE_NODEJS_5_X is not handled in
Config.in.legacy because buildroot has never been released with this
option included.

Signed-off-by: Martin Bark <martin@barkynet.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy         |  8 +++++---
 package/nodejs/Config.in | 38 ++++++++++----------------------------
 package/nodejs/nodejs.mk |  2 +-
 3 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ec6f26e..3677f86 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -315,12 +315,14 @@ config BR2_PACKAGE_INFOZIP
 	  in the unzip package.
 
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
-	bool "nodejs 0.10.x option renamed"
+	bool "nodejs 0.10.x option removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_NODEJS
 	help
-	  nodejs 0.10.x option was named incorrectly and has been renamed
-	  to BR2_PACKAGE_NODEJS_0_10_X.
+	  nodejs 0.10.x option has been removed.  0.10.x is now
+	  automatically chosen for ARMv5 architectures only and the latest
+	  nodejs for all other supported architectures. The correct nodejs
+	  version has been automatically selected in your configuration.
 
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "nodejs version 0.12.x has been removed"
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 4385646..cdf7705 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,9 +1,10 @@
-comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
+comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
@@ -13,6 +14,11 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
+	# 0.10.x could be built without the following toolchain dependencies but
+	# simplify things by requiring these basic dependencies for all versions.
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
 	# uses dlopen(). On ARMv5, we could technically support static
@@ -35,34 +41,10 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	# On ARM, at least ARMv6+ with VFPv2+ is needed
 	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
 
-choice
-	prompt "Node.js version"
-	default BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
-	default BR2_PACKAGE_NODEJS_5_X
-	help
-	  Select the version of Node.js you wish to use.
-
-config BR2_PACKAGE_NODEJS_0_10_X
-	bool "v0.10.41"
-
-config BR2_PACKAGE_NODEJS_5_X
-	bool "v5.5.0"
-	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_USE_WCHAR
-
-comment "v5.5.0 needs a toolchain w/ gcc >= 4.8, wchar"
-	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-
-endchoice
-
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "0.10.41"	if BR2_PACKAGE_NODEJS_0_10_X
-	default "5.5.0"		if BR2_PACKAGE_NODEJS_5_X
+	default "5.5.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "0.10.41"
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index af47b26..37de331 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
-ifeq ($(BR2_PACKAGE_NODEJS_5_X),y)
+ifeq ($(findstring 0.10.,$(NODEJS_VERSION)),)
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 else
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
