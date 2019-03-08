From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Mar 2019 16:04:19 -0600
Subject: [Buildroot] [PATCH v8 1/9] cpe-info: new make target
In-Reply-To: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1552082667-46877-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to make legal-info, produce a csv delimited file containing
all selected packages CPE identification.

By default, support the pkg infra defining a set of CPE_ID_* defaults
using the package name for the vendor and name as most CPE IDs seem
to align with that assumption. Plus initially, use the pkg version as
the CPE ID's version field.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v8
 - Removed CVE patched list as this isn't implmented.

v4 -> v7
 - No change

v3
[Thomas P
 - Merged infra define CPE_ID_*  into this patch
 - Report all packages vs restricting to just allowing based on if
   the VENDOR was set (v2). This now represents Thomas P's original
   idea to report everything.  At first I felt I should restrict
   the reporting to those CPE IDs we had made sure were correct.
   Turns out we should have actually let the script handle fixing
   the CPEs and just make a complete design of this up front.

[Matt
 - Moved to using the _project on all vendors instead of just name

v2
[Thomas P
 - Moved comment on conditionals back to this patchset where
   the conditional is created vs later
---
 Makefile               | 17 ++++++++++++++++-
 package/pkg-generic.mk | 13 +++++++++++++
 package/pkg-utils.mk   |  8 ++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a64196f..cdf2cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -135,7 +135,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars
+	savedefconfig update-defconfig printvars cpe-info %-cpe-info
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -219,6 +219,7 @@ LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
 LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
+CPE_MANIFEST_CSV = $(BASE_DIR)/cpe-manifest.csv
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
@@ -852,6 +853,19 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
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
@@ -1124,6 +1138,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  cpe-info               - generate info about security CPE identification'
 	@echo '  printvars              - dump all the internal variables'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4353bd3..644128d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -911,6 +911,18 @@ else
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
@@ -1052,6 +1064,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-clean-for-reconfigure \
 	$(1)-clean-for-reinstall \
 	$(1)-configure \
+	$(1)-cpe-info \
 	$(1)-depends \
 	$(1)-dirclean \
 	$(1)-external-deps \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index bffd79d..0201632 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -102,3 +102,11 @@ legal-deps = \
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
1.9.1
