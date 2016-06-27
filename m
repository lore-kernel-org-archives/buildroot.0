From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 22:25:56 -0400
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to menuconfig
Message-ID: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like the kernel menuconfig, this allows for a user to
specify a local directory for the uboot source code.

Also had to change ifeq ($(UBOOT_VERSION),custom) to
ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y) in uboot.mk,
this is also just like the kernel's make file as well.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 boot/uboot/Config.in | 15 +++++++++++++++
 boot/uboot/uboot.mk  |  5 ++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9ffbb51..5a91461 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -57,6 +57,12 @@ config BR2_TARGET_UBOOT_CUSTOM_HG
 config BR2_TARGET_UBOOT_CUSTOM_SVN
 	bool "Custom Subversion repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	bool "Local directory"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a local directory.
+
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
@@ -84,6 +90,13 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the uboot source code.
+
+
 config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2016.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
@@ -92,9 +105,11 @@ config BR2_TARGET_UBOOT_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
+	default "custom" if BR2_TARGET_UBOOT_CUSTOM_LOCAL
 
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
+	depends on !BR2_TARGET_UBOOT_CUSTOM_LOCAL
 	help
 	  A space-separated list of patches to apply to U-Boot.
 	  Each patch can be described as an URL, a local file path,
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a2274ee..86671bd 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -12,12 +12,15 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
 
-ifeq ($(UBOOT_VERSION),custom)
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH))
+UBOOT_SITE_METHOD = local
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
-- 
2.7.4
