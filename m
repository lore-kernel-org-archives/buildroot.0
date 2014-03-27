From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 27 Mar 2014 17:19:36 +0100
Subject: [Buildroot] [PATCH 1/1] system: add ability to pass additional
	users tables.
In-Reply-To: <1395937176-7585-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1395937176-7585-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1395937176-7585-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new entry has been added to the "System Configuration" menu to allow
the user to set the location of additional user tables (besides the ones
defined in packages).

A user table is a text file, formatted using the mkusers syntax, which
describes the users on the target system, with their UID/GID, home
directory, password, etc.

The target root file system will be populated according the content of
these files.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 fs/common.mk     |    6 +++++-
 system/Config.in |    9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index d95c26b..6f37bd0 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -33,6 +33,7 @@ FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
        $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+ROOTFS_USERS_TABLE = $(call qstrip,$(BR2_ROOTFS_USERS_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -78,7 +79,10 @@ endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
+ifneq ($$(ROOTFS_USERS_TABLE),)
+	cat $$(ROOTFS_USERS_TABLE) > $(USERS_TABLE)
+endif
+	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
 	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
diff --git a/system/Config.in b/system/Config.in
index e8f1ed6..b7052f5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -280,6 +280,15 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_USERS_TABLE
+	string "Path to the users tables"
+	help
+	  Specify a space-separated list of users table locations,
+	  that will be passed to the mkusers utility to create
+	  users on the system, with home directory, password, etc.
+
+	  See manual for details on the usage and syntax of these files.
+
 config BR2_ROOTFS_OVERLAY
 	string "Root filesystem overlay directories"
 	default ""
-- 
1.7.9.5
