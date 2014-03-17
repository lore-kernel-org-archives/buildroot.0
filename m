From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 22:10:45 +0100
Subject: [Buildroot] [git commit] Remove STAMP_DIR
Message-ID: <20140317221234.C24579BF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0c6067772f4f131678ca8eeb8e45dcbea9f6f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the migration of the toolchains to the generic package
infrastructure, it is no longer used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                            |    9 ++++-----
 docs/manual/how-buildroot-works.txt |    2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2b13917..011af57 100644
--- a/Makefile
+++ b/Makefile
@@ -152,7 +152,6 @@ endif
 _BR2_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR:=$(BASE_DIR)/build
-STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 # initial definition so that 'make clean' works for most users, even without
@@ -435,7 +434,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -454,7 +453,7 @@ world: target-post-image
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR)
 
 ################################################################################
 #
@@ -462,7 +461,7 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # We make a symlink lib32->lib or lib64->lib as appropriate
@@ -824,7 +823,7 @@ printvars:
 
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
