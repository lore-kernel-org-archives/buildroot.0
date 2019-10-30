From: Fabrice Goucem <fabrice.goucem@nxp.com>
Date: Wed, 30 Oct 2019 13:40:13 +0000
Subject: [Buildroot] [PATCH v2 2/3] configs/freescale_imx7ulpevk: new
 defconfig
In-Reply-To: <20191030133955.30611-1-fabrice.goucem@nxp.com>
References: <20191029170102.13482-1-fabrice.goucem@nxp.com>
 <20191030133955.30611-1-fabrice.goucem@nxp.com>
Message-ID: <20191030133955.30611-2-fabrice.goucem@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add basic support for NXP's i.MX7 ULP EVK board:

https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-7ulp-applications-processor:MCIMX7ULP-EVK

Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 +
 board/freescale/imx7ulpevk/readme.txt  | 60 ++++++++++++++++++++++++++
 configs/freescale_imx7ulpevk_defconfig | 27 ++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 board/freescale/imx7ulpevk/readme.txt
 create mode 100644 configs/freescale_imx7ulpevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d71257a20..74ee5b732e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -177,6 +177,7 @@ freescale_imx6qsabreauto_defconfig: { extends: .defconfig }
 freescale_imx6qsabresd_defconfig: { extends: .defconfig }
 freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
 freescale_imx7dsabresd_defconfig: { extends: .defconfig }
+freescale_imx7ulpevk_defconfig: { extends: .defconfig }
 freescale_imx8mmevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 81e144ead5..c7f41ecf6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -879,6 +879,8 @@ F:	package/tinymembench/
 F:	package/whois/
 
 N:	Fabrice Goucem <fabrice.goucem@nxp.com>
+F:	board/freescale/imx7ulpevk/
+F:	configs/freescale_imx7ulpevk_defconfig
 F:	package/freescale-imx/imx-m4-firmware/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
diff --git a/board/freescale/imx7ulpevk/readme.txt b/board/freescale/imx7ulpevk/readme.txt
new file mode 100644
index 0000000000..c7a2120f13
--- /dev/null
+++ b/board/freescale/imx7ulpevk/readme.txt
@@ -0,0 +1,60 @@
+****************************
+Freescale i.MX7ULP EVK board
+****************************
+
+This file documents the Buildroot support for the Freescale i.MX7ULP EVK board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX7ULP EVK board:
+
+  make freescale_imx7ulpevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - boot.vfat
+  - imx7ulp-evkb.dtb
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
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX7ULP EVK board
+===========================
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
+[1] https://www.nxp.com/docs/en/user-guide/IMX7ULPQSG.pdf
diff --git a/configs/freescale_imx7ulpevk_defconfig b/configs/freescale_imx7ulpevk_defconfig
new file mode 100644
index 0000000000..441ececa47
--- /dev/null
+++ b/configs/freescale_imx7ulpevk_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.0.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evkb"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7ulp_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.0.0"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.23.0
