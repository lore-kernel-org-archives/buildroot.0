From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:01 +0100
Subject: [Buildroot] [RFC v2 01/31] legal-info: infrastructure to collect
	legally-relevant material
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile                                  |   52 ++++++++++++++++++++++++-
 package/Makefile.package.in               |   59 +++++++++++++++++++++++++++++
 support/legal-info/README.header          |   24 ++++++++++++
 support/legal-info/README.warnings-header |    4 ++
 4 files changed, 136 insertions(+), 3 deletions(-)
 create mode 100644 support/legal-info/README.header
 create mode 100644 support/legal-info/README.warnings-header

diff --git a/Makefile b/Makefile
index d508888..b78aaf8 100644
--- a/Makefile
+++ b/Makefile
@@ -284,6 +284,15 @@ TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
+LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
+LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
+LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
+LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
+LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
+
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
@@ -362,6 +371,10 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
+TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
+		$(filter-out host-makedevs,\
+		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
@@ -395,8 +408,9 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
+	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -406,7 +420,7 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -513,6 +527,37 @@ source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
+legal-info-clean:
+	@rm -fr $(LEGAL_INFO_DIR)
+
+legal-info-prepare: $(LEGAL_INFO_DIR)
+	@echo "package,version,license,license files,source archive" \
+		>>$(LEGAL_MANIFEST_CSV)
+	@mkdir -p $(LICENSE_FILES_DIR)/buildroot
+	@cp COPYING $(LICENSE_FILES_DIR)/buildroot/COPYING
+	@echo -e "$(LEGAL_INFO_SEPARATOR)\n\t buildroot:" \
+		"COPYING file\n$(LEGAL_INFO_SEPARATOR)\n\n" \
+			>>$(LEGAL_LICENSES_TXT)
+	@cat COPYING >>$(LEGAL_LICENSES_TXT)
+	@echo >>$(LEGAL_LICENSES_TXT)
+	@echo "buildroot,$(BR2_VERSION_FULL),GPLv2,COPYING,not saved" \
+		>>$(LEGAL_MANIFEST_CSV)
+	@echo "WARNING: The Buildroot source code has not be saved" \
+		>>$(LEGAL_WARNINGS)
+	@echo "WARNING: The toolchain has not be saved" \
+		>>$(LEGAL_WARNINGS)
+	@cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
+
+legal-info: legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
+		$(TARGETS_LEGAL_INFO)
+	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
+	@if [ -r $(LEGAL_WARNINGS) ]; then \
+		cat support/legal-info/README.warnings-header \
+			$(LEGAL_WARNINGS) >>$(LEGAL_REPORT); \
+		cat $(LEGAL_WARNINGS); fi
+	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
+	@rm -f $(LEGAL_WARNINGS)
+
 show-targets:
 	@echo $(TARGETS)
 
@@ -634,7 +679,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(LEGAL_INFO_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 59adce1..262cc6a 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -505,6 +505,8 @@ ifndef $(2)_SOURCE
  endif
 endif
 
+$(2)_LICENSE			?= unknown
+
 ifndef $(2)_PATCH
  ifdef $(3)_PATCH
   $(2)_PATCH = $($(3)_PATCH)
@@ -644,6 +646,62 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
+# legal-info: produce legally relevant info.
+ifneq ($$($(3)_LICENSE),PROPRIETARY)
+ifneq ($$($(3)_SITE_METHOD),local)
+ifneq ($$($(3)_SITE_METHOD),override)
+# Packages that have a tarball need it downloaded and extracted beforehand
+$(1)-legal-info:	$(1)-extract $(REDIST_SOURCES_DIR)
+endif
+endif
+endif
+
+$(1)-legal-info:
+	@echo -n "$$($(3)_NAME),$$($(3)_VERSION),$$($(3)_LICENSE)," \
+		>>$(LEGAL_MANIFEST_CSV)
+ifeq ($$($(3)_LICENSE),PROPRIETARY)
+# Proprietary packages: nothing to save
+	@echo "not saved,not saved" >>$(LEGAL_MANIFEST_CSV)
+else ifeq ($$($(3)_SITE_METHOD),local)
+# Packages without a tarball: don't save and warn
+	@echo "not saved,not saved" >>$(LEGAL_MANIFEST_CSV)
+	@echo "WARNING: $$($(3)_NAME): sources and license files not saved" \
+		"(local packages not handled)" \
+		>>$(LEGAL_WARNINGS)
+else ifeq ($$($(3)_SITE_METHOD),override)
+	@echo "not saved,not saved" >>$(LEGAL_MANIFEST_CSV)
+	@echo "WARNING:  $$($(3)_NAME): sources and license files not saved" \
+		"(override packages not handled)" \
+		>>$(LEGAL_WARNINGS)
+else
+# Other packages
+# Save license files if defined
+ifeq ($(call qstrip,$$($(3)_LICENSE_FILES)),)
+	@echo -n "not saved," >>$(LEGAL_MANIFEST_CSV)
+	@echo -e "$(LEGAL_INFO_SEPARATOR)\n\t $$($(3)_NAME):" \
+		"unknown license file(s)\n$(LEGAL_INFO_SEPARATOR)\n\n" \
+			>>$(LEGAL_LICENSES_TXT)
+	@echo "WARNING: $$($(3)_NAME): cannot save license" \
+		"($(3)_LICENSE_FILES not defined)" >>$(LEGAL_WARNINGS)
+else
+	@mkdir -p $(LICENSE_FILES_DIR)/$$($(3)_NAME)/
+	@cp $(addprefix $$($(2)_DIR)/,$$($(3)_LICENSE_FILES)) \
+		$(LICENSE_FILES_DIR)/$$($(3)_NAME)/
+	@echo -n "$$($(3)_LICENSE_FILES)," >>$(LEGAL_MANIFEST_CSV)
+	@for F in $$($(3)_LICENSE_FILES); do \
+		echo -e "$(LEGAL_INFO_SEPARATOR)\n\t $$($(3)_NAME):" \
+			"$$$${F} file\n$(LEGAL_INFO_SEPARATOR)\n" \
+			>>$(LEGAL_LICENSES_TXT); \
+		cat $$($(2)_DIR)/$$$${F} >>$(LEGAL_LICENSES_TXT); \
+		echo >>$(LEGAL_LICENSES_TXT); \
+		done
+endif
+# Copy the source tarball (just hardlink if possible)
+	@cp -l $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
+	   cp $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR)
+	@echo "$$($(3)_SOURCE)" >>$(LEGAL_MANIFEST_CSV)
+endif
+
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
@@ -687,6 +745,7 @@ $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_LEGAL_INFO):		PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
diff --git a/support/legal-info/README.header b/support/legal-info/README.header
new file mode 100644
index 0000000..156ef7e
--- /dev/null
+++ b/support/legal-info/README.header
@@ -0,0 +1,24 @@
+Most of the packages that were used by Buildroot to produce the image files,
+including Buildroot itself, have open-source licenses. It is your
+responsibility to comply to the requirements of these licenses.
+To make this easier for you, Buildroot collected in this directory some
+material you may need to get it done.
+
+This material is composed of the following items.
+ * The scripts used to control compilation of the packages and the generation
+   of image files, i.e. the Buildroot sources.
+   Note: this has not be saved due to technical limitations, you must collect
+   it manually.
+ * The Buildroot configuration file; this has been saved in buildroot.config.
+ * The toolchain (cross-compiler and related tools) used to generate all the
+   compiled programs.
+   Note: this has not be saved due to technical limitations, you must collect
+   it manually.
+ * The source code for all packages; this has been saved in the sources/
+   subdirectory (except for the proprietary packages, which have not been
+   saved); patches applied to some packages by Buildroot are included in the
+   Buildroot sources and were not duplicated in the sources/ subdirectory.
+ * A manifest file listing the configured packages and related information;
+ * The license text of the packages; they have been saved in the licenses/
+   subdirectory.
+
diff --git a/support/legal-info/README.warnings-header b/support/legal-info/README.warnings-header
new file mode 100644
index 0000000..cd08290
--- /dev/null
+++ b/support/legal-info/README.warnings-header
@@ -0,0 +1,4 @@
+Due to technical limitations or lack of license definition in the package
+makefile, some of the material listed above could not been saved, as the
+following list details.
+
-- 
1.7.5.4
