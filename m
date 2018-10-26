From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 16:59:05 +0200
Subject: [Buildroot] [git commit] boot/xloader: remove package
Message-ID: <20181026145758.B76958903E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=070b183d0cf5da9ec886b0cdd282246e97b6ba40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-boot has provided SPL support as a viable replacement for the
2nd stage bootloader on TI platforms.  The X-loader project
hasn't had a commit in the log since 12-05-2011.
(https://gitorious.org/x-loader/x-loader)

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy        |  7 +++++++
 boot/Config.in          |  1 -
 boot/xloader/Config.in  | 17 -----------------
 boot/xloader/xloader.mk | 32 --------------------------------
 4 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bd236b2083..c3df37ddd9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_TARGET_XLOADER
+	bool "xloader has been removed"
+	select BR2_LEGACY
+	help
+	  The package has been removed as u-boot SPL provides
+	  similar functionality
+
 config BR2_PACKAGE_TIDSP_BINARIES
 	bool "tidsp-binaries package removed"
 	select BR2_LEGACY
diff --git a/boot/Config.in b/boot/Config.in
index 945168bf37..8e0c8e5df4 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,6 +19,5 @@ source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
-source "boot/xloader/Config.in"
 
 endmenu
diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
deleted file mode 100644
index f687b897ea..0000000000
--- a/boot/xloader/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TARGET_XLOADER
-	bool "X-loader"
-	depends on BR2_cortex_a8 || BR2_cortex_a9
-	help
-	  The x-loader bootloader. It is mainly used on OMAP-based
-	  platforms.
-
-	  http://omappedia.org/wiki/Linux_OMAP_Kernel_Main
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
index 7e0b286681..0000000000
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
