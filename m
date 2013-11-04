From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 4 Nov 2013 09:48:06 -0800
Subject: [Buildroot] [RFC] core: Download all package sources
Message-ID: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Everyone,

This is an RFC for a new make option to download all package
sources to aid developers who cannot freely download packages.
This includes limited internet access or restrictive firewalls.
This is a best effort download. Any errors in downloading are
ignored rather than causing a failure.

The main changes in this patch is the addition of an "allsource"
make option that pulls down all of the package sources if a
version string is found. The version check is required because
packages that do not have a default version cause a invalid file
download attempt. I had to abstract the download steps from
pkg-generic.mk so they are callable by both the main Makefile
and the pkg-generic.mk download step.

Implementation details:
 1) The allsource command filters the make .VARIABLES for all
    "*_TARGET_SOURCE" and then strips off the "_TARGET_SOURCE"
    to get the package name. This results in a list of all
    of the packages that can be downloaded.
 2) The newly created PKG_DOWNLOAD define is called on all of
    the package names to download the source. This call does
    not cause the allsource command to fail if there is an
    error. This is only a best effort call.
 3) All of the sources are downloaded to the BR2_DL_DIR folder.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 Makefile                |    8 +++++++-
 package/pkg-download.mk |   17 +++++++++++++++++
 package/pkg-generic.mk  |    9 +--------
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index f266e2d..ef2cd74 100644
--- a/Makefile
+++ b/Makefile
@@ -388,7 +388,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: $(BASE_TARGETS) $(TARGETS_ALL)
 
-.PHONY: all world toolchain dirs clean distclean source outputmakefile \
+.PHONY: all world toolchain dirs clean distclean source allsource outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
@@ -564,6 +564,11 @@ toolchain-eclipse-register:
 
 source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
+allsource:
+	$(foreach V, \
+		$(subst _TARGET_SOURCE,,$(filter %_TARGET_SOURCE,$(sort $(.VARIABLES)))), \
+		-$(if $($(V)_VERSION),$(call PKG_DOWNLOAD,$(V))))
+
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
@@ -802,6 +807,7 @@ endif
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
+	@echo '  allsource              - download sources for all packages, not just selected ones'
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8e4a1ec..b75f039 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -226,6 +226,23 @@ define SHOW_EXTERNAL_DEPS_LOCALFILES
   echo $(2)
 endef
 
+###############################################################################
+# PKG_DOWNLOAD -- Package Download helper.
+#
+# Argument 1 is the package name in all caps
+#
+###############################################################################
+define PKG_DOWNLOAD
+	$(if $($(1)_SOURCE),$(call DOWNLOAD,$($(1)_SITE:/=)/$($(1)_SOURCE)))
+	$(foreach p,$($(1)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(1)_SITE:/=)/$(p))$(sep))
+	$(foreach p,$($(1)_PATCH),\
+		$(if $(findstring ://,$(p)),\
+			$(call DOWNLOAD,$(p)),\
+			$(call DOWNLOAD,$($(1)_SITE:/=)/$(p))\
+		)\
+	$(sep))
+endef
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4bba4b5..c993f47 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -39,14 +39,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		done ; \
 	fi
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
-	$(foreach p,$($(PKG)_PATCH),\
-		$(if $(findstring ://,$(p)),\
-			$(call DOWNLOAD,$(p)),\
-			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
-		)\
-	$(sep))
+	$(call PKG_DOWNLOAD,$(PKG))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
-- 
1.7.9.5
