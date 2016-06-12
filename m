From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:18 +0200
Subject: [Buildroot] [PATCH 13/24] package/skeleton: add macro to rsync
	skeleton directory
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <174817d7ac2784b29de4f67f4f51ff7e16b76ccd.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rsync command is currently called from a single location. In
follow-up patches, it will be called from various places now.

It will be easier to update and fix this command if it is defined in a
single location, rather than if duplicated in many places.

Define a macro that skeleton packages can call to install their skeleton
directories. Since at least one occurence of it wants to install in
staging, the macro must accept a destination path, rather than hard-code
target as the destination.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton/skeleton.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 072d217..e3ae694 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -62,6 +62,14 @@ SKELETON_PATH = system/skeleton
 
 endif # ! custom skeleton
 
+# This function rsyncs the skeleton directory in $(1) to the destination
+# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+define SKELETON_RSYNC
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		$(1)/ $(2)/
+endef
+
 # This function handles the merged or non-merged /usr cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_USR_SYMLINKS_OR_DIRS
@@ -86,9 +94,7 @@ SKELETON_LIB_SYMLINK = lib32
 endif
 
 define SKELETON_INSTALL_TARGET_CMDS
-	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
-		$(SKELETON_PATH)/ $(TARGET_DIR)/
+	$(call SKELETON_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
 	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
-- 
2.7.4
