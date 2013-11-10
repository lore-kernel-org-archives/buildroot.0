From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 10 Nov 2013 11:03:09 -0300
Subject: [Buildroot] [PATCH] freetype: add libpng to freetype-config and
	freetype2.pc
Message-ID: <1384092189-4590-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add libpng libraries to freetype-config and freetype2.pc when they're
needed to avoid build breakage for other packages.

Patch in a different form is already upstream.

Fixing configure & friends is not so good since autoreconf busts things
up because of the odd way things are done (upstream fixed too it seems).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index cc5fbf8..1e378d3 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -37,6 +37,7 @@ ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
 FREETYPE_CONF_OPT += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
 	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
+FREETYPE_LIBPNG_LIBS = "`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
 else
 FREETYPE_CONF_OPT += --without-png
 endif
@@ -49,5 +50,14 @@ define FREETYPE_FIX_CONFIG_FILE
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE
 
+# libpng isn't included in freetype-config & freetype2.pc :-/
+define FREETYPE_FIX_CONFIG_FILE_LIBS
+	$(SED) "s,^Libs.private:,& $(FREETYPE_LIBPNG_LIBS)," \
+		$(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
+	$(SED) "s,-lfreetype,& $(FREETYPE_LIBPNG_LIBS)," \
+		$(STAGING_DIR)/usr/bin/freetype-config
+endef
+FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
