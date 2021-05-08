From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sat,  8 May 2021 22:16:14 +0200
Subject: [Buildroot] [PATCH] configs/bananapi_m2_zero: bump versions and add
 WiFi support
Message-ID: <20210508201614.16041-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump kernel to version 5.12.2.
- Bump U-Boot to version 2021.04.

Also, adapt the SD card name in the boot script to follow Linux naming.
While at it, add comments to make the defconfig more readable.

The Banana Pi M2 Zero comprises an AMPAK AP6212 module with a Broadcom
bcm43438/a1 WiFi chip. Add the necessary firmware and tools to support it
and update documentation. We switch to mdev for /dev management, so that
the WiFi driver get auto-loaded.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 board/bananapi/bananapi-m2-zero/boot.cmd      |  2 +-
 .../bananapi-m2-zero/firmware-links.sh        |  9 ++++++
 .../bananapi-m2-zero/linux-extras.config      |  9 ++++++
 board/bananapi/bananapi-m2-zero/readme.txt    | 14 +++++++++
 configs/bananapi_m2_zero_defconfig            | 30 +++++++++++++++++--
 5 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100755 board/bananapi/bananapi-m2-zero/firmware-links.sh
 create mode 100644 board/bananapi/bananapi-m2-zero/linux-extras.config

diff --git a/board/bananapi/bananapi-m2-zero/boot.cmd b/board/bananapi/bananapi-m2-zero/boot.cmd
index 081450935b..70ccdf7045 100644
--- a/board/bananapi/bananapi-m2-zero/boot.cmd
+++ b/board/bananapi/bananapi-m2-zero/boot.cmd
@@ -1,4 +1,4 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
 
 mmc dev 0
 fatload mmc 0 $kernel_addr_r zImage
diff --git a/board/bananapi/bananapi-m2-zero/firmware-links.sh b/board/bananapi/bananapi-m2-zero/firmware-links.sh
new file mode 100755
index 0000000000..7f320fb1a5
--- /dev/null
+++ b/board/bananapi/bananapi-m2-zero/firmware-links.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+# Create the necessary WiFi firmware symbolic links for the brcmfmac driver
+set -eu
+
+cd "$1/lib/firmware"
+[ -d brcm ] || mkdir -v brcm
+cd brcm
+ln -svf ../ap6212/nvram.txt brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt
+ln -svf ../ap6212/fw_bcm43438a1_apsta.bin brcmfmac43430-sdio.bin
diff --git a/board/bananapi/bananapi-m2-zero/linux-extras.config b/board/bananapi/bananapi-m2-zero/linux-extras.config
new file mode 100644
index 0000000000..b9d3b143c8
--- /dev/null
+++ b/board/bananapi/bananapi-m2-zero/linux-extras.config
@@ -0,0 +1,9 @@
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_BRCMFMAC=m
diff --git a/board/bananapi/bananapi-m2-zero/readme.txt b/board/bananapi/bananapi-m2-zero/readme.txt
index 9edd477f11..a48c514c14 100644
--- a/board/bananapi/bananapi-m2-zero/readme.txt
+++ b/board/bananapi/bananapi-m2-zero/readme.txt
@@ -32,3 +32,17 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
 
 Insert the micro SDcard in your Bananapi M2 Zero and power it up. The console
 is on the Debug UART on the CON3 header, with serial settings 115200 8N1.
+
+Using Wifi
+==========
+
+  # iwconfig wlan0 essid ACCESSPOINTNAME
+  # wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
+
+(enter the wifi password and press enter)
+
+  # wpa_supplicant -i wlan0 -c /etc/wpa.conf &
+  # udhcpc -i wlan0
+  # ping buildroot.org
+
+Enjoy!
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index e5c89fce40..9e6760d196 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -1,23 +1,45 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+
+# Linux headers same as kernel, a 5.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# System
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Bananapi M2 Zero"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-zero/firmware-links.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-zero/genimage.cfg"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bananapi/bananapi-m2-zero/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-bananapi-m2-zero"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# WiFi
+BR2_PACKAGE_ARMBIAN_FIRMWARE=y
+BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="bananapi_m2_zero"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -26,6 +48,8 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-zero/boot.cmd"
+
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.30.2
