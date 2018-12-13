From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:14:37 +0100
Subject: [Buildroot] [git commit] xapp_xclipboard: fix build with pkgconf
 1.5.3
Message-ID: <20181213211051.15D218D2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07b4f8ebe9f65e0eafa0a04b049ef055f724b07c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xclipboard uses the appdefaultdir variable from xt.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/bbca1f77fc5beb1878c43b1abcad64b8e35a77e6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 3620f757d5..d77ac98621 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -10,5 +10,6 @@ XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
+XAPP_XCLIPBOARD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
