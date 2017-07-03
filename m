From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:00:50 +0200
Subject: [Buildroot] [PATCH v14 3/4] qemu x86 selinux: added common selinux
	support files
In-Reply-To: <20170703210051.3457-1-arnout@mind.be>
References: <20170703210051.3457-1-arnout@mind.be>
Message-ID: <20170703210051.3457-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Add a default busybox SELinux config which disables init and uses
sysvinit. Add base skeleton with inittab and fstab tailored to selinux
Add base skeleton audit configuration (didn't seem to merit being
the package default).

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
[Arnout:
 - Include linux-selinux-fragment.config in this patch already;
 - Renamed a number of files/directories.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v14:
 - Reordered before adding the qemu_selinux defconfig that uses this
   stuff.
 - Include linux-selinux-fragment.config in this patch already.
 - Renamed a number of files/directories.
---
 .../common_selinux/busybox-selinux-fragment.config | 32 ++++++++++++++++++++++
 .../fs-overlay/etc/audit/auditd.conf               | 32 ++++++++++++++++++++++
 .../fs-overlay/etc/audit/rules.d/audit.rules       |  3 ++
 board/common_selinux/fs-overlay/etc/fstab          | 15 ++++++++++
 board/common_selinux/fs-overlay/etc/inittab        | 29 ++++++++++++++++++++
 board/common_selinux/linux-selinux-fragment.config | 19 +++++++++++++
 board/common_selinux/permissions.txt               | 26 ++++++++++++++++++
 board/common_selinux/post_build.sh                 | 30 ++++++++++++++++++++
 8 files changed, 186 insertions(+)
 create mode 100644 board/common_selinux/busybox-selinux-fragment.config
 create mode 100644 board/common_selinux/fs-overlay/etc/audit/auditd.conf
 create mode 100644 board/common_selinux/fs-overlay/etc/audit/rules.d/audit.rules
 create mode 100755 board/common_selinux/fs-overlay/etc/fstab
 create mode 100755 board/common_selinux/fs-overlay/etc/inittab
 create mode 100644 board/common_selinux/linux-selinux-fragment.config
 create mode 100755 board/common_selinux/permissions.txt
 create mode 100755 board/common_selinux/post_build.sh

diff --git a/board/common_selinux/busybox-selinux-fragment.config b/board/common_selinux/busybox-selinux-fragment.config
new file mode 100644
index 0000000000..7222fac96c
--- /dev/null
+++ b/board/common_selinux/busybox-selinux-fragment.config
@@ -0,0 +1,32 @@
+CONFIG_BUILD_LIBBUSYBOX=y
+CONFIG_CHCON=y
+CONFIG_DEFAULT_DEPMOD_FILE=""
+CONFIG_DEFAULT_MODULES_DIR=""
+CONFIG_FATATTR=y
+CONFIG_FEATURE_BASH_IS_ASH=y
+CONFIG_FEATURE_CHCON_LONG_OPTIONS=y
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
+CONFIG_FEATURE_FIND_INUM=y
+CONFIG_FEATURE_HAVE_RPC=y
+CONFIG_FEATURE_INDIVIDUAL=y
+CONFIG_FEATURE_LAST_SMALL=y
+CONFIG_FEATURE_MOUNT_HELPERS=y
+CONFIG_FEATURE_MOUNT_LABEL=y
+CONFIG_FEATURE_MOUNT_NFS=y
+CONFIG_FEATURE_MOUNT_VERBOSE=y
+CONFIG_FEATURE_RUNCON_LONG_OPTIONS=y
+CONFIG_FEATURE_SWAPON_DISCARD=y
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
+CONFIG_FEATURE_TAR_SELINUX=y
+CONFIG_FEATURE_TOUCH_NODEREF=y
+CONFIG_FIRST_SYSTEM_ID=0
+CONFIG_GROUPS=y
+CONFIG_INIT_TERMINAL_TYPE=""
+CONFIG_LAST_ID=0
+CONFIG_LAST_SYSTEM_ID=0
+CONFIG_PAM=y
+CONFIG_RUNCON=y
+CONFIG_SELINUXENABLED=y
+CONFIG_SELINUX=y
+CONFIG_SHUF=y
+CONFIG_USERS=y
diff --git a/board/common_selinux/fs-overlay/etc/audit/auditd.conf b/board/common_selinux/fs-overlay/etc/audit/auditd.conf
new file mode 100644
index 0000000000..039b7f0287
--- /dev/null
+++ b/board/common_selinux/fs-overlay/etc/audit/auditd.conf
@@ -0,0 +1,32 @@
+#
+# This file controls the configuration of the audit daemon
+#
+
+log_file = /var/log/audit/audit.log
+log_format = RAW
+log_group = root
+priority_boost = 4
+flush = INCREMENTAL
+freq = 20
+num_logs = 5
+disp_qos = lossy
+dispatcher = /usr/sbin/audispd
+name_format = NONE
+##name = mydomain
+max_log_file = 6 
+max_log_file_action = ROTATE
+space_left = 75
+space_left_action = IGNORE
+action_mail_acct = root
+admin_space_left = 50
+admin_space_left_action = IGNORE
+disk_full_action = IGNORE
+disk_error_action = IGNORE
+##tcp_listen_port = 
+tcp_listen_queue = 5
+tcp_max_per_addr = 1
+##tcp_client_ports = 1024-65535
+tcp_client_max_idle = 0
+enable_krb5 = no
+krb5_principal = auditd
+##krb5_key_file = /etc/audit/audit.key
diff --git a/board/common_selinux/fs-overlay/etc/audit/rules.d/audit.rules b/board/common_selinux/fs-overlay/etc/audit/rules.d/audit.rules
new file mode 100644
index 0000000000..7c906060e6
--- /dev/null
+++ b/board/common_selinux/fs-overlay/etc/audit/rules.d/audit.rules
@@ -0,0 +1,3 @@
+-D
+-b 1024
+-e 2
diff --git a/board/common_selinux/fs-overlay/etc/fstab b/board/common_selinux/fs-overlay/etc/fstab
new file mode 100755
index 0000000000..d772349c9f
--- /dev/null
+++ b/board/common_selinux/fs-overlay/etc/fstab
@@ -0,0 +1,15 @@
+# /etc/fstab: static file system information.
+#
+# <file system> <mount pt>     <type>    <options>                      <dump> <pass>
+/dev/root       /              ext3      rw,noauto                       0      1
+proc            /proc          proc      defaults                        0      0
+devpts          /dev/pts       devpts    defaults,gid=5,mode=620         0      0
+tmpfs           /dev/shm       tmpfs     mode=0700,nodev,nosuid,noexec,size=1M    0      0
+tmpfs           /tmp           tmpfs     mode=0700,nodev,nosuid,noexec,size=200M  0      0
+tmpfs           /var/cache     tmpfs     mode=0700,nodev,nosuid,noexec,size=1M    0      0
+tmpfs           /var/lock      tmpfs     mode=0700,nodev,nosuid,noexec,size=1M    0      0
+tmpfs           /var/log       tmpfs     mode=0700,nodev,nosuid,noexec,size=50M   0      0
+tmpfs           /var/run       tmpfs     mode=0700,nodev,nosuid,noexec,size=1M    0      0
+tmpfs           /var/spool     tmpfs     mode=0700,nodev,nosuid,noexec,size=1M    0      0
+sysfs           /sys           sysfs     defaults                 0      0
+none            /selinux       selinuxfs noauto                   0      0
diff --git a/board/common_selinux/fs-overlay/etc/inittab b/board/common_selinux/fs-overlay/etc/inittab
new file mode 100755
index 0000000000..cbdc23766c
--- /dev/null
+++ b/board/common_selinux/fs-overlay/etc/inittab
@@ -0,0 +1,29 @@
+# /etc/inittab
+#
+# This inittab is a basic inittab sample for sysvinit, which mimics
+# Buildroot's default inittab for BusyBox.
+id:1:initdefault:
+
+proc::sysinit:/bin/mount -t proc proc /proc
+sysf::sysinit:/bin/mount -t sysfs sysfs /sys
+dpts::sysinit:/bin/mkdir -p /dev/pts -Z `matchpathcon -n /dev/pts`
+dshm::sysinit:/bin/mkdir -p /dev/shm -Z `matchpathcon -n /dev/shm`
+mpts::sysinit:/bin/mkdir -p /dev/pts
+mshm::sysinit:/bin/mkdir -p /dev/shm
+fsck::sysinit:/sbin/fsck -ARy
+moun::sysinit:/bin/mount -a
+host::sysinit:/bin/hostname -F /etc/hostname
+
+# now run any rc scripts
+init::bootwait:/etc/init.d/rcS
+
+S0::respawn:/sbin/getty -L  ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Stuff to do before rebooting
+shd0:06:wait:/etc/init.d/rcK
+shd1:06:wait:/sbin/swapoff -a
+shd2:06:wait:/bin/umount -a -r
+
+# The usual halt or reboot actions
+hlt0:0:wait:/sbin/halt -dhp
+reb0:6:wait:/sbin/reboot
diff --git a/board/common_selinux/linux-selinux-fragment.config b/board/common_selinux/linux-selinux-fragment.config
new file mode 100644
index 0000000000..6c715f0599
--- /dev/null
+++ b/board/common_selinux/linux-selinux-fragment.config
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
diff --git a/board/common_selinux/permissions.txt b/board/common_selinux/permissions.txt
new file mode 100755
index 0000000000..374adbc02a
--- /dev/null
+++ b/board/common_selinux/permissions.txt
@@ -0,0 +1,26 @@
+################################################################################
+#
+# See <buildroot-source>/package/makedevs/README for details
+#
+# This device table is used to assign proper ownership and permissions
+# on the files in the local-skeleton directory. It doesn't create any device
+# file, as it is used in both static device configurations (where /dev/ is static)
+# and in dynamic configurations (where devtmpfs, mdev or udev are used).
+#
+# <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+
+# All the necessary file permissions for /etc
+/etc/audit/auditd.conf			f	644	0	0	-	-	-	-	-
+/etc/audit/rules.d/audit.rules		f	644	0	0	-	-	-	-	-
+/etc/fstab				f	644	0	0	-	-	-	-	-
+/etc/inittab				f	644	0	0	-	-	-	-	-
+
+# Setup entries for all of the /var/* directories that need proper
+# mount points
+/var/cache				d	755	0	0	-	-	-	-	-
+/var/lib/misc				d	755	0	0	-	-	-	-	-
+/var/lock				d	755	0	0	-	-	-	-	-
+/var/log				d	755	0	0	-	-	-	-	-
+/var/run				d	755	0	0	-	-	-	-	-
+/var/spool				d	755	0	0	-	-	-	-	-
+/var/tmp				d	755	0	0	-	-	-	-	-
diff --git a/board/common_selinux/post_build.sh b/board/common_selinux/post_build.sh
new file mode 100755
index 0000000000..3509de9135
--- /dev/null
+++ b/board/common_selinux/post_build.sh
@@ -0,0 +1,30 @@
+#!/bin/bash
+################################################################################
+#
+# DESCRIPTION:
+#     This script will do any "post-build" steps (after all packages are built
+#     but before image creation). Any filesystem permission issues should be
+#     fixed in this script.
+#
+#     The script requires following variables to be passed into it.
+#        $1 - the target directory (passed in by default by buildroot if
+#             script is BR2_ROOTFS_POST_BUILD_SCRIPT)
+#
+################################################################################
+
+DEST_DIR=$1
+
+# For SELinux targets, the /var directory symlinks need to be removed
+# and replaced with actual folders. The removal is done here and the
+# recreation is done in the permissions file for the common_selinux
+# local_skeleton
+for link in ${DEST_DIR}/var/{cache,lock,log,run,spool,tmp} ${DEST_DIR}/var/lib/misc; do
+	if [ -h ${link} ]; then
+		echo "Removing symlink ${link}"
+		unlink ${link}
+	fi
+done
+
+# Replace the /run folder with a symlink to /var/run
+rm -rf ${DEST_DIR}/run
+ln -sf -t ${DEST_DIR} run var/run
-- 
2.13.2
