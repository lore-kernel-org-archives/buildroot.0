From: Dagg Stompler <daggs@gmx.com>
Date: Fri,  2 Dec 2016 12:10:27 +0200
Subject: [Buildroot] [PATCH 1/2] first_boot_rootfs_resizer: New Package.
Message-ID: <20161202101028.26736-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this new package will resize the root fs to the max possible when
booting an image for the first time.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                                  |  1 +
 package/first_boot_rootfs_resizer/Config.in        | 17 +++++++++
 .../first_boot_rootfs_resizer.mk                   | 23 +++++++++++
 package/first_boot_rootfs_resizer/resize_fs.sh     | 44 ++++++++++++++++++++++
 package/first_boot_rootfs_resizer/resizing         | 11 ++++++
 5 files changed, 96 insertions(+)
 create mode 100644 package/first_boot_rootfs_resizer/Config.in
 create mode 100644 package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
 create mode 100644 package/first_boot_rootfs_resizer/resize_fs.sh
 create mode 100644 package/first_boot_rootfs_resizer/resizing

diff --git a/package/Config.in b/package/Config.in
index 9ed296f2d..ed414fd3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1408,6 +1408,7 @@ menu "Miscellaneous"
 	source "package/collectd/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/first_boot_rootfs_resizer/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/gr-osmosdr/Config.in"
diff --git a/package/first_boot_rootfs_resizer/Config.in b/package/first_boot_rootfs_resizer/Config.in
new file mode 100644
index 000000000..cce62dd39
--- /dev/null
+++ b/package/first_boot_rootfs_resizer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER
+	bool "first_boot_rootfs_resizer"
+	select BR2_PACKAGE_E2FSPROGS # for resizefs
+	select BR2_PACKAGE_E2FSPROGS_RESIZE2FS # for resizefs
+	depends on BR2_USE_WCHAR # util-linux
+
+	help
+	  installs a script that will resize the rootfs to the max possible consecutive size
+	  unused from the end of rootfs.
+
+config BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER_SYSV_PRIORITY
+	int "SystemV priority"
+	depends on BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER
+	default "0"
+
+	help
+	  set the script's priority (defualt is 00)
diff --git a/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
new file mode 100644
index 000000000..8752831ea
--- /dev/null
+++ b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# first_boot_rootfs_resizer
+#
+################################################################################
+
+FIRST_BOOT_ROOTFS_RESIZER_LICENSE = unclear
+
+FIRST_BOOT_ROOTFS_RESIZER_PRIO = $(shell printf "%02u" $(BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER_SYSV_PRIORITY))
+FIRST_BOOT_ROOTFS_RESIZER_DEPENDENCIES = e2fsprogs
+
+define FIRST_BOOT_ROOTFS_RESIZER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 package/first_boot_rootfs_resizer/resize_fs.sh \
+		$(TARGET_DIR)/usr/sbin/resize_fs.sh
+	touch $(TARGET_DIR)/.first_boot
+endef
+
+define FIRST_BOOT_ROOTFS_RESIZER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/first_boot_rootfs_resizer/resizing \
+		$(TARGET_DIR)/etc/init.d/S$(FIRST_BOOT_ROOTFS_RESIZER_PRIO)resizing
+endef
+
+$(eval $(generic-package))
diff --git a/package/first_boot_rootfs_resizer/resize_fs.sh b/package/first_boot_rootfs_resizer/resize_fs.sh
new file mode 100644
index 000000000..be41753d8
--- /dev/null
+++ b/package/first_boot_rootfs_resizer/resize_fs.sh
@@ -0,0 +1,44 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          resize_fs.sh
+# Required-Start:    $remote_fs $all
+# Required-Stop:
+# Default-Start:     2 3 4 5 S
+# Default-Stop:
+# Short-Description: First boot system setup
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+ROOT=$(cat /proc/cmdline | tr ' ' '\n' | grep root= | cut -f 2 -d =)
+DEV=$(echo ${ROOT} | sed 's/p[0-9]\+$//g')
+PART=$(basename ${ROOT})
+
+if [ ! -z "${ROOT}" ]; then
+	echo "unable to locate root= entry in cmdline, resizing aborted"
+	exit 1
+fi
+
+if [ -f /.first_boot ]; then
+	echo "Resizing fs, please wait... upon finish the system will be restarted"
+	# ok, its the very first boot, we need to resize the disk.
+	p2_start=`fdisk -l ${DEV} | grep ${PART} | awk '{print $2}'`
+	p2_finish=`fdisk -l ${DEV} | grep sectors | awk '{printf $5}'`
+
+	fdisk ${DEV} <<EOF
+p
+d
+2
+n
+p
+2
+$p2_start
+$p2_finish
+p
+w
+EOF
+	rm -fr /.first_boot
+	sync
+	reboot
+else
+	resize2fs ${ROOT} && rm -fr $0
+fi
diff --git a/package/first_boot_rootfs_resizer/resizing b/package/first_boot_rootfs_resizer/resizing
new file mode 100644
index 000000000..4a19ce40e
--- /dev/null
+++ b/package/first_boot_rootfs_resizer/resizing
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		if [ -f /usr/sbin/resize_fs.sh ]; then /usr/sbin/resize_fs.sh; fi
+		;;
+	*)
+		;;
+esac
+
+exit $?
-- 
2.11.0
