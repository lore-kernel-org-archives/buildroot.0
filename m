From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 25 Oct 2016 14:26:08 -0500
Subject: [Buildroot] [PATCH v13 6/8] qemu x86 selinux: base br defconfig
In-Reply-To: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1477423570-15694-6-git-send-email-bryce.ferguson@rockwellcollins.com>
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
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

---
Changes v12 -> v13:
  - Bump kernel to 4.8
  - Fixed error in fragment config line: 6 (ONFIG_EXT2_FS -> CONFIG_EXT2_FS)

Changes v11 -> v12:
  - Bump kernel to 4.6
  - Renamed fragment config to be 4.x vs 4.0

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
 board/qemu/x86/linux-4.x-selinux.config | 19 +++++++++++++++++++
 board/qemu/x86/readme.txt               | 17 +++++++++++++++++
 configs/qemu_x86_selinux_defconfig      | 31 +++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 board/qemu/x86/linux-4.x-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig

diff --git a/board/qemu/x86/linux-4.x-selinux.config b/board/qemu/x86/linux-4.x-selinux.config
new file mode 100644
index 0000000..6c715f0
--- /dev/null
+++ b/board/qemu/x86/linux-4.x-selinux.config
@@ -0,0 +1,19 @@
+CONFIG_AUDIT=y
+CONFIG_MODULES=y
+CONFIG_IP_PNP=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_EXT2_FS=y
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
index 4f2e4c7..f7bf256 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -7,3 +7,20 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.5.0
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
index 0000000..ebfe4ca
--- /dev/null
+++ b/configs/qemu_x86_selinux_defconfig
@@ -0,0 +1,31 @@
+BR2_x86_pentiumpro=y
+
+# Internal tool chain glibc
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
+# Select SYSV init to provide selinux enabled init
+BR2_INIT_SYSV=y
+BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt board/common_selinux/skeleton_permissions.txt"
+BR2_TARGET_GENERIC_ROOT_PASSWD="root"
+BR2_ROOTFS_OVERLAY="board/common_selinux/skeleton"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/common_selinux/post_build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.8.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/x86/linux-4.x-selinux.config"
+
+# Ensure busybox is built as individual binaries for the
+# SELinux refpolicy to work correctly
+BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_REFPOLICY=y
+BR2_PACKAGE_RSYSLOG=y
+BR2_PACKAGE_UTIL_LINUX=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=5
+BR2_PACKAGE_HOST_CHECKPOLICY=y
-- 
1.9.1
