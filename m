From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:22 -0500
Subject: [Buildroot] [PATCH v6 18/22] qemu x86 selinux: base br defconfig
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-19-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

This will build a base SELinux system that boots with SELinux
in permissive mode. Also adding documentation on how to use it.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Update the qemu_x86_defconfig to the 4.0 kernel series (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 board/qemu/x86/linux-4.0-selinux.config | 77 +++++++++++++++++++++++++++++++++
 board/qemu/x86/readme.txt               | 17 ++++++++
 configs/qemu_x86_selinux_defconfig      | 67 ++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 board/qemu/x86/linux-4.0-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig

diff --git a/board/qemu/x86/linux-4.0-selinux.config b/board/qemu/x86/linux-4.0-selinux.config
new file mode 100644
index 0000000..89ab0dc
--- /dev/null
+++ b/board/qemu/x86/linux-4.0-selinux.config
@@ -0,0 +1,77 @@
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
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
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
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 85d5c60..032d714 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -5,3 +5,20 @@ Run the emulation with:
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.2.1
+
+-------------------------------------------------------------------
+
+Run the SElinux target emulation with:
+
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda rw console=ttyS0 selinux=1" -net nic,model=rtl8139 -net user -display none -serial stdio
+
+The emulation should reboot once the first time for relabeling and
+then provide a login prompt. The login is username root and password
+root because PAM requires a password in this secure configuration. To
+enable SELinux enforcing at boot, login and edit the
+/etc/selinux/config and set SELINUX to enforcing. Save and make sure
+to "sync" before restarting the emulation as the ext2 fs would
+otherwise corrupt when the emulation exits. After enforcing is
+default, the selinux= provided as part of the qemu "append" above can
+be used to turn enforcing on/off. This configuration would be tailored
+as part of a targets refpolicy customization.
diff --git a/configs/qemu_x86_selinux_defconfig b/configs/qemu_x86_selinux_defconfig
new file mode 100644
index 0000000..feb4534
--- /dev/null
+++ b/configs/qemu_x86_selinux_defconfig
@@ -0,0 +1,67 @@
+# Architecture
+BR2_x86_pentiumpro=y
+
+# Default to the latest Code Sourcery
+BR2_TOOLCHAIN_EXTERNAL=y
+
+# Select SYSV init to provide selinux enabled init
+BR2_INIT_SYSV=y
+
+# Default password to allow PAM login
+BR2_TARGET_GENERIC_ROOT_PASSWD="root"
+
+# Default the shell to bash, sh symlinks to busybox which
+# is not compatible with refpolicy
+BR2_SYSTEM_BIN_SH_BASH=y
+
+# Pull in SELinux specific file overlay to allow login
+# in enforcing mode.
+BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt board/common_selinux/skeleton_permissions.txt"
+BR2_ROOTFS_OVERLAY="board/common_selinux/skeleton"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/common_selinux/post_build.sh"
+
+# Lock to a kernel that's been tested against selinux libs
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.0-selinux.config"
+
+# Customized busybox config providing a tailored
+# balance of applets vs full apps
+BR2_PACKAGE_BUSYBOX_CONFIG="board/common_selinux/busybox-selinux.config"
+
+# Ensure busybox is built as individual binaries for the
+# SELinux refpolicy to work correctly
+BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y
+
+# Audit service
+BR2_PACKAGE_AUDIT=y
+
+# Enhanced authentication with selinux hooks
+BR2_PACKAGE_LINUX_PAM=y
+
+# Full version of login with SELinux support
+BR2_PACKAGE_UTIL_LINUX=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
+
+# SSH daemon for secure login
+BR2_PACKAGE_OPENSSH=y
+
+# Provides tools for fs security context relabeling
+BR2_PACKAGE_POLICYCOREUTILS=y
+
+# SELinux policy config/definition
+BR2_PACKAGE_REFPOLICY=y
+
+# Logging daemon
+BR2_PACKAGE_RSYSLOG=y
+
+#rootfs with spare space for fs relabel activity
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=5
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Offline tools for policy analysis/building
+BR2_PACKAGE_HOST_CHECKPOLICY=y
-- 
1.9.1
