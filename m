From: sojkam1 at fel.cvut.cz <sojkam1@fel.cvut.cz>
Date: Thu,  9 Aug 2018 19:00:55 +0200
Subject: [Buildroot] [PATCH] core/legal-info: Add package dependencies with
 licenses to the manifest
Message-ID: <20180809170055.13334-1-sojkam1@fel.cvut.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michal Sojka <michal.sojka@cvut.cz>

This adds one column to the legal-info manifest table. It contains the
dependencies of the given package and their licenses. This information
is useful when assessing license compatibility of the packages and
their libraries.

An example of the content of the new column for the MPD package is
shown below:

    "alsa-lib (LGPL-2.1+ (library), GPL-2.0+ (aserver)),
    boost (BSL-1.0), libid3tag (GPL-2.0+), libmad (GPL-2.0+),
    libzlib (Zlib), skeleton-init-common (unknown),
    skeleton-init-sysv (unknown),
    toolchain-external-linaro-arm (unknown), "

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 Makefile               |  6 +++---
 package/pkg-generic.mk |  2 +-
 package/pkg-utils.mk   | 15 +++++++++++++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f79d39fd26..ba60a5a08f 100644
--- a/Makefile
+++ b/Makefile
@@ -781,9 +781,9 @@ legal-info-clean:
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
 	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
-	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,TARGET)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,HOST)
+	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,,HOST)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91b61c6de0..ec51e073a6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -936,7 +936,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)))
+	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(foreach p,$$(call legal-deps,$(2)),$$(p) ($$($$(call UPPERCASE,$$(p))_LICENSE)), ),$$(call UPPERCASE,$(4)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c3acc22b17..3390f2ef67 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
-define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
-	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
+define legal-manifest # pkg, version, license, license-files, source, url, dependencies, {HOST|TARGET}
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)","$(7)"' >>$(LEGAL_MANIFEST_CSV_$(8))
 endef
 
 define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
@@ -95,3 +95,14 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
 	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
+
+remove-virtual-pkgs = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
+get-direct-deps = $(sort $(foreach p,$(1),$($(call UPPERCASE,$(p))_FINAL_DEPENDENCIES)))
+
+define get-transitive-deps # packages
+	$(if $(filter-out $(1),$(call get-direct-deps,$(1))),\
+	     $(sort $(1) $(call get-transitive-deps,$(filter-out $(1),$(call get-direct-deps,$(1))))),\
+	     $(1))
+endef
+
+legal-deps = $(call remove-virtual-pkgs,$(filter-out $(1) host-%,$(call get-transitive-deps,$(1))))
-- 
2.18.0
