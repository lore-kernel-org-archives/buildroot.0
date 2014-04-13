From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Apr 2014 11:33:56 +0300
Subject: [Buildroot] [PATCH v2] ne10: bump version to 1.0.0
Message-ID: <76642160278009c2ccd78c0d6ab5e557fd47e247.1397378036.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github helper while at it.

Fixes:
http://autobuild.buildroot.net/results/a2c/a2ca3fe245e410a738f4b10631a1414696a0edea/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ne10/Config.in |  9 ++++++++-
 package/ne10/ne10.mk   | 10 +++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/ne10/Config.in b/package/ne10/Config.in
index d0c4983ed588..fa21cc4f084c 100644
--- a/package/ne10/Config.in
+++ b/package/ne10/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_NE10
 	bool "ne10"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_arm
+	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
+	depends on BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2
 	help
 	  The Ne10 project has been set up to provide a set of common,
 	  useful functions which have been heavily optimized for the
@@ -10,3 +12,8 @@ config BR2_PACKAGE_NE10
 	  and NEON implementations.
 
 	  http://projectne10.github.io/Ne10/
+
+comment "ne10 needs a toolchain w/ neon and thumb"
+	depends on BR2_arm
+	depends on !(BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)
+	depends on !(BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2)
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
1.9.1
