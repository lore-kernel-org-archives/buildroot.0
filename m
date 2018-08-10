From: sojkam1 at fel.cvut.cz <sojkam1@fel.cvut.cz>
Date: Fri, 10 Aug 2018 16:03:22 +0200
Subject: [Buildroot] [PATCH v2] core/legal-info: Add package dependencies
 with licenses to the manifest
Message-ID: <20180810140322.2748-1-sojkam1@fel.cvut.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michal Sojka <sojka@merica.cz>

This adds one column to the legal-info manifest table. It contains the
dependencies of the given package and their licenses. This information
is useful when assessing license compatibility of the packages and
their libraries.

An example of the content of the new column for the MPD package is
shown below:

    "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)], boost
    [BSL-1.0], libid3tag [GPL-2.0+], libmad [GPL-2.0+], libogg
    [BSD-3-Clause], libvorbis [BSD-3-Clause], libzlib [Zlib],
    skeleton-init-common [unknown], skeleton-init-sysv [unknown],
    sqlite [Public domain], toolchain-external-linaro-arm [unknown], "

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
Changes against v1:

* switched parameters of legal-manifest (added one is the last)
* producing some output even for host packages
* documented legal-deps macro


 Makefile               |  6 +++---
 package/pkg-generic.mk |  2 +-
 package/pkg-utils.mk   | 23 +++++++++++++++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f79d39fd26..cadf43146b 100644
--- a/Makefile
+++ b/Makefile
@@ -781,9 +781,9 @@ legal-info-clean:
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
 	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
-	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET,DEPENDENCIES WITH LICENSES)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST,DEPENDENCIES WITH LICENSES)
+	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST,)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91b61c6de0..a539483ae4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -936,7 +936,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)))
+	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)),$$(call legal-deps,$(1)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c3acc22b17..f7a3609443 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
-define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
-	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
+define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}, dependencies
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(7))
 endef
 
 define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
@@ -95,3 +95,22 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
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
+non-virtual-deps = $(call remove-virtual-pkgs,$(filter-out $(1),$(call get-transitive-deps,$(1))))
+host-pattern-if-target-pkg = $(if $(1:host-%=),host-%,)
+
+# Produce a comma-separated list of dependent packages and their
+# licenses. Host packages are removed from the list if the argument is
+# not a host package.
+define legal-deps # package
+$(foreach p,$(filter-out $(call host-pattern-if-target-pkg,$(1)),$(call non-virtual-deps,$(1))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)], )
+endef
-- 
2.18.0
