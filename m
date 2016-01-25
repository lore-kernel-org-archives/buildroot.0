From: Cam Hutchison <camh@xdna.net>
Date: Tue, 26 Jan 2016 10:18:26 +1100
Subject: [Buildroot] [PATCH 1/1] overlay: Allow overlay to be a tar archive.
Message-ID: <1453763906-22220-1-git-send-email-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installing an overlay, check if the source is a directory. If it is,
continue to use rsync to install it to the target. If it is not a
directory, assume it is an archive extractable by GNU tar(1) and use
that to install it to the target.

This allows an overlay specified with BR2_ROOTFS_OVERLAY to be a tar
archive instead of a directory, which is useful when an external build
process produces rootfs archives and not directories.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 Makefile         | 14 +++++++++-----
 system/Config.in | 14 ++++++++------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 17c181b..803be0c 100644
--- a/Makefile
+++ b/Makefile
@@ -653,11 +653,15 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
-	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
-			$(d)/ $(TARGET_DIR)$(sep))
+	@$(foreach overlay, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		$(call MESSAGE,"Copying overlay $(overlay)"); \
+		if test -d $(overlay); then \
+			rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+				--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+				$(overlay)/ $(TARGET_DIR); \
+		else \
+			tar -a -x -C $(TARGET_DIR) -f $(overlay); \
+		fi$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
diff --git a/system/Config.in b/system/Config.in
index 2e14971..ef65d98 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -419,15 +419,17 @@ config BR2_ROOTFS_USERS_TABLES
 	  See manual for details on the usage and syntax of these files.
 
 config BR2_ROOTFS_OVERLAY
-	string "Root filesystem overlay directories"
+	string "Root filesystem overlay directories or archives"
 	default ""
 	help
-	  Specify a list of directories that are copied over the target
-	  root filesystem after the build has finished and before it is
-	  packed into the selected filesystem images.
+	  Specify a list of directories or archives that are copied over
+	  the target root filesystem after the build has finished and
+	  before it is packed into the selected filesystem images.
 
-	  They are copied as-is into the rootfs, excluding files ending with
-	  ~ and .git, .svn and .hg directories.
+	  Directories are copied as-is into the rootfs, excluding files ending
+	  with ~ and .git, .svn and .hg directories.
+
+	  Archives are extracted as-is into the rootfs with no modifications.
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom scripts to run before creating filesystem images"
-- 
2.1.4
