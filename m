From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:25:52 +0200
Subject: [Buildroot] [git commit branch/next] sunxi-boards: new package
Message-ID: <20130528213110.DFCB09A621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc40219173997b87d46ef53f497f0496bbf60cac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: depend on arm, wrap help, change to _FEX_FILE option, error on empty]
Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/sunxi-boards/Config.in       |   25 +++++++++++++++++++++++++
 package/sunxi-boards/sunxi-boards.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 28c2c5c..7bf7dd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ source "package/b43-firmware/Config.in"
 source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
+source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
new file mode 100644
index 0000000..d9fd852
--- /dev/null
+++ b/package/sunxi-boards/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SUNXI_BOARDS
+	bool "sunxi script.bin board file"
+	depends on BR2_arm
+	select BR2_PACKAGE_HOST_SUNXI_TOOLS
+	help
+	  Sunxi-boards requires a compiled .fex files for hardware
+	  description, used by the kernel during boot for hardware
+	  initialization. This package is specific for linux-sunxi
+	  kernel and it is useless for mainline kernel versions.
+
+	  https://github.com/linux-sunxi/sunxi-boards
+
+if BR2_PACKAGE_SUNXI_BOARDS
+config BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE
+	string ".fex file to compile"
+	help
+	  This field defines the name of the .fex file for which the
+	  .bin file should be generated.
+
+	  This should be the path of the .fex file relative to the
+	  sys_config/ directory, and including the .fex extension.
+
+	  See inside sys_config/ directory in sunxi-boards source code
+	  to see the list of valid .fex files.
+endif
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
new file mode 100644
index 0000000..38fc3e1
--- /dev/null
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -0,0 +1,28 @@
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
+SUNXI_BOARDS_FEX_FILE = $(call qstrip,$(BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE))
+
+define SUNXI_BOARDS_INSTALL_IMAGES_CMDS
+	$(FEX2BIN) $(@D)/sys_config/$(SUNXI_BOARDS_FEX_FILE) \
+		$(BINARIES_DIR)/script.bin
+endef
+
+ifeq ($(BR2_PACKAGE_SUNXI_BOARDS),y)
+# we NEED a board name
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(SUNXI_BOARDS_FEX_FILE),)
+$(error No sunxi .fex file specified. Check your BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE settings)
+endif
+endif
+endif
+
+$(eval $(generic-package))
