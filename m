From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Date: Wed, 24 Jun 2020 13:50:09 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: do not rename startup files
Message-ID: <20200624115009.15561-1-sveyret@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug: 13026

When booting, a Raspberry Pi will load the appropriate start files, depending on the provided configuration. For example, if the config.txt file contains:
gpu_mem=16
the board will automatically load the cut-down startup files (start_cd.elf and fixup_cd.dat on non-Rpi4).
Unfortunately, even when the appropriate version is selected in the configuration menu (in this example, BR2_PACKAGE_RPI_FIRMWARE_BOOT="_cd") if the rpi-firmware makefile takes the good files, it renames them to non-qualified, i.e. start.elf and fixup.dat. But as these are not the files searched by the Raspberry Pi, the board will not start.

Signed-off-by: St?phane Veyret <sveyret@gmail.com>
---
 package/rpi-firmware/rpi-firmware.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6ad67ab0e5..2f4b2b05bf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -44,14 +44,14 @@ endif # INSTALL_VCDBG
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
 # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
 define RPI_FIRMWARE_INSTALL_BOOT
-	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/
 endef
 else
 define RPI_FIRMWARE_INSTALL_BOOT
-	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/
 endef
 endif
 
-- 
2.26.2
