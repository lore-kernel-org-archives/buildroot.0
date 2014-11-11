From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 11 Nov 2014 17:17:31 +0100
Subject: [Buildroot] [-M] uboot: Added local directory as source of U-Boot
	code
Message-ID: <1415722651-9204-1-git-send-email-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the option to use a local directory as the source for building U-Boot.
This can be useful during development.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  | 11 ++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 46d1109..ea929d9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -34,6 +34,12 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
 config BR2_TARGET_UBOOT_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	bool "Custom local directory"
+	help
+	  This option allows Buildroot to get the target U-Boot source
+	  code from a local directory.
+
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
@@ -44,6 +50,13 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 	string "URL of custom U-Boot tarball"
 	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the target U-Boot source
+	  code.
+
 if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
@@ -69,6 +82,7 @@ config BR2_TARGET_UBOOT_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_LOCAL
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1f8818c..fb7ceb3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -12,11 +12,14 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
 
-ifeq ($(UBOOT_VERSION),custom)
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH))
+UBOOT_SITE_METHOD = local
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
@@ -187,6 +190,12 @@ $(error No custom U-Boot tarball specified. Check your BR2_TARGET_UBOOT_CUSTOM_T
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 endif # BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH)),)
+$(error No custom U-Boot local path specified. Check your BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
+endif # BR2_TARGET_UBOOT_CUSTOM_LOCAL
+
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT)$(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
-- 
2.1.3
