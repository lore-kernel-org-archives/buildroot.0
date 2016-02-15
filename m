From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Mon, 15 Feb 2016 20:10:03 +0530
Subject: [Buildroot] [Buildroot PATCH v3 1/1] cgroupsfs: new package
Message-ID: <1455547203-24097-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package consists of scripts that setup cgroups at boot
without doing any cgroup management or classification of
tasks into cgroups

Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
---
Changes v2 -> v3:
  - placed start(),stop() and restart() in seperate functions.
  - Changed LICENSE to GPLv3+ and added $(CGROUPFS_PKGDIR)
    instead of package/cgroupfs/ .
  - Added .hash file.
  - Removed test condition for mount and umount (suggested by Thomas).

Changes v1 -> v2:
  - Changed navigation options in Config.in ( suggested by Arnout).
  - Removed CGROUPFS_INSTALL_TARGET and cgroupfs-mount.upstart from cgroupfs.mk file as it was
    not required.
  - Added S30cgroupfs startup script which gets installed to /etc/init.d
  - Added details of version,copyright and licence file.


---
 package/Config.in              |  1 +
 package/cgroupfs/Config.in     | 19 +++++++++++++++++++
 package/cgroupfs/S30cgroupfs   | 36 ++++++++++++++++++++++++++++++++++++
 package/cgroupfs/cgroupfs.hash |  2 ++
 package/cgroupfs/cgroupfs.mk   | 23 +++++++++++++++++++++++
 5 files changed, 81 insertions(+)
 create mode 100644 package/cgroupfs/Config.in
 create mode 100644 package/cgroupfs/S30cgroupfs
 create mode 100644 package/cgroupfs/cgroupfs.hash
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
index 0000000..627da2c
--- /dev/null
+++ b/package/cgroupfs/S30cgroupfs
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Set up cgroupfs mounts.
+#
+
+start() {
+	printf "Mounting cgroupfs hierarchy"
+	/usr/bin/cgroupfs-mount
+	[ $? = 0 ] && echo "OK" || echo "FAIL"	
+}
+stop() {
+	printf "Unmounting cgroupfs hierarchy"
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
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart|reload)
+  	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/cgroupfs/cgroupfs.hash b/package/cgroupfs/cgroupfs.hash
new file mode 100644
index 0000000..e127e1b
--- /dev/null
+++ b/package/cgroupfs/cgroupfs.hash
@@ -0,0 +1,2 @@
+# No hash for 7285bf44402029394808339f69f4f293730fc2c6
+none	xxx  cgroupfs-7285bf44402029394808339f69f4f293730fc2c6.tar.gz
diff --git a/package/cgroupfs/cgroupfs.mk b/package/cgroupfs/cgroupfs.mk
new file mode 100644
index 0000000..c7ea616
--- /dev/null
+++ b/package/cgroupfs/cgroupfs.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cgroupfs
+#
+################################################################################
+
+CGROUPFS_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
+CGROUPFS_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_VERSION))
+CGROUPFS_LICENSE = GPLv3+
+CGROUPFS_LICENSE_FILES = COPYRIGHT
+
+define CGROUPFS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
+	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
+endef
+
+define CGROUPFS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(CGROUPFS_PKGDIR)S30cgroupfs \
+		$(TARGET_DIR)/etc/init.d/S30cgroupfs
+
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
