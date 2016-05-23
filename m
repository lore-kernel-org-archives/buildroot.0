From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 May 2016 15:33:48 +0200
Subject: [Buildroot] [PATCH 1/2] boot: add s500-bootloader package
Message-ID: <1464010429-3604-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first level bootloader for the Actions Semiconductor S500 SoC,
which is used on boards like Roseapple Pi and LeMaker Guitar.

The bootloader performs basic configuration and chain loads u-boot for
futher setup.

This bootloader is unfortunately only available as a binary blob. It gets
configured for a specific board using a binary (32bit x86) tool based on a
.ini file (somewhat similar to sunxi .fex).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/Config.in                            |  1 +
 boot/s500-bootloader/Config.in            | 17 ++++++++++++++++
 boot/s500-bootloader/s500-bootloader.hash |  2 ++
 boot/s500-bootloader/s500-bootloader.mk   | 34 +++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 boot/s500-bootloader/Config.in
 create mode 100644 boot/s500-bootloader/s500-bootloader.hash
 create mode 100644 boot/s500-bootloader/s500-bootloader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 4daf079..cd10cd8 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -11,6 +11,7 @@ source "boot/grub2/Config.in"
 source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
+source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
diff --git a/boot/s500-bootloader/Config.in b/boot/s500-bootloader/Config.in
new file mode 100644
index 0000000..7bb689f
--- /dev/null
+++ b/boot/s500-bootloader/Config.in
@@ -0,0 +1,17 @@
+config BR2_TARGET_S500_BOOTLOADER
+	bool "s500-bootloader"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  1st level bootloader for Actions Semiconductor S500 SoC.
+
+	  https://github.com/xapp-le/owl
+
+config BR2_TARGET_S500_BOOTLOADER_BOARD
+	string "board to configure for"
+	depends on BR2_TARGET_S500_BOOTLOADER
+	help
+	  Specify the board to configure the bootloader for.
+	  This should be the name of a directory under s500/boards
+	  containing a suitable bootloader.ini file.
diff --git a/boot/s500-bootloader/s500-bootloader.hash b/boot/s500-bootloader/s500-bootloader.hash
new file mode 100644
index 0000000..d538f23
--- /dev/null
+++ b/boot/s500-bootloader/s500-bootloader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b183024ac69f51ea7befd28d03b2ec35a7280e270405600fb4f37aa91d9c9571  s500-bootloader-a8d7fa1d9a7f353ec4613febf30f4ca99a10a106.tar.gz
diff --git a/boot/s500-bootloader/s500-bootloader.mk b/boot/s500-bootloader/s500-bootloader.mk
new file mode 100644
index 0000000..bc87b09
--- /dev/null
+++ b/boot/s500-bootloader/s500-bootloader.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# s500-bootloader
+#
+################################################################################
+
+S500_BOOTLOADER_VERSION = a8d7fa1d9a7f353ec4613febf30f4ca99a10a106
+S500_BOOTLOADER_SITE = $(call github,xapp-le,owl,$(S500_BOOTLOADER_VERSION))
+S500_BOOTLOADER_LICENSE = PROPRIETARY
+S500_BOOTLOADER_INSTALL_TARGET = NO
+S500_BOOTLOADER_INSTALL_IMAGES = YES
+
+S500_BOOTLOADER_BOARD = $(call qstrip,$(BR2_TARGET_S500_BOOTLOADER_BOARD))
+
+define S500_BOOTLOADER_BUILD_CMDS
+	cd $(@D) && ./tools/utils/bootloader_pack \
+		s500/bootloader/bootloader.bin \
+		s500/boards/$(S500_BOOTLOADER_BOARD)/bootloader.ini \
+		s500-bootloader.bin
+endef
+
+define S500_BOOTLOADER_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/s500-bootloader.bin \
+		$(BINARIES_DIR)/s500-bootloader.bin
+endef
+
+$(eval $(generic-package))
+
+ifeq ($(BR2_TARGET_S500_BOOTLOADER)$(BR_BUILDING),yy)
+# we NEED a board name
+ifeq ($(S500_BOOTLOADER_BOARD),)
+$(error No s500-bootloader board specified. Check your BR2_TARGET_S500_BOOTLOADER settings)
+endif
+endif
-- 
2.7.0
