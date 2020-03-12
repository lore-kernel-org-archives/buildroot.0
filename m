From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 10:15:30 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't hang the build if there are
 no file lists
In-Reply-To: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
References: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200312091530.287681-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
This is a fix, it should be backported to 2020.02.x
---
 Makefile | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 074d08c04a..3fdd52c677 100644
--- a/Makefile
+++ b/Makefile
@@ -727,6 +727,10 @@ $(TARGETS_ROOTFS): target-finalize
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
+		cat $(TARGET_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list.txt)
+	$(if $(HOST_DIR_FILES_LISTS), \
+		cat $(HOST_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-host.txt)
+	$(if $(STAGING_DIR_FILES_LISTS), \
+		cat $(STAGING_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-staging.txt)
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
-- 
2.24.1
