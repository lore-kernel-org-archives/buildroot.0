From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Jan 2016 16:09:04 +0100
Subject: [Buildroot] [PATCH v10 1/4] Makefile: move LIB_SYMLINK definition
	to toolchain/helpers.mk
Message-ID: <1453302547-24314-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Commit 7a6b83a211612ff95a1f5d35b2861ad5655ac8b1 introduced the skeleton
package, which took over the lib32/lib64 -> lib symlink creation from the
main Makefile.
However, the definition of the LIB_SYMLINK variable did not move along, for
no real reason. At that moment, the most logical location for the definition
would be package/skeleton/skeleton.mk.

Given that due to a subsequent commit the definition will also be needed
from toolchain-external, move it instead to toolchain/helpers.mk which is
also conceptually a fine place.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                     | 8 --------
 package/skeleton/skeleton.mk | 8 ++++----
 toolchain/helpers.mk         | 8 ++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)

(v10: new patch)

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
index 6b5ab79..e2089c7 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -82,8 +82,8 @@ define SKELETON_INSTALL_TARGET_CMDS
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/$(TOOLCHAIN_LIB_SYMLINK)
+	ln -snf lib $(TARGET_DIR)/usr/$(TOOLCHAIN_LIB_SYMLINK)
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
@@ -99,8 +99,8 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/$(TOOLCHAIN_LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/usr/$(TOOLCHAIN_LIB_SYMLINK)
 endef
 
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 70695ee..1d053a2 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -1,5 +1,13 @@
 # This Makefile fragment declares toolchain related helper functions.
 
+# We make a symlink lib32->lib or lib64->lib as appropriate
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+TOOLCHAIN_LIB_SYMLINK = lib64
+else
+TOOLCHAIN_LIB_SYMLINK = lib32
+endif
+
 # The copy_toolchain_lib_root function copies a toolchain library and
 # its symbolic links from the sysroot directory to the target
 # directory. Note that this function is used both by the external
-- 
2.4.10
