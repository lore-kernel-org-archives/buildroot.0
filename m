From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:14:37 +0100
Subject: [Buildroot] [git commit] xapp_xconsole: fix build with pkgconf 1.5.3
Message-ID: <20181213211051.2B0198D2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef7d11bbabc713fa5836f74e07e1646518f93689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xconsole uses the appdefaultdir variable from xt.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/959986ce1411f14d84da4aafaeb965bf9a847c7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index a91b98dc60..ddec4cfaa3 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -12,5 +12,6 @@ XAPP_XCONSOLE_LICENSE_FILES = COPYING
 XAPP_XCONSOLE_DEPENDENCIES = \
 	xlib_libX11 xlib_libXaw xlib_libXt xorgproto \
 	xlib_libXmu
+XAPP_XCONSOLE_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
