From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 21:11:08 +0100
Subject: [Buildroot] [git commit] configs/aarch64_efi_defconfig: new
 defconfig
Message-ID: <20181202071559.C6CA1803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fb2a489598e82497f79f144b2374241e4912575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New generic defconfig for aarch64, to run on aarch64 servers compliant
with EFI firmware and ACPI.

This can also be tested with qemu, and is useful so that we have an
arm defconfig with grub enabled. Tested with qemu 2.11.2 and AAVMF,
the aarch64 virtual machine UEFI firmware.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
[Thomas: extend readme.txt with more details]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/aarch64-efi/genimage-efi.cfg | 30 ++++++++++++++++++++++++++++++
 board/aarch64-efi/grub.cfg         |  6 ++++++
 board/aarch64-efi/post-image.sh    |  5 +++++
 board/aarch64-efi/readme.txt       | 34 ++++++++++++++++++++++++++++++++++
 configs/aarch64_efi_defconfig      | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
new file mode 100644
index 0000000000..f93ab9d64f
--- /dev/null
+++ b/board/aarch64-efi/genimage-efi.cfg
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
diff --git a/board/aarch64-efi/grub.cfg b/board/aarch64-efi/grub.cfg
new file mode 100644
index 0000000000..ab88da91b9
--- /dev/null
+++ b/board/aarch64-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
+}
diff --git a/board/aarch64-efi/post-image.sh b/board/aarch64-efi/post-image.sh
new file mode 100755
index 0000000000..f0214dc866
--- /dev/null
+++ b/board/aarch64-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
new file mode 100644
index 0000000000..65a6345b6c
--- /dev/null
+++ b/board/aarch64-efi/readme.txt
@@ -0,0 +1,34 @@
+
+The aarch64_efi_defconfig allows to build a minimal Linux system that
+can boot on all AArch64 servers providing an EFI firmware and ACPI.
+
+Building and booting
+====================
+
+$ make aarch64_efi_defconfig
+$ make
+
+The file output/images/disk.img is a complete disk image that can be
+booted, it includes the grub2 bootloader, Linux kernel and root
+filesystem.
+
+Testing under Qemu
+==================
+
+This image can also be tested using Qemu:
+
+qemu-system-aarch64 \
+	-M virt \
+	-cpu cortex-a57 \
+	-m 512 \
+	-nographic \
+	-bios </path/to/QEMU_EFI.fd> \
+	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+	-device virtio-blk-device,drive=hd0 \
+	-netdev user,id=eth0 \
+	-device virtio-net-device,netdev=eth0
+
+Note that </path/to/QEMU_EFI.fd> needs to point to a valid aarch64 UEFI
+firmware image for qemu.
+It may be provided by your distribution as a edk2-aarch64 or AAVMF
+package, in path such as /usr/share/edk2/aarch64/QEMU_EFI.fd .
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
new file mode 100644
index 0000000000..e4e20b09ba
--- /dev/null
+++ b/configs/aarch64_efi_defconfig
@@ -0,0 +1,33 @@
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
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_AARCH64_EFI=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
+
+# Linux headers same as kernel, a 4.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
