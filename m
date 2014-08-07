From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:17:37 +0200
Subject: [Buildroot] [git commit] qemu/aarch64-virt: add new sample config
Message-ID: <20140807201742.BB9059D3D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6999e6760dc1dda6a25cf5250bedad28ed16dc16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/aarch64-virt/linux-3.16.config |   57 +++++++++++++++++++++++++++++
 board/qemu/aarch64-virt/readme.txt        |    7 ++++
 configs/qemu_aarch64_virt_defconfig       |   23 ++++++++++++
 3 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-3.16.config b/board/qemu/aarch64-virt/linux-3.16.config
new file mode 100644
index 0000000..594f424
--- /dev/null
+++ b/board/qemu/aarch64-virt/linux-3.16.config
@@ -0,0 +1,57 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_SMP=y
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
+CONFIG_BRIDGE=y
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_MULTI_LUN=y
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
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
new file mode 100644
index 0000000..f011de1
--- /dev/null
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
new file mode 100644
index 0000000..8ce28a8
--- /dev/null
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_aarch64=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Lock to 3.16 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.16"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.16.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
