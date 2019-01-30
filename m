From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 30 Jan 2019 11:47:28 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces a Qemu board for an Armv7-A target executing
with OP-TEE secure world services.

The target Linux based normal world embeds the standard minimal
filesystem with OP-TEE non-secure components embedded files from
OP-TEE test, examples and benchmark packages.

The Linux custom configuration is dumped from the vexpress_defconfig
with few added fragments: OP-TEE driver and 9p for virtual filesystem to
ease file manipulation and exchanges through Qemu virtfs support.

The standard way for booting OP-TEE with a non-secure world companion
use the Arm Trusted Firmware-A as bootloader. OP-TEE OS provides the
BL32 image and U-boot the BL33 image. The proposed board enables OP-TEE
and U-boot build for this. However package boot/arm-trusted-firmware
needs few change support building Armv7-A targets.

Therefore the proposed board allows one to build the images but not
yet to run the target with the built Qemu host tool.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

---
Changes v3 -> v4
  - No change.

Changes v2 -> v3
  - New change to introduce a board that at least builds Armv7-A OP-TEE.

---
 board/qemu/armv7a-tz-virt/linux.config  | 167 ++++++++++++++++++++++++++++++++
 board/qemu/armv7a-tz-virt/readme.txt    |  11 +++
 board/qemu/armv7a-tz-virt/u-boot.config |   3 +
 configs/qemu_armv7a_tz_virt_defconfig   |  41 ++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 board/qemu/armv7a-tz-virt/linux.config
 create mode 100644 board/qemu/armv7a-tz-virt/readme.txt
 create mode 100644 board/qemu/armv7a-tz-virt/u-boot.config
 create mode 100644 configs/qemu_armv7a_tz_virt_defconfig

diff --git a/board/qemu/armv7a-tz-virt/linux.config b/board/qemu/armv7a-tz-virt/linux.config
new file mode 100644
index 0000000..62ece0c
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/linux.config
@@ -0,0 +1,167 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_CPUSETS=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_ARCH_VEXPRESS_DCSCB=y
+CONFIG_ARCH_VEXPRESS_TC2_PM=y
+# CONFIG_SWP_EMULATE is not set
+CONFIG_SMP=y
+CONFIG_HAVE_ARM_ARCH_TIMER=y
+CONFIG_MCPM=y
+CONFIG_VMSPLIT_2G=y
+CONFIG_NR_CPUS=8
+CONFIG_ARM_PSCI=y
+CONFIG_AEABI=y
+CONFIG_CMA=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyAMA0"
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_MULTIPLE_DRIVERS=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_PLATRAM=y
+CONFIG_MTD_UBI=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_VIRTIO_BLK=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+# CONFIG_SATA_PMP is not set
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_SMC91X=y
+CONFIG_SMSC911X=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C=y
+CONFIG_I2C_VERSATILE=y
+CONFIG_SENSORS_VEXPRESS=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_VEXPRESS=y
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+# CONFIG_SND_DRIVERS is not set
+CONFIG_SND_ARMAACI=y
+CONFIG_HID_DRAGONRISE=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_TWINHAN=y
+CONFIG_HID_NTRIG=y
+CONFIG_HID_PANTHERLORD=y
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SONY=y
+CONFIG_HID_SUNPLUS=y
+CONFIG_HID_GREENASIA=y
+CONFIG_HID_SMARTJOYPLUS=y
+CONFIG_HID_TOPSEED=y
+CONFIG_HID_THRUSTMASTER=y
+CONFIG_HID_ZEROPLUS=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_MON=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_ISP1760=y
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+#CONFIG_JFFS2_FS is not set
+CONFIG_UBIFS_FS=y
+CONFIG_CRAMFS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_DEBUG_USER=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+### Enable OP-TEE
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+### Enable 9P VFS
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/board/qemu/armv7a-tz-virt/readme.txt b/board/qemu/armv7a-tz-virt/readme.txt
new file mode 100644
index 0000000..06b728f
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/readme.txt
@@ -0,0 +1,11 @@
+Board qemu_armv7a_tz_virt builds a Qemu Armv7-A target with
+OP-TEE running in the TrustZone secure world setup and a Linux based
+OS running in the non-secure world.
+
+This setup is usually booted with the Arm Trsuted Firmware-A (TF-A from
+package boot/arm-trusted-firmware). However the current Buildroot package
+needs few changes to build TF-A for OP-TEE support.
+
+Until BR arm-trusted-firmware is updated this board allows one to only
+build the secure and non-secure boot images if not the BIOS for the Qemu
+host.
diff --git a/board/qemu/armv7a-tz-virt/u-boot.config b/board/qemu/armv7a-tz-virt/u-boot.config
new file mode 100644
index 0000000..5588008
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/u-boot.config
@@ -0,0 +1,3 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
diff --git a/configs/qemu_armv7a_tz_virt_defconfig b/configs/qemu_armv7a_tz_virt_defconfig
new file mode 100644
index 0000000..ab52480
--- /dev/null
+++ b/configs/qemu_armv7a_tz_virt_defconfig
@@ -0,0 +1,41 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3D16=y
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_EXT2=y
+# Linux 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/armv7a-tz-virt/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
+# TF-A for booting OP-TEE secure and uboot/linux non secure
+# POSTPONED: depends on boot/arm-trusted-firmware support for Armv7-A
+# OP-TEE components
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_DEBUG=n CFG_UNWIND=n CFG_TEE_CORE_LOG_LEVEL=2"
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_PACKAGE_OPTEE_TEST=y
+BR2_PACKAGE_OPTEE_EXAMPLES=y
+BR2_PACKAGE_OPTEE_BENCHMARK=y
+# U-boot for booting the dear Linux kernel
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/armv7a-tz-virt/u-boot.config"
+# Qemu emulator for the Arm target
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+BR2_PACKAGE_HOST_QEMU_VIRTFS=y
