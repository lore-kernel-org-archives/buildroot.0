From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 7 Dec 2015 21:40:01 +0100
Subject: [Buildroot] [PATCH 2/2] wine: Fix more likely *-config problems
Message-ID: <5665EEA1.9000504@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index e29d616..6dfd3f0 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -72,7 +72,11 @@ endif
 # To support freetype in wine we also need freetype in host-wine for the cross compiling tools
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 WINE_CONF_OPTS += --with-freetype
+WINE_CONF_OPTS += FREETYPE_CFLAGS="`($(STAGING_DIR)/usr/bin/freetype-config --cflags || $(STAGING_DIR)/usr/bin/freetype2-config --cflags) 2>/dev/null`"
+WINE_CONF_OPTS += FREETYPE_LIBS="`($(STAGING_DIR)/usr/bin/freetype-config --ldflags || $(STAGING_DIR)/usr/bin/freetype2-config --ldflags) 2>/dev/null`"
 HOST_WINE_CONF_OPTS += --with-freetype
+HOST_WINE_CONF_OPTS += FREETYPE_CFLAGS="`($(HOST_DIR)/usr/bin/freetype-config --cflags || $(HOST_DIR)/usr/bin/freetype2-config --cflags) 2>/dev/null`"
+HOST_WINE_CONF_OPTS += FREETYPE_LIBS="`($(HOST_DIR)/usr/bin/freetype-config --ldflags || $(HOST_DIR)/usr/bin/freetype2-config --ldflags) 2>/dev/null`"
 WINE_DEPENDENCIES += freetype
 HOST_WINE_DEPENDENCIES += host-freetype
 else
@@ -138,6 +142,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 WINE_CONF_OPTS += --with-xml
+WINE_CONF_OPTS += XML2_CFLAGS="`$(STAGING_DIR)/usr/bin/xml2-config --cflags 2>/dev/null`"
+WINE_CONF_OPTS += XML2_LIBS="`$(STAGING_DIR)/usr/bin/xml2-config --ldflags 2>/dev/null`"
 WINE_DEPENDENCIES += libxml2
 else
 WINE_CONF_OPTS += --without-xml
@@ -145,6 +151,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXSLT),y)
 WINE_CONF_OPTS += --with-xslt
+WINE_CONF_OPTS += XSLT_CFLAGS="`$(STAGING_DIR)/usr/bin/xslt-config --cflags 2>/dev/null`"
+WINE_CONF_OPTS += XSLT_LIBS="`$(STAGING_DIR)/usr/bin/xslt-config --ldflags 2>/dev/null`"
 WINE_DEPENDENCIES += libxslt
 else
 WINE_CONF_OPTS += --without-xslt
-- 
1.9.1
