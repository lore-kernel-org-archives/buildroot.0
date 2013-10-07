From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 15:15:10 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] legal info: split license texts for
	host and target
In-Reply-To: <patchbomb.1381151707@argentina>
References: <patchbomb.1381151707@argentina>
Message-ID: <15f6330a82d9a7164d72.1381151710@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

---
v2:
- rebase after changes in first patch
- fix accidental mixup of contents from first patch

 Makefile               |   8 +++++---
 package/pkg-generic.mk |   6 +++---
 package/pkg-utils.mk   |  16 ++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
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
 
@@ -588,7 +590,7 @@ legal-info-clean:
 
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
-	@$(call legal-license-file,buildroot,COPYING,COPYING)
+	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -512,7 +512,7 @@ else
 
 # Save license files if defined
 ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
+	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(5)))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
 # We cannot use $$($(2)_LICENSE_FILES) in the foreach below because it fails
@@ -521,11 +521,11 @@ else
 ifeq ($($(2)_LICENSE_FILES),)
 ifneq ($($(3)_LICENSE_FILES),)
 # Host package with no explicit HOST_FOO_LICENSE_FILES
-	@$(foreach F,$($(3)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
+	@$(foreach F,$($(3)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F),$(call UPPERCASE,$(5)))$$(sep))
 endif
 else
 # Target package, or host package with explicit HOST_FOO_LICENSE_FILES
-	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
+	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F),$(call UPPERCASE,$(5)))$$(sep))
 endif # host/target distinction
 endif # license files
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -99,15 +99,15 @@ endef
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
