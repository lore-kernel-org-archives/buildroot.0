From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 21 Mar 2015 16:38:27 +0100
Subject: [Buildroot] [PATCH 2/4] wine: Add xlib_libXext dependency
Message-ID: <550D9073.2000901@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes window size issues.

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index bd242cf..188c7cc 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -27,9 +27,7 @@ WINE_CONF_OPTS = \
 	--without-openal \
 	--without-opencl \
 	--without-osmesa \
-	--without-oss \
-	--without-xshape \
-	--without-xshm
+	--without-oss
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
@@ -207,6 +205,13 @@ else
 WINE_CONF_OPTS += --without-xcursor
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+WINE_CONF_OPTS += --with-xshape --with-xshm
+WINE_DEPENDENCIES += xlib_libXext
+else
+WINE_CONF_OPTS += --without-xshape --without-xshm
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 WINE_CONF_OPTS += --with-xinput --with-xinput2
 WINE_DEPENDENCIES += xlib_libXi
-- 
1.9.1
