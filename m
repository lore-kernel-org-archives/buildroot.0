From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Wed, 13 Apr 2011 23:30:08 +0200
Subject: [Buildroot] [PATCH] Add x-loader bootloader
In-Reply-To: <y>
References: <y>
Message-ID: <1302730208-17584-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 boot/Config.in            |    1 +
 boot/x-loader/Config.in   |   13 +++++++++++++
 boot/x-loader/x-loader.mk |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 boot/x-loader/Config.in
 create mode 100644 boot/x-loader/x-loader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 6bcc98a..a7052b4 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -7,6 +7,7 @@ source "boot/syslinux/Config.in"
 source "boot/u-boot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/x-loader/Config.in"
 
 endmenu
 
diff --git a/boot/x-loader/Config.in b/boot/x-loader/Config.in
new file mode 100644
index 0000000..4c71d03
--- /dev/null
+++ b/boot/x-loader/Config.in
@@ -0,0 +1,13 @@
+menuconfig BR2_TARGET_XLOADER
+	bool "X-loader"
+	help
+	  The x-loader bootloader.
+
+if BR2_TARGET_XLOADER
+config BR2_TARGET_XLOADER_BOARDNAME
+	string "x-loader board name"
+	help
+	  One of x-loader supported boards to be built.
+	  This will be suffixed with _config to meet x-loader 
+	  standard naming.  
+endif
diff --git a/boot/x-loader/x-loader.mk b/boot/x-loader/x-loader.mk
new file mode 100644
index 0000000..37aaf1d
--- /dev/null
+++ b/boot/x-loader/x-loader.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# x-loader
+#
+#############################################################
+XLOADER_VERSION:=6f3a26101303051e0f91b6213735b68ce804e94e
+XLOADER_SITE:=git://gitorious.org/x-loader/x-loader.git
+XLOADER_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
+
+define XLOADER_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) $(XLOADER_BOARD_NAME)_config
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) ift
+endef
+
+define XLOADER_INSTALL_TARGET_CMDS
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
+TARGETS+=xloader
+
+# we NEED a board name unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(XLOADER_BOARD_NAME),)
+$(error NO x-loader board name set. Check your BR2_TARGET_XLOADER_BOARDNAME setting)
+endif
+endif
+
+endif
-- 
1.7.1
