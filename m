From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:00 -0000
Subject: [Buildroot] [git commit branch/next] legal-info: infrastructure to
	collect legally-relevant material
Message-ID: <20120802195250.E7BD28F944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e76f904d208e4ef0bf722583897d4044264f546
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This allows to automatically collect material that may be needed to comply with
the license of packages that Buildroot prepares for the target device.

The core of the implementation is made by the following parts:
 - in package/pkg-utils.mk some helper functions are defined for common actions
   such as generating a warning, producing info about a package etc;
 - in package/pkg-gentargets.mk, within the GENTARGETS framework, a new
   <PKG>-legal-info target produces all the info for a given package;
 - Makefile implements the top-level targets:
   - legal-info-prepare creates the output directory and produces legal info
     about Buildroot itself and the toolchain, which mostly means just warning
     the user that this is not implemented;
   - legal-info, the only target that is supposed to be used directly, depends
     on all of the above and finishes things by producing the README files from
     the various pieces.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                  |   42 ++++++++++++++++++-
 package/pkg-gentargets.mk                 |   61 +++++++++++++++++++++++++++++
 package/pkg-utils.mk                      |   25 ++++++++++++
 support/legal-info/README.header          |   24 +++++++++++
 support/legal-info/README.warnings-header |    4 ++
 5 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index b80477f..d55b136 100644
--- a/Makefile
+++ b/Makefile
@@ -257,6 +257,14 @@ TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
+LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
+LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
+LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
+LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
+
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 BUILDROOT_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
@@ -338,6 +346,9 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
+TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
+		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
@@ -354,8 +365,9 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
 .PHONY: all world dirs clean distclean source outputmakefile \
+	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -365,7 +377,7 @@ world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -498,6 +510,28 @@ source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
+legal-info-clean:
+	@rm -fr $(LEGAL_INFO_DIR)
+
+legal-info-prepare: $(LEGAL_INFO_DIR)
+	@$(call MESSAGE,"Collecting legal info")
+	@$(call legal-license-file,buildroot,COPYING,COPYING)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE)
+	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved)
+	@$(call legal-warning,the Buildroot source code has not been saved)
+	@$(call legal-warning,the toolchain has not been saved)
+	@cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
+
+legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
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
 
@@ -619,7 +653,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(LEGAL_INFO_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
@@ -687,6 +722,7 @@ endif
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
+	@echo '  legal-info             - generate info about license compliance'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 5da9cdc..5105335 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -180,6 +180,7 @@ define GENTARGETS_INNER
 
 $(2)_TYPE                       =  $(5)
 $(2)_NAME			=  $(1)
+$(2)_RAWNAME			=  $(patsubst host-%,%,$(1))
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
@@ -245,6 +246,20 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
+ifndef $(2)_LICENSE
+ ifdef $(3)_LICENSE
+  $(2)_LICENSE = $($(3)_LICENSE)
+ endif
+endif
+
+ifndef $(2)_LICENSE_FILES
+ ifdef $(3)_LICENSE_FILES
+  $(2)_LICENSE_FILES = $($(3)_LICENSE_FILES)
+ endif
+endif
+
+$(2)_LICENSE			?= unknown
+
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
@@ -412,6 +427,52 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+# legal-info: declare dependencies and set values used later for the manifest
+ifneq ($$($(2)_LICENSE),PROPRIETARY)
+ifneq ($$($(2)_SITE_METHOD),local)
+ifneq ($$($(2)_SITE_METHOD),override)
+# Packages that have a tarball need it downloaded and extracted beforehand
+$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR)
+$(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
+ifneq ($$($(2)_LICENSE_FILES),)
+$(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
+endif
+endif
+endif
+endif
+# defaults for packages without tarball or license files
+$(2)_MANIFEST_TARBALL ?= not saved
+$(2)_MANIFEST_LICENSE_FILES ?= not saved
+
+# legal-info: produce legally relevant info.
+$(1)-legal-info:
+# Packages without a source are assumed to be part of Buildroot, skip them.
+ifneq ($(call qstrip,$$($(2)_SOURCE)),)
+ifeq ($$($(2)_LICENSE),PROPRIETARY)
+# Proprietary packages: nothing to save
+else ifeq ($$($(2)_SITE_METHOD),local)
+# Packages without a tarball: don't save and warn
+	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
+else ifeq ($$($(2)_SITE_METHOD),override)
+	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
+else
+# Other packages
+# Save license files if defined
+ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
+	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
+	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
+else
+	@for F in $$($(2)_LICENSE_FILES); do \
+		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
+		done
+endif
+# Copy the source tarball (just hardlink if possible)
+	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
+	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
+endif
+	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
+endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
+
 # add package to the general list of targets if requested by the buildroot
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0c55a9d..35abb17 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -92,3 +92,28 @@ define sep
 
 
 endef
+
+#
+# legal-info helper functions
+#
+LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
+legal-warning=echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
+legal-warning-pkg=echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
+define legal-warning-pkg-savednothing # pkg, {local|override}
+	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
+endef
+legal-manifest=echo "$(1),$(2),$(3),$(4),$(5)" >>$(LEGAL_MANIFEST_CSV)
+define legal-license-header
+	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
+		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
+endef
+define legal-license-nofiles
+	$(call legal-license-header,$(1),unknown license file(s))
+endef
+define legal-license-file # pkg, filename, file-fullpath
+	$(call legal-license-header,$(1),$(2) file) && \
+	cat $(3) >>$(LEGAL_LICENSES_TXT) && \
+	echo >>$(LEGAL_LICENSES_TXT) && \
+	mkdir -p $(LICENSE_FILES_DIR)/$(1)/ && \
+	cp $(3) $(LICENSE_FILES_DIR)/$(1)/
+endef
diff --git a/support/legal-info/README.header b/support/legal-info/README.header
new file mode 100644
index 0000000..3321adb
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
+   Note: this has not been saved due to technical limitations, you must
+   collect it manually.
+ * The Buildroot configuration file; this has been saved in buildroot.config.
+ * The toolchain (cross-compiler and related tools) used to generate all the
+   compiled programs.
+   Note: this has not been saved due to technical limitations, you must
+   collect it manually.
+ * The source code for all packages; this has been saved in the sources/
+   subdirectory (except for the proprietary packages, which have not been
+   saved); patches applied to some packages by Buildroot are included in the
+   Buildroot sources and were not duplicated in the sources/ subdirectory.
+ * A manifest file listing the configured packages and related information.
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
