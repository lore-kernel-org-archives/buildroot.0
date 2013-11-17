From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 09:15:04 +0100
Subject: [Buildroot] [git commit branch/next] legal info: split license
	texts for host and target
Message-ID: <20131117081822.4A0E09B9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=366f17f747197c449970480ff628b8fc5d87a71e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |    8 +++++---
 package/pkg-generic.mk |    4 ++--
 package/pkg-utils.mk   |   16 ++++++++--------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index d5b3473..da2a646 100644
--- a/Makefile
+++ b/Makefile
@@ -109,10 +109,12 @@ HOST_DIR:=$(BASE_DIR)/host
 
 LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
-LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
+LICENSE_FILES_DIR_TARGET=$(LEGAL_INFO_DIR)/licenses
+LICENSE_FILES_DIR_HOST=$(LEGAL_INFO_DIR)/host-licenses
 LEGAL_MANIFEST_CSV_TARGET=$(LEGAL_INFO_DIR)/manifest.csv
 LEGAL_MANIFEST_CSV_HOST=$(LEGAL_INFO_DIR)/host-manifest.csv
-LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_LICENSES_TXT_TARGET=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_LICENSES_TXT_HOST=$(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
 
@@ -575,7 +577,7 @@ legal-info-clean:
 
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
-	@$(call legal-license-file,buildroot,COPYING,COPYING)
+	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a11b21d..5e3fd39 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -575,13 +575,13 @@ else
 
 # Save license files if defined
 ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
+	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(5)))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
 # Double dollar signs are really needed here, to catch host packages
 # without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
 # have multiple license files.
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(5)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f740061..86fa5da 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -107,15 +107,15 @@ endef
 legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
 define legal-license-header
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
-		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
+		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
 endef
 define legal-license-nofiles
-	$(call legal-license-header,$(1),unknown license file(s))
+	$(call legal-license-header,$(1),unknown license file(s),$(2))
 endef
-define legal-license-file # pkg, filename, file-fullpath
-	$(call legal-license-header,$(1),$(2) file) && \
-	cat $(3) >>$(LEGAL_LICENSES_TXT) && \
-	echo >>$(LEGAL_LICENSES_TXT) && \
-	mkdir -p $(LICENSE_FILES_DIR)/$(1)/$(dir $(2)) && \
-	cp $(3) $(LICENSE_FILES_DIR)/$(1)/$(2)
+define legal-license-file # pkg, filename, file-fullpath, type
+	$(call legal-license-header,$(1),$(2) file,$(4)) && \
+	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
+	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
+	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
+	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
 endef
