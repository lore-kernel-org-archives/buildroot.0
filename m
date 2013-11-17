From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 09:14:51 +0100
Subject: [Buildroot] [git commit] legal info: split manifest for host and
	target
Message-ID: <20131201201519.77BDB9BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc4f34ddd4d9f501811b3c86262cdb05ab506460
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |    8 +++++---
 package/pkg-generic.mk |    2 +-
 package/pkg-utils.mk   |    2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a425875..d5b3473 100644
--- a/Makefile
+++ b/Makefile
@@ -110,7 +110,8 @@ HOST_DIR:=$(BASE_DIR)/host
 LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
 LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
-LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_MANIFEST_CSV_TARGET=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_MANIFEST_CSV_HOST=$(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
 LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
@@ -575,8 +576,9 @@ legal-info-clean:
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
 	@$(call legal-license-file,buildroot,COPYING,COPYING)
-	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE)
-	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
+	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
+	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fc6e8c6..a11b21d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -591,7 +591,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
+	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(5)))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0ef433d..f740061 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -104,7 +104,7 @@ legal-warning-pkg=echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
 define legal-warning-pkg-savednothing # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
 endef
-legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV)
+legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
 define legal-license-header
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
