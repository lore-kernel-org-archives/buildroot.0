From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:12:31 +0200
Subject: [Buildroot] [git commit] core/legal-info: Change order of
 legal-manifest parameters
Message-ID: <20181021171440.77D048843E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f1490104383d9062f8b87c33926946602ac936a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last parameter {HOST|TARGET} is now first. With this change,
adding new columns to the legal manifest file (as in the next commit)
will be slightly easier to review.

Signed-off-by: Michal Sojka <sojka@merica.cz>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 6 +++---
 package/pkg-generic.mk | 2 +-
 package/pkg-utils.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 5c9b8a803b..9f371b0d8b 100644
--- a/Makefile
+++ b/Makefile
@@ -798,9 +798,9 @@ legal-info-clean:
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
 	@$(call legal-license-file,buildroot,buildroot,support/legal-info/buildroot.hash,COPYING,COPYING,HOST)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
-	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
+	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
+	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
+	@$(call legal-manifest,HOST,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b8de0a9aac..aee22795c0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -942,7 +942,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)))
+	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index be287dc817..992ce0b941 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
-define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
-	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
+define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, source, url
+	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)"' >>$(LEGAL_MANIFEST_CSV_$(1))
 endef
 
 define legal-license-file # pkgname, pkgname-pkgver, pkg-hashfile, filename, file-fullpath, {HOST|TARGET}
