From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:49:14 +0100
Subject: [Buildroot] [git commit] skeleton: move LIB_SYMLINK definition from
	Makefile
Message-ID: <20160120205455.61286827EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50a93866f0851a9cd06feb95c556f007bc578af1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7a6b83a211612ff95a1f5d35b2861ad5655ac8b1 introduced the skeleton
package, which took over the lib32/lib64 -> lib symlink creation from the
main Makefile.
However, the definition of the LIB_SYMLINK variable did not move along, for
no real reason.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |  8 --------
 package/skeleton/skeleton.mk | 16 ++++++++++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 6bf9864..2e09611 100644
--- a/Makefile
+++ b/Makefile
@@ -501,14 +501,6 @@ world: target-post-image
 $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
-# We make a symlink lib32->lib or lib64->lib as appropriate
-# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
-ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-LIB_SYMLINK = lib64
-else
-LIB_SYMLINK = lib32
-endif
-
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 6b5ab79..7618835 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -77,13 +77,21 @@ define SKELETON_USR_SYMLINKS_OR_DIRS
 endef
 endif
 
+# We make a symlink lib32->lib or lib64->lib as appropriate
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+SKELETON_LIB_SYMLINK = lib64
+else
+SKELETON_LIB_SYMLINK = lib32
+endif
+
 define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
@@ -99,8 +107,8 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
 endef
 
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
