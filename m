From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:38:50 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: assemble
 package file lists before calling post-build scripts
Message-ID: <20200328072643.B527F88777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf67e6823f07fa87c7fea1050911acb4fae8baec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Post-build scripts may want to do something based on the list of files
installed by a package. However, since commit
0e2be4db8ab01d479177a3a187c22525752195ae the final packages-file-lists.txt
file is only created _after_ the post-build scripts.

Move the assembly of the file lists upwards, before the post-build scripts.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d4d52d907b9e6651be4f3ecfec5631122073f3cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 00ca596e66..c76d4cf70e 100644
--- a/Makefile
+++ b/Makefile
@@ -805,12 +805,6 @@ endif # merged /usr
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
-	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
-
-	touch $(TARGET_DIR)/usr
-
 	$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
 	$(if $(HOST_DIR_FILES_LISTS), \
@@ -818,6 +812,12 @@ endif # merged /usr
 	$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing post-build script $(s)"); \
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+
+	touch $(TARGET_DIR)/usr
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
