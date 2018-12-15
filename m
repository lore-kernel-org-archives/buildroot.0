From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 12:09:57 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xfontsel: fix build with pkgconf 1.5.3
Message-ID: <20181215110957.32371-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xfontsel uses the appdefaultdir variable from xt.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/d1e1b732b17a2a7b1b2afec9e16cde993211722b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 9dea4299b3..83252803ff 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -10,5 +10,6 @@ XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
+XAPP_XFONTSEL_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
-- 
2.14.1
