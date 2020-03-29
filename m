From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:55:39 +0200
Subject: [Buildroot] [git commit] package/ghostscript: add optional
 dependency to openjpeg
Message-ID: <20200329204239.DFC8689153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d97c2b3c5ec8f9a81a3634011d0c737b0cf3c659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove openjpeg source files included in upstream tarball as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
