From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  2 Sep 2019 15:34:42 -0700
Subject: [Buildroot] [PATCH v2] board/mender: add a mender board example
 configuration.
In-Reply-To: <20190902223442.24880-1-aduskett@gmail.com>
References: <20190902223442.24880-1-aduskett@gmail.com>
Message-ID: <20190902223442.24880-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

Buildroot currently has all of the needed packages to use Mender as the primary
update system. However; there isn't any documentation or examples now that
provide a starting point for users. This lack of documentation makes setting up
a Mender based update system difficult and time-consuming.

Provided in this patch series is a mender_x86_64_efi_defconfig -that sets up an
x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
QEMU environment. The system partition schema comprises of two equally sized
root partitions and a 32M data partition that is mounted to /var/lib/mender as
a persistent data store partition.

There is a board/mender/readme.txt provided which gives users documentation on
how to flash the built image or boot the image using QEMU as well.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
Changes v1 -> v2:
  - Remove uneeded entries in board/mender/overlays/etc/fstab

  - Rename post-image-efi-gpt.sh to post-image-efi.sh

  - Rename pre-image.sh to post-build.sh to keep with standard naming conventions.

  - Check if /var/lib/mender is a symlink, and if so; remove it and create a
    directory in its place. This change prevents the mender init script from
    doing the same thing and preventing the data partition from mounting
    correctly on the initial boot.

  - Make creating a mender artifact optional after the build.

  - Add more documentation in board/mender/readme.txt.
  - Add genimage-efi.cfg [Thomas]

  - Use genimage.sh instead of the old-style found in
    board/pc/post-image-efi-gpt.sh (Thomas)


 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 board/mender/genimage-efi.cfg               | 49 ++++++++++++++
 board/mender/linux.config                   | 64 ++++++++++++++++++
 board/mender/mender_grubenv_defines         | 32 +++++++++
 board/mender/overlay/etc/fstab              |  7 ++
 board/mender/overlay/etc/mender/mender.conf | 10 +++
 board/mender/post-build.sh                  | 14 ++++
 board/mender/post-image-efi.sh              | 20 ++++++
 board/mender/readme.txt                     | 65 ++++++++++++++++++
 configs/mender_x86_64_efi_defconfig         | 74 +++++++++++++++++++++
 11 files changed, 337 insertions(+)
 create mode 100644 board/mender/genimage-efi.cfg
 create mode 100644 board/mender/linux.config
 create mode 100644 board/mender/mender_grubenv_defines
 create mode 100644 board/mender/overlay/etc/fstab
 create mode 100644 board/mender/overlay/etc/mender/mender.conf
 create mode 100755 board/mender/post-build.sh
 create mode 100755 board/mender/post-image-efi.sh
 create mode 100644 board/mender/readme.txt
 create mode 100644 configs/mender_x86_64_efi_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5d42d2a606..4f923af8fa 100644
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
index 3df21a78e6..8ef6853d83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -27,6 +27,7 @@
 #   modify packages that use this infrastructure.
 
 N:	Adam Duskett <aduskett@gmail.com>
+F:	configs/mender_x86_64_efi_defconfig
 F:	package/audit/
 F:	package/busybox/
 F:	package/checkpolicy/
diff --git a/board/mender/genimage-efi.cfg b/board/mender/genimage-efi.cfg
new file mode 100644
index 0000000000..e95fec8df5
--- /dev/null
+++ b/board/mender/genimage-efi.cfg
@@ -0,0 +1,49 @@
+image efi-part.vfat {
+  vfat {
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
+    }
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file bzImage {
+      image = "bzImage"
+    }
+  }
+  size = 32M
+}
+
+image data-part.vfat {
+  vfat {
+    file device_type {
+      image = "data-part/device_type"
+    }
+    extraargs = "-n 'data' -F32"
+  }
+  size = 32M
+}
+
+image disk.img {
+  hdimage {}
+
+  partition boot {
+    partition-type = 0xEF
+    image = "efi-part.vfat"
+    bootable = true
+  }
+
+  partition roota {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+
+  partition rootb {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+
+  partition data {
+    partition-type = 0xEF
+    image = "data-part.vfat"
+  }
+}
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
index 0000000000..2e45f893df
--- /dev/null
+++ b/board/mender/overlay/etc/fstab
@@ -0,0 +1,7 @@
+# <file system>     <mount pt>      <type>      <options>                               <dump>  <pass>
+/dev/vda1           /boot/EFI       vfat        defaults                                    0    0
+/dev/vda4           /var/lib/mender vfat        defaults,user                               0    0
+/dev/root           /               ext4        rw,noauto                                   0    1
+proc                /proc           proc        defaults                                    0    0
+devpts              /dev/pts        devpts      defaults,gid=5,mode=620,ptmxmode=0666       0    0
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
diff --git a/board/mender/post-build.sh b/board/mender/post-build.sh
new file mode 100755
index 0000000000..9c74a65a3d
--- /dev/null
+++ b/board/mender/post-build.sh
@@ -0,0 +1,14 @@
+#!/bin/sh -e
+cd ${TARGET_DIR}
+
+# Create a persistent directory to mount the data partition at.
+if [[ -L var/lib/mender ]]; then
+  rm var/lib/mender
+  mkdir -p var/lib/mender
+fi
+
+# The common paradigm is to have the persistent data volume at /data for mender.
+if [[ ! -L data ]]; then
+    ln -s var/lib/mender data
+fi
+
diff --git a/board/mender/post-image-efi.sh b/board/mender/post-image-efi.sh
new file mode 100755
index 0000000000..4bc400d68e
--- /dev/null
+++ b/board/mender/post-image-efi.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+
+mkdir -p ${BINARIES_DIR}/data-part/
+echo "device_type=buildroot" > ${BINARIES_DIR}/data-part/device_type
+sh support/scripts/genimage.sh $2 board/mender/genimage-efi.cfg
+
+function create_mender_image(){
+  echo "Creating ${BINARIES_DIR}/${1}"
+  ${HOST_DIR}/bin/mender-artifact \
+    --compression lzma \
+    write rootfs-image \
+    -t BUILDROOT_DEVICE \
+    -n ${BR2_VERSION} \
+    -f ${BINARIES_DIR}/rootfs.ext2 \
+    -o ${BINARIES_DIR}/${1}
+}
+
+# Uncomment this line to generate a mender artifact after the image is built.
+# create_mender_image "update-${BR2_VERSION}.mender"
diff --git a/board/mender/readme.txt b/board/mender/readme.txt
new file mode 100644
index 0000000000..7701edf0ce
--- /dev/null
+++ b/board/mender/readme.txt
@@ -0,0 +1,64 @@
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
+Emulation in qemu
+========================
+
+Run the emulation with:
+
+qemu-system-x86_64 \
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
+Optional arguments:
+ - -enable-kvm to speed up qemu. This requires a loaded kvm module on the host
+    system.
+ - Add -smp N to emulate an SMP system with N CPUs.
+
+The login prompt will appear in the serial window.
+
+Tested with QEMU 3.1.1 on Fedora 30
+
+Creating a mender-artifact
+========================
+Edit board/mender/post-image-efi.sh and uncomment the line:
+create_mender_image "update-${BR2_VERSION}.mender" to create a mender file
+automatically at the end of a build.
+
+Using mender
+========================
+Please read the mender documentation at:
+https://docs.mender.io/2.0/getting-started
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
new file mode 100644
index 0000000000..4f79578db2
--- /dev/null
+++ b/configs/mender_x86_64_efi_defconfig
@@ -0,0 +1,74 @@
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
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_OVERLAY="board/mender/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/post-image-efi.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mender/genimage-efi.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.11"
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
