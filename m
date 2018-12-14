From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:23:06 +0100
Subject: [Buildroot] [git commit] xapp_xmap: fix build with pkgconf 1.5.3
Message-ID: <20181214202215.3532686BFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a3a7bdbdf91cde6a42c9295de7762bb9df84dad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xmap uses the appdefaultdir variable from xt.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/725c20ec9621a9c2d4b94784785bb481ff74f0e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xman/xapp_xman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index bca6bbff8d..0d744cc390 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -10,6 +10,7 @@ XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAN_LICENSE = MIT
 XAPP_XMAN_LICENSE_FILES = COPYING
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
+XAPP_XMAN_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 XAPP_XMAN_CONF_ENV = \
 	ac_cv_file__etc_man_conf=no \
