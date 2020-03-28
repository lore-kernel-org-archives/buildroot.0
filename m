From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:35:57 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: don't hang the
 build if there are no file lists
Message-ID: <20200328072643.A467F88777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c4fc019ee0ac907ea5c21ccad9b2ca318a02774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In very limited configurations, it is possible to have a case where no
.files-list-staging.txt files are created. In this case:

    cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
        $(BUILD_DIR)/packages-file-list-staging.txt

becomes:

    cat > \
        $(BUILD_DIR)/packages-file-list-staging.txt

which of course makes the build hang.. forever.

So we fix this by checking the list is not empty. To keep the code
readable, we introduce an intermediate variable to store the list of
these files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[yann.morin.1998 at free.fr: always create the file, even if empty]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa1e74745c93534a14981616b92956e920a01dc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 5b17a32f30..00ca596e66 100644
--- a/Makefile
+++ b/Makefile
@@ -728,6 +728,10 @@ $(TARGETS_ROOTFS): target-finalize
 # Avoid the rootfs name leaking down the dependency chain
 target-finalize: ROOTFS=
 
+TARGET_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt))
+HOST_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt))
+STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt))
+
 .PHONY: host-finalize
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
@@ -807,12 +811,12 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
-	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt)) > \
-		$(BUILD_DIR)/packages-file-list.txt
-	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt)) > \
-		$(BUILD_DIR)/packages-file-list-host.txt
-	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
-		$(BUILD_DIR)/packages-file-list-staging.txt
+	$(if $(TARGET_DIR_FILES_LISTS), \
+		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
+	$(if $(HOST_DIR_FILES_LISTS), \
+		cat $(HOST_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-host.txt
+	$(if $(STAGING_DIR_FILES_LISTS), \
+		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
