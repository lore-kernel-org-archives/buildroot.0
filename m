From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 15 Feb 2013 22:45:57 +0200
Subject: [Buildroot] [PATCH] new package: mlocate
Message-ID: <1360961157-1056-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mlocate

Merging locate is an utility to index and quickly search for files.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                 |    1 +
 package/mlocate/Config.in         |   14 ++++++++++
 package/mlocate/mlocate-cron.conf |    9 +++++++
 package/mlocate/mlocate.cron-r2   |   48 +++++++++++++++++++++++++++++++++++++
 package/mlocate/mlocate.mk        |   42 ++++++++++++++++++++++++++++++++
 package/mlocate/updatedb.conf     |   17 +++++++++++++
 6 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 package/mlocate/Config.in
 create mode 100644 package/mlocate/mlocate-cron.conf
 create mode 100644 package/mlocate/mlocate.cron-r2
 create mode 100644 package/mlocate/mlocate.mk
 create mode 100644 package/mlocate/updatedb.conf

diff --git a/package/Config.in b/package/Config.in
index ec282b9..b242318 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -782,6 +782,7 @@ source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
+source "package/mlocate/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
diff --git a/package/mlocate/Config.in b/package/mlocate/Config.in
new file mode 100644
index 0000000..6ec8162
--- /dev/null
+++ b/package/mlocate/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MLOCATE
+	bool "mlocate"
+	help
+	  mlocate is a locate/updatedb implementation. The 'm' stands for
+	  'merging': updatedb reuses the existing database to avoid
+	  rereading most of the file system, which makes updatedb
+	  faster and does not trash the system caches as much.
+
+	  The mlocate utility is intended to be completely compatible to
+	  slocate (Security Enhanced version of the GNU locate). 
+	  It also attempts to be compatible to GNU locate, when it does 
+	  not conflict with slocate compatibility.
+
+	  https://fedorahosted.org/mlocate
diff --git a/package/mlocate/mlocate-cron.conf b/package/mlocate/mlocate-cron.conf
new file mode 100644
index 0000000..f207344
--- /dev/null
+++ b/package/mlocate/mlocate-cron.conf
@@ -0,0 +1,9 @@
+# nice value to run at: see -n in nice(1)
+NICE="19"
+
+# ionice class to run at: see -c in ionice(1)
+# you have to install sys-apps/util-linux manually
+IONICE_CLASS="2"
+
+# ionice priority to run at: see -n in ionice(1)
+IONICE_PRIORITY="7"
diff --git a/package/mlocate/mlocate.cron-r2 b/package/mlocate/mlocate.cron-r2
new file mode 100644
index 0000000..51cb504
--- /dev/null
+++ b/package/mlocate/mlocate.cron-r2
@@ -0,0 +1,48 @@
+#! /bin/sh
+set -e
+
+# check if we run on battery and if so then don't run
+if which on_ac_power >/dev/null 2>&1; then
+	ON_BATTERY=0
+	on_ac_power >/dev/null 2>&1 || ON_BATTERY=$?
+	if [ "${ON_BATTERY}" -eq 1 ]; then
+			exit 0
+	fi
+fi
+
+# check if we are already running (lockfile)
+LOCKFILE="/var/lock/mlocate.daily.lock"
+if [ -e "${LOCKFILE}" ]; then
+	echo >&2 "Warning: \"${LOCKFILE}\" already present, not running updatedb."
+	exit 1
+fi
+touch "${LOCKFILE}"
+# trap the lockfile only if we really run the updatedb
+trap "rm -f ${LOCKFILE}" EXIT
+
+# source the user specified variables
+if [ -f /etc/mlocate-cron.conf ]; then
+	. /etc/mlocate-cron.conf
+fi
+
+# check the config file
+NODEVS=""
+if [ ! -f /etc/updatedb.conf ]; then
+	NODEVS=$(< /proc/filesystems awk '$1 == "nodev" && $2 != "rootfs" { print $2 }')
+fi
+
+# alter the priority of the updatedb process
+if [ -x /usr/bin/renice ]; then
+	/usr/bin/renice +${NICE:-19} -p $$ > /dev/null 2>&1
+fi
+if [ -x /usr/bin/ionice ] && /usr/bin/ionice -c3 true 2>/dev/null; then
+	/usr/bin/ionice -c${IONICE_CLASS:-2} -n${IONICE_PRIORITY:-7} -p $$ > /dev/null 2>&1
+fi
+
+# run the updatedb if possible
+if [ -x /usr/bin/updatedb ]; then
+	/usr/bin/updatedb -f "${NODEVS}"
+else
+	echo >&2 "Warning: \"/usr/bin/updatedb\" is not executable, unable to run updatedb."
+	exit 0
+fi
diff --git a/package/mlocate/mlocate.mk b/package/mlocate/mlocate.mk
new file mode 100644
index 0000000..cdf14a1
--- /dev/null
+++ b/package/mlocate/mlocate.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# mlocate
+#
+#############################################################
+
+MLOCATE_VERSION = 0.26
+MLOCATE_SOURCE = mlocate-$(MLOCATE_VERSION).tar.xz
+MLOCATE_SITE = https://fedorahosted.org/releases/m/l/mlocate
+MLOCATE_DEPENDENCIES = xz-utils
+MLOCATE_CONF_OPT += --disable-rpath --localstatedir=/var/lib
+
+# For uClibc. MLOCATE_CFLAGS does not work. Why?
+MLOCATE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dmbstate_t=__mbstate_t"
+
+define	MLOCATE_POST_INSTALL_FIXUP
+	$(INSTALL) -m 0644 -D updatedb.conf $(TARGET_DIR)/etc/updatedb.conf
+
+	# Cron stuff
+	$(INSTALL) -m 0644 -D mlocate-cron.conf $(TARGET_DIR)/etc/mlocate-cron.conf
+	$(INSTALL) -m 0755 -D mlocate.cron-r2 $(TARGET_DIR)/etc/cron.daily/mlocate
+
+	# This is what Gentoo folks do. We can't yet use
+	# chown because buildroot does not yet have
+	# capability to automatically to create 
+	# users & groups. So for now you have to
+	# create group mlocate manually inside your
+	# extracted, chrooted target rootfs and do the
+	# chown things yourself
+
+	# chown :mlocate $(TARGET_DIR)/usr/bin/locate
+	chmod 2711 $(TARGET_DIR)/usr/bin/locate
+
+	# chown -R :mlocate $(TARGET_DIR)/var/lib/mlocate
+	chmod 0750 $(TARGET_DIR)/var/lib/mlocate
+
+endef
+
+MLOCATE_POST_INSTALL_TARGET_HOOKS += MLOCATE_POST_INSTALL_FIXUP
+
+$(eval $(autotools-package))
+
diff --git a/package/mlocate/updatedb.conf b/package/mlocate/updatedb.conf
new file mode 100644
index 0000000..09f5db4
--- /dev/null
+++ b/package/mlocate/updatedb.conf
@@ -0,0 +1,17 @@
+# /etc/updatedb.conf: config file for slocate
+# $Id: updatedb.conf,v 1.5 2011/01/24 12:39:33 scarabeus Exp $
+
+# This file sets variables that are used by updatedb.
+# For more info, see the updatedb.conf(5) manpage.
+
+# Filesystems that are pruned from updatedb database
+PRUNEFS="afs anon_inodefs auto autofs bdev binfmt binfmt_misc cgroup cifs coda configfs cramfs cpuset debugfs devpts devtmps devfs devpts ecryptfs eventpollfs exofs futexfs ftpfs fuse fusectl gfs gfs2 hostfs hugetlbfs inotifyfs iso9660 jffs2 lustre misc mqueue ncpfs nfs NFS nfs4 nfsd nnpfs ocfs ocfs2 pipefs proc ramfs rpc_pipefs securityfs selinuxfs sfs shfs smbfs sockfs spufs sshfs subfs supermount sysfs tmpfs ubifs udf usbfs vboxsf vperfctrfs"
+
+# Paths which are pruned from updatedb database
+PRUNEPATHS="/tmp /var/tmp /var/cache /var/lock /var/run /var/spool"
+
+# Folder names that are pruned from updatedb database
+PRUNENAMES=".git .hg .svn CVS"
+
+# Skip bind mounts.
+PRUNE_BIND_MOUNTS="yes"
-- 
1.7.7.6
