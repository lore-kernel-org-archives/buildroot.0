From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Dec 2018 16:27:16 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xclock: fix build with pkgconf 1.5.3
Message-ID: <20181214152716.7233-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xclock uses the appdefaultdir variable from xt.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/ea028467a981f419c395158c55aa9a6d16e3f2c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xclock/xapp_xclock.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 282d753ffa..6f8044ef61 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -10,5 +10,6 @@ XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_LICENSE = MIT
 XAPP_XCLOCK_LICENSE_FILES = COPYING
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
+XAPP_XCLOCK_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
-- 
2.14.1
