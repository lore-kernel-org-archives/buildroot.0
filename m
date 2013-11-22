From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:50:55 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to install
	firmware files in target/boot/
In-Reply-To: <cover.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <74d82d94462f019fa59a880bfdff422110956f5c.1385157864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The firmware files must reside in a FAT filesystem, in the first partition
of the SDcard, so it makes sense to install them in target/ (eg. for a
post-image script to generate the different partitions from the rootfs.tar).

Add an option (off by default) to install the bootloader files into
$(TARGET_DIR)/boot .

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Note: this will come very handy when we eventually have our generic
multi-image generation infra, to come in a following patch.
---
 package/rpi-firmware/Config.in       |  9 +++++++++
 package/rpi-firmware/rpi-firmware.mk | 16 +++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cd45be4..ce5b974 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -45,4 +45,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_TARGET
+	bool "Install bootloader files into /boot"
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	help
+	  Say 'y' here if you want to have the bootloader files installed
+	  in /boot on the target (the default).
+
+	  Say 'n' to have them installed in $(BINARIES_DIR)/rpi-firmware.
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e88efd2..6adea77 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -9,12 +9,18 @@ RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWAR
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_TARGET),y)
+RPI_FIRMWARE_DEST = $(TARGET_DIR)/boot
+else
+RPI_FIRMWARE_DEST = $(BINARIES_DIR)/rpi-firmware
+endif
+
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
-	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(RPI_FIRMWARE_DEST)/bootcode.bin
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(RPI_FIRMWARE_DEST)/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(RPI_FIRMWARE_DEST)/fixup.dat
+	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(RPI_FIRMWARE_DEST)/config.txt
+	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(RPI_FIRMWARE_DEST)/cmdline.txt
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.2
