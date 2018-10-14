From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 14:25:41 +0200
Subject: [Buildroot] [PATCH 2/6] legal-info: use the per-package variable to
 get the hash file
In-Reply-To: <cover.1539519817.git.yann.morin.1998@free.fr>
References: <cover.1539519817.git.yann.morin.1998@free.fr>
Message-ID: <b7bcdf4b5ea3040b04fdc7346b76e7e604033c56.1539519817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile               | 2 +-
 package/pkg-generic.mk | 2 +-
 package/pkg-utils.mk   | 8 ++------
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 82dd76ea76..4948b7f5b1 100644
--- a/Makefile
+++ b/Makefile
@@ -792,7 +792,7 @@ legal-info-clean:
 .PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
-	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
+	@$(call legal-license-file,buildroot,buildroot,support/legal-info/buildroot.hash,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7dfad2d1be..b8de0a9aac 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -912,7 +912,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c3acc22b17..be287dc817 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -83,14 +83,10 @@ define legal-manifest # pkg, version, license, license-files, source, url, {HOST
 	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
 endef
 
-define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
+define legal-license-file # pkgname, pkgname-pkgver, pkg-hashfile, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
 	{ \
-		if [ -f $(3)/$($(PKG)_VERSION)/$(1).hash ]; then \
-			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
-		else \
-			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
-		fi; \
+		support/download/check-hash $(3) $(5) $(4); \
 		case $${?} in (0|3) ;; (*) exit 1;; esac; \
 	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
-- 
2.14.1
