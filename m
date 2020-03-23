From: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Date: Mon, 23 Mar 2020 22:01:22 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: new defconfig
Message-ID: <20200323210122.471254-1-fabrice.goucem@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add basic support for NXP's i.MX6 ULL EVK board:

https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-6ull-and-6ulz-applications-processor:MCIMX6ULL-EVK

Signed-off-by: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  4 ++
 board/freescale/imx6ullevk/readme.txt  | 61 ++++++++++++++++++++++++++
 configs/freescale_imx6ullevk_defconfig | 24 ++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 board/freescale/imx6ullevk/readme.txt
 create mode 100644 configs/freescale_imx6ullevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f5ed95f5e7..95b75cf14b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -177,6 +177,7 @@ freescale_imx6dlsabresd_defconfig: { extends: .defconfig }
 freescale_imx6qsabreauto_defconfig: { extends: .defconfig }
 freescale_imx6qsabresd_defconfig: { extends: .defconfig }
 freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
+freescale_imx6ullevk_defconfig: { extends: .defconfig }
 freescale_imx7dsabresd_defconfig: { extends: .defconfig }
 freescale_imx8mmevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 8ea08739f7..9958232d1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -910,6 +910,10 @@ F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
 
+N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
+F:	board/freescale/imx6ullevk/
+F:	configs/freescale_imx6ullevk_defconfig
+
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
new file mode 100644
index 0000000000..e0c0c392a8
--- /dev/null
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -0,0 +1,61 @@
+****************************
+Freescale i.MX6ULL EVK board
+****************************
+
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX6ULL EVK board:
+
+  make freescale_imx6ullevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - boot.vfat
+  - imx6ull-14x14-evk.dtb
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.bin
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
+Boot the i.MX6ULL EVK board
+===========================
+
+To boot your newly created system (refer to the i.MX 6ULL EVK Quick Start Guide [1] for guidance):
+- insert the SD card in the micro SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/files-static/32bit/doc/brochure/IMX6ULLQSG.pdf
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
new file mode 100644
index 0000000000..2d73389055
--- /dev/null
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1
