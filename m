From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Dec 2018 16:28:42 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xfd: fix build with pkgconf 1.5.3
Message-ID: <20181214152842.7297-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xfd uses the appdefaultdir variable from xt.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/ea9884f4d676849d643d53275ebbc8668074a418

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index e3c770b37c..06c9c83e4a 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -10,5 +10,6 @@ XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_LICENSE = MIT
 XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
+XAPP_XFD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
-- 
2.14.1
