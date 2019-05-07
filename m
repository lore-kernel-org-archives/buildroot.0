From: Romain Naour <romain.naour@smile.fr>
Date: Tue,  7 May 2019 13:25:21 +0200
Subject: [Buildroot] [PATCH] board/qemu/aarch64: add a aarch64 virt machine
 using an ARM cortex-a72 core
Message-ID: <20190507112521.12165-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARM cortex-a72 core has been added to Qemu since version 3.1.0 [1] [2].

Rebuild the .gitlab-ci.yml.

Tested using Qemu 4.0.0.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=f11b452b95df4a0fc6561c278721cad03b24098b
[2] https://wiki.qemu.org/ChangeLog/3.1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Qemu also support ARM cortex-a57 cpu core.
Should we support and test all cpu emulation available in Qemu ?
This can be useful for toolchain-builder project to provide a prebuilt ARM aarch64
toolchain optimized for cortex-a57.
---
 .gitlab-ci.yml                                |  1 +
 .../qemu/aarch64-virt-cortex-a72/linux.config | 54 +++++++++++++++++++
 board/qemu/aarch64-virt-cortex-a72/readme.txt |  7 +++
 .../qemu_aarch64_virt_cortex-a72_defconfig    | 23 ++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 board/qemu/aarch64-virt-cortex-a72/linux.config
 create mode 100644 board/qemu/aarch64-virt-cortex-a72/readme.txt
 create mode 100644 configs/qemu_aarch64_virt_cortex-a72_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 374dbfe837..6462ca3a32 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -244,6 +244,7 @@ pc_x86_64_bios_defconfig: { extends: .defconfig }
 pc_x86_64_efi_defconfig: { extends: .defconfig }
 pine64_defconfig: { extends: .defconfig }
 pine64_sopine_defconfig: { extends: .defconfig }
+qemu_aarch64_virt_cortex-a72_defconfig: { extends: .defconfig }
 qemu_aarch64_virt_defconfig: { extends: .defconfig }
 qemu_arm_versatile_defconfig: { extends: .defconfig }
 qemu_arm_versatile_nommu_defconfig: { extends: .defconfig }
diff --git a/board/qemu/aarch64-virt-cortex-a72/linux.config b/board/qemu/aarch64-virt-cortex-a72/linux.config
new file mode 100644
index 0000000000..c9f2708ad5
--- /dev/null
+++ b/board/qemu/aarch64-virt-cortex-a72/linux.config
@@ -0,0 +1,54 @@
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
diff --git a/board/qemu/aarch64-virt-cortex-a72/readme.txt b/board/qemu/aarch64-virt-cortex-a72/readme.txt
new file mode 100644
index 0000000000..c1395839f2
--- /dev/null
+++ b/board/qemu/aarch64-virt-cortex-a72/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-aarch64 -M virt -cpu cortex-a72 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 4.0.0
diff --git a/configs/qemu_aarch64_virt_cortex-a72_defconfig b/configs/qemu_aarch64_virt_cortex-a72_defconfig
new file mode 100644
index 0000000000..703f5797fe
--- /dev/null
+++ b/configs/qemu_aarch64_virt_cortex-a72_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt-cortex-a72/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.20.1
