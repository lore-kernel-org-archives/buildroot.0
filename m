From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:36 +0100
Subject: [Buildroot] [RFC 03/15] legal-info: save source tarballs for all
	packages
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile                    |   11 +++++++----
 package/Makefile.package.in |    3 ++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index dcff4dd..31fda9a 100644
--- a/Makefile
+++ b/Makefile
@@ -279,6 +279,7 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
 LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
 
 ifeq ($(BR2_CCACHE),y)
@@ -366,7 +367,8 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) \
+	$(REDIST_SOURCES_DIR)
 
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
@@ -406,7 +408,7 @@ $(O)/toolchainfile.cmake:
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -510,7 +512,7 @@ legal-info-prepare-manifest: $(LEGAL_INFO_DIR)
 	@rm -f $(LEGAL_MANIFEST_CSV)
 	@echo "package,version,license" >$(LEGAL_MANIFEST_CSV)
 
-legal-info: legal-info-prepare-manifest $(TARGETS_LEGAL_INFO)
+legal-info: legal-info-prepare-manifest $(REDIST_SOURCES_DIR) $(TARGETS_LEGAL_INFO)
 
 show-targets:
 	@echo $(TARGETS)
@@ -633,7 +635,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e117223..0d7e081 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -653,10 +653,11 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
-$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR)
+$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
 			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
 			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
 				>>$(LEGAL_MANIFEST_CSV)
+			@cp $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR)
 
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
-- 
1.7.5.4
