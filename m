From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Dec 2018 22:04:50 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xload: fix build with pkgconf 1.5.3
Message-ID: <20181213210450.29474-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xload uses the appdefaultdir variable from xt.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/722c1bdfb3f38a13be7a40793a8df4f0324885f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xload/xapp_xload.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index b44a51b5fd..605359bab6 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -10,6 +10,7 @@ XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
+XAPP_XLOAD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 # musl doesn't have rwhod.h, but xload can replace it with stubs
-- 
2.14.1
