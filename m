From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:14:40 +0200
Subject: [Buildroot] [git commit] package/skeleton-custom: also check for
	missing directories
Message-ID: <20170802171031.709DB821EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf6d321e9d5c9dec63e42466fec4bf5de5853bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to checking the symlinks in the merged usr case, also check
whether /bin, /lib, /sbin and their /usr/... counterparts exist in the
non-merged case.

Missing directories are collected in the variable
SKELETON_CUSTOM_MISSING_DIRS. For symmetry and because it's more
logical, rename SKELETON_CUSTOM_NOT_MERGED_USR to
SKELETON_CUSTOM_NOT_MERGED_USR_DIRS.

When a directory is indeed missing, "stat" will print an error.
Buildroot *also* prints an error, which is clearer. So remove the error
from stat by redirecting it to /dev/null.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: split off in a separate patch + wrote commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton-custom/skeleton-custom.mk | 48 +++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index b514f80..df46b72 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -28,34 +28,60 @@ endif
 # can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
 # all of them.
 #
-SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/.)
-SKELETON_CUSTOM_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/bin/.)
-SKELETON_CUSTOM_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/sbin/.)
-SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/lib/.)
-SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/.)
-SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/.)
+SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/. 2>/dev/null)
+SKELETON_CUSTOM_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/bin/. 2>/dev/null)
+SKELETON_CUSTOM_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/sbin/. 2>/dev/null)
+SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/lib/. 2>/dev/null)
+SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/. 2>/dev/null)
+SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/. 2>/dev/null)
+
+# Ensure that the custom skeleton has /lib, /bin and /sbin, and their
+# /usr counterparts
+ifeq ($(SKELETON_CUSTOM_LIB_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /lib
+endif
+ifeq ($(SKELETON_CUSTOM_USR_LIB_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/lib
+endif
+ifeq ($(SKELETON_CUSTOM_BIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /bin
+endif
+ifeq ($(SKELETON_CUSTOM_USR_BIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/bin
+endif
+ifeq ($(SKELETON_CUSTOM_SBIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /sbin
+endif
+ifeq ($(SKELETON_CUSTOM_USR_SBIN_INODE),)
+SKELETON_CUSTOM_MISSING_DIRS += /usr/sbin
+endif
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 
 ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /lib
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /lib
 endif
 ifneq ($(SKELETON_CUSTOM_BIN_INODE),$(SKELETON_CUSTOM_USR_BIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /bin
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /bin
 endif
 ifneq ($(SKELETON_CUSTOM_SBIN_INODE),$(SKELETON_CUSTOM_USR_SBIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /sbin
 endif
 
 endif # merged /usr
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
-ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
+ifneq ($(SKELETON_CUSTOM_MISSING_DIRS),)
+$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is \
+	missing those directories or symlinks: \
+	$(SKELETON_CUSTOM_MISSING_DIRS))
+endif
+ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
 $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
 	using a merged /usr for the following directories: \
-	$(SKELETON_CUSTOM_NOT_MERGED_USR))
+	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
 endif
 endif
 
