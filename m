From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:36:43 +0200
Subject: [Buildroot] [git commit] legal-info: Add site to legal info manifest
Message-ID: <20140723213747.6A3A39D2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af629e49ad26bd2873c1e39c0f263704ed8957a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I would like to propose adding the site to the legal-info manifest
files. This gives a little more information on where the sources came
from without adding much overhead. Please note that is is only for
packages where the source is not local or set with OVERRIDE_SRCDIR.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |    6 +++---
 package/pkg-generic.mk |    4 +++-
 package/pkg-utils.mk   |    4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 1af51de..6bd18e3 100644
--- a/Makefile
+++ b/Makefile
@@ -639,9 +639,9 @@ legal-info-clean:
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
 	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
-	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
+	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,not saved,HOST)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 395e593..97a7547 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -644,10 +644,12 @@ ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded beforehand
 $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
+$(2)_MANIFEST_SITE = $$(call qstrip,$$($(2)_SITE))
 endif
 endif
 endif
 $(2)_MANIFEST_TARBALL ?= not saved
+$(2)_MANIFEST_SITE ?= not saved
 
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
@@ -685,7 +687,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$(call UPPERCASE,$(4)))
+	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$($(2)_MANIFEST_SITE),$$(call UPPERCASE,$(4)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 99e1f76..89ad9e9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -105,8 +105,8 @@ define legal-warning-nosource # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
-define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
-	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
+define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
 endef
 
 define legal-license-header # pkg, license-file, {HOST|TARGET}
