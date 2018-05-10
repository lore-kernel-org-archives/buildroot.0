From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 10 May 2018 13:58:50 -0500
Subject: [Buildroot] [PATCH v4 1/5] cpe-info: new make target
In-Reply-To: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1525978734-35706-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to make legal-info, produce a csv delimited file containing
all selected packages CPE identification.

Have the pkg infra define CPE_ID_* defaults using the package name
for the vendor and name as most CPE IDs seem to align with that
assumption. Also use the pkg version as the CPE ID's version field.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v2
[Thomas P
 - Moved comment on conditionals back to this patchset where
   the conditional is created vs later

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
---
 Makefile               | 17 ++++++++++++++++-
 package/pkg-generic.mk | 13 +++++++++++++
 package/pkg-utils.mk   |  8 ++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c024c65..71632bb 100644
--- a/Makefile
+++ b/Makefile
@@ -146,7 +146,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig printvars
+	savedefconfig printvars cpe-info %-cpe-info
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -233,6 +233,7 @@ LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
 LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
+CPE_MANIFEST_CSV = $(BASE_DIR)/cpe-manifest.csv
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
@@ -802,6 +803,19 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
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
@@ -1070,6 +1084,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  cpe-info               - generate info about security CPE identification'
 	@echo '  printvars              - dump all the internal variables'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a3b5f9..67ac436 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -861,6 +861,18 @@ else
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
+	$(Q)$$(call cpe-manifest,$$($(2)_CPE_ID),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
+endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
@@ -1002,6 +1014,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-clean-for-reconfigure \
 	$(1)-clean-for-reinstall \
 	$(1)-configure \
+	$(1)-cpe-info \
 	$(1)-depends \
 	$(1)-dirclean \
 	$(1)-external-deps \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c3acc22..11a2457 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -95,3 +95,11 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
 	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
+
+#
+# cpe-info helper functions
+#
+
+define cpe-manifest # cpe, cve patched, pkg name, version, url
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(CPE_MANIFEST_CSV)
+endef
-- 
1.9.1
