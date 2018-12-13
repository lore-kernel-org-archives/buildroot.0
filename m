From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Dec 2018 21:59:52 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_beforelight: fix build with pkgconf
 1.5.3
Message-ID: <20181213205952.29015-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_beforelight uses the appdefaultdir variable from xt.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/164bb80f261f48525de508b5f74321f2fec91cce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_beforelight/xapp_beforelight.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index b39fe7870e..7dcb715ef3 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -10,5 +10,6 @@ XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BEFORELIGHT_LICENSE = MIT
 XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
+XAPP_BEFORELIGHT_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
-- 
2.14.1
