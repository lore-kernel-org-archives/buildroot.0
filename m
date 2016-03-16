From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 16 Mar 2016 17:16:46 +0530
Subject: [Buildroot] [ PATCH Selinux v11] qemu x86 selinux: base br defconfig
Message-ID: <1458128806-15103-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

This will build a base SELinux system that boots with SELinux
in permissive mode. Also adding documentation on how to use it.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

---
Changes v10 -> v11:
  - Removed configs BR2_ROOTFS_XXX (post build script,device table and overlay) from this patch
    and added these configs to another patch (common-selinux-support-files.patch)
  - Included configuration BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES in defconfig.

Changes v9 -> v10:
  - Changed version number of QEMU from 2.2.1 to 2.3.0

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - No changes

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Update the qemu_x86_defconfig to the 4.0 kernel series (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 board/qemu/x86/linux-4.0-selinux.config | 19 ++++++++++++
 board/qemu/x86/readme.txt               | 17 +++++++++++
 configs/qemu_x86_selinux_defconfig      | 54 +++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 board/qemu/x86/linux-4.0-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig

diff --git a/board/qemu/x86/linux-4.0-selinux.config b/board/qemu/x86/linux-4.0-selinux.config
new file mode 100644
index 0000000..1235141
--- /dev/null
+++ b/board/qemu/x86/linux-4.0-selinux.config
@@ -0,0 +1,19 @@
+CONFIG_AUDIT=y
+CONFIG_MODULES=y
+CONFIG_IP_PNP=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+ONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_SELINUX_BOOTPARAM=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 62c51b0..b5cb3fe 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -7,3 +7,20 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.3.0
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
index 0000000..ed98bb4
--- /dev/null
+++ b/configs/qemu_x86_selinux_defconfig
@@ -0,0 +1,54 @@
+# Architecture
+BR2_x86_pentiumpro=y
+
+# Internal tool chain glibc
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
+# Select SYSV init to provide selinux enabled init
+BR2_INIT_SYSV=y
+
+# Default password to allow PAM login
+BR2_TARGET_GENERIC_ROOT_PASSWD="root"
+
+# Lock to a kernel that's been tested against selinux libs
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.3.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/x86/linux-4.0-selinux.config"
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
2.5.0
