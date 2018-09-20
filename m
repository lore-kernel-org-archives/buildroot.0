From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 16:05:02 -0500
Subject: [Buildroot] [PATCH] boot/xloader: remove package
Message-ID: <1537477502-30073-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-boot has provided SPL support as a viable replacement for the
2nd stage bootloader on TI platforms.  The X-loader project
hasn't had a commit in the log since 12-05-2011.
(https://gitorious.org/x-loader/x-loader)

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 boot/Config.in          |  1 -
 boot/xloader/Config.in  | 15 ---------------
 boot/xloader/xloader.mk | 32 --------------------------------
 3 files changed, 48 deletions(-)
 delete mode 100644 boot/xloader/Config.in
 delete mode 100644 boot/xloader/xloader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 3687c41..5f524f9 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -18,6 +18,5 @@ source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
-source "boot/xloader/Config.in"
 
 endmenu
diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
deleted file mode 100644
index c411be4..0000000
--- a/boot/xloader/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_TARGET_XLOADER
-	bool "X-loader"
-	depends on BR2_cortex_a8 || BR2_cortex_a9
-	help
-	  The x-loader bootloader. It is mainly used on OMAP-based
-	  platforms.
-
-if BR2_TARGET_XLOADER
-config BR2_TARGET_XLOADER_BOARDNAME
-	string "x-loader board name"
-	help
-	  One of x-loader supported boards to be built.
-	  This will be suffixed with _config to meet x-loader
-	  standard naming.
-endif
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
deleted file mode 100644
index 7e0b286..0000000
--- a/boot/xloader/xloader.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# x-loader
-#
-################################################################################
-
-XLOADER_VERSION = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE = git://gitorious.org/x-loader/x-loader.git
-XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
-
-XLOADER_LICENSE = GPL-2.0+
-XLOADER_LICENSE_FILES = README
-
-XLOADER_INSTALL_IMAGES = YES
-
-define XLOADER_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) $(XLOADER_BOARD_NAME)_config
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) ift
-endef
-
-define XLOADER_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
-endef
-
-$(eval $(generic-package))
-
-ifeq ($(BR2_TARGET_XLOADER)$(BR_BUILDING),yy)
-ifeq ($(XLOADER_BOARD_NAME),)
-$(error NO x-loader board name set. Check your BR2_BOOT_XLOADER_BOARDNAME setting)
-endif
-endif
-- 
1.9.1
