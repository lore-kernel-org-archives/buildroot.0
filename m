From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:28:10 +0000
Subject: [Buildroot] [PATCH v3 11/11]
 configs/solidrun_macchiatobin_efi_defconfig: EFI config for MacchiatoBin
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-12-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces an alternative board build for the MacchiatoBin based on
EDK2 (UEFI) firmware loaded as BL33 by ARM Trusted Firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/solidrun/macchiatobin-efi/genimage.cfg  | 24 +++++++++++++++++++
 .../solidrun/macchiatobin-efi/linux.fragment  |  4 ++++
 board/solidrun/macchiatobin-efi/post-image.sh |  9 +++++++
 board/solidrun/macchiatobin-efi/readme.txt    | 14 +++++++++++
 configs/solidrun_macchiatobin_efi_defconfig   | 24 +++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 board/solidrun/macchiatobin-efi/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin-efi/linux.fragment
 create mode 100755 board/solidrun/macchiatobin-efi/post-image.sh
 create mode 100644 board/solidrun/macchiatobin-efi/readme.txt
 create mode 100644 configs/solidrun_macchiatobin_efi_defconfig

diff --git a/board/solidrun/macchiatobin-efi/genimage.cfg b/board/solidrun/macchiatobin-efi/genimage.cfg
new file mode 100644
index 0000000000..5d8457e4ac
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/genimage.cfg
@@ -0,0 +1,24 @@
+image efi-part.vfat {
+  vfat {
+    file EFI {
+      image = "efi-part/EFI"
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+    gpt = true
+  }
+
+  partition boot {
+    partition-type = 0xEF
+    image = "efi-part.vfat"
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/solidrun/macchiatobin-efi/linux.fragment b/board/solidrun/macchiatobin-efi/linux.fragment
new file mode 100644
index 0000000000..7e6a75f191
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/linux.fragment
@@ -0,0 +1,4 @@
+CONFIG_CMDLINE="console=ttyS0,115200n8 root=/dev/mmcblk1p2 rootwait"
+CONFIG_MARVELL_PHY=y
+CONFIG_MARVELL_10G_PHY=y
+CONFIG_SFP=y
diff --git a/board/solidrun/macchiatobin-efi/post-image.sh b/board/solidrun/macchiatobin-efi/post-image.sh
new file mode 100755
index 0000000000..7dfea3fa9d
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/post-image.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+set -e
+
+EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
+
+# Set up the kernel executable according to the UEFI standard.
+mkdir -p ${EFI_DIR}
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
diff --git a/board/solidrun/macchiatobin-efi/readme.txt b/board/solidrun/macchiatobin-efi/readme.txt
new file mode 100644
index 0000000000..42205f3d4e
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/readme.txt
@@ -0,0 +1,14 @@
+Intro
+=====
+
+This is the board support for MacchiatoBin with UEFI. Refer to
+board/solidrun/macchiatobin/readme.txt for more information.
+
+More info
+=========
+
+For more information about the UEFI support for this board see:
+
+- https://developer.solid-run.com/knowledge-base/armada-8040-uefi/
+- http://wiki.macchiatobin.net/tiki-index.php?page=Build+from+source+-+UEFI+EDK+II
+- http://wiki.macchiatobin.net/tiki-index.php?page=Update+the+Bootloader
diff --git a/configs/solidrun_macchiatobin_efi_defconfig b/configs/solidrun_macchiatobin_efi_defconfig
new file mode 100644
index 0000000000..194d092b98
--- /dev/null
+++ b/configs/solidrun_macchiatobin_efi_defconfig
@@ -0,0 +1,24 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/macchiatobin-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin-efi/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN=y
+BR2_TARGET_MV_DDR_MARVELL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1
