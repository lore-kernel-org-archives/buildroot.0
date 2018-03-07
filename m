From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed,  7 Mar 2018 19:52:18 +0100
Subject: [Buildroot] [PATCH v5 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1520448738-5794-5-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
v5: Added readme.txt in board/freescale/imx8mqevk (suggested by Fabio E.)
    Change version tags to rel_imx_4.9.51_8mq_beta_patch 
    for kernel, u-boot and atf (suggested by Baruch S.)
    Remove generation of rootfs.tar
v4: Change to Buildroot toolchain from external toolchain
v3: Change commit message (suggested by Thomas P.)
    Make sure to use tags instead of branches in kernel,bootloader and ATF repositorires (Arnout V.)
    Use BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG instead of copy kernel defconfig to board folder (suggested by Arnout V.)
    Split v2 commit into two commits
---
 .../common/imx/genimage.cfg.template_imx8          | 40 +++++++++++
 board/freescale/common/imx/post-image.sh           | 10 ++-
 board/freescale/imx8mqevk/readme.txt               | 83 ++++++++++++++++++++++
 configs/freescale_imx8mqevk_defconfig              | 39 ++++++++++
 4 files changed, 169 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
 create mode 100644 board/freescale/imx8mqevk/readme.txt
 create mode 100644 configs/freescale_imx8mqevk_defconfig

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
new file mode 100644
index 0000000..138beff
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -0,0 +1,40 @@
+# Minimal SD card image for the Freescale boards Template for SPL Boot
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 33 kB free space at the beginning,
+# * U-Boot is integrated into imx-boot-imx8mqevk-sd.bin and is dumped as is,
+# * a FAT partition at offset 64MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 64M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition imx-boot {
+    in-partition-table = "no"
+    image = "imx-boot-imx8mqevk-sd.bin"
+    offset = 33K
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index b239743..264c8a4 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -7,10 +7,10 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
 
 	for dt in $DTB_LIST; do
-		echo -n "\"$dt.dtb\", "
+		echo -n "\"`basename $dt`.dtb\", "
 	done
 }
 
@@ -23,6 +23,8 @@ linux_image()
 {
 	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
 		echo "\"uImage\""
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+		echo "\"Image\""
 	else
 		echo "\"zImage\""
 	fi
@@ -30,7 +32,9 @@ linux_image()
 
 genimage_type()
 {
-	if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
 	else
 		echo "genimage.cfg.template"
diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
new file mode 100644
index 0000000..648d102
--- /dev/null
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -0,0 +1,83 @@
+***************************
+Freescale i.MX8mq EVK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX8mq EVK board.
+
+Hardware support
+================
+
+Currently only basic support for hardware is avialable, currently no
+support for GPU, VPU and other HW features.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX51 EVK board:
+
+  make freescale_imx8mqevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl31.bin
+  - boot.vfat
+  - fsl-imx8mq-evk.dtb
+  - Image
+  - imx-boot-imx8mqevk-sd.bin
+  - lpddr4_pmu_train_1d_dmem.bin
+  - lpddr4_pmu_train_1d_imem.bin
+  - lpddr4_pmu_train_2d_dmem.bin
+  - lpddr4_pmu_train_2d_imem.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - signed_hdmi_imx8m.bin
+  - u-boot.bin
+  - u-boot.imx
+  - u-boot-nodtb.bin
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
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx8.
+
+Boot the i.MX8mq EVK board
+==========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enable HDMI output
+==================
+
+To enable HDMI output at boot you must provide the video kernel boot argument.
+To set the video boot argument from U-Boot run after stoping in U-Boot prompt:
+
+setenv mmcargs 'setenv bootargs console=${console} root=${mmcroot} video=HDMI-A-1:1920x1080-32 at 60'
+saveenv
+reset
+
+Change screen resolution to suit your connected display.
+
+Enjoy!
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
new file mode 100644
index 0000000..68b10ac
--- /dev/null
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta_patch"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta_patch"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta_patch"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
