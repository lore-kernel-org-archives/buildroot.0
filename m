From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:52:16 +0200
Subject: [Buildroot] [git commit] qemu: add new board support for
	qemu-system-sparc64
Message-ID: <20151010105226.E468B7FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a150d4f5e0804f79fc2a197b68164a476b1269d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPARC64 builds can be tested with Qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/sparc64-sun4u/linux-4.1.config |   27 +++++++++++++++++++++++++++
 board/qemu/sparc64-sun4u/readme.txt       |    7 +++++++
 configs/qemu_sparc64_sun4u_defconfig      |   19 +++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/board/qemu/sparc64-sun4u/linux-4.1.config b/board/qemu/sparc64-sun4u/linux-4.1.config
new file mode 100644
index 0000000..2b282f9
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/linux-4.1.config
@@ -0,0 +1,27 @@
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_EMBEDDED=y
+CONFIG_MODULES=y
+CONFIG_PCI=y
+CONFIG_SUN_OPENPROMFS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_CMD64X=y
+CONFIG_NETDEVICES=y
+CONFIG_NE2K_PCI=y
+CONFIG_SERIAL_SUNSU=y
+CONFIG_SERIAL_SUNSU_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_USE_FOR_EXT23=y 
+CONFIG_TMPFS=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="utf-8"
+CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
new file mode 100644
index 0000000..90d1edc
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "root=/dev/sda console=ttyS0,115200" -serial stdio output/images/rootfs.ext2
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.3.0
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
new file mode 100644
index 0000000..0bb4b3e
--- /dev/null
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_sparc64=y
+BR2_sparc_v9=y
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 4.1 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.1.config"
