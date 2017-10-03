From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  3 Oct 2017 15:58:54 -0500
Subject: [Buildroot] [PATCH v2] HOST_DIR/lib: symlink respectively to
	lib32/64
Message-ID: <1507064334-22885-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Discovered the issue on a RHEL7.4 machine where
the cmake build dynamically selected HOST_DIR/lib64
as the installation path for the lzo2 library.

Fixes failures like the following:
host-mtd
http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/

host-squashfs
http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
[Yann
v1 -> v2
 - Correct the condition used to determine host arch.
   (Previously used the target arch check)
---
 Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9b09589..1cc474a 100644
--- a/Makefile
+++ b/Makefile
@@ -542,7 +542,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
+	$(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -565,6 +565,13 @@ sdk: world
 $(HOST_DIR)/usr: $(HOST_DIR)
 	@ln -snf . $@
 
+$(HOST_DIR)/lib: $(HOST_DIR)
+ifeq ($(HOSTARCH),x86)
+	@ln -snf lib $@32
+else
+	@ln -snf lib $@64
+endif
+
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
-- 
1.9.1
