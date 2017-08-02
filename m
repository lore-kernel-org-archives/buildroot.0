From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:13:29 +0200
Subject: [Buildroot] [git commit] package/skeleton-custom: rework the
	merged_usr and building conditions
Message-ID: <20170802170920.8B1C5821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aebb0a729f583fd8d1adf321ee3cea4050c21997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

skeleton-custom.mk contains a huge condition for BR_BUILDING and for
BR2_ROOTFS_MERGED_USR. This makes the code difficult to follow, so
rework the condition a bit so that only the parts that really need to
be conditional are indeed conditional.

Note that there is no overhead in needlessly evaluation the "stat"
commands. Indeed, the assignments use late evaluation so the "stat"
is only executed when evaluating the condition - when skeleton-custom
is not selected, stat is never called.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: split off in a separate patch + wrote commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton-custom/skeleton-custom.mk | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 4aebe3f..b514f80 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -20,11 +20,8 @@ ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
 ifeq ($(SKELETON_CUSTOM_PATH),)
 $(error No path specified for the custom skeleton)
 endif
+endif
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
-# Ensure the user has prepared a merged /usr.
-#
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
 # append '/.' to be sure we get the target directory. Since the symlinks
@@ -38,6 +35,10 @@ SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr
 SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/.)
 SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/.)
 
+# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
+# counterparts are appropriately setup as symlinks ones to the others.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
 ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
 SKELETON_CUSTOM_NOT_MERGED_USR += /lib
 endif
@@ -48,14 +49,15 @@ ifneq ($(SKELETON_CUSTOM_SBIN_INODE),$(SKELETON_CUSTOM_USR_SBIN_INODE))
 SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
 endif
 
+endif # merged /usr
+
+ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
 ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
 $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
 	using a merged /usr for the following directories: \
 	$(SKELETON_CUSTOM_NOT_MERGED_USR))
 endif
-
-endif # merged /usr
-endif # ! building
+endif
 
 define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
