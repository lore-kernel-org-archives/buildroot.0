Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DEBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B685282CCA;
	Sun, 24 Jul 2022 19:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B685282CCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sskbzJ6HiaPs; Sun, 24 Jul 2022 19:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCA282A87;
	Sun, 24 Jul 2022 19:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCA282A87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA9D11BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93D204161B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D204161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLJuX9-VBoNB for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:04:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D35341615
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D35341615
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4D8EB85CBA; Sun, 24 Jul 2022 18:51:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:04:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948c7b2f2c7fa1a4c466b3331cc182dd90a67d11
X-Git-Newrev: 71cc3992598a30a8de584853ec1a2332d005cd49
X-Patchwork-Hint: ignore
Message-Id: <20220724185111.4D8EB85CBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender: add a mender board example
 configuration.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71cc3992598a30a8de584853ec1a2332d005cd49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot currently has all of the needed packages to use Mender as the primary
update system. However, there isn't any documentation or examples now that
provide a starting point for users. This lack of documentation makes setting up
a Mender based update system difficult and time-consuming.

Provided in this patch series is a mender_x86_64_efi_defconfig of which sets up
an x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
QEMU environment. The system partition schema comprises of two equally sized
root partitions and a data partition that mounts to /var/lib/mender as a
persistent data store partition.

There is a board/mender/readme.txt provided, which gives users documentation on
how to flash the built image or boot the image using QEMU as well.

The post-build and post-image-efi scripts also have four options:
-a --artifact-name:
  - The name of the artifact, this is added to /etc/mender/artifact_info
-o --data-part-size:
  - The data partition size.
-d --device-type
  - The device-type used by mender to catagorize registered devices.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
[Romain: rebase on master (01.2022)
  - update genimage-efi.cfg to use GPT partition table and genimage-15 syntax
  - bump the kernel to 5.15.13
  - Add host-libelf kernel dependency
  - Use BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI after commit 82d1e8c628cc
    (boot/grub2: use none platform when building for host)
  - Add regexp grub mandatory module for mender-grubenv
  - remove startup.nsh from genimage-efi.cfg after commit 3efb5e31fc05
    (board, boot, package: remove usage of startup.nsh in EFI partition)]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Arnout:
  - abbreviate sizes and partition uuids, remove implicit ones in genimage.cfg
  - change data partition uuid to Linux (instead of x86_64 rootfs)
  - fix whitespace and shellcheck errors in scripts
  - remove --generate-mender-image option, always create it
  - remove empty directory and -O ^64bit when creating data fs
  - remove redundant e2fsck
  - add -serial stdio option to qemu call
  - update kernel to current stable 5.18.14
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/mender/x86_64/genimage-efi.cfg               | 40 +++++++++++
 board/mender/x86_64/linux.config                   | 64 +++++++++++++++++
 board/mender/x86_64/mender_grubenv_defines         | 25 +++++++
 board/mender/x86_64/overlay/etc/fstab              |  7 ++
 board/mender/x86_64/overlay/etc/mender/mender.conf | 11 +++
 board/mender/x86_64/post-build.sh                  | 54 ++++++++++++++
 board/mender/x86_64/post-image-efi.sh              | 72 +++++++++++++++++++
 board/mender/x86_64/readme.txt                     | 69 ++++++++++++++++++
 configs/mender_x86_64_efi_defconfig                | 83 ++++++++++++++++++++++
 9 files changed, 425 insertions(+)

diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
new file mode 100644
index 0000000000..10cefe2380
--- /dev/null
+++ b/board/mender/x86_64/genimage-efi.cfg
@@ -0,0 +1,40 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		partition-type-uuid = U
+		offset = 32K
+		image = "efi-part.vfat"
+		bootable = true
+	}
+
+	partition roota {
+		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		image = "rootfs.ext2"
+	}
+
+	partition rootb {
+		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		image = "rootfs.ext2"
+	}
+
+	partition data {
+		partition-type-uuid = L
+		image = "data-part.ext4"
+	}
+}
diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
new file mode 100644
index 0000000000..f17fc18edb
--- /dev/null
+++ b/board/mender/x86_64/linux.config
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
diff --git a/board/mender/x86_64/mender_grubenv_defines b/board/mender/x86_64/mender_grubenv_defines
new file mode 100644
index 0000000000..77f68fe6b2
--- /dev/null
+++ b/board/mender/x86_64/mender_grubenv_defines
@@ -0,0 +1,25 @@
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
+# initrd_imagetype=initrd.img
diff --git a/board/mender/x86_64/overlay/etc/fstab b/board/mender/x86_64/overlay/etc/fstab
new file mode 100644
index 0000000000..45a7ba0260
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/fstab
@@ -0,0 +1,7 @@
+# <file system>     <mount pt>      <type>      <options>                               <dump>  <pass>
+/dev/root           /               ext4        rw,noauto                                   0    1
+/dev/vda1           /boot           vfat        defaults                                    0    0
+/dev/vda4           /var/lib/mender ext4        rw,relatime                                 0    0
+proc                /proc           proc        defaults                                    0    0
+devpts              /dev/pts        devpts      defaults,gid=5,mode=620,ptmxmode=0666       0    0
+sysfs               /sys            sysfs       defaults                                    0    0
diff --git a/board/mender/x86_64/overlay/etc/mender/mender.conf b/board/mender/x86_64/overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..5f423fb2cb
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/mender/mender.conf
@@ -0,0 +1,11 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy",
+  "DeviceTypeFile": "/etc/mender/device_type"
+}
diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
new file mode 100755
index 0000000000..23d1120d45
--- /dev/null
+++ b/board/mender/x86_64/post-build.sh
@@ -0,0 +1,54 @@
+#!/usr/bin/env bash
+set -e
+DEVICE_TYPE="buildroot-x86_64"
+ARTIFACT_NAME="1.0"
+
+function parse_args {
+    local o O opts
+    o='a:o:d:'
+    O='artifact-name:,data-part-size:,device-type:'
+    opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
+    eval set -- "${opts}"
+    while [ ${#} -gt 0 ]; do
+        case "${1}" in
+        (-o|--data-part-size)
+            # Ignored to have same options as other scripts
+            shift 2
+            ;;
+        (-d|--device-type)
+            DEVICE_TYPE="${2}"; shift 2
+            ;;
+        (-a|--artifact-name)
+            ARTIFACT_NAME="${2}"; shift 2
+            ;;
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+}
+
+  # Create a persistent directory to mount the data partition at.
+function mender_fixup {
+    pushd "${TARGET_DIR}"
+    if [[ -L var/lib/mender ]]; then
+        rm var/lib/mender
+        mkdir -p var/lib/mender
+    fi
+
+    # The common paradigm is to have the persistent data volume at /data for mender.
+    if [[ ! -L data ]]; then
+        ln -s var/lib/mender data
+    fi
+
+    popd
+}
+
+function main {
+    parse_args "${@}"
+    mender_fixup
+    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
+    echo "artifact_name=${ARTIFACT_NAME}" > "${TARGET_DIR}/etc/mender/artifact_info"
+}
+
+main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
new file mode 100755
index 0000000000..97b9e06d21
--- /dev/null
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -0,0 +1,72 @@
+#!/usr/bin/env bash
+set -e
+BOARD_DIR="$(realpath "$(dirname "$0")")"
+DATA_PART_SIZE="32M"
+DEVICE_TYPE="buildroot-x86_64"
+ARTIFACT_NAME="1.0"
+
+
+# Parse arguments.
+function parse_args {
+    local o O opts
+    o='a:o:d:'
+    O='artifact-name:,data-part-size:,device-type:'
+    opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
+    eval set -- "${opts}"
+    while [ ${#} -gt 0 ]; do
+        case "${1}" in
+        (-o|--data-part-size)
+            DATA_PART_SIZE="${2}"; shift 2
+            ;;
+        (-d|--device-type)
+            DEVICE_TYPE="${2}"; shift 2
+            ;;
+        (-a|--artifact-name)
+            ARTIFACT_NAME="${2}"; shift 2
+            ;;
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+}
+
+# Create the data partition
+function make_data_partition {
+    "${HOST_DIR}/sbin/mkfs.ext4" \
+        -F \
+        -r 1 \
+        -N 0 \
+        -m 5 \
+        -L "data" \
+        "${BINARIES_DIR}/data-part.ext4" "${DATA_PART_SIZE}"
+}
+
+
+# Create a mender image.
+function generate_mender_image {
+    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+    "${HOST_DIR}/bin/mender-artifact" \
+        --compression lzma \
+        write rootfs-image \
+        -t "${DEVICE_TYPE}" \
+        -n "${BR2_VERSION}" \
+        -f "${BINARIES_DIR}/rootfs.ext2" \
+        -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+}
+
+
+function generate_image {
+    sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
+}
+
+# Main function.
+function main {
+    parse_args "${@}"
+    make_data_partition
+    generate_image
+    generate_mender_image
+    exit $?
+}
+
+main "${@}"
diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
new file mode 100644
index 0000000000..a9755ec58b
--- /dev/null
+++ b/board/mender/x86_64/readme.txt
@@ -0,0 +1,69 @@
+Mender UEFI PC sample config
+=====================
+
+1. Build
+
+  $ make mender_x86_64_efi_defconfig
+
+  Add any additional packages required. Update the files in board/mender/x86_64
+  and change /dev/vda to what is relevant for your platform: typically
+  /dev/mmcblk0p for eMMC and /dev/sda for USB or SATA.
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
+    -drive file=output/images/disk.img,if=virtio,format=raw \
+    -net nic,model=virtio \
+    -net user \
+    -serial stdio \
+    -bios </path/to/OVMF_CODE.fd>
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
+Tested with QEMU 4.1.1 on Fedora 31
+
+Creating a mender-artifact
+========================
+
+The mender artifact is created in output/images/buildroot-x86_64-1.0.mender
+
+You may wish to change --artifact-name=1.0 to a name that best suits your
+particular needs, as this option changes the mender artifact name.
+
+Using mender
+========================
+Please read the mender documentation at:
+https://docs.mender.io/2.2/getting-started
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
new file mode 100644
index 0000000000..4ab4c7b03d
--- /dev/null
+++ b/configs/mender_x86_64_efi_defconfig
@@ -0,0 +1,83 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+# Required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+# Required for sysvinit
+BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Required as vda4 doesn't mount on first boot with busybox
+BR2_INIT_SYSV=y
+
+# Required tools to create bootable media
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+# Add mandatory modules from MENDER_GRUBENV_MANDATORY_MODULES
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp"
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
+BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
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
+BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
