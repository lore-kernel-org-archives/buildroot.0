From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Dec 2018 22:06:27 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_oclock: fix build with pkgconf 1.5.3
Message-ID: <20181213210627.29611-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_oclock uses the appdefaultdir variable from xt.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/77c57f68039b4490e70a3d15ca6f4b9e945d12e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_oclock/xapp_oclock.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 833d151404..0f94cf8c13 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -10,6 +10,7 @@ XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_LICENSE = MIT
 XAPP_OCLOCK_LICENSE_FILES = COPYING
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
+XAPP_OCLOCK_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
 XAPP_OCLOCK_CONF_OPTS += --with-xkb
-- 
2.14.1
