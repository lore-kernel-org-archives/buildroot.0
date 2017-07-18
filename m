From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 19:25:29 +0200
Subject: [Buildroot] [PATCH 03/20] package/skeleton: add macro to rsync
	skeleton directory
In-Reply-To: <cover.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rsync command is currently called from a single location. In
follow-up patches, it will be called from various places then.

It will be easier to update and fix this command if it is defined in a
single location, rather than if duplicated in many places.

Define a macro that skeleton packages can call to install their skeleton
directories. Since at least one occurence of it will want to install in
staging, the macro must accept a destination path, rather than hard-code
target as the destination.

Since it is to be used by other skeleton packages, define it early,
outside of any conditional block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
---
 package/skeleton/skeleton.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 9b7407a236..017479a990 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,6 +14,18 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_INSTALL_STAGING = YES
 
+############
+# Macros available for use by any skeleton package:
+# - SKELETON_RSYNC
+
+# This function rsyncs the skeleton directory in $(1) to the destination
+# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+define SKELETON_RSYNC
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		$(1)/ $(2)/
+endef
+
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
@@ -89,9 +101,7 @@ SKELETON_LIB_SYMLINK = lib32
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
2.11.0
