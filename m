From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 17 Sep 2012 22:34:17 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
Message-ID: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for raspberrypi bootloader and VideoCore.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

Added changes from Arnout comments:
(http://lists.busybox.net/pipermail/buildroot/2012-September/058565.html)
- add rasberrypi-firmware as separate package
- change Config.in handling to have separate bootloader and
  VideoCore packages (handled in same mk file)
- various other fixes

New features:
- add possibility to choose ARM - GPU memory split by user
- download package in tar.gz instead git method

---
 package/Config.in                                  |    1 +
 package/raspberrypi-firmware/Config.in             |   53 ++++++++++++++++++++
 .../raspberrypi-firmware/raspberrypi-firmware.mk   |   48 ++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 package/raspberrypi-firmware/Config.in
 create mode 100644 package/raspberrypi-firmware/raspberrypi-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 58dd5e8..36635cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -232,6 +232,7 @@ source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
+source "package/raspberrypi-firmware/Config.in"
 source "package/read-edid/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sane-backends/Config.in"
diff --git a/package/raspberrypi-firmware/Config.in b/package/raspberrypi-firmware/Config.in
new file mode 100644
index 0000000..55abd68
--- /dev/null
+++ b/package/raspberrypi-firmware/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+	bool
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+        bool "Raspberry Pi bootloader files"
+	select BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+        help
+          These are the binary bootloader files from Broadcom.
+
+          https://github.com/raspberrypi/firmware
+
+if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+choice
+
+prompt "Memory & GPU split"
+	default BR2_PACKAGE_BOOTLOADER_ARM192
+	help
+         Select how much memory use for system and
+	 how much for GPU.
+
+config BR2_PACKAGE_BOOTLOADER_ARM128
+        bool "arm128"
+        help
+	   128M ARM, 128M GPU split (use this for heavy 3D work, possibly also
+	   required for some video decoding)
+
+config BR2_PACKAGE_BOOTLOADER_ARM192
+        bool "arm192"
+        help
+	  192M ARM, 64M GPU split (this is the default)
+
+config BR2_PACKAGE_BOOTLOADER_ARM224
+        bool "arm224"
+        help
+	  224M ARM, 32M GPU split (use this for Linux only with no 3D or video
+	  processing. Its enough for the 1080p framebuffer, but not much else)
+
+config BR2_PACKAGE_BOOTLOADER_ARM240
+        bool "arm240"
+        help
+	  240M ARM, 16M GPU split (use this for headless mode only. It is enough
+	  to boot the system, but you can not use video at all.)
+endchoice
+
+endif #BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+
+config BR2_PACKAGE_RASPBERRYPI_VIDEOCORE
+        bool "Raspberry Pi VideoCore drivers"
+	select BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+        help
+          These are the binary VideoCore drivers from Broadcom.
+
+          https://github.com/raspberrypi/firmware
diff --git a/package/raspberrypi-firmware/raspberrypi-firmware.mk b/package/raspberrypi-firmware/raspberrypi-firmware.mk
new file mode 100644
index 0000000..1ebf67c
--- /dev/null
+++ b/package/raspberrypi-firmware/raspberrypi-firmware.mk
@@ -0,0 +1,48 @@
+RASPBERRYPI_FIRMWARE_VERSION = d29291e
+RASPBERRYPI_FIRMWARE_SOURCE = raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz
+RASPBERRYPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
+
+ifeq ($(BR2_PACKAGE_RASPBERRYPI_VIDEOCORE),y)
+RASPBERRYPI_FIRMWARE_INSTALL_STAGING = YES
+
+define RASPBERRYPI_FIRMWARE_INSTALL_STAGING_CMDS
+	cp -r $(@D)/hardfp/opt $(STAGING_DIR)/
+endef
+
+define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_VIDEOCORE
+	cp -r $(@D)/hardfp/opt/vc/bin $(TARGET_DIR)/usr/bin
+	cp -r $(@D)/hardfp/opt/vc/lib $(TARGET_DIR)/usr/lib
+	cp -r $(@D)/hardfp/opt/vc/sbin $(TARGET_DIR)/usr/sbin
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER),y)
+BOOT_FILE := #empty
+ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM128),y)
+BOOT_FILE += arm128_start.elf
+else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM192),y)
+BOOT_FILE += arm192_start.elf
+else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM224),y)
+BOOT_FILE += arm224_start.elf
+else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM240),y)
+BOOT_FILE += arm240_start.elf
+endif
+
+define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER
+	if [ ! -d "$(TARGET_DIR)/boot" ]; then \
+		mkdir $(TARGET_DIR)/boot; \
+	fi; \
+	cp $(@D)/boot/$(subst $(space),$(comma),$(strip $(BOOT_FILE))) \
+		$(TARGET_DIR)/boot/start.elf
+	cp $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/bootcode.bin
+	cp $(@D)/boot/loader.bin $(TARGET_DIR)/boot/loader.bin
+endef
+endif
+
+define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER)
+	$(RASPBERRYPI_FIRMWARE_INSTALL_TARGET_VIDEOCORE)
+endef
+
+$(eval $(generic-package))
+
-- 
1.7.9.5
