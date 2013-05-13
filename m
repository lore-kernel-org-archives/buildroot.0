From: Carlo Caione <carlo.caione@gmail.com>
Date: Mon, 13 May 2013 07:52:27 +0200
Subject: [Buildroot] [PATCH 2/3] sunxi-boards: new package
In-Reply-To: <1368424348-9853-1-git-send-email-carlo.caione@gmail.com>
References: <1368424348-9853-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1368424348-9853-2-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
Changelog:
	- Improved package description
	- Config.in rewritten
	- Makefile rewritten
---
 package/Config.in                    |  1 +
 package/sunxi-boards/Config.in       | 19 +++++++++++++++++++
 package/sunxi-boards/sunxi-boards.mk | 17 +++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/sunxi-boards/Config.in
 create mode 100644 package/sunxi-boards/sunxi-boards.mk

diff --git a/package/Config.in b/package/Config.in
index 26440a5..7868c32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -218,6 +218,7 @@ source "package/b43-firmware/Config.in"
 source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
+source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
new file mode 100644
index 0000000..27ee8fc
--- /dev/null
+++ b/package/sunxi-boards/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SUNXI_BOARDS
+	bool "sunxi script.bin board file"
+	select BR2_PACKAGE_HOST_SUNXI_TOOLS
+	help
+	  Sunxi-boards requires a compiled .fex files for hardware description,
+	  used by kernel during boot for hardware initialization. This package
+	  is specific for linux-sunxi kernel and it is useless for mainline
+	  kernel versions.
+
+	  https://github.com/linux-sunxi/sunxi-boards
+
+if BR2_PACKAGE_SUNXI_BOARDS
+config BR2_PACKAGE_SUNXI_BOARDS_BOARD_NAME
+	string "Board name"
+	help
+	  This field defines the name of the board for which the .bin
+	  files should be generated. See inside sys_config/a10 directory in
+	  sunxi-boards source code to see the list of valid board names.
+endif
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
new file mode 100644
index 0000000..1f52110
--- /dev/null
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# sunxi-boards
+#
+#############################################################
+
+SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
+SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/master
+SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
+SUNXI_BOARDS_INSTALL_IMAGES = YES
+SUNXI_BOARDS_INSTALL_TARGET = NO
+
+define SUNXI_BOARDS_INSTALL_IMAGES_CMDS
+	$(FEX2BIN) $(@D)/sys_config/a10/$(BR2_PACKAGE_SUNXI_BOARDS_BOARD_NAME).fex $(BINARIES_DIR)/script.bin
+endef
+
+$(eval $(generic-package))
-- 
1.8.2.3
