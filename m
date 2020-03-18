From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Mar 2020 16:58:13 +0100
Subject: [Buildroot] [PATCH 3/3] Makefile: assemble package file lists
 before calling post-build scripts
In-Reply-To: <20200318155814.567-1-patrickdepinguin@gmail.com>
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
Message-ID: <20200318155814.567-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Post-build scripts may want to do something based on the list of files
installed by a package. However, since commit
0e2be4db8ab01d479177a3a187c22525752195ae the final packages-file-lists.txt
file is only created _after_ the post-build scripts.

Move the assembly of the file lists upwards, before the post-build scripts.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 29d30a4f70..1280066bab 100644
--- a/Makefile
+++ b/Makefile
@@ -806,12 +806,6 @@ endif # merged /usr
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
-	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
-
-	touch $(TARGET_DIR)/usr
-
 	$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list.txt)
 	$(if $(HOST_DIR_FILES_LISTS), \
@@ -819,6 +813,12 @@ endif # merged /usr
 	$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-staging.txt)
 
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing post-build script $(s)"); \
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+
+	touch $(TARGET_DIR)/usr
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
-- 
2.24.1
