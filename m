From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 Nov 2019 22:10:05 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/ghostscript: add optional
 dependency to openjpeg
In-Reply-To: <20191106211005.16734-1-bernd.kuhls@t-online.de>
References: <20191106211005.16734-1-bernd.kuhls@t-online.de>
Message-ID: <20191106211005.16734-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove openjpeg source files included in upstream tarball as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ghostscript/ghostscript.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index d0f46187c3..1d6f8d04a0 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -28,7 +28,8 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
 define GHOSTSCRIPT_REMOVE_LIBS
 	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jbig2dec $(@D)/jpeg \
-		$(@D)/lcms2mt $(@D)/libpng $(@D)/tiff $(@D)/zlib
+		$(@D)/lcms2mt $(@D)/libpng $(@D)/openjpeg $(@D)/tiff \
+		$(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
@@ -60,6 +61,13 @@ else
 GHOSTSCRIPT_CONF_OPTS += --without-libidn
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+GHOSTSCRIPT_DEPENDENCIES += openjpeg
+GHOSTSCRIPT_CONF_OPTS += --enable-openjpeg
+else
+GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
 GHOSTSCRIPT_CONF_OPTS += --with-x
-- 
2.20.1
