From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 17 Jul 2020 19:46:43 +0300
Subject: [Buildroot] [PATCH 4/4] configs/odroidc2: add defconfig
In-Reply-To: <20200717164643.4702-1-daggs@gmx.com>
References: <20200717164643.4702-1-daggs@gmx.com>
Message-ID: <20200717164643.4702-4-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add config to buildroot which allows building an image which
can run on Hardkernel's Odroid C2 board.

features summery:
 - kernel 5.7
 - uboot 2020.07
 - hdmi should work but not tested
 - needed modules are loaded

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 DEVELOPERS                 |  1 +
 configs/odroidc2_defconfig | 40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 configs/odroidc2_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 82044605b7..f055bebb70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -621,6 +621,7 @@ F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests

 N:	Dagg Stompler <daggs@gmx.com>
+F:	board/odroidc2/
 F:	package/meson-tools/
 F:	package/odroidc2_atf/

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
new file mode 100644
index 0000000000..8b854e2c4f
--- /dev/null
+++ b/configs/odroidc2_defconfig
@@ -0,0 +1,40 @@
+# Architecture
+BR2_aarch64=y
+
+# Toolchain
+BR2_GCC_VERSION_9_X=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/hardkernel/odroidc2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="yes"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-odroidc2"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
+BR2_TARGET_UBOOT_BOARDNAME="odroid-c2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION="2020.07"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MESON_TOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_ODROIDC2_ATF=y
--
2.27.0
