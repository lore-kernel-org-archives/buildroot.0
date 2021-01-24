From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jan 2021 22:42:25 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_r1_defconfig: bump kernel to
 5.10.10, u-boot to 2020.10
Message-ID: <20210124214226.29305-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The probing order of the two mmc controllers (sdcard and sdio wifi) has
changed in kernel 5.10 since commit 21b2cec61c04bd1 (mmc: Set
PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4), so change to
root=PARTUUID=.. instead of hardcoding /dev/mmcblkXp2.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-r1/boot.cmd     | 2 +-
 board/orangepi/orangepi-r1/genimage.cfg | 2 ++
 configs/orangepi_r1_defconfig           | 7 ++++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/board/orangepi/orangepi-r1/boot.cmd b/board/orangepi/orangepi-r1/boot.cmd
index e927b01e82..2e3a4bb679 100644
--- a/board/orangepi/orangepi-r1/boot.cmd
+++ b/board/orangepi/orangepi-r1/boot.cmd
@@ -1,6 +1,6 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=PARTUUID=deadbeef-02 rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-r1.dtb
diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index 01e2c0adc4..e7b32c86ab 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -13,6 +13,8 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		# for root=PARTUUID=deadbeef-02 support
+		disk-signature = 0xdeadbeef
 	}
 
 	partition u-boot {
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index 7c3ec637e5..bad1f9400c 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-r1"
@@ -19,9 +19,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_r1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.20.1
