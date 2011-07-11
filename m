From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:52 +0200
Subject: [Buildroot] [PATCH 08/12] Add x-loader bootloader
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a50f6419bfba04ed1c24b23be18752b12c951c7d.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Philippe Reynes <tremyfr@yahoo.fr>

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

merge xloader
---
 boot/Config.in          |    1 +
 boot/xloader/Config.in  |   15 +++++++++++++++
 boot/xloader/xloader.mk |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 boot/xloader/Config.in
 create mode 100644 boot/xloader/xloader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 67adae8..2a97695 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/xloader/Config.in"
 
 endmenu
 
diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
new file mode 100644
index 0000000..fe9a20c
--- /dev/null
+++ b/boot/xloader/Config.in
@@ -0,0 +1,15 @@
+menuconfig BR2_TARGET_XLOADER
+	bool "X-loader"
+	depends on BR2_arm
+	help
+	  The x-loader bootloader. It is mainly used on OMAP-based
+	  platforms.
+
+if BR2_TARGET_XLOADER
+config BR2_TARGET_XLOADER_BOARDNAME
+	string "x-loader board name"
+	help
+	  One of x-loader supported boards to be built.
+	  This will be suffixed with _config to meet x-loader
+	  standard naming.
+endif
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
new file mode 100644
index 0000000..8d8cce3
--- /dev/null
+++ b/boot/xloader/xloader.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# x-loader
+#
+#############################################################
+XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
+XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
+XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
+
+XLOADER_INSTALL_IMAGES = YES
+
+define XLOADER_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) $(XLOADER_BOARD_NAME)_config
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) ift
+endef
+
+define XLOADER_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
+endef
+
+$(eval $(call GENTARGETS,boot,xloader))
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_TARGET_XLOADER),y)
+# we NEED a board name unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(XLOADER_BOARD_NAME),)
+$(error NO x-loader board name set. Check your BR2_BOOT_XLOADER_BOARDNAME setting)
+endif
+endif
+
+endif
-- 
1.7.4.1
