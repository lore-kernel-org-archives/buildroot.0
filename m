From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 04 Oct 2013 15:12:31 +0200
Subject: [Buildroot] [PATCH 2 of 5] legal info: split manifest for host and
	target
In-Reply-To: <patchbomb.1380892349@argentina>
References: <patchbomb.1380892349@argentina>
Message-ID: <7c9a3a9dd202f6b7f19f.1380892351@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Note: this is a resend without changes, now accumulated in a legal-info
series

 Makefile                     |  8 +++++---
 docs/manual/legal-notice.txt |  6 +++---
 package/pkg-generic.mk       |  2 +-
 package/pkg-utils.mk         |  2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
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
@@ -588,8 +589,9 @@ legal-info-clean:
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
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -44,8 +44,8 @@ There you will find:
   saved);
   patches applied to some packages by Buildroot are distributed with the
   Buildroot sources and are not duplicated in the +sources/+ subdirectory.
-* A manifest file listing the configured packages, their version, license and
-  related information.
+* A manifest file (one for host and one for target packages) listing the
+  configured packages, their version, license and related information.
   Some of this information might not be defined in Buildroot; such items are
   marked as "unknown".
 * A +licenses/+ subdirectory, which contains the license text of packages.
@@ -72,7 +72,7 @@ License abbreviations
 ---------------------
 
 Here is a list of the licenses that are most widely used by packages in
-Buildroot, with the name used in the manifest file:
+Buildroot, with the name used in the manifest files:
 
 * `GPLv2`:
   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -519,7 +519,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
 endif
 endif
-	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
+	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(5)))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -96,7 +96,7 @@ legal-warning-pkg=echo "WARNING: $(1): $
 define legal-warning-pkg-savednothing # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
 endef
-legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV)
+legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
 define legal-license-header
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
