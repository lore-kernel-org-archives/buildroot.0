From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:34 +0200
Subject: [Buildroot] [PATCH 01/17] cpe-info: new make target
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-2-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Similar to make legal-info, produce a csv delimited file containing
all selected packages CPE identification.

By default, support the pkg infra defining a set of CPE_ID_* defaults
using the package name for the vendor and name as most CPE IDs seem
to align with that assumption. Plus initially, use the pkg version as
the CPE ID's version field.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 Makefile               | 17 ++++++++++++++++-
 package/pkg-generic.mk | 13 +++++++++++++
 package/pkg-utils.mk   |  8 ++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9648fa58d8..9b788cf937 100644
--- a/Makefile
+++ b/Makefile
@@ -141,7 +141,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars
+	savedefconfig update-defconfig printvars cpe-info %-cpe-info
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -228,6 +228,7 @@ LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
 LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
+CPE_MANIFEST_CSV = $(BASE_DIR)/cpe-manifest.csv
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
@@ -873,6 +874,19 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
 		mv .legal-info.sha256 legal-info.sha256)
 	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
+.PHONY: cpe-info-clean
+cpe-info-clean:
+	@rm -f $(CPE_MANIFEST_CSV)
+
+.PHONY: cpe-info-prepare
+cpe-info-prepare:
+	@$(call MESSAGE,"Gathering CPE info")
+	@$(call cpe-manifest,CPE ID,CVE PATCHED,PACKAGE,VERSION,SOURCE SITE)
+
+.PHONY: cpe-info
+cpe-info: cpe-info-clean cpe-info-prepare $(foreach p,$(PACKAGES),$(p)-cpe-info)
+	@echo "CPE info produced in $(CPE_MANIFEST_CSV)"
+
 .PHONY: show-targets
 show-targets:
 	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
@@ -1154,6 +1168,7 @@ help:
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
+	@echo '  cpe-info               - generate info about security CPE identification'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54de03da03..01df3a3a4f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -970,6 +970,18 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
+$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
+$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
+$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
+
+$(1)-cpe-info: PKG=$(2)
+$(1)-cpe-info:
+ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+	@$$(call MESSAGE,"Collecting cpe info")
+	$(Q)$$(call cpe-manifest,$$($(2)_CPE_ID),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
+endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
@@ -1121,6 +1133,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 	$(1)-clean-for-reconfigure \
 	$(1)-clean-for-reinstall \
 	$(1)-configure \
+	$(1)-cpe-info \
 	$(1)-depends \
 	$(1)-dirclean \
 	$(1)-external-deps \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 4fcb076e21..f1d085ece1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -228,3 +228,11 @@ legal-deps = \
         $(filter-out $(if $(1:host-%=),host-%),\
             $(call non-virtual-deps,\
                 $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
+
+#
+# cpe-info helper functions
+#
+
+define cpe-manifest # cpe, pkg name, version, url
+	echo '"$(1)","$(2)","$(3)","$(4)"' >>$(CPE_MANIFEST_CSV)
+endef
-- 
2.28.0
