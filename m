From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon,  7 Jan 2019 11:24:58 +0100
Subject: [Buildroot] [PATCH v3 7/7] configs/qemu_aarch64_tz_virt: AArch64
 emulation with TrustZone services
In-Reply-To: <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
References: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
 <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1546856698-20032-7-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces a Qemu board for an AArch64 target executing
with OP-TEE secure world services.

The target Linux based normal world embeds the standard minimal
filesystem with OP-TEE non-secure components embedded files from
OP-TEE client, test, examples and benchmark packages.

The Linux custom configuration is dumped from the qemu/aarch64-virt board
with few added fragments: OP-TEE driver and 9p for virtual filesystem to
ease file manipulation and exchanges through Qemu virtfs support.

The standard way for booting OP-TEE with a non-secure world companion
use the Arm Trusted Firmware-A as bootloader. OP-TEE OS provides the
BL32 image and U-boot the BL33 image. The proposed board enables OP-TEE
and U-boot build for this. However package boot/arm-trusted-firmware
needs few changes to build OP-TEE compliant TF-A images.

Therefore the proposed board allows one to build the images but not
yet to run the target with the built Qemu host tool.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3
  - New change to introduce a board that at least builds Aarch64 OP-TEE.

---
 board/qemu/aarch64-tz-virt/linux.config  | 63 ++++++++++++++++++++++++++++++++
 board/qemu/aarch64-tz-virt/readme.txt    | 11 ++++++
 board/qemu/aarch64-tz-virt/u-boot.config |  3 ++
 configs/qemu_aarch64_tz_virt_defconfig   | 47 ++++++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 board/qemu/aarch64-tz-virt/linux.config
 create mode 100644 board/qemu/aarch64-tz-virt/readme.txt
 create mode 100644 board/qemu/aarch64-tz-virt/u-boot.config
 create mode 100644 configs/qemu_aarch64_tz_virt_defconfig

diff --git a/board/qemu/aarch64-tz-virt/linux.config b/board/qemu/aarch64-tz-virt/linux.config
new file mode 100644
index 0000000..49b7ac6
--- /dev/null
+++ b/board/qemu/aarch64-tz-virt/linux.config
@@ -0,0 +1,63 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_BINFMT_MISC=y
+CONFIG_COMPAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=m
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+### Enable OP-TEE
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+### Enable 9P VFS
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
+
diff --git a/board/qemu/aarch64-tz-virt/readme.txt b/board/qemu/aarch64-tz-virt/readme.txt
new file mode 100644
index 0000000..ec91d2e
--- /dev/null
+++ b/board/qemu/aarch64-tz-virt/readme.txt
@@ -0,0 +1,11 @@
+Board qemu_aarch64_tz_virt builds a Qemu Armv8-A target with
+OP-TEE running in the TrustZone secure wolrd setup and a Linux based
+OS running in the non-secure wolrd.
+
+This setup is usually booted with the Arm Trsuted Firmware-A (TF-A from
+package boot/arm-trusted-firmware). However the current Buildroot package
+needs few changes to build TF-A for OP-TEE support.
+
+Until BR arm-trusted-firmware is updated this board allows one to only
+build the secure and non-secure boot images if not the BIOS for the Qemu
+host.
diff --git a/board/qemu/aarch64-tz-virt/u-boot.config b/board/qemu/aarch64-tz-virt/u-boot.config
new file mode 100644
index 0000000..5588008
--- /dev/null
+++ b/board/qemu/aarch64-tz-virt/u-boot.config
@@ -0,0 +1,3 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
diff --git a/configs/qemu_aarch64_tz_virt_defconfig b/configs/qemu_aarch64_tz_virt_defconfig
new file mode 100644
index 0000000..9286d15
--- /dev/null
+++ b/configs/qemu_aarch64_tz_virt_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_aarch64=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-tz-virt/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# TF-A for booting OP-TEE secure and uboot/linux non secure
+# POSTPONED: depends on boot/arm-trusted-firmware support for Armv7-A
+
+# OP-TEE components
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_armv8a"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_DEBUG=n CFG_UNWIND=n CFG_TEE_CORE_LOG_LEVEL=2"
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_PACKAGE_OPTEE_TEST=y
+BR2_PACKAGE_OPTEE_EXAMPLES=y
+BR2_PACKAGE_OPTEE_BENCHMARK=y
+
+# Need a non-secure bootloader for the dear Linux kernel: U-boot? UEFI?
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-tz-virt/u-boot.config"
+
+# Qemu emulator for the Arm target
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+BR2_PACKAGE_HOST_QEMU_VIRTFS=y
-- 
1.9.1
