From: Guillermo A. Amaral <g@maral.me>
Date: Wed, 18 Feb 2015 21:14:54 -0800
Subject: [Buildroot] [PATCH] Raspberry Pi 2 Support
In-Reply-To: <1424282540-6127-1-git-send-email-g@maral.me>
References: <1424282540-6127-1-git-send-email-g@maral.me>
Message-ID: <1424322894-27643-1-git-send-email-g@maral.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added support for Raspberry Pi 2, tried to keep the configuration
similar to the current RPi support.

* Correction made to kernel hash.

Signed-off-by: Guillermo A. Amaral <g@maral.me>
---
 configs/raspberrypi2_defconfig       | 26 ++++++++++++++++++++++++++
 package/rpi-firmware/cmdline7.txt    |  1 +
 package/rpi-firmware/config7.txt     |  7 +++++++
 package/rpi-firmware/rpi-firmware.mk | 18 +++++++++++++-----
 package/rpi-userland/rpi-userland.mk |  2 +-
 5 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 configs/raspberrypi2_defconfig
 create mode 100644 package/rpi-firmware/cmdline7.txt
 create mode 100644 package/rpi-firmware/config7.txt

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
new file mode 100644
index 0000000..b3d3f7f
--- /dev/null
+++ b/configs/raspberrypi2_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_CPU_ARMV7A=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+
+# Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.12.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe4a83540ec73dfc298f16f027277355470ea9a0"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/package/rpi-firmware/cmdline7.txt b/package/rpi-firmware/cmdline7.txt
new file mode 100644
index 0000000..192fb98
--- /dev/null
+++ b/package/rpi-firmware/cmdline7.txt
@@ -0,0 +1 @@
+console=tty1 root=/dev/mmcblk0p2 rootwait
diff --git a/package/rpi-firmware/config7.txt b/package/rpi-firmware/config7.txt
new file mode 100644
index 0000000..84f93c3
--- /dev/null
+++ b/package/rpi-firmware/config7.txt
@@ -0,0 +1,7 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using a post-build script.
+# See http://buildroot.org/downloads/manual/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+kernel=zImage
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 03178d5..d663bf7 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 393dcc0e76f18f6ac1b67ba45d36058410670034
+RPI_FIRMWARE_VERSION = 8aca5762f984f6decbeda294cee8418966c3d8d3
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -13,19 +13,26 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
-# The Device Tree blobs are not yet in the master branch of the
-# raspberrypi firmware project, so we have to use a separate branch
-# for now.
-RPI_FIRMWARE_VERSION = 09627457b9e15bf4ea4e6751d3c173a3fb65df07
 define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
+	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
 	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
 endif
 
+ifeq ($(BR2_cortex_a7),y)
+define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 package/rpi-firmware/config7.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline7.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	$(RPI_FIRMWARE_INSTALL_DTB)
+endef
+else
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
@@ -34,6 +41,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_DTB)
 endef
+endif
 
 # We have no host sources to get, since we already
 # bundle the script we want to install.
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3f92950..7a19184 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = ba753c1a7f68d7a2e00edaf03364eef001e233ef
+RPI_USERLAND_VERSION = 8efa5baddf63166b9d114ce34e1da10685a11ad6
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.0.5
