From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:38:09 -0600
Subject: [Buildroot] [PATCH v5 20/20] configs: Add SELinux x86 qemu config
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-21-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a base SELinux QEMU image for x86. This will build a base
SELinux system that boots with SELinux in permissive mode.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - Upgraded kernel version to match Gustavo's commit.
  - Added a entry to enable a glibc toolchain with C++ support.
Changes v1 -> v4:
  - Commit did not exist.
---
 board/qemu/x86/linux-3.12-selinux.config |   72 ++++++++++++++++++++++++++++++
 configs/qemu_x86_selinux_defconfig       |   28 ++++++++++++
 2 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/x86/linux-3.12-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig

diff --git a/board/qemu/x86/linux-3.12-selinux.config b/board/qemu/x86/linux-3.12-selinux.config
new file mode 100644
index 0000000..20aff7f
--- /dev/null
+++ b/board/qemu/x86/linux-3.12-selinux.config
@@ -0,0 +1,72 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_AUDIT=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
+# CONFIG_MTRR_SANITIZER is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_RELOCATABLE is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+# CONFIG_BLK_DEV is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_X86_PLATFORM_DEVICES is not set
+# CONFIG_DMIID is not set
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_SECURITY=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_SELINUX_BOOTPARAM=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+# CONFIG_VIRTUALIZATION is not set
diff --git a/configs/qemu_x86_selinux_defconfig b/configs/qemu_x86_selinux_defconfig
new file mode 100644
index 0000000..3530ffd
--- /dev/null
+++ b/configs/qemu_x86_selinux_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_i386=y
+BR2_x86_pentiumpro=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+# toolchain
+# Lock to 3.12 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12-selinux.config"
+
+# SELinux
+BR2_PACKAGE_REFPOLICY=y
-- 
1.7.1
