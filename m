From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:53:50 +0100
Subject: [Buildroot] [git commit] cgroupfs-mount: new package
Message-ID: <20160320225414.4237980789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e1547a87cfd51e4fedf1cb7837f77e4f66c4052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package consists of scripts that setup cgroups at boot without
doing any cgroup management or classification of tasks into cgroups

Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
[Thomas:
 - rename to cgroupfs-mount to match upstream
 - add proper hash, since hashes should be added for github sourced
   packages
 - fix minor typos in the init script
 - fix the license file information.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/cgroupfs-mount/Config.in           | 19 +++++++++++++++++
 package/cgroupfs-mount/S30cgroupfs         | 34 ++++++++++++++++++++++++++++++
 package/cgroupfs-mount/cgroupfs-mount.hash |  2 ++
 package/cgroupfs-mount/cgroupfs-mount.mk   | 23 ++++++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6a8079c..27db639 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1608,6 +1608,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 endif
+	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/cgroupfs-mount/Config.in b/package/cgroupfs-mount/Config.in
new file mode 100644
index 0000000..0b2e4ba
--- /dev/null
+++ b/package/cgroupfs-mount/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CGROUPFS_MOUNT
+	bool "cgroupfs-mount"
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
diff --git a/package/cgroupfs-mount/S30cgroupfs b/package/cgroupfs-mount/S30cgroupfs
new file mode 100644
index 0000000..aa0a29b
--- /dev/null
+++ b/package/cgroupfs-mount/S30cgroupfs
@@ -0,0 +1,34 @@
+#!/bin/sh
+#
+# Set up cgroupfs mounts.
+#
+
+start() {
+	printf "Mounting cgroupfs hierarchy: "
+	/usr/bin/cgroupfs-mount
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Unmounting cgroupfs hierarchy: "
+	/usr/bin/cgroupfs-umount
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+      start
+	;;
+  stop)
+      stop
+	;;
+  restart|reload)
+      restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/cgroupfs-mount/cgroupfs-mount.hash b/package/cgroupfs-mount/cgroupfs-mount.hash
new file mode 100644
index 0000000..34f5167
--- /dev/null
+++ b/package/cgroupfs-mount/cgroupfs-mount.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	  fb32a8d9de491358d28f56ab76a56e1a611b90d5b6326910d3a69395fa539027	cgroupfs-mount-7285bf44402029394808339f69f4f293730fc2c6.tar.gz
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
new file mode 100644
index 0000000..b375605
--- /dev/null
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cgroupfs-mount
+#
+################################################################################
+
+CGROUPFS_MOUNT_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
+CGROUPFS_MOUNT_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_MOUNT_VERSION))
+CGROUPFS_MOUNT_LICENSE = GPLv3+
+CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
+
+define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
+endef
+
+define CGROUPFS_MOUNT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(CGROUPFS_MOUNT_PKGDIR)/S30cgroupfs \
+		$(TARGET_DIR)/etc/init.d/S30cgroupfs
+
+endef
+
+$(eval $(generic-package))
