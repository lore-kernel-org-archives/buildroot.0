From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Fri, 12 Feb 2016 19:50:42 +0530
Subject: [Buildroot] [PATCH v2 1/1] cgroupsfs: new package
Message-ID: <1455286842-11540-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

This package consists of scripts that setup cgroups at boot
without doing any cgroup management or classification of
tasks into cgroups

Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
---
Changes v1 -> v2:
  - Changed navigation options in Config.in ( suggested by Arnout).
  - Removed CGROUPFS_INSTALL_TARGET and cgroupfs-mount.upstart from cgroupfs.mk file as it was
    not required.
  - Added S30cgroupfs startup script which gets installed to /etc/init.d
  - Added details of version,copyright and licence file.

---
 package/Config.in            |  1 +
 package/cgroupfs/Config.in   | 19 +++++++++++++++++
 package/cgroupfs/S30cgroupfs | 50 ++++++++++++++++++++++++++++++++++++++++++++
 package/cgroupfs/cgroupfs.mk | 22 +++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/cgroupfs/Config.in
 create mode 100644 package/cgroupfs/S30cgroupfs
 create mode 100644 package/cgroupfs/cgroupfs.mk

diff --git a/package/Config.in b/package/Config.in
index a5b31aa..452fd0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1571,6 +1571,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 endif
+	source "package/cgroupfs/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/cgroupfs/Config.in b/package/cgroupfs/Config.in
new file mode 100644
index 0000000..e0b685c
--- /dev/null
+++ b/package/cgroupfs/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CGROUPFS
+	bool "cgroupfs"
+	depends on !BR2_INIT_SYSTEMD
+	help
+	  cgroupfs mount and umount scripts.
+
+	  requires a Linux kernel >= 3.0 with the following options
+	  enabled:
+
+	  - CONFIG_BLK_CGROUP
+	  - CONFIG_CGROUPS
+	  - CONFIG_CGROUP_CPUACCT
+	  - CONFIG_CGROUP_DEVICE
+	  - CONFIG_CGROUP_FREEZER
+	  - CONFIG_CGROUP_WRITEBACK
+	  - CONFIG_CGROUP_SCHED
+	  - CONFIG_CGROUP_PIDS
+
+	  https://github.com/tianon/cgroupfs-mount
diff --git a/package/cgroupfs/S30cgroupfs b/package/cgroupfs/S30cgroupfs
new file mode 100644
index 0000000..86819de
--- /dev/null
+++ b/package/cgroupfs/S30cgroupfs
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+# cgroupfs:   Set up cgroupfs mounts.
+#
+# description:  Control groups are a kernel mechanism for tracking and imposing
+#  		limits on resource usage on groups of tasks.
+#
+#
+
+RETVAL=0
+case "$1" in
+	start)
+		test -x /usr/bin/cgroupfs-mount || exit 0
+		echo "Mounting cgroupfs hierarchy"
+		/usr/bin/cgroupfs-mount
+		RETVAL=$?
+		;;
+
+	stop)
+		test -x /usr/bin/cgroupfs-umount || exit 0
+		echo "Unmounting cgroupfs hierarchy"
+		/usr/bin/cgroupfs-umount
+		RETVAL=$?
+		;;
+
+	restart|force-reload)
+		if mountpoint -q /sys/fs/cgroup; then
+			$0 stop
+		fi
+		exec $0 start
+		;;
+
+	status)
+		if mountpoint -q /sys/fs/cgroup; then
+			# TODO decide whether to detect "partial mounted" status (ie, whether all available subsystems are mounted correctly)
+			echo "cgroupfs hierarchy is mounted"
+			exit 0
+		else
+			echo "cgroupfs hierarchy is not mounted"
+			exit 1
+		fi
+		;;
+
+	*)
+		echo "Usage: $0 {start|stop|restart|status}"
+		exit 1
+		;;
+esac
+
+exit $RETVAL
diff --git a/package/cgroupfs/cgroupfs.mk b/package/cgroupfs/cgroupfs.mk
new file mode 100644
index 0000000..8d178ff
--- /dev/null
+++ b/package/cgroupfs/cgroupfs.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# cgroupfs
+#
+#############################################################
+CGROUPFS_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
+CGROUPFS_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_VERSION))
+CGROUPFS_LICENSE = GPL-3+
+CGROUPFS_LICENSE_FILES = COPYRIGHT
+
+define CGROUPFS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
+endef
+
+define CGROUPFS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/cgroupfs/S30cgroupfs \
+		$(TARGET_DIR)/etc/init.d/S30cgroupfs
+
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
