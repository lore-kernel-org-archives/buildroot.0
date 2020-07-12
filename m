From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Jul 2020 18:34:21 +0200
Subject: [Buildroot] [PATCH 3/4] configs/qemu_aarch64_virt_defconfig: boot
 with grub bootloader with efi
In-Reply-To: <20200712163422.1162187-1-romain.naour@gmail.com>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
Message-ID: <20200712163422.1162187-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
tables are missing and the plug and play support is disabled.

dmesg:
ACPI: Interpreter disabled.
[...]
pnp: PnP ACPI: disabled

The ACPI support is already available in the kernel defconfig, the
memory hotplug support will be added by the next patch.

Borrow the post image script, genimage and bootloader configuration from
aarch64_efi_defconfig to build the disk image used to boot the system
in efi mode.

As a side effect, the bootloader grub2 is now runtime tested in the
Buildroot gitlab-ci while testing this defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/genimage-efi.cfg  | 30 +++++++++++++++++++++++
 board/qemu/aarch64-virt/grub.cfg          |  6 +++++
 board/qemu/aarch64-virt/post-image-efi.sh | 11 +++++++++
 board/qemu/aarch64-virt/readme.txt        |  2 +-
 configs/qemu_aarch64_virt_defconfig       | 19 +++++++++++++-
 5 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 board/qemu/aarch64-virt/genimage-efi.cfg
 create mode 100644 board/qemu/aarch64-virt/grub.cfg
 create mode 100755 board/qemu/aarch64-virt/post-image-efi.sh

diff --git a/board/qemu/aarch64-virt/genimage-efi.cfg b/board/qemu/aarch64-virt/genimage-efi.cfg
new file mode 100644
index 0000000000..f93ab9d64f
--- /dev/null
+++ b/board/qemu/aarch64-virt/genimage-efi.cfg
@@ -0,0 +1,30 @@
+image efi-part.vfat {
+  vfat {
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
+    }
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file Image {
+      image = "Image"
+    }
+  }
+  size = 32M
+}
+
+image disk.img {
+
+  hdimage {
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
diff --git a/board/qemu/aarch64-virt/grub.cfg b/board/qemu/aarch64-virt/grub.cfg
new file mode 100644
index 0000000000..ab88da91b9
--- /dev/null
+++ b/board/qemu/aarch64-virt/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
+}
diff --git a/board/qemu/aarch64-virt/post-image-efi.sh b/board/qemu/aarch64-virt/post-image-efi.sh
new file mode 100755
index 0000000000..d781f3368e
--- /dev/null
+++ b/board/qemu/aarch64-virt/post-image-efi.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
+
+cp ${HOST_DIR}/usr/share/edk2/aarch64/QEMU_EFI.fd ${BINARIES_DIR}/QEMU_EFI.fd
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index db35a3a7a8..53df3f4380 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig
+  qemu-system-aarch64 -M virt -m 512 -cpu cortex-a53 -nographic -smp 1 -bios output/images/QEMU_EFI.fd -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/disk.img,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 9f22987694..6901da505d 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -2,17 +2,30 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
 
+# Toolchain, required for eudev and grub
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+## Required tools to create bootable media
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_ARM64_EFI=y
+BR2_PACKAGE_HOST_EDK2_AARCH64_BIN=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-virt/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
 # Linux headers same as kernel, a 5.4 series
@@ -26,6 +39,10 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
+# Host tools for genimage
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.25.4
