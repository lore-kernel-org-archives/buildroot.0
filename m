From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 22:02:26 +0100
Subject: [Buildroot] [git commit] e2fsprogs: remove findfs option
Message-ID: <20160214210631.7CA2D801D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ead1df4287b0037bc21810af1f0939cdbb95f3ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The e2fsprogs package's findfs option provides no capabilities. When the
option is selected, a symbolic link is generated from findfs to e2label;
however, e2label will not handle findfs since the respective code is
explicitly disabled when `--disable-libblkid` is passed in. At this
time, the e2fsprogs package only supports findfs capabilities when
building its "private blkid library".

Note that the `--disable-libblkid` configuration argument must remain
to prevent conflicts with util-linux's libblkid and an e2fsprogs-
generated variant (see e1ffc2f791b336339909c90559b7db40b455f172).

Since e2fsprogs cannot provide findfs capabilities, the option is being
removed in this change. A following change will be introduced to include
util-linux's findfs utility.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Cc: Zheng Yi <yzheng@techyauld.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy               | 9 +++++++++
 package/e2fsprogs/Config.in    | 5 -----
 package/e2fsprogs/e2fsprogs.mk | 9 ---------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3677f86..2fda9f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_E2FSPROGS_FINDFS
+	bool "e2fsprogs findfs option has been removed"
+	select BR2_LEGACY
+	help
+	  This option attempted to enable findfs capabilities from
+	  e2fsprogs but has not worked since July 2015 (due to
+	  packaging changes). One can use BusyBox's findfs support or
+	  enable the BR2_PACKAGE_UTIL_LINUX_FINDFS option.
+
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
 	select BR2_LEGACY
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ad33983..ac3eae7 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -59,11 +59,6 @@ config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
 	default y
 
-config BR2_PACKAGE_E2FSPROGS_FINDFS
-	bool "findfs"
-	default y
-	select BR2_PACKAGE_E2FSPROGS_E2LABEL
-
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 4b81b44..3de4cd4 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -74,7 +74,6 @@ E2FSPROGS_TXTTARGETS_ = \
 	usr/sbin/mkfs.ext4dev \
 	usr/sbin/fsck.ext[234] \
 	usr/sbin/fsck.ext4dev \
-	usr/sbin/findfs \
 	usr/sbin/tune2fs
 
 define E2FSPROGS_TARGET_REMOVE_UNNEEDED
@@ -137,14 +136,6 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_TUNE2FS_SYMLINK
 endif
 
-define E2FSPROGS_TARGET_FINDFS_SYMLINK
-	ln -sf e2label $(TARGET_DIR)/usr/sbin/findfs
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
-endif
-
 # systemd really wants to have fsck in /sbin
 define E2FSPROGS_TARGET_FSCK_SYMLINK
 	ln -sf ../usr/sbin/fsck $(TARGET_DIR)/sbin/fsck
