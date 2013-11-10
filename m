From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 22:34:24 +0100
Subject: [Buildroot] [git commit] freetype: add libpng to freetype-config
	and freetype2.pc
Message-ID: <20131110223451.B46E59BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7313cadf2ca9e0195a873f62f6b6c38a58a3630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add libpng libraries to freetype-config and freetype2.pc when they're
needed to avoid build breakage for other packages.

Patch in a different form is already upstream.

Fixing configure & friends is not so good since autoreconf busts things
up because of the odd way things are done (upstream fixed too it seems).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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
