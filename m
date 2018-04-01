From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun,  1 Apr 2018 15:01:13 -0500
Subject: [Buildroot] [PATCH v2] configs/qemu_ppc64_e5500: new defconfig
Message-ID: <1522612873-3708-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding basic support modeled after the Freescale/NXP T1040RDBD4
board.

This target is used to support testing of the bootlin e5500
toolchain.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
v1 -> v2
[Thomas P
 - Fixed title
 - Added defconfig to DEVELOPERS
 - Updated linux config to have more clarification on e500
 - Option to set kernel headers default (missed this in orig as
   4.15 is default)
 - Adjusted linux cfg to support virtio block device and mount
   a ext fs as the rootfs.  Also setup config to support a net
   virtio device(assuming this would come up as a bug eventually)
---
 DEVELOPERS                            |  2 ++
 board/qemu/ppc64-e5500/linux.fragment | 10 ++++++++++
 board/qemu/ppc64-e5500/readme.txt     |  7 +++++++
 configs/qemu_ppc64_e5500_defconfig    | 20 ++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 board/qemu/ppc64-e5500/linux.fragment
 create mode 100644 board/qemu/ppc64-e5500/readme.txt
 create mode 100644 configs/qemu_ppc64_e5500_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ac7a47f..c0dd6fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1165,8 +1165,10 @@ F:	package/ts4900-fpga/
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
+F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
+F:	configs/qemu_ppc64_e5500_defconfig
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
new file mode 100644
index 0000000..071a55c
--- /dev/null
+++ b/board/qemu/ppc64-e5500/linux.fragment
@@ -0,0 +1,10 @@
+# Enables generic PPC e500 base arch support for QEMU.
+# The e5500 is a variant of the e500 arch.
+CONFIG_PPC_QEMU_E500=y
+
+# Enable virtio (blk, rng and net devices)
+CONFIG_VIRTIO=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_NET=y
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
new file mode 100644
index 0000000..0bfd41d
--- /dev/null
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append 'console=ttyS0 root=/dev/vda' -serial mon:stdio -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
new file mode 100644
index 0000000..e4a7518
--- /dev/null
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_e5500=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Linux headers same as the kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
1.9.1
