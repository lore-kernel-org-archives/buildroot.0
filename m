From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:23:52 +0100
Subject: [Buildroot] [PATCH 6/7] package/rpi-firmware: install DTB blobs
In-Reply-To: <cover.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <fce1facfca634dd669d5334e033951edcf7f32d6.1420142707.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we compile a DT-aware kernel, or the user wants them, install the DTB
blobs:
  - standard DTBs for standalon A/B and A+/B+ models;
  - overlay DTBs for the 'hats' addon boards.

The only configurations allowed are:
  - no kernel enabled                 :  prompt the user
  - kernel enabled without DT support :  hide the prompt
  - kernel enabled with DT support    :  show the prompt, force the option

Install the DTBs as per the traditional layout expected by all RPi
users, that is:
  - base DTBs alongside the other boot files;
  - overlay DTBs in a sub-directory.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/Config.in       | 11 +++++++++++
 package/rpi-firmware/rpi-firmware.mk | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cd45be4..b708579 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RPI_FIRMWARE
 	bool "rpi-firmware"
 	depends on BR2_arm
+	select BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DBS if BR2_LINUX_KERNEL_DTS_SUPPORT
 	help
 	  RaspberryPi Firmware
 	  Pre-compiled binaries of the current bootloader and GPU firmware
@@ -45,4 +46,14 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DBS
+	bool "Install DTB blobs"
+	depends on !BR2_LINUX_KERNEL || BR2_LINUX_KERNEL_DTS_SUPPORT
+	help
+	  Say 'y' here if you want to boot your kernel that has support
+	  for the device tree.
+
+	  If Buildroot will also build a kernel, this is automatically
+	  selected.
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index eb835ee..dedfbc5 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -11,6 +11,19 @@ RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_TARGET = NO
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DBS),y)
+RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
+# Override the version in this case.
+RPI_FIRMWARE_VERSION = 09627457b9e15bf4ea4e6751d3c173a3fb65df07
+define RPI_FIRMWARE_INSTALL_DTB
+	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
+	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
+	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
+		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
+	done
+endef
+endif
+
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-- 
1.9.1
