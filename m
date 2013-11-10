From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:10:58 +0100
Subject: [Buildroot] [git commit] infra: centralize rsync exclude list for
	VCS files
Message-ID: <20131110231541.822919BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ad286563e1883f2e17c0d67e055525e840c5420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot has three places where rsync is used:
1. to copy the target skeleton
2. to copy the rootfs overlay(s)
3. to copy overridden package sources

In all of these cases, we want to exclude version control files by default.
Place 1 and 2 used an identical set of explicit --exclude options, while
place 3 used the option --cvs-exclude. This last option, however, not only
excludes version control files, but also binary files (.o, .so) and any file
or directory named 'core' (a problem for the linux kernel that has several
directories with this name). Moreover, the exact list of excluded files when
using --cvs-exclude depends on the version of rsync.

This patch creates one global variable RSYNC_VCS_EXCLUSIONS that can be used
by the various rsync commands. It excludes the version control files of
svn, git, hg, cvs and bzr.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |   14 ++++++++------
 package/pkg-generic.mk |    2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index a006615..2f7db59 100644
--- a/Makefile
+++ b/Makefile
@@ -426,11 +426,14 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
 
+RSYNC_VCS_EXCLUSIONS = \
+	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
+	--exclude CVS
+
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	rsync -a \
-		--exclude .empty --exclude .svn --exclude .git \
-		--exclude .hg --exclude=CVS --exclude '*~' \
+	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
+		--exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -504,9 +507,8 @@ endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a \
-			--exclude .empty --exclude .svn --exclude .git \
-			--exclude .hg --exclude=CVS --exclude '*~' \
+		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
+			--exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f1835a1..80b38a5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -68,7 +68,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
