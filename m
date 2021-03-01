From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 23:50:15 +0100
Subject: [Buildroot] [git commit] board/qemu: Add ppc-e500mc configuration
Message-ID: <20210308072137.007B38893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88c1cb10b66b8690aed29447cbedfa6d7657db00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds a 32-bit equivalent configuration of ppc64-e5500 board.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/ppc-e500mc/linux.fragment | 10 ++++++++++
 board/qemu/ppc-e500mc/readme.txt     |  5 +++++
 configs/qemu_ppc_e500mc_defconfig    | 29 +++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/board/qemu/ppc-e500mc/linux.fragment b/board/qemu/ppc-e500mc/linux.fragment
new file mode 100644
index 0000000000..35a8dccf89
--- /dev/null
+++ b/board/qemu/ppc-e500mc/linux.fragment
@@ -0,0 +1,10 @@
+# Enables generic PPC e500 base arch support for QEMU.
+# The e500mc is a variant of the e500 arch.
+CONFIG_PPC_QEMU_E500=y
+
+# Enable virtio (blk, rng and net devices)
+CONFIG_VIRTIO=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_NET=y
diff --git a/board/qemu/ppc-e500mc/readme.txt b/board/qemu/ppc-e500mc/readme.txt
new file mode 100644
index 0000000000..77a864ed2b
--- /dev/null
+++ b/board/qemu/ppc-e500mc/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+ qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc_e500mc_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
new file mode 100644
index 0000000000..69fc8dbc06
--- /dev/null
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_e500mc=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as the kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
