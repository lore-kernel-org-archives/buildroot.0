From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu, 20 Sep 2012 22:37:46 +0200
Subject: [Buildroot] [PATCH v2] Add package raspberrypi-firmware.
Message-ID: <1348173466-10956-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for raspberrypi bootloader and VideoCore.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

Changes from V1:
- fix names in Config.in (BR2_PACKAGE_BOOTLOADER_ARM192 to
 BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192)
- remove unnecessary SOURCE in mk file
- fix installing VideoCore libraries and include
- copy bootloader files directly to images directory
- rework handling selection of GPU & ARM memory split
 (inspired by Yann patch)
- bump to latest "turbo mode" firmware version
 (http://www.raspberrypi.org/archives/2008)

---
 package/Config.in                                  |    1 +
 package/raspberrypi-firmware/Config.in             |   60 ++++++++++++++++++++
 .../raspberrypi-firmware/raspberrypi-firmware.mk   |   37 ++++++++++++
 3 files changed, 98 insertions(+)
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
index 0000000..e1b7e52
--- /dev/null
+++ b/package/raspberrypi-firmware/Config.in
@@ -0,0 +1,60 @@
+config BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+	bool
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+	bool "Raspberry Pi bootloader files"
+	select BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+	help
+	  These are the binary bootloader files from Broadcom.
+
+	  https://github.com/raspberrypi/firmware
+
+if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+choice
+
+prompt "Memory & GPU split"
+	default BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192
+	help
+	  Select how much memory use for system and
+	  how much for GPU.
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM128
+	bool "arm128"
+	help
+	  128M ARM, 128M GPU split (use this for heavy 3D work, possibly also
+	  required for some video decoding)
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192
+	bool "arm192"
+	help
+	  192M ARM, 64M GPU split (this is the default)
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM224
+	bool "arm224"
+	help
+	  224M ARM, 32M GPU split (use this for Linux only with no 3D or video
+	  processing. Its enough for the 1080p framebuffer, but not much else)
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM240
+	bool "arm240"
+	help
+	  240M ARM, 16M GPU split (use this for headless mode only. It is enough
+	  to boot the system, but you can not use video at all.)
+endchoice
+
+config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_FILE
+	string
+	default "arm128" if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM128
+	default "arm192" if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192
+	default "arm224" if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM224
+	default "arm240" if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM240
+
+endif #BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
+
+config BR2_PACKAGE_RASPBERRYPI_VIDEOCORE
+	bool "Raspberry Pi VideoCore drivers"
+	select BR2_PACKAGE_RASPBERRYPI_FIRMWARE
+	help
+	  These are the binary VideoCore drivers from Broadcom.
+
+	  https://github.com/raspberrypi/firmware
diff --git a/package/raspberrypi-firmware/raspberrypi-firmware.mk b/package/raspberrypi-firmware/raspberrypi-firmware.mk
new file mode 100644
index 0000000..c788497
--- /dev/null
+++ b/package/raspberrypi-firmware/raspberrypi-firmware.mk
@@ -0,0 +1,37 @@
+RASPBERRYPI_FIRMWARE_VERSION = 9f7cff0
+RASPBERRYPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
+
+ifeq ($(BR2_PACKAGE_RASPBERRYPI_VIDEOCORE),y)
+RASPBERRYPI_FIRMWARE_INSTALL_STAGING = YES
+
+define RASPBERRYPI_FIRMWARE_INSTALL_STAGING_CMDS
+	cp -r -T $(@D)/hardfp/opt/vc/include $(STAGING_DIR)/usr/include
+	cp -r -T $(@D)/hardfp/opt/vc/lib $(STAGING_DIR)/usr/lib
+endef
+
+define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_VIDEOCORE
+	cp -r -T $(@D)/hardfp/opt/vc/bin $(TARGET_DIR)/usr/bin
+	cp -r -T $(@D)/hardfp/opt/vc/lib $(TARGET_DIR)/usr/lib
+	cp -r -T $(@D)/hardfp/opt/vc/sbin $(TARGET_DIR)/usr/sbin
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER),y)
+
+BOOT_FILE = $(call qstrip,$(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_FILE))
+
+define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER
+	install -D -m 0644 $(@D)/boot/$(BOOT_FILE)_start.elf \
+		$(BINARIES_DIR)/start.elf
+	install -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/bootcode.bin
+	install -D -m 0644 $(@D)/boot/loader.bin $(BINARIES_DIR)/loader.bin
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
