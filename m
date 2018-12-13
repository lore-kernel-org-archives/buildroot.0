From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Dec 2018 22:02:53 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_editres: fix build with pkgconf 1.5.3
Message-ID: <20181213210253.29287-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_editres uses the appdefaultdir variable from xt.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/938a91641c277c905e77779afe2d0e2ce92ed76d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_editres/xapp_editres.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 1a947d478e..108a0ec351 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -10,5 +10,6 @@ XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_LICENSE = MIT
 XAPP_EDITRES_LICENSE_FILES = COPYING
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
+XAPP_EDITRES_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
-- 
2.14.1
