From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 10 Feb 2016 20:32:36 +0530
Subject: [Buildroot] [PATCH 1/1] cgroupsfs: new package
Message-ID: <1455116556-3449-1-git-send-email-niranjan.reddy@rockwellcollins.com>
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
 package/Config.in            |  1 +
 package/cgroupfs/Config.in   |  6 ++++++
 package/cgroupfs/cgroupfs.mk | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/cgroupfs/Config.in
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
index 0000000..f83432e
--- /dev/null
+++ b/package/cgroupfs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CGROUPFS
+	bool "cgroupfs"
+	help
+	  cgroupfs mount and umount scripts.
+
+	  https://github.com/tianon/cgroupfs-mount/blob/master/README.md
diff --git a/package/cgroupfs/cgroupfs.mk b/package/cgroupfs/cgroupfs.mk
new file mode 100644
index 0000000..06d430a
--- /dev/null
+++ b/package/cgroupfs/cgroupfs.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# cgroupfs
+#
+#############################################################
+CGROUPFS_VERSION = 1.0
+CGROUPFS_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_VERSION))
+CGROUPFS_INSTALL_TARGET = YES
+
+define CGROUPFS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
+	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
+	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/debian/cgroupfs-mount.init $(TARGET_DIR)/etc/init.d/cgroupfs-mount.init
+	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/debian/cgroupfs-mount.upstart $(TARGET_DIR)/etc/init.d/cgroupfs-mount.upstart
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
