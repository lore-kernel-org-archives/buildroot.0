From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:18:45 +0200
Subject: [Buildroot] [git commit] configs: add new configuration for
	qemu-system-xtensa
Message-ID: <20140715201907.E15AC9D232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a570dea84f2e1728b43348c166694a3246d1b49c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with Qemu 2.0.0.
Overlay is from
https://github.com/jcmvbkbc/xtensa-toolchain-build/tree/master/overlays

Many thanks to Max Filippov <jcmvbkbc@gmail.com> for his extended help
and kernel config examples.

A small kernel patch is required, because mkimage does not contain
support for Xtensa and the uImage target is failing. Redboot is unused
so disable it, too.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/xtensa-lx60/linux-3.15.config           |   34 ++++++++++++++++++++
 .../linux-0001-disable-redboot-and-uboot.patch     |   16 +++++++++
 board/qemu/xtensa-lx60/readme.txt                  |    7 ++++
 board/qemu/xtensa-lx60/xtensa_dc232b.tar           |  Bin 0 -> 747520 bytes
 configs/qemu_xtensa_lx60_defconfig                 |   30 +++++++++++++++++
 5 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/board/qemu/xtensa-lx60/linux-3.15.config b/board/qemu/xtensa-lx60/linux-3.15.config
new file mode 100644
index 0000000..e231368
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-3.15.config
@@ -0,0 +1,34 @@
+# CONFIG_SWAP is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_DC232B=y
+# CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0,38400"
+# CONFIG_COMPACTION is not set
+# CONFIG_BOUNCE is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_S32C1I_SELFTEST is not set
+CONFIG_LD_NO_RELAX=y
diff --git a/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch b/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
new file mode 100644
index 0000000..c0ccf48
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
@@ -0,0 +1,16 @@
+disable boot-uboot and boot-redboot, requires a patched u-boot and mkimage
+
+Signed-off-by:Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur linux-3.15.orig/arch/xtensa/boot/Makefile linux-3.15/arch/xtensa/boot/Makefile
+--- linux-3.15.orig/arch/xtensa/boot/Makefile	2014-06-08 20:19:54.000000000 +0200
++++ linux-3.15/arch/xtensa/boot/Makefile	2014-06-14 20:07:15.206091165 +0200
+@@ -23,7 +23,7 @@
+ 
+ bootdir-$(CONFIG_XTENSA_PLATFORM_ISS)	 += boot-elf
+ bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf boot-uboot
+-bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf boot-uboot
++bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-elf
+ 
+ zImage Image: $(bootdir-y)
+ 
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
new file mode 100644
index 0000000..0bfed90
--- /dev/null
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-xtensa -M lx60 -cpu dc232b -monitor null -nographic -kernel output/images/Image.elf
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.0.0
diff --git a/board/qemu/xtensa-lx60/xtensa_dc232b.tar b/board/qemu/xtensa-lx60/xtensa_dc232b.tar
new file mode 100644
index 0000000..77080e0
Binary files /dev/null and b/board/qemu/xtensa-lx60/xtensa_dc232b.tar differ
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
new file mode 100644
index 0000000..05598a9
--- /dev/null
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_xtensa=y
+BR2_XTENSA_CUSTOM=y
+BR2_XTENSA_CUSTOM_NAME="dc232b"
+BR2_XTENSA_CORE_NAME="lx60"
+BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
+
+BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Lock to 3.15 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.15.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
