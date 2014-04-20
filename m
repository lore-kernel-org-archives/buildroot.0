From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Apr 2014 19:33:09 +0200
Subject: [Buildroot] [PATCH] system: add ability to pass additional users
	tables.
Message-ID: <1398015189-21070-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

A new entry has been added to the "System Configuration" menu to allow
the user to set the location of additional user tables (besides the ones
defined in packages).

A user table is a text file, formatted using the mkusers syntax, which
describes the users on the target system, with their UID/GID, home
directory, password, etc.

The target root file system will be populated according the content of
these files.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[yann.morin.1998 at free.fr: use plural TABLES; we need to remove the
    intermediate users_table file, as it is no longer generated in
    one shot, in case a previous run failed and did not remove it]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - use the plural form in TABLES
  - remove intermediate file
---
 fs/common.mk     | 7 ++++++-
 system/Config.in | 9 +++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 080b8c6..831365e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -33,6 +33,7 @@ FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
        $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -68,6 +69,7 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
+	rm -f $(USERS_TABLE)
 	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
@@ -77,7 +79,10 @@ endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
+ifneq ($$(ROOTFS_USERS_TABLES),)
+	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+endif
+	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
 	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
diff --git a/system/Config.in b/system/Config.in
index d15c3aa..0b4f20a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -319,6 +319,15 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_USERS_TABLES
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
1.8.3.2
