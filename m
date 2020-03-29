From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:55:29 +0200
Subject: [Buildroot] [git commit] package/ghostscript: add optional
 dependency to jbig2dec
Message-ID: <20200329204239.D5E8C89153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3c1e64a23bdc20e388276cff2f016bb78f03d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove jbig2dec source files included in upstream tarball as well.

Needs http://patchwork.ozlabs.org/patch/1161981/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ghostscript/ghostscript.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index a6e85d9894..d0f46187c3 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -27,8 +27,8 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
 define GHOSTSCRIPT_REMOVE_LIBS
-	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2mt \
-		$(@D)/libpng $(@D)/tiff $(@D)/zlib
+	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jbig2dec $(@D)/jpeg \
+		$(@D)/lcms2mt $(@D)/libpng $(@D)/tiff $(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
@@ -43,10 +43,16 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--with-fontpath=/usr/share/fonts \
 	--enable-freetype \
 	--disable-gtk \
-	--without-jbig2dec \
 	--without-libpaper \
 	--with-system-libtiff
 
+ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
+GHOSTSCRIPT_DEPENDENCIES += jbig2dec
+GHOSTSCRIPT_CONF_OPTS += --with-jbig2dec
+else
+GHOSTSCRIPT_CONF_OPTS += --without-jbig2dec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
 GHOSTSCRIPT_DEPENDENCIES += libidn
 GHOSTSCRIPT_CONF_OPTS += --with-libidn
