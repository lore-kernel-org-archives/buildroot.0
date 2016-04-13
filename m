From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:47:44 +0200
Subject: [Buildroot] [git commit] configs: atmel: add sama5d3 xplained sd
	card image generation
Message-ID: <20160413214758.54C008057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89155c849208b35a69780119c5eea6f0073b93c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use genimage to generate a sd card with a fat partition (at91bootstrap,
u-boot, kernel, dtbs) and an ext4 partition (rootfs).

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/sama5d3_xplained_mmc/genimage.cfg  | 33 ++++++++++++++++++++++++++
 board/atmel/sama5d3_xplained_mmc/post-image.sh | 14 +++++++++++
 configs/atmel_sama5d3_xplained_mmc_defconfig   |  6 +++++
 3 files changed, 53 insertions(+)

diff --git a/board/atmel/sama5d3_xplained_mmc/genimage.cfg b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
new file mode 100644
index 0000000..32df453
--- /dev/null
+++ b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
@@ -0,0 +1,33 @@
+# Image for SD card boot on Atmel SAMA5D3 Xplained boards
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d3_xplained.dtb",
+			"at91-sama5d3_xplained_pda4.dtb",
+			"at91-sama5d3_xplained_pda7.dtb",
+			"at91-sama5d3_xplained_pda7b.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/atmel/sama5d3_xplained_mmc/post-image.sh b/board/atmel/sama5d3_xplained_mmc/post-image.sh
new file mode 100755
index 0000000..359b4c9
--- /dev/null
+++ b/board/atmel/sama5d3_xplained_mmc/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 6d99038..fc2f5d9 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d3_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
@@ -10,6 +11,8 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
@@ -21,3 +24,6 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_mmc"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
