From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 27 Jan 2021 09:05:20 +0300
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_zero_plus2_defconfig: bump
 BSP versions
In-Reply-To: <20210127060520.616445-1-geomatsi@gmail.com>
References: <20210127060520.616445-1-geomatsi@gmail.com>
Message-ID: <20210127060520.616445-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux to 5.10.10 and U-Boot to 2020.10. In the new kernel sunxi-mmc
driver has been switched to asynchronous probe. As a result, mmc indexes
can be shuffled breaking board boot. Add patch that pins mmc indexes to
their original ordered values.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...-pi-zero-plus2-use-fixed-mmc-indexes.patch | 33 +++++++++++++++++++
 configs/orangepi_zero_plus2_defconfig         |  8 +++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch

diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch
new file mode 100644
index 0000000000..8c4e19500c
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch
@@ -0,0 +1,33 @@
+From f780fee2dc7d4a7bcfb2297342f7bfec2c0d1c28 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Tue, 26 Jan 2021 23:19:13 +0300
+Subject: [PATCH 1/1] ARM: dts: orange-pi-zero-plus2: use fixed mmc indexes
+
+Driver sunxi-mmc has recently been switched to asynchronous probe.
+As a result, mmc indexes can be shuffled breaking existing setups
+where UUIDs are not used for boot devices. Pin mmc indexes to keep
+running the systems where fixed MMC or eMMC are specified,
+e.g. root=/dev/mmcblk0p2.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ .../arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+index de19e68eb84e..c4854d3ba524 100644
+--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
++++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+@@ -13,6 +13,9 @@ / {
+ 
+ 	aliases {
+ 		serial0 = &uart0;
++		mmc0 = &mmc0;
++		mmc1 = &mmc1;
++		mmc2 = &mmc2;
+ 	};
+ 
+ 	chosen {
+-- 
+2.30.0
+
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 222736423c..9273a8e3a8 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,9 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -18,9 +19,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
@@ -34,7 +36,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-pl
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
-- 
2.30.0
