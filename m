From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:35 +0100
Subject: [Buildroot] [RFC 02/15] legal-info: produce a manifest file with
	licensing info
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile                    |   14 +++++++++++---
 package/Makefile.package.in |    4 +++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 507fd78..dcff4dd 100644
--- a/Makefile
+++ b/Makefile
@@ -278,6 +278,9 @@ TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
+LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
@@ -363,7 +366,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR)
 
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
@@ -391,6 +394,7 @@ $(O)/toolchainfile.cmake:
 	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
+	legal-info-prepare-manifest \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -402,7 +406,7 @@ $(O)/toolchainfile.cmake:
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -502,7 +506,11 @@ source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
-legal-info: $(TARGETS_LEGAL_INFO)
+legal-info-prepare-manifest: $(LEGAL_INFO_DIR)
+	@rm -f $(LEGAL_MANIFEST_CSV)
+	@echo "package,version,license" >$(LEGAL_MANIFEST_CSV)
+
+legal-info: legal-info-prepare-manifest $(TARGETS_LEGAL_INFO)
 
 show-targets:
 	@echo $(TARGETS)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 8e73f34..e117223 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -653,8 +653,10 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
-$(1)-legal-info:	$(1)-source
+$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR)
 			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
+			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
+				>>$(LEGAL_MANIFEST_CSV)
 
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
-- 
1.7.5.4
