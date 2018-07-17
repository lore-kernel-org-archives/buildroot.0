From: Marcelo Macedo <marcelo.macedo@nxp.com>
Date: Tue, 17 Jul 2018 14:24:27 -0300
Subject: [Buildroot] [PATCH] configs/imx7ulp-evk: Add new config
Message-ID: <20180717172427.16814-1-marcelo.macedo@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcelo Macedo <mpmacedo@gmail.com>

Add new configuration for i.MX7ULP EVK board running U-Boot
and Kernel provided by NXP on Cortex-A7 and FreeRTOS on Cortex-M4.

Signed-off-by: Marcelo Macedo <mpmacedo@gmail.com>
---
This patch depends on Fabio's patch:
http://lists.busybox.net/pipermail/buildroot/2018-July/225491.html

 DEVELOPERS                              |  4 ++
 board/freescale/imx7ulpevk/readme.txt   | 54 +++++++++++++++++++++++++
 configs/freescale_imx7ulp-evk_defconfig | 38 +++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 board/freescale/imx7ulpevk/readme.txt
 create mode 100644 configs/freescale_imx7ulp-evk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c2d1f291f..c5da2d933d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1198,6 +1198,10 @@ N:	Manuel V?gele <develop@manuel-voegele.de>
 F:	package/python-pyqt5/
 F:	package/python-requests-toolbelt/
 
+N:	Marcelo Macedo <mpmacedo@gmail.com>
+F:	board/freescale/imx7ulpevk/
+F:	configs/freescale_imx7ulp-evk_defconfig
+
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/
diff --git a/board/freescale/imx7ulpevk/readme.txt b/board/freescale/imx7ulpevk/readme.txt
new file mode 100644
index 0000000000..d816eedfcc
--- /dev/null
+++ b/board/freescale/imx7ulpevk/readme.txt
@@ -0,0 +1,54 @@
+****************************
+Freescale i.MX7ULP EVK board
+****************************
+
+This file documents the Buildroot support for the Freescale i.MX7ULP EVK board.
+
+First, configure Buildroot for your i.MX7ULP EVK board:
+
+	$ make freescale_imx7ulp-evk_defconfig
+	$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped into an SD card:
+
+sudo dd if=output/images/sdcard.img of=/dev/<your-microsd-device>; sync
+
+i.MX7ULP has a Cortex-A7 and a Cortex-M4.
+
+Important: Cortex-M4 must be programmed to enable PMIC to correct boot
+Linux in the Cortex-A7.
+
+Step 1 - Download the Cortex-M4 pre-compiled binary:
+
+	wget https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx7ulp-m4-demo-2.4.0.bin
+
+Step 2: Extract the example files:
+
+	$ chmod a+x imx7ulp-m4-demo-2.4.0.bin
+	$  ./imx7ulp-m4-demo-2.4.0.bin
+
+Step 3: Copy the imx7ulp_m4_demo.img binary to the FAT partion of MicroSD card.
+
+Step 4: Insert the MicroSD card on the board, open 2 terminals at 115200 bps,
+8n1
+
+	First terminal (Cortex-A7): 	/dev/ttyUSB0
+	Second terminal (Cortex-M4):	/dev/ttyUSB1
+
+Step 5: Power on the board and, on first terminal ttyUSB0, stop at U-Boot. 
+	To flash the QSPI memory with the pre-built Cortex-M4 binary,run 
+	the commands below:
+   
+=> sf probe
+=> sf erase 0x0 0x20000
+=> fatload mmc 0:1 0x62000000 imx7ulp_m4_demo.img
+=> sf write 0x62000000 0x0 0x20000
+
+Step 6: Power cycle the board:
+
+	- The first terminal ttyUSB0 communicates with Cortex-A7 and will
+show the Linux boot.
+
+	- The second terminal ttyUSB1 communicates with Cortex-M4 running the 
+"Power Mode Switch Task" application.
diff --git a/configs/freescale_imx7ulp-evk_defconfig b/configs/freescale_imx7ulp-evk_defconfig
new file mode 100644
index 0000000000..895e96dae8
--- /dev/null
+++ b/configs/freescale_imx7ulp-evk_defconfig
@@ -0,0 +1,38 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.88_2.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evk"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7ulp_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.88_2.0.0_ga"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=yev	
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-- 
2.17.1
