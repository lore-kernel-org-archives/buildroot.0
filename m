From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sat, 11 Apr 2020 12:40:21 +0300
Subject: [Buildroot] [PATCH 2/3] package/cups-filters: add ghostscript
 support
In-Reply-To: <20200411094022.13773-1-skif@skif-web.ru>
References: <20200411094022.13773-1-skif@skif-web.ru>
Message-ID: <20200411094022.13773-3-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cups-filters can work around ghostscript render instead of pdftops.

It's solve some troubles with printers. For example, in current
buildroot version pdftopsget FILTER ERROR message and broken printing.

Also ghostscriot have support of multiple printer models.

This patch check, is ghostscript enabled. If yes, default render will
send to ghostscript.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/cups-filters/cups-filters.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 3bb33d963c..75447b2b7e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -11,8 +11,7 @@ CUPS_FILTERS_LICENSE_FILES = COPYING
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
-CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
-	--disable-mutool \
+CUPS_FILTERS_CONF_OPTS = --disable-mutool \
 	--disable-foomatic \
 	--disable-braille \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
@@ -20,6 +19,13 @@ CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--with-pdftops=pdftops \
 	--with-jpeg
 
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+CUPS_FILTERS_CONF_OPTS += --with-pdftops=gs
+CUPS_FILTERS_DEPENDENCIES += ghostscript
+else
+CUPS_FILTERS_CONF_OPTS += --with-pdftops=pdftops
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
 CUPS_FILTERS_DEPENDENCIES += libpng
-- 
2.17.1
