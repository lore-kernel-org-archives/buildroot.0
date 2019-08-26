From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 26 Aug 2019 13:36:19 -0700
Subject: [Buildroot] [PATCH 1/1] board/mender: add a mender board example
 configuration.
In-Reply-To: <20190826203619.71720-1-aduskett@gmail.com>
References: <20190826203619.71720-1-aduskett@gmail.com>
Message-ID: <20190826203619.71720-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Buildroot currently has all of the needed packages to use Mender as the primary
update system. However; there isn't any documentation or examples now that
provide a starting point for users. This lack of documentation makes setting up
a Mender based update system difficult and time-consuming.

Provided in this patch series is a mender_x86_64_efi_defconfig -that sets up an
x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
QEMU environment. The system partition exchema comprises of two equally sized
root partitions and a 64M data partition that is mounted to /var/lib/mender as
a persistent data store partition.

There is a board/mender/readme.txt provided which gives users documentation on
how to flash the built image or boot the image using QEMU as well.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 board/mender/linux.config                   | 64 ++++++++++++++++
 board/mender/mender_grubenv_defines         | 32 ++++++++
 board/mender/overlay/etc/fstab              | 10 +++
 board/mender/overlay/etc/mender/mender.conf | 10 +++
 board/mender/post-image-efi-gpt.sh          | 83 +++++++++++++++++++++
 board/mender/pre-image.sh                   |  9 +++
 board/mender/readme.txt                     | 58 ++++++++++++++
 configs/mender_x86_64_efi_defconfig         | 73 ++++++++++++++++++
 10 files changed, 341 insertions(+)
 create mode 100644 board/mender/linux.config
 create mode 100644 board/mender/mender_grubenv_defines
 create mode 100644 board/mender/overlay/etc/fstab
 create mode 100644 board/mender/overlay/etc/mender/mender.conf
 create mode 100755 board/mender/post-image-efi-gpt.sh
 create mode 100755 board/mender/pre-image.sh
 create mode 100644 board/mender/readme.txt
 create mode 100644 configs/mender_x86_64_efi_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28824cc722..25ec8d61af 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -203,6 +203,7 @@ imx8mpico_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
+mender_x86_64_efi_defconfig: { extends: .defconfig }
 minnowboard_max-graphical_defconfig: { extends: .defconfig }
 minnowboard_max_defconfig: { extends: .defconfig }
 mx25pdk_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e50ac78ae7..5c1c694702 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -27,6 +27,7 @@
 #   modify packages that use this infrastructure.
 
 N:	Adam Duskett <aduskett@gmail.com>
+F:	configs/mender_x86_64_efi_defconfig
 F:	package/audit/
 F:	package/busybox/
 F:	package/checkpolicy/
diff --git a/board/mender/linux.config b/board/mender/linux.config
new file mode 100644
index 0000000000..f17fc18edb
--- /dev/null
+++ b/board/mender/linux.config
@@ -0,0 +1,64 @@
+CONFIG_SYSVIPC=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_EFI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_ATH9K=m
+CONFIG_ATH9K_HTC=m
+CONFIG_CARL9170=m
+CONFIG_ATH10K=m
+CONFIG_RT2X00=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+# CONFIG_RTL_CARDS is not set
+CONFIG_RTL8XXXU=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB_VESA=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/mender/mender_grubenv_defines b/board/mender/mender_grubenv_defines
new file mode 100644
index 0000000000..6cc4d5c92e
--- /dev/null
+++ b/board/mender/mender_grubenv_defines
@@ -0,0 +1,32 @@
+################################################################################
+# Mandatory
+################################################################################
+# Warning: This file is an example and should be customized to fit your needs!
+
+# Partition index of root filesystem A
+mender_rootfsa_part=2
+
+# Partition index of root filesystem B
+mender_rootfsb_part=3
+
+# Device file corresponding to the root filesystem partitions, without index.
+mender_kernel_root_base=/dev/vda
+
+# Name of the storage device containing root filesystem partitions in GRUB
+# format.
+mender_grub_storage_device=hd0
+
+# Type of kernel (bzImage or zImage)
+kernel_imagetype=bzImage
+
+# Type of initrd image.
+# Note: An initrd image is not strictly necessary, and the system will boot and
+#       update without a initrd image.
+initrd_imagetype=initrd.img
+
+################################################################################
+# Mandatory on ARM
+################################################################################
+
+# Basename of DTB that should be loaded by the bootloader.
+# kernel_devicetree=kernel.dtb
diff --git a/board/mender/overlay/etc/fstab b/board/mender/overlay/etc/fstab
new file mode 100644
index 0000000000..980b2eb4e1
--- /dev/null
+++ b/board/mender/overlay/etc/fstab
@@ -0,0 +1,10 @@
+# <file system>     <mount pt>      <type>      <options>                               <dump>  <pass>
+/dev/vda1           /boot/efi       vfat        defaults                                    0    0
+/dev/root           /               ext4        rw,noauto                                   0    1
+/dev/vda4           /var/lib/mender ext4        defaults                                    0    0
+proc                /proc           proc        defaults                                    0    0
+devpts              /dev/pts        devpts      defaults,gid=5,mode=620,ptmxmode=0666       0    0
+tmpfs               /dev/shm        tmpfs       mode=0777                                   0    0
+tmpfs               /tmp            tmpfs       mode=1777                                   0    0
+tmpfs               /run            tmpfs       mode=0755,nosuid,nodev                      0    0
+sysfs               /sys            sysfs       defaults                                    0    0
diff --git a/board/mender/overlay/etc/mender/mender.conf b/board/mender/overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..37d41a2f0c
--- /dev/null
+++ b/board/mender/overlay/etc/mender/mender.conf
@@ -0,0 +1,10 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy"
+}
diff --git a/board/mender/post-image-efi-gpt.sh b/board/mender/post-image-efi-gpt.sh
new file mode 100755
index 0000000000..76ddfa5d47
--- /dev/null
+++ b/board/mender/post-image-efi-gpt.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+set -e
+
+# GPT partition type UUIDs
+esp_type=c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+linux_type=44479540-f297-41b2-9af7-d131d5f0458a
+
+# Partition UUIDs
+efi_part_uuid=$(uuidgen)
+root_part_a_uuid=$(uuidgen)
+root_part_b_uuid=$(uuidgen)
+data_part_uuid=$(uuidgen)
+
+# Boot partition offset and size, in 512-byte sectors
+efi_part_start=64
+efi_part_size=32768
+
+# Rootfs-a partition offset and size, in 512-byte sectors
+root_part_a_start=$(( efi_part_start + efi_part_size ))
+root_part_a_size=$(( $(stat -c %s ${BINARIES_DIR}/rootfs.ext2) / 512 ))
+
+# Rootfs-b partition offset and size, in 512-byte sectors
+root_part_b_start=$(( $root_part_a_start + $root_part_a_size ))
+root_part_b_size=$(( $(stat -c %s ${BINARIES_DIR}/rootfs.ext2) / 512 ))
+
+# Data partition offset and size, in 512-byte sectors
+data_part_start=$(( $root_part_b_start + $root_part_b_size ))
+data_part_size=122880
+
+first_lba=34
+total_size=$(( ${root_part_a_size} + ${root_part_b_size} + ${data_part_size} ))
+last_lba=$(( root_part_a_start + total_size ))
+
+# Disk image size in 512-byte sectors
+image_size=$(( last_lba + first_lba ))
+
+# Copy the mender-grubenv to the efi partition.
+cd ${BINARIES_DIR}
+cp -rf ${TARGET_DIR}/boot/efi/EFI/ efi-part/
+
+# Create EFI system partition
+rm -f efi-part.vfat
+dd if=/dev/zero of=efi-part.vfat bs=512 count=0 seek=${efi_part_size}
+mkdosfs  efi-part.vfat
+mcopy -bsp -i efi-part.vfat efi-part/startup.nsh ::startup.nsh
+mcopy -bsp -i efi-part.vfat efi-part/EFI ::EFI
+mcopy -bsp -i efi-part.vfat bzImage ::bzImage
+
+# Create the persistent data partition
+rm -f data.img
+dd if=/dev/zero of=data.img bs=512 count=0 seek=${data_part_size}
+mkfs.ext4 data.img
+
+rm -f disk.img
+dd if=/dev/zero of=disk.img bs=512 count=0 seek=${image_size}
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
+/dev/foobar0p2 : start=$root_part_a_start, size=$root_part_a_size, type=$linux_type, uuid=$root_part_a_uuid, name="rootfs.ext2"
+/dev/foobar0p3 : start=$root_part_b_start, size=$root_part_b_size, type=$linux_type, uuid=$root_part_b_uuid, name="rootfs.ext2"
+/dev/foobar0p4 : start=$data_part_start, size=$data_part_size, type=$linux_type, uuid=$data_part_uuid, name="data"
+EOF
+
+dd if=efi-part.vfat of=disk.img bs=512 count=${efi_part_size} seek=${efi_part_start} conv=notrunc
+dd if=rootfs.ext2   of=disk.img bs=512 count=${root_part_a_size} seek=${root_part_a_start} conv=notrunc
+dd if=rootfs.ext2   of=disk.img bs=512 count=${root_part_b_size} seek=${root_part_b_start} conv=notrunc
+dd if=data.img      of=disk.img bs=512 count=${data_part_size} seek=${data_part_start} conv=notrunc
+
+echo "Creating ${BINARIES_DIR}/update-${BR2_VERSION}.mender"
+${HOST_DIR}/bin/mender-artifact \
+  --compression lzma \
+  write rootfs-image \
+  -t BUILDROOT_DEVICE \
+  -n ${BR2_VERSION} \
+  -f ${BINARIES_DIR}/rootfs.ext4 \
+  -o ${BINARIES_DIR}/update-${BR2_VERSION}.mender
diff --git a/board/mender/pre-image.sh b/board/mender/pre-image.sh
new file mode 100755
index 0000000000..2a04cd9982
--- /dev/null
+++ b/board/mender/pre-image.sh
@@ -0,0 +1,9 @@
+#!/bin/sh -e
+
+# The common paradigm is to have the persistent data volume@/data
+# for mender.
+cd ${TARGET_DIR}
+if [ ! -L data ]; then
+    ln -s var/lib/mender data
+fi
+
diff --git a/board/mender/readme.txt b/board/mender/readme.txt
new file mode 100644
index 0000000000..2c92511127
--- /dev/null
+++ b/board/mender/readme.txt
@@ -0,0 +1,58 @@
+Mender UEFI PC sample config
+=====================
+
+1. Build
+
+  $ make mender_x86_64_efi_defconfig
+
+  Add any additional packages required and build:
+
+  $ make
+
+2. Write the Pendrive
+
+  The build process will create a Pendrive image called disk.img in
+  output/images.
+
+  Write the image to a pendrive:
+
+  $ dd if=output/images/disk.img of=/dev/${pendrive}; sync
+
+  Once the process is complete, insert it into the target PC and boot.
+
+  Remember that if said PC has another boot device you might need to
+  select this alternative for it to boot.
+
+  You might need to disable Secure Boot from the setup as well.
+
+3. Enjoy
+
+
+Emulation in qemu
+========================
+
+Run the emulation with:
+
+qemu-system-x86_64 \
+    -enable-kvm \
+    -M pc \
+    -bios </path/to/OVMF_CODE.fd> \
+    -drive file=output/images/disk.img,if=virtio,format=raw \
+    -net nic,model=virtio \
+    -net user
+
+Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
+firmware image for qemu. It may be provided by your distribution as an
+edk2 or OVMF package, in a path such as /usr/share/edk2/ovmf/OVMF_CODE.fd.
+
+Optionally add -smp N to emulate an SMP system with N CPUs.
+
+The login prompt will appear in the serial window.
+
+Tested with QEMU 3.1.1 on Fedora 30
+
+Using Mender
+========================
+The build process creates a update-${buildroot_version_number}.mender file in
+output/images. To use this file, please read the mender documentation at:
+https://docs.mender.io/2.0/getting-started
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
new file mode 100644
index 0000000000..a291ce1b25
--- /dev/null
+++ b/configs/mender_x86_64_efi_defconfig
@@ -0,0 +1,73 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Required tools to create bootable media
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test"
+BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+
+# Required tools to create a mender image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/post-image-efi-gpt.sh"
+BR2_ROOTFS_OVERLAY="board/mender/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/pre-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.10"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/linux.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+
+# Packages
+#
+# Use connman so that networking setup is simpler, via connmanctl tool
+# acpid is for seamless power button support
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_MENDER=y
+BR2_PACKAGE_MENDER_GRUBENV=y
+BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/mender_grubenv_defines"
-- 
2.21.0
