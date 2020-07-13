From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 14:46:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: add dejavu mandatory
 dependency
Message-ID: <20200713124642.741955-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.27.3, cups-filters needs dejavu (even if it is only used
for test programs):
https://github.com/OpenPrinting/cups-filters/commit/1d66106e5ae45407b01459cb112ee09752166dba

Fixes:
 - http://autobuild.buildroot.org/results/0e141abc57e4185c74adce75cac4215dd8a3108b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-filters/Config.in       | 1 +
 package/cups-filters/cups-filters.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 9e4e37ca6b..d62a791ed6 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_DEJAVU
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dc4e89b52e..dd78f4b7f7 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -9,7 +9,7 @@ CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
 
-CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
+CUPS_FILTERS_DEPENDENCIES = cups dejavu libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = \
 	--disable-mutool \
@@ -20,6 +20,7 @@ CUPS_FILTERS_CONF_OPTS = \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
 	--with-jpeg \
+	--with-test-font-path=$(TARGET_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf \
 	--without-rcdir
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-- 
2.27.0
