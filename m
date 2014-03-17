From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 17 Mar 2014 09:22:33 +0100
Subject: [Buildroot] [PATCH] Remove STAMP_DIR.
Message-ID: <1395044553-29436-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the migration of the toolchains to the generic package
infrastructure, it is no longer used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                            | 9 ++++-----
 docs/manual/how-buildroot-works.txt | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 682f547..92b0dc2 100644
--- a/Makefile
+++ b/Makefile
@@ -149,7 +149,6 @@ endif
 _BR2_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR:=$(BASE_DIR)/build
-STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 # initial definition so that 'make clean' works for most users, even without
@@ -432,7 +431,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -451,7 +450,7 @@ world: target-post-image
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR)
 
 ################################################################################
 #
@@ -459,7 +458,7 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # We make a symlink lib32->lib or lib64->lib as appropriate
@@ -819,7 +818,7 @@ printvars:
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
 distclean: clean
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index a96e45b..5ef6e0f 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -53,7 +53,7 @@ The main Makefile performs the following steps (once the
 configuration is done):
 
 * Create all the output directories: +staging+, +target+, +build+,
-  +stamps+, etc. in the output directory (+output/+ by default,
+  etc. in the output directory (+output/+ by default,
   another value can be specified using +O=+)
 
 * Generate the toolchain target. When an internal toolchain is used, this
-- 
1.9.0
