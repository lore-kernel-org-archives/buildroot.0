From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:21:20 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: install DTB blobs
Message-ID: <20150110112230.588A17FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=958c224c56664e25698e7f6e992c348c64264643
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install all the DTBs:
  - standard DTBs for standalon A/B and A+/B+ models;
  - overlay DTBs for the 'hats' addon boards.

Install the DTBs as per the traditional layout expected by all RPi
users, that is:
  - base DTBs alongside the other boot files;
  - overlay DTBs in a sub-directory.

This requires the user provide a specially configured Linux defconfig
file, as the default ones do not enable USE_OF.

[Thomas: adjust comment explaining why we use a different version when
installing the DTBs is selected.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in       |   11 +++++++++++
 package/rpi-firmware/rpi-firmware.mk |   16 ++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cd45be4..80ba88a 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -45,4 +45,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
+	bool "Install Device Tree Blobs (DTBs)"
+	help
+	  Say 'y' here if you want to boot your kernel that has support
+	  for the device tree.
+
+	  Note that the defconfig files in the Raspberry Pi fork of the
+	  Linux kernel do not enable support for the Device Tree. You'll
+	  have to provide your own Linux config or defconfig file with
+	  device tree enabled, to make use of those DTBs.
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index eb835ee..03178d5 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -11,12 +11,28 @@ RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_TARGET = NO
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
+RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
+# The Device Tree blobs are not yet in the master branch of the
+# raspberrypi firmware project, so we have to use a separate branch
+# for now.
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
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	$(RPI_FIRMWARE_INSTALL_DTB)
 endef
 
 # We have no host sources to get, since we already
