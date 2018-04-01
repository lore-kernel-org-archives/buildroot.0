From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun,  1 Apr 2018 09:15:30 -0500
Subject: [Buildroot] [PATCH] ppc64 e5500 arch: new qemu target
Message-ID: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding basic support modeled after the Freescale/NXP
T1040RDBD4 board.

This target is used to support testing of the bootlin e5500
toolchain.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                            |  1 +
 board/qemu/ppc64-e5500/linux.fragment |  2 ++
 board/qemu/ppc64-e5500/readme.txt     |  7 +++++++
 configs/qemu_ppc64_e5500_defconfig    | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 board/qemu/ppc64-e5500/linux.fragment
 create mode 100644 board/qemu/ppc64-e5500/readme.txt
 create mode 100644 configs/qemu_ppc64_e5500_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ac7a47f..dd7e389 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1165,6 +1165,7 @@ F:	package/ts4900-fpga/
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
+F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
 F:	package/argp-standalone/
diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
new file mode 100644
index 0000000..81993d2
--- /dev/null
+++ b/board/qemu/ppc64-e5500/linux.fragment
@@ -0,0 +1,2 @@
+# Enables generic e500 arch support for QEMU
+CONFIG_PPC_QEMU_E500=y
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
new file mode 100644
index 0000000..8da23f9
--- /dev/null
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -append 'console=ttyS0 root=/dev/ram' -initrd output/images/rootfs.cpio.gz -serial mon:stdio -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
new file mode 100644
index 0000000..55c5644
--- /dev/null
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_e5500=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
1.9.1
