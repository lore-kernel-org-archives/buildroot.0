From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 04 Oct 2013 15:12:33 +0200
Subject: [Buildroot] [PATCH 4 of 5] legal info: split sources for host and
	target
In-Reply-To: <patchbomb.1380892349@argentina>
References: <patchbomb.1380892349@argentina>
Message-ID: <89676a95334fafa93e7b.1380892353@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
This patch concludes the splitting of legal info for host and target.

 Makefile               |  9 +++++----
 package/pkg-generic.mk |  6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -108,7 +108,8 @@ TARGET_DIR:=$(BASE_DIR)/target
 HOST_DIR:=$(BASE_DIR)/host
 
 LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
-REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
+REDIST_SOURCES_DIR_TARGET=$(LEGAL_INFO_DIR)/sources
+REDIST_SOURCES_DIR_HOST=$(LEGAL_INFO_DIR)/host-sources
 LICENSE_FILES_DIR_TARGET=$(LEGAL_INFO_DIR)/licenses
 LICENSE_FILES_DIR_HOST=$(LEGAL_INFO_DIR)/host-licenses
 LEGAL_MANIFEST_CSV_TARGET=$(LEGAL_INFO_DIR)/manifest.csv
@@ -419,7 +420,7 @@ world: toolchain $(TARGETS_ALL)
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
+$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # We make a symlink lib32->lib or lib64->lib as appropriate
@@ -598,8 +599,8 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
-legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
-		$(TARGETS_LEGAL_INFO)
+legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
+		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
 		cat support/legal-info/README.warnings-header \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -488,7 +488,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded and extracted beforehand
-$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR)
+$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5)))
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
 endif
 endif
@@ -515,8 +515,8 @@ else
 endif
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
-	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
-	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
+	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5))) 2>/dev/null || \
+	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5)))
 endif
 endif
 	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(5)))
