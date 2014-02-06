From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2014 23:08:54 +0100
Subject: [Buildroot] [git commit] zedboard: add Avnet Zedboard support.
Message-ID: <20140206221408.8A6139C83D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12106fc69ba66c335f7d5f2960c45df8c7c3bffb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: update to recent Buildroot which had renamed several
Config.in options, lock down kernel headers version]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/avnet/zedboard/readme.txt |   13 +++++++++++++
 configs/zedboard_defconfig      |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
new file mode 100644
index 0000000..b869066
--- /dev/null
+++ b/board/avnet/zedboard/readme.txt
@@ -0,0 +1,13 @@
+This is the buildroot board support for the Avnet Zedboard. The Zedboard is
+a development board based on the Xilinx Zynq-7000 based All-Programmable
+System-On-Chip.
+
+Zedboard information including schematics, reference designs, and manuals are
+available from http://www.zedboard.org .
+
+To boot the Zedboard using a buildroot generated image copy the following files
+to the sdcard:
+	zynq-zed.dtb -> devicetree.dtb
+	rootfs.cpio.gz.uboot -> uramdisk.image.gz
+	uImage -> uImage
+
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
new file mode 100644
index 0000000..2a67fdd
--- /dev/null
+++ b/configs/zedboard_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+
+# Lock to 3.8 headers as the kernel is based off 3.8
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.8"
+
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v14.5"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
+
+# Root filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v14.5"
+BR2_TARGET_UBOOT_FORMAT_ELF=y
