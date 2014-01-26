From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jan 2014 01:35:53 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's sources
Message-ID: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the user has specified a custom U-Boot repository, he may also want
to use it for U-Boot tools.

This could be usefull in two identified use case:
  - User want the same version for U-Boot tools and U-Boot
  - User has modified U-Boot tools in his U-Boot repository

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/uboot-tools/Config.in      | 10 ++++++++++
 package/uboot-tools/uboot-tools.mk |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 7c8f17c..3742b0e 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -7,6 +7,16 @@ config BR2_PACKAGE_UBOOT_TOOLS
 
 if BR2_PACKAGE_UBOOT_TOOLS
 
+if BR2_TARGET_UBOOT
+
+config BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE
+	bool "Use the same repository as U-Boot ?"
+	help
+	  Select this to use the same repository specified for U-Boot. Otherwise,
+	  the upstream sources will be used.
+
+endif
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	bool "mkimage"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 398ce8b..367d067 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -10,6 +10,15 @@ UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
+	UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
+	UBOOT_TOOLS_SOURCE  = $(UBOOT_SOURCE)
+	UBOOT_TOOLS_SITE    = $(UBOOT_SITE)
+ifeq ($(UBOOT_SITE_METHOD),)
+	UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
+endif
+endif
+
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		HOSTCC="$(TARGET_CC)"		\
-- 
1.8.5.2
