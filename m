From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:11:20 +0000
Subject: [Buildroot] [PATCH 8/8] configs/arm_foundationv8_sbbr_defconfig:
 new config for SBBR on FVP
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-9-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces a configuration for the ARM Foundation Platform that builds
firmware that is close to SBBR compliance. It consists of ATF that load EDK2
as BL33 which in turn will load the kernel as EFI stub in ACPI mode.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/aarch64-sbsa/post-image.sh        |  4 +++
 board/aarch64-sbsa/readme.txt           | 17 +++++++++
 configs/arm_foundationv8_sbbr_defconfig | 46 +++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 configs/arm_foundationv8_sbbr_defconfig

diff --git a/board/aarch64-sbsa/post-image.sh b/board/aarch64-sbsa/post-image.sh
index a9fdd486d7..87f7002a2a 100755
--- a/board/aarch64-sbsa/post-image.sh
+++ b/board/aarch64-sbsa/post-image.sh
@@ -23,4 +23,8 @@ if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu_sbsa\"$" ${BR2_CON
 elif grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu\"$" ${BR2_CONFIG}; then
   resize_or_link_flash "bl1.bin" "secureflash.bin" "64"
   resize_or_link_flash "fip.bin" "flash0.bin" "64"
+
+elif grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"fvp\"$" ${BR2_CONFIG}; then
+  resize_or_link_flash "bl1.bin" "secureflash.bin"
+  resize_or_link_flash "fip.bin" "flash0.bin"
 fi
diff --git a/board/aarch64-sbsa/readme.txt b/board/aarch64-sbsa/readme.txt
index 8ccf1a81ee..f8f25c11ae 100644
--- a/board/aarch64-sbsa/readme.txt
+++ b/board/aarch64-sbsa/readme.txt
@@ -12,6 +12,7 @@ The following configurations currently provide SBBR firmware:
 
 - qemu_aarch64_sbsa_sbbr_defconfig: An implementation of SBBR for QEMU SBSA
 - qemu_aarch64_virt_sbbr_defconfig: An implementation of SBBR for QEMU Virt
+- arm_foundationv8_sbbr_defconfig: An implementation of SBBR for ARM Foundation
 
 Building and booting under QEMU SBSA
 ====================================
@@ -43,3 +44,19 @@ $ qemu-system-aarch64 \
 	-drive file=output/images/flash0.bin,if=pflash,format=raw \
 	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
 	-device virtio-blk-device,drive=hd0
+
+Bulding and booting under ARM Foundation
+========================================
+
+$ make arm_foundationv8_sbbr_defconfig
+$ make
+$ Foundation_Platform \
+	--disable-analytics \
+	--no-visualization \
+	--arm-v8.0 \
+	--secure-memory \
+	--gicv3 \
+	--cores=4 \
+	--data=output/images/secureflash.bin at 0x0 \
+	--nsdata=output/images/flash0.bin at 0x08000000 \
+	--block-device=output/images/disk.img
diff --git a/configs/arm_foundationv8_sbbr_defconfig b/configs/arm_foundationv8_sbbr_defconfig
new file mode 100644
index 0000000000..bff0e8c099
--- /dev/null
+++ b/configs/arm_foundationv8_sbbr_defconfig
@@ -0,0 +1,46 @@
+# Architecture
+BR2_aarch64=y
+
+# Toolchain, required for eudev and grub
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+## Required tools to create bootable media
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-sbsa/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-sbsa/genimage-sbsa.cfg"
+
+# Linux headers same as kernel, a 4.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aarch64-sbsa/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# UEFI firmware
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="fvp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="FVP_USE_GIC_DRIVER=FVP_GICV3"
+
+# Host tools for genimage
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
