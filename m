From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:26:01 +0200
Subject: [Buildroot] [git commit] Revert "package/skeleton-custom: also
	check for missing directories"
Message-ID: <20170809212029.58D8580407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aff2f7395843b338f3492b915e8e5cd8b25a43b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This partially reverts commit cf6d321e9d5c9dec63e42466fec4bf5de5853bd3.

The underlying reason for doing the checks is to ensure that a
merged-usr setting is properly enforced, even for custom skeletons.

Before that patch, a custom skeleton where both /bin and /usr/bin were
missing was accepted; but then the first package that intalled something
in /bin would create it as a directory, thus breaking the merged-usr
situation. Ditto sbin and lib, of course.

cf6d321 was created to detect that situation, and the fix was to require
that both directories do exist in the custom skeleton, so that we new
the check for consistency were OK, in all cases.

However, that broke existing skeletons which where missing both
directories, and some people are shinning about it...

The crux of the problem is that Buildroot should be responsible for
creating the directories or the symliks when they are missing, and only
fail if the existing ones are incorrect, but not impose the burden on
the user.

A situation where the problem arises is when a skeleton is shared
between various builds, some using a merged-usr while other do not.

We fix that by reverting the offending changes change, back to the
previous behaviour. We keep the stderr redirection in stat calls, and
the variable renaming.

A proper fix to create the missing directories can be added later.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton-custom/skeleton-custom.mk | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index d3c6b48..8c57531 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -36,27 +36,6 @@ SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr
 SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/. 2>/dev/null)
 SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/. 2>/dev/null)
 
-# Ensure that the custom skeleton has /lib, /bin and /sbin, and their
-# /usr counterparts
-ifeq ($(SKELETON_CUSTOM_LIB_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /lib
-endif
-ifeq ($(SKELETON_CUSTOM_USR_LIB_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /usr/lib
-endif
-ifeq ($(SKELETON_CUSTOM_BIN_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /bin
-endif
-ifeq ($(SKELETON_CUSTOM_USR_BIN_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /usr/bin
-endif
-ifeq ($(SKELETON_CUSTOM_SBIN_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /sbin
-endif
-ifeq ($(SKELETON_CUSTOM_USR_SBIN_INODE),)
-SKELETON_CUSTOM_MISSING_DIRS += /usr/sbin
-endif
-
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
@@ -74,11 +53,6 @@ endif
 endif # merged /usr
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
-ifneq ($(SKELETON_CUSTOM_MISSING_DIRS),)
-$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is \
-	missing those directories or symlinks: \
-	$(SKELETON_CUSTOM_MISSING_DIRS))
-endif
 ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
 $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
 	using a merged /usr for the following directories: \
