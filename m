From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:50:56 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: move to bootloaders
	menu
In-Reply-To: <cover.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

rpi-firmware, although it does contain the GPU firmware, also serves as
the bootloader. As a reminder, here is an overview of how the RPi boots:
  - GPU exits reset
  - GPU loads its firmware from the first, FAT32-formatted partition
  - GPU reads its config file from the same partition
  - GPU loads kernel from the same partition, into RAM
  - GPU de-asserts the reset of the ARM core (CPU)
  - CPU exits reset and starts executing kernel code

So, although the largest part of rpi-firmware is indeed the GPU firmware,
the first purpose it serves is as a bootloader for the ARM core.

People that do not want to use the GPU (eg. headless, no multimedia...)
will still want to select rpi-firmware.

Having rpi-firmware in target packages -> hardware-handling -> firmware
is a bit misleading in this case.

Hence, move rpi-firmware from the target packages submenu, into the
bootloaders submenu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/Config.in                                 |  1 +
 {package => boot}/rpi-firmware/Config.in       | 24 ++++++++++++------------
 {package => boot}/rpi-firmware/cmdline.txt     |  0
 {package => boot}/rpi-firmware/config.txt      |  0
 {package => boot}/rpi-firmware/rpi-firmware.mk | 10 +++++-----
 configs/raspberrypi_defconfig                  |  2 +-
 package/Config.in                              |  1 -
 7 files changed, 19 insertions(+), 19 deletions(-)
 rename {package => boot}/rpi-firmware/Config.in (71%)
 rename {package => boot}/rpi-firmware/cmdline.txt (100%)
 rename {package => boot}/rpi-firmware/config.txt (100%)
 rename {package => boot}/rpi-firmware/rpi-firmware.mk (60%)

diff --git a/boot/Config.in b/boot/Config.in
index eb5f7cd..2783607 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -8,6 +8,7 @@ source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
+source "boot/rpi-firmware/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
diff --git a/package/rpi-firmware/Config.in b/boot/rpi-firmware/Config.in
similarity index 71%
rename from package/rpi-firmware/Config.in
rename to boot/rpi-firmware/Config.in
index ce5b974..fea292b 100644
--- a/package/rpi-firmware/Config.in
+++ b/boot/rpi-firmware/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_RPI_FIRMWARE
+config BR2_TARGET_RPI_FIRMWARE
 	bool "rpi-firmware"
 	depends on BR2_arm
 	help
@@ -7,11 +7,11 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 	  https://github.com/raspberrypi/firmware
 
-if BR2_PACKAGE_RPI_FIRMWARE
+if BR2_TARGET_RPI_FIRMWARE
 
 choice
 	bool "Firmware to boot"
-	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	default BR2_TARGET_RPI_FIRMWARE_DEFAULT
 	help
 	  There are three different firmware files:
 	    - the default firmware, that enables standard GPU features;
@@ -20,18 +20,18 @@ choice
 	    - the cut-down firmware, for emergency situations, with only
 	      features required to boot a Linux kernel.
 
-config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+config BR2_TARGET_RPI_FIRMWARE_DEFAULT
 	bool "default"
 	help
 	  The default firmware, that enables standard GPU features.
 
-config BR2_PACKAGE_RPI_FIRMWARE_X
+config BR2_TARGET_RPI_FIRMWARE_X
 	bool "extended ('x', more codecs)"
 	help
 	  The extended firmware, that enables additional GPU features
 	  (eg. more audio/video codecs).
 
-config BR2_PACKAGE_RPI_FIRMWARE_CD
+config BR2_TARGET_RPI_FIRMWARE_CD
 	bool "cut-down ('cd', emergency)"
 	help
 	  The cut-down firmware, for emergency situations, with only
@@ -39,13 +39,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CD
 
 endchoice
 
-config BR2_PACKAGE_RPI_FIRMWARE_BOOT
+config BR2_TARGET_RPI_FIRMWARE_BOOT
 	string
-	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
-	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
-	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
+	default ""      if BR2_TARGET_RPI_FIRMWARE_DEFAULT
+	default "_x"    if BR2_TARGET_RPI_FIRMWARE_X
+	default "_cd"   if BR2_TARGET_RPI_FIRMWARE_CD
 
-config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_TARGET
+config BR2_TARGET_RPI_FIRMWARE_INSTALL_TARGET
 	bool "Install bootloader files into /boot"
 	depends on !BR2_TARGET_ROOTFS_INITRAMFS
 	help
@@ -54,4 +54,4 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_TARGET
 
 	  Say 'n' to have them installed in $(BINARIES_DIR)/rpi-firmware.
 
-endif # BR2_PACKAGE_RPI_FIRMWARE
+endif # BR2_TARGET_RPI_FIRMWARE
diff --git a/package/rpi-firmware/cmdline.txt b/boot/rpi-firmware/cmdline.txt
similarity index 100%
rename from package/rpi-firmware/cmdline.txt
rename to boot/rpi-firmware/cmdline.txt
diff --git a/package/rpi-firmware/config.txt b/boot/rpi-firmware/config.txt
similarity index 100%
rename from package/rpi-firmware/config.txt
rename to boot/rpi-firmware/config.txt
diff --git a/package/rpi-firmware/rpi-firmware.mk b/boot/rpi-firmware/rpi-firmware.mk
similarity index 60%
rename from package/rpi-firmware/rpi-firmware.mk
rename to boot/rpi-firmware/rpi-firmware.mk
index 6adea77..215de95 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/boot/rpi-firmware/rpi-firmware.mk
@@ -9,7 +9,7 @@ RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWAR
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_TARGET),y)
+ifeq ($(BR2_TARGET_RPI_FIRMWARE_INSTALL_TARGET),y)
 RPI_FIRMWARE_DEST = $(TARGET_DIR)/boot
 else
 RPI_FIRMWARE_DEST = $(BINARIES_DIR)/rpi-firmware
@@ -17,10 +17,10 @@ endif
 
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(RPI_FIRMWARE_DEST)/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(RPI_FIRMWARE_DEST)/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(RPI_FIRMWARE_DEST)/fixup.dat
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(RPI_FIRMWARE_DEST)/config.txt
-	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(RPI_FIRMWARE_DEST)/cmdline.txt
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_TARGET_RPI_FIRMWARE_BOOT).elf $(RPI_FIRMWARE_DEST)/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_TARGET_RPI_FIRMWARE_BOOT).dat $(RPI_FIRMWARE_DEST)/fixup.dat
+	$(INSTALL) -D -m 0644 boot/rpi-firmware/config.txt $(RPI_FIRMWARE_DEST)/config.txt
+	$(INSTALL) -D -m 0644 boot/rpi-firmware/cmdline.txt $(RPI_FIRMWARE_DEST)/cmdline.txt
 endef
 
 $(eval $(generic-package))
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index da877fb..db34717 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -6,7 +6,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_TARGET_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_LIBCOFI=y
 
diff --git a/package/Config.in b/package/Config.in
index 311cc6c..f003a57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -254,7 +254,6 @@ menu "Firmware"
 source "package/am33x-cm3/Config.in"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"
-source "package/rpi-firmware/Config.in"
 source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
-- 
1.8.1.2
