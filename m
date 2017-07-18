From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 19:25:30 +0200
Subject: [Buildroot] [PATCH 04/20] package/skeleton: make
	SKELETON_LIB_SYMLINK a macro
In-Reply-To: <cover.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than duplicate that code in all skeleton packages, make this a
macro, so that it is easier to use.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton/skeleton.mk | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 017479a990..0a8add66dc 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -17,6 +17,7 @@ SKELETON_INSTALL_STAGING = YES
 ############
 # Macros available for use by any skeleton package:
 # - SKELETON_RSYNC
+# - SKELETON_LIB_SYMLINK
 
 # This function rsyncs the skeleton directory in $(1) to the destination
 # in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
@@ -26,6 +27,21 @@ define SKELETON_RSYNC
 		$(1)/ $(2)/
 endef
 
+# Make a symlink lib32->lib or lib64->lib as appropriate.
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+# $(1): base dir (either staging or target)
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+define SKELETON_LIB_SYMLINK
+	ln -snf lib $(1)/lib64
+	ln -snf lib $(1)/usr/lib64
+endef
+else
+define SKELETON_LIB_SYMLINK
+	ln -snf lib $(1)/lib32
+	ln -snf lib $(1)/usr/lib32
+endef
+endif
+
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
@@ -92,19 +108,10 @@ define SKELETON_USR_SYMLINKS_OR_DIRS
 endef
 endif
 
-# We make a symlink lib32->lib or lib64->lib as appropriate
-# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
-ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-SKELETON_LIB_SYMLINK = lib64
-else
-SKELETON_LIB_SYMLINK = lib32
-endif
-
 define SKELETON_INSTALL_TARGET_CMDS
 	$(call SKELETON_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
-	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+	$(call SKELETON_LIB_SYMLINK,$(TARGET_DIR))
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
@@ -120,8 +127,7 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
-	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
+	$(call SKELETON_LIB_SYMLINK,$(STAGING_DIR))
 endef
 
 # The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
-- 
2.11.0
