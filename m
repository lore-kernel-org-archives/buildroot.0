From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 28 Oct 2015 17:36:26 -0400
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: prevent undesired cleanup with a
	usr merged target
Message-ID: <1446068186-13524-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following commit prevents the e2fsprogs package from inadvertently
removing its own binaries when a target includes BusyBox and is
targeting a usr-merged environment.

While an action has been added to cleanup BusyBox-provided (if any)
ext2-related tools when including e2fsprogs, the action will delete
desired e2fsprogs binaries in an already prepared usr-merged target.
Adjusting the cleanup to occur before installing e2fsprogs binaries so
that if a usr-merged target exists, it will first delete the previous
binaries (if any) followed by installing new binaries.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/e2fsprogs/e2fsprogs.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 178372b..4b81b44 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -106,9 +106,16 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
 endif
 
-# Remove busybox tune2fs and e2label, since we want the e2fsprogs full
-# blown variants to take precedence, but they are not installed in the
-# same location.
+# If BusyBox is included, its configuration may supply its own variant
+# of ext2-related tools. Since Buildroot desires having full blown
+# variants take precedence (in this case, e2fsprogs), we want to remove
+# BusyBox's variant of e2fsprogs provided binaries. e2fsprogs targets
+# /usr/{bin,sbin} where BusyBox targets /{bin,sbin}. We will attempt to
+# remove BusyBox-generated ext2-related tools from /{bin,sbin}. We need
+# to do this in the pre-install stage to ensure we do not accidentally
+# remove e2fsprogs's binaries in usr-merged environments (ie. if they
+# are removed, they would be re-installed in this package's install
+# stage).
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 E2FSPROGS_DEPENDENCIES += busybox
 
@@ -119,7 +126,7 @@ define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
 	$(RM) -f $(TARGET_DIR)/sbin/e2label
 endef
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
+E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 endif
 
 define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
-- 
1.9.5.msysgit.1
