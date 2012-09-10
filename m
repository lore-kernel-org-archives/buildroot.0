From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Sep 2012 16:00:50 +0200
Subject: [Buildroot] [git commit] pkg-download: allow relative BR2_DL_DIR
Message-ID: <20120910142751.38AA7995B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a77ee7fd40a78d6fe05657b4f4be63926c04e523
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And move the BUILDROOT_DL_DIR override here as well for consistency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                |   11 +++--------
 package/pkg-download.mk |   11 ++++++++++-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index b81170f..ba5da99 100644
--- a/Makefile
+++ b/Makefile
@@ -96,11 +96,6 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
 endif
 
-# Override BR2_DL_DIR if shell variable defined
-ifneq ($(BUILDROOT_DL_DIR),)
-BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
-endif
-
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
@@ -363,7 +358,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
-dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
@@ -379,7 +374,7 @@ world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
-	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
@@ -388,7 +383,7 @@ world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
+$(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9e98581..fa9a3e8 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -22,11 +22,20 @@ LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
 # external-deps target.
 DL_MODE=DOWNLOAD
 
-DL_DIR=$(call qstrip,$(BR2_DL_DIR))
+# Override BR2_DL_DIR if shell variable defined
+ifneq ($(BUILDROOT_DL_DIR),)
+DL_DIR:=$(BUILDROOT_DL_DIR)
+else
+DL_DIR:=$(call qstrip,$(BR2_DL_DIR))
+endif
+
 ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
 
+# ensure it exists and a absolute path
+DL_DIR:=$(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
+
 #
 # URI scheme helper functions
 # Example URIs:
