From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:13:34 +0100
Subject: [Buildroot] [git commit] board/orangepi-zero-plus2: switch to GPT
 for PARTLABEL support
Message-ID: <20210203215317.EC253815FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=194dbbfc92072e9d4d5a6dcb0ac79ccbdc8cc48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch that pins mmc indexes was not accepted to mainline kernel. Drop that
patch and switch to GPT to use partition labels. For GPT the name of the
partition in genimage.cfg is used as the label for that partition. Note
that the default GPT partition table location conflicts with the SPL
location, so move GPT table after bootloaders.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-zero-plus2/boot.cmd        |  2 +-
 board/orangepi/orangepi-zero-plus2/genimage.cfg    |  9 +++++-
 ...range-pi-zero-plus2-use-fixed-mmc-indexes.patch | 33 ----------------------
 configs/orangepi_zero_plus2_defconfig              |  1 -
 4 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/boot.cmd b/board/orangepi/orangepi-zero-plus2/boot.cmd
index 4772a9be31..aa5162004b 100644
--- a/board/orangepi/orangepi-zero-plus2/boot.cmd
+++ b/board/orangepi/orangepi-zero-plus2/boot.cmd
@@ -1,4 +1,4 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
 
 fatload mmc 0 $kernel_addr_r Image
 fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus2.dtb
diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index 8091edad6f..98ebf5b475 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -11,6 +11,10 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		# for root=PARTLABEL support
+		gpt = true
+		# default GPT location conflicts with bootloaders, move it after
+		gpt-location = 1M
 	}
 
 	partition spl {
@@ -23,7 +27,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1024000 # 1MB - 40K + 16K(GPT)
 	}
 
 	partition boot {
@@ -32,8 +36,11 @@ image sdcard.img {
 		image = "boot.vfat"
 	}
 
+	# 'rootfs' will be used as the partition label, used
+	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
+		size = 256M
 	}
 }
diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch
deleted file mode 100644
index 8c4e19500c..0000000000
--- a/board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f780fee2dc7d4a7bcfb2297342f7bfec2c0d1c28 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Tue, 26 Jan 2021 23:19:13 +0300
-Subject: [PATCH 1/1] ARM: dts: orange-pi-zero-plus2: use fixed mmc indexes
-
-Driver sunxi-mmc has recently been switched to asynchronous probe.
-As a result, mmc indexes can be shuffled breaking existing setups
-where UUIDs are not used for boot devices. Pin mmc indexes to keep
-running the systems where fixed MMC or eMMC are specified,
-e.g. root=/dev/mmcblk0p2.
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- .../arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-index de19e68eb84e..c4854d3ba524 100644
---- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-@@ -13,6 +13,9 @@ / {
- 
- 	aliases {
- 		serial0 = &uart0;
-+		mmc0 = &mmc0;
-+		mmc1 = &mmc1;
-+		mmc2 = &mmc2;
- 	};
- 
- 	chosen {
--- 
-2.30.0
-
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 9273a8e3a8..aa4c5c9413 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -5,7 +5,6 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
-BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
