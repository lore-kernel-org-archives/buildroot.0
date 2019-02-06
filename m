From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:40:28 +0100
Subject: [Buildroot] [git commit] configs/pc_x86_64_efi: use a GPT partition
 table
Message-ID: <20190206163922.D54088151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fee29b05bb7db25e37c8a5175ce00dc712554edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since all EFI-based systems support GPT, this commit changes
pc_x86_64_efi to use a GPT partition table. It shows an example of how
to craft a disk image with GPT partitioning instead of MBR. This is
achieved by means of a post-image script which uses
mkdosfs+mcopy+sfdisk, since genimage is unable to deal with GPT. Long
term, it would be ideal if genimage had GPT support, but until then,
this script shows how to achieve creating a GPT-based disk image.

The script was kept as simple as possible to make it easy to understand
and adapt for other purposes.

The root filesystem location is passed to the kernel by a partition
UUID, so it is possible to boot on QEMU, directly from the disk image,
or dump the image to a physical device.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pc/genimage-efi.cfg       | 31 ---------------------
 board/pc/post-build.sh          | 13 +++------
 board/pc/post-image-efi-gpt.sh  | 62 +++++++++++++++++++++++++++++++++++++++++
 board/pc/readme.txt             |  2 +-
 configs/pc_x86_64_efi_defconfig |  5 +---
 5 files changed, 68 insertions(+), 45 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
deleted file mode 100644
index ec96d73dd1..0000000000
--- a/board/pc/genimage-efi.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image efi-part.vfat {
-  vfat {
-    file startup.nsh {
-      image = "efi-part/startup.nsh"
-    }
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file bzImage {
-      image = "bzImage"
-    }
-  }
-  size = 16M
-}
-
-image disk.img {
-
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xEF
-    image = "efi-part.vfat"
-  }
-
-  partition root {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
-
-}
diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index 552d488160..346f29ab6a 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -4,12 +4,7 @@ set -e
 
 BOARD_DIR=$(dirname "$0")
 
-# Detect boot strategy, EFI or BIOS
-if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
-    cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
-else
-    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
-
-    # Copy grub 1st stage to binaries, required for genimage
-    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
-fi
+cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
+
+# Copy grub 1st stage to binaries, required for genimage
+cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
diff --git a/board/pc/post-image-efi-gpt.sh b/board/pc/post-image-efi-gpt.sh
new file mode 100755
index 0000000000..d2acd8f852
--- /dev/null
+++ b/board/pc/post-image-efi-gpt.sh
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+set -e
+
+cd ${BINARIES_DIR}
+
+# GPT partition type UUIDs
+esp_type=c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+linux_type=44479540-f297-41b2-9af7-d131d5f0458a
+
+# Partition UUIDs
+efi_part_uuid=$(uuidgen)
+root_part_uuid=$(uuidgen)
+
+# Boot partition offset and size, in 512-byte sectors
+efi_part_start=64
+efi_part_size=32768
+
+# Rootfs partition offset and size, in 512-byte sectors
+root_part_start=$(( efi_part_start + efi_part_size ))
+root_part_size=$(( $(stat -c %s rootfs.ext2) / 512 ))
+
+first_lba=34
+last_lba=$(( root_part_start + root_part_size ))
+
+# Disk image size in 512-byte sectors
+image_size=$(( last_lba + first_lba ))
+
+cat > efi-part/EFI/BOOT/grub.cfg <<EOF
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=PARTUUID=$root_part_uuid rootwait console=tty1
+}
+EOF
+
+# Create EFI system partition
+rm -f efi-part.vfat
+dd if=/dev/zero of=efi-part.vfat bs=512 count=0 seek=$efi_part_size
+mkdosfs  efi-part.vfat
+mcopy -bsp -i efi-part.vfat efi-part/startup.nsh ::startup.nsh
+mcopy -bsp -i efi-part.vfat efi-part/EFI ::EFI
+mcopy -bsp -i efi-part.vfat bzImage ::bzImage
+
+rm -f disk.img
+dd if=/dev/zero of=disk.img bs=512 count=0 seek=$image_size
+
+sfdisk disk.img <<EOF
+label: gpt
+label-id: $(uuidgen)
+device: /dev/foobar0
+unit: sectors
+first-lba: $first_lba
+last-lba: $last_lba
+
+/dev/foobar0p1 : start=$efi_part_start,  size=$efi_part_size,  type=$esp_type,   uuid=$efi_part_uuid,  name="efi-part.vfat"
+/dev/foobar0p2 : start=$root_part_start, size=$root_part_size, type=$linux_type, uuid=$root_part_uuid, name="rootfs.ext2"
+EOF
+
+dd if=efi-part.vfat of=disk.img bs=512 count=$efi_part_size seek=$efi_part_start conv=notrunc
+dd if=rootfs.ext2   of=disk.img bs=512 count=$root_part_size seek=$root_part_start conv=notrunc
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index ca3b5123c1..895331b0af 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -9,7 +9,7 @@ Bare PC sample config
 
   $ make pc_x86_64_bios_defconfig
 
-  Or for EFI:
+  For EFI-based boot strategy on a GPT-partitioned disk:
 
   $ make pc_x86_64_efi_defconfig
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index bba04c8f5d..324de35dff 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -10,7 +10,6 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
 # Required tools to create bootable media
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Bootloader
@@ -22,9 +21,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-efi.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi-gpt.sh"
 
 # Linux headers same as kernel, a 4.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
