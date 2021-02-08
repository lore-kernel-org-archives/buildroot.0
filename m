From: Stefan Agner <stefan@agner.ch>
Date: Mon,  8 Feb 2021 14:13:49 +0100
Subject: [Buildroot] [RFC] package/rpi-firmware: Allow to deploy multiple
 firmware files
Message-ID: <fa3866259e9e3e908e8c92dbaa37e1f9e10886f4.1612789783.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new config option to allow a specific list of firmware files to be
deployed. This is useful if the system needs to decide at runtime which
firmware to use.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
We need this in Home Assistant OS since depending on configuration users want to
use a different firmware. Would something like this be acceptable upstream?

 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk | 19 +++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f5a25c5680..ce31ad46de 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -58,8 +58,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_CD
 	  The cut-down firmware, for emergency situations, with only
 	  features required to boot a Linux kernel.
 
+config BR2_PACKAGE_RPI_FIRMWARE_CUSTOM_LIST
+	bool "deploy firmware files from list"
+	help
+	  Deploy firmware files as listed.
+
 endchoice
 
+config BR2_PACKAGE_RPI_FIRMWARE_LIST
+	string
+	default "start.elf start_x.elf start_cd.elf fixup.dat fixup_x.dat fixup_cd.dat" if BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
+	default "start4.elf start4x.elf start4cd.elf fixup4.dat fixup4x.dat fixup4cd.dat" if BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+
 config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	string
 	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index fe7a099407..d7d432d866 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -48,11 +48,26 @@ define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_CUSTOM_LIST),y)
+define RPI_FIRMWARE_INSTALL_FIRMWARE
+	$(foreach firmware,$(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_LIST)), \
+		$(INSTALL) -D -m 0644 $(@D)/boot/$(firmware) $(BINARIES_DIR)/rpi-firmware/$(firmware)
+	)
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/gaga
+endef
+else
+define RPI_FIRMWARE_INSTALL_FIRMWARE
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/gugus
+endef
+endif
+
+
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(RPI_FIRMWARE_INSTALL_FIRMWARE)
 	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
-- 
2.30.0
