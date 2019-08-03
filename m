From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 11:06:44 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version for pi4
 support
Message-ID: <20190803090406.22FB583D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a47328a22aa5fac2fe92aab2d8d75d8c3481b9ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit pulls in the latest version of rpi-firmware to enable support
for the new Pi4.  The Pi4 uses a different set of start files, so it adds
variant selection and copies the Pi4 variant of the files if selected.

Signed-off-by: Michael Cullen <michael@michaelcullen.name>
[Peter: reword / rework slightly]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/Config.in         | 24 ++++++++++++++++++++++--
 package/rpi-firmware/rpi-firmware.hash |  2 +-
 package/rpi-firmware/rpi-firmware.mk   | 16 ++++++++++++++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 0ebbe7a4cd..7cebc5e7ca 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -11,6 +11,24 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 if BR2_PACKAGE_RPI_FIRMWARE
 
+choice
+	bool "rpi variant"
+	help
+	  The Raspberry Pi 4 introduced a slightly different naming
+	  convention and set of boot files. This option controls which
+	  format to use.
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
+	bool "rpi 0/1/2/3"
+	help
+	  The default set of files, for versions pre-4
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	bool "rpi 4"
+	help
+	  The Raspberry Pi 4 files
+endchoice
+
 choice
 	bool "Firmware to boot"
 	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
@@ -45,8 +63,10 @@ endchoice
 config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	string
 	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
-	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
-	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
+	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
+	default "x"     if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
+	default "cd"    if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 076ce5044c..61834f7d42 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e911f6342ea8aa9380cae97c6f5ac4ddd370527265f23d5b5d4b2c6f679d4ba8 rpi-firmware-ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da.tar.gz
+sha256 c82c40cf37fac36160a7f6b9c314506beb942bf113a55d30fa163c56a4f98946 rpi-firmware-bcf40b5c2b94178c7564fb451098d44968e44af5.tar.gz
 sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 272db1c321..717f705f66 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da
+RPI_FIRMWARE_VERSION = bcf40b5c2b94178c7564fb451098d44968e44af5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -41,12 +41,24 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 endef
 endif # INSTALL_VCDBG
 
-define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
+# bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
+define RPI_FIRMWARE_INSTALL_BOOT
+	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
+endef
+else
+define RPI_FIRMWARE_INSTALL_BOOT
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+endef
+endif
+
+define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	$(RPI_FIRMWARE_INSTALL_BOOT)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
