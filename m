From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:20:54 +0200
Subject: [Buildroot] [PATCH] Makefile: hide commands that build the package
 file lists at end of build
Message-ID: <20200829122055.131928-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 0e2be4db8ab01d479177a3a187c22525752195ae
("package/pkg-generic: make file list logic parallel build
compatible"), the commands executed at the every end of the build to
assemble the list of files installed by the different packages are
visible in the make output. They are quite noisy, and clutter the
output.

The other commands in target-finalize are also hidden using "@", so do
the same for those commands.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index faef1a1be3..4a5c13b92f 100644
--- a/Makefile
+++ b/Makefile
@@ -815,11 +815,11 @@ endif # merged /usr
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
-	$(if $(TARGET_DIR_FILES_LISTS), \
+	@$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
-	$(if $(HOST_DIR_FILES_LISTS), \
+	@$(if $(HOST_DIR_FILES_LISTS), \
 		cat $(HOST_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-host.txt
-	$(if $(STAGING_DIR_FILES_LISTS), \
+	@$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-- 
2.26.2
