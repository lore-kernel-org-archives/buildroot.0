From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 28 Jul 2014 11:58:04 +1200
Subject: [Buildroot] [PATCH] Add local directory support for uboot
Message-ID: <1406505484-19123-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 boot/uboot/Config.in |   12 ++++++++++++
 boot/uboot/uboot.mk  |    3 +++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 46d1109..b489fae 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -34,6 +34,12 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
 config BR2_TARGET_UBOOT_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	bool "Local directory"
+	help
+	  This option allows Buildroot to get the u-boot source
+	  code from a local directory.
+
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
@@ -70,6 +76,12 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
+config BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_TARGET_UBOOT_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the u-boot source code.
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 532ac8b..2ae7d87 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -23,6 +23,9 @@ UBOOT_SITE_METHOD = git
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
+LINUX_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH))
+LINUX_SITE_METHOD = local
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-- 
1.7.9.5
