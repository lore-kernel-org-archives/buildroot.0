From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:39:55 +0200
Subject: [Buildroot] [git commit] configs: add support for LinkSprite pcDuino
Message-ID: <20160612164003.4C6B181E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f7c3c3c25eccb4392a9a9cd26593adcc12f18ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add basic support for LinkSprite pcDuino board series
including pcDuino, pcDuino-Lite, pcDuino-Lite-WiFi.
Tested on pcDuino-Lite-WiFi.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/linksprite/pcduino/boot.cmd            |  8 ++++
 board/linksprite/pcduino/genimage.cfg        | 41 ++++++++++++++++++
 board/linksprite/pcduino/linux-extras.config | 16 +++++++
 board/linksprite/pcduino/post-build.sh       | 11 +++++
 board/linksprite/pcduino/post-image.sh       | 16 +++++++
 board/linksprite/pcduino/readme.txt          | 42 +++++++++++++++++++
 configs/linksprite_pcduino_defconfig         | 62 ++++++++++++++++++++++++++++
 7 files changed, 196 insertions(+)

diff --git a/board/linksprite/pcduino/boot.cmd b/board/linksprite/pcduino/boot.cmd
new file mode 100644
index 0000000..0db8363
--- /dev/null
+++ b/board/linksprite/pcduino/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 console=tty1 earlyprintk root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun4i-a10-pcduino.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/linksprite/pcduino/genimage.cfg b/board/linksprite/pcduino/genimage.cfg
new file mode 100644
index 0000000..0ff0434
--- /dev/null
+++ b/board/linksprite/pcduino/genimage.cfg
@@ -0,0 +1,41 @@
+#
+# Minimal SD card image for the pcDuino
+#
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun4i-a10-pcduino.dtb",
+			"boot.scr"
+		}
+	}
+	size = 16M
+}
+
+#
+# Note: u-boot environment is stored between u-boot and boot partitions
+#
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/linksprite/pcduino/linux-extras.config b/board/linksprite/pcduino/linux-extras.config
new file mode 100644
index 0000000..670f83f
--- /dev/null
+++ b/board/linksprite/pcduino/linux-extras.config
@@ -0,0 +1,16 @@
+# spidev
+CONFIG_SPI_SPIDEV=y
+
+# wireless core
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+
+# wireless drivers
+CONFIG_WLAN=y
+CONFIG_RTL_CARDS=m
+CONFIG_RTL8192CU=m
+CONFIG_RTLWIFI=m
+CONFIG_RTLWIFI_USB=m
+CONFIG_RTLWIFI_DEBUG=y
+CONFIG_RTL8192C_COMMON=m
diff --git a/board/linksprite/pcduino/post-build.sh b/board/linksprite/pcduino/post-build.sh
new file mode 100755
index 0000000..268c107
--- /dev/null
+++ b/board/linksprite/pcduino/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# post-build.sh for pcDuino taken from OrangePi post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/linksprite/pcduino/post-image.sh b/board/linksprite/pcduino/post-image.sh
new file mode 100755
index 0000000..c82b189
--- /dev/null
+++ b/board/linksprite/pcduino/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/linksprite/pcduino/readme.txt b/board/linksprite/pcduino/readme.txt
new file mode 100644
index 0000000..08f380f
--- /dev/null
+++ b/board/linksprite/pcduino/readme.txt
@@ -0,0 +1,42 @@
+pcDuino v1 boards (http://www.linksprite.com/linksprite-pcduino)
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting
+with the buildroot environment for the LinkSprite pcDuino v1 board
+including its flavors pcDuino-Lite and pcDuino-Lite-WiFi. With the
+current configuration it will bring-up the board and allow access
+through the serial console as well as ethernet and wireless
+network interfaces.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make linksprite_pcduino_defconfig
+
+Modify configuration if needed, e.g. add more packages to target:
+
+    $ make menuconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image
+called "sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+How to boot new image
+=====================
+
+Insert SD card and reset the board. By default pcDuino board
+boots from SD card.
diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
new file mode 100644
index 0000000..45de3c1
--- /dev/null
+++ b/configs/linksprite_pcduino_defconfig
@@ -0,0 +1,62 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# System settings
+BR2_TARGET_GENERIC_HOSTNAME="pcduino"
+BR2_TARGET_GENERIC_ISSUE="pcDuino buildroot is ready"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# SD image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/linksprite/pcduino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/linksprite/pcduino/post-image.sh"
+
+# For kernel modules autoloading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Host packages
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# Target packages: wireless support for pcduino-lite-wifi
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
