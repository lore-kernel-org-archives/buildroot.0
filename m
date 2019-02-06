From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:03:30 +0100
Subject: [Buildroot] [git commit] skeleton-custom: use a script to check
 merged usr structure
Message-ID: <20190206160819.7311D821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf2a308578bddf7cbc5d9273bcec50f063e82da2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce support/scripts/check-merged-usr.sh, a script that check if a
given path complies to the merged /usr requirements:

    /
    /bin -> usr/bin
    /lib -> usr/lib
    /sbin -> usr/sbin
    /usr/bin/
    /usr/lib/
    /usr/sbin/

Use this script in skeleton-custom.mk instead of a bunch of variables
filled by $(shell ...) macros. The same script will be used to check
rootfs overlays, in a forthcoming change.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton-custom/skeleton-custom.mk | 26 ++------------------
 support/scripts/check-merged-usr.sh        | 39 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 8c57531782..6301bc1b91 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -23,33 +23,11 @@ $(error No path specified for the custom skeleton)
 endif
 endif
 
-# Extract the inode numbers for all of those directories. In case any is
-# a symlink, we want to get the inode of the pointed-to directory, so we
-# append '/.' to be sure we get the target directory. Since the symlinks
-# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# all of them.
-#
-SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/. 2>/dev/null)
-SKELETON_CUSTOM_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/bin/. 2>/dev/null)
-SKELETON_CUSTOM_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/sbin/. 2>/dev/null)
-SKELETON_CUSTOM_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/lib/. 2>/dev/null)
-SKELETON_CUSTOM_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/bin/. 2>/dev/null)
-SKELETON_CUSTOM_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/usr/sbin/. 2>/dev/null)
-
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
-ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /lib
-endif
-ifneq ($(SKELETON_CUSTOM_BIN_INODE),$(SKELETON_CUSTOM_USR_BIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /bin
-endif
-ifneq ($(SKELETON_CUSTOM_SBIN_INODE),$(SKELETON_CUSTOM_USR_SBIN_INODE))
-SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /sbin
-endif
-
+SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
+	$(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))
 endif # merged /usr
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
new file mode 100755
index 0000000000..433857cd8c
--- /dev/null
+++ b/support/scripts/check-merged-usr.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# Check if a given custom skeleton or overlay complies to the merged /usr
+# requirements:
+# /
+# /bin -> usr/bin
+# /lib -> usr/lib
+# /sbin -> usr/sbin
+# /usr/bin/
+# /usr/lib/
+# /usr/sbin/
+#
+# Output: the list of non-compliant paths (empty if compliant).
+#
+
+# Extract the inode numbers for all of those directories. In case any is
+# a symlink, we want to get the inode of the pointed-to directory, so we
+# append '/.' to be sure we get the target directory. Since the symlinks
+# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
+# all of them.
+#
+lib_inode=$(stat -c '%i' "${1}/lib/." 2>/dev/null)
+bin_inode=$(stat -c '%i' "${1}/bin/." 2>/dev/null)
+sbin_inode=$(stat -c '%i' "${1}/sbin/." 2>/dev/null)
+usr_lib_inode=$(stat -c '%i' "${1}/usr/lib/." 2>/dev/null)
+usr_bin_inode=$(stat -c '%i' "${1}/usr/bin/." 2>/dev/null)
+usr_sbin_inode=$(stat -c '%i' "${1}/usr/sbin/." 2>/dev/null)
+
+not_merged_dirs=""
+test -z "$lib_inode" || \
+	test "$lib_inode" = "$usr_lib_inode" || \
+		not_merged_dirs="/lib"
+test -z "$bin_inode" || \
+	test "$bin_inode" = "$usr_bin_inode" || \
+		not_merged_dirs="$not_merged_dirs /bin"
+test -z "$sbin_inode" || \
+	test "$sbin_inode" = "$usr_sbin_inode" || \
+		not_merged_dirs="$not_merged_dirs /sbin"
+echo "${not_merged_dirs# }"
