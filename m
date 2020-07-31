From: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Date: Fri, 31 Jul 2020 14:13:33 +0200
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7ulpevkb: new defconfig
In-Reply-To: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
References: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
Message-ID: <20200731121333.3754957-2-fabrice.goucem@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add basic support for NXP's i.MX7 ULP EVK board:

https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-7ulp-applications-processor:MCIMX7ULP-EVK

Signed-off-by: Fabrice Goucem <fabrice.goucem@oss.nxp.com>

---
Changes v6 -> v7:
  - Updated imx-mcore-demos Yocto's URL (suggested by Gary Bisson)
  - Renamed package imx-m4-demos to imx-mcore-demos (suggested by Gary
    Bisson)
  - Factorised firmware copies in imx-mcore-demos recipe (suggested by Gary Bisson)
  - Updated all mcore demos (bar i.MX7D) to 2.8.0 (suggested by Gary
    Bisson)

Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 DEVELOPERS                              |  2 +
 board/freescale/imx7ulpevkb/readme.txt  | 76 +++++++++++++++++++++++++
 configs/freescale_imx7ulpevkb_defconfig | 29 ++++++++++
 package/freescale-imx/Config.in         |  8 ++-
 4 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 board/freescale/imx7ulpevkb/readme.txt
 create mode 100644 configs/freescale_imx7ulpevkb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 387eb61c06..78be02ccc8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -907,7 +907,9 @@ F:	package/whois/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
+F:	board/freescale/imx7ulpevkb/
 F:	configs/freescale_imx6ullevk_defconfig
+F:	configs/freescale_imx7ulpevkb_defconfig
 F:	package/freescale-imx/imx-mcore-demos/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
diff --git a/board/freescale/imx7ulpevkb/readme.txt b/board/freescale/imx7ulpevkb/readme.txt
new file mode 100644
index 0000000000..d8b0abaee6
--- /dev/null
+++ b/board/freescale/imx7ulpevkb/readme.txt
@@ -0,0 +1,76 @@
+*******************************
+Freescale i.MX7ULP EVK B1 board
+*******************************
+
+This file documents the Buildroot support for the Freescale i.MX7ULP EVK B1 board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX7ULP EVK B1 board:
+
+  make freescale_imx7ulpevkb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - boot.vfat
+  - imx7ulp-evkb.dtb
+  - mcore_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
+  - mcore_imx7ulp_m4_demo.img
+  - mcore_imx7ulp_rpmsg_lite_pingpong_rtos.img
+  - mcore_imx7ulp_rpmsg_lite_str_echo_rtos.img
+  - mcore_imx7ulp_wireless_uart_bridge.img
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on an SD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Flash QSPI with Cortex-M4 demo
+==============================
+
+Cortex-M4 image must be flashed onto QSPI NOR memory to handle PMIC management.
+To do so, stop at u-boot prompt and run the following commands:
+
+  sf probe
+  sf erase 0 30000
+  fatload mmc 0 62000000 m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
+  sf write 62000000 0 30000
+
+Boot the i.MX7ULP EVK B1 board
+==============================
+
+To boot your newly created system (refer to the i.MX 7ULP EVK Quick Start Guide [1] for guidance):
+- insert the SD card in the micro SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/document/guide/get-started-with-the-mcimx7ulp-evk:GS-MCIMX7ULP-EVK
diff --git a/configs/freescale_imx7ulpevkb_defconfig b/configs/freescale_imx7ulpevkb_defconfig
new file mode 100644
index 0000000000..9402062663
--- /dev/null
+++ b/configs/freescale_imx7ulpevkb_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evkb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP=y
+BR2_PACKAGE_IMX_MCORE_DEMOS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7ulp_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 75c213a1d7..cc0d8fc7a8 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -38,7 +38,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	bool "imx6ul/imx6ull"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
-	bool "imx7d/imx7ulp"
+	bool "imx7d"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
+	bool "imx7ulp"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	bool "imx8"
@@ -68,6 +71,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default "IMX7ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
 	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
@@ -90,6 +94,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
@@ -99,6 +104,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 config BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
-- 
2.27.0
