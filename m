From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 4 Apr 2016 10:52:42 +0200
Subject: [Buildroot] [PATCH v2 1/4] configs: atmel: add sama5d2 xplained sd
	card image generation
In-Reply-To: <1459759965-14073-1-git-send-email-ludovic.desroches@atmel.com>
References: <1459759965-14073-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1459759965-14073-2-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use genimage to generate a sd card with a fat partition (at91bootstrap,
u-boot, kernel, dtbs) and an ext4 partition (rootfs).

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/sama5d2_xplained_mmc/genimage.cfg  | 33 ++++++++++++++++++++++++++
 board/atmel/sama5d2_xplained_mmc/post-image.sh | 14 +++++++++++
 configs/atmel_sama5d2_xplained_mmc_defconfig   |  6 +++++
 3 files changed, 53 insertions(+)
 create mode 100644 board/atmel/sama5d2_xplained_mmc/genimage.cfg
 create mode 100755 board/atmel/sama5d2_xplained_mmc/post-image.sh

diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
new file mode 100644
index 0000000..b0ba22d
--- /dev/null
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
@@ -0,0 +1,33 @@
+# Image for SD card boot on Atmel SAMA5D2 Xplained boards
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d2_xplained.dtb",
+			"at91-sama5d2_xplained_pda4.dtb",
+			"at91-sama5d2_xplained_pda7.dtb",
+			"at91-sama5d2_xplained_pda7b.dtb",
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
diff --git a/board/atmel/sama5d2_xplained_mmc/post-image.sh b/board/atmel/sama5d2_xplained_mmc/post-image.sh
new file mode 100755
index 0000000..359b4c9
--- /dev/null
+++ b/board/atmel/sama5d2_xplained_mmc/post-image.sh
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
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 74fa2b5..ecf4898 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d2_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
@@ -13,6 +14,8 @@ BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
@@ -24,3 +27,6 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_xplained_mmc"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.5.0
