From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 10:01:04 +0200
Subject: [Buildroot] [PATCH 1/3] core/pkg-util: pass package directory and
	name when saving license files
In-Reply-To: <cover.1497772831.git.yann.morin.1998@free.fr>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
Message-ID: <2c8c0a75d4b08c606f827711e1a510139255a08e.1497772831.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will be usefull when checking the hashes of the license files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 2 +-
 package/pkg-generic.mk | 2 +-
 package/pkg-utils.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 88d98e0405..1c272d009c 100644
--- a/Makefile
+++ b/Makefile
@@ -740,7 +740,7 @@ legal-info-clean:
 .PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
-	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
+	@$(call legal-license-file,buildroot,buildroot,,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f474704980..8a1dc310d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -849,7 +849,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	@$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAW_BASE_NAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_NAME),$$($(2)_RAW_BASE_NAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c95e77953b..e9ac56276f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -83,7 +83,7 @@ define legal-manifest # pkg, version, license, license-files, source, url, {HOST
 	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
 endef
 
-define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
-	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
-	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
+define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
+	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
+	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
-- 
2.11.0
