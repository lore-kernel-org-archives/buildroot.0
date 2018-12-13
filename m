From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:14:37 +0100
Subject: [Buildroot] [git commit] xapp_xmessage: fix build with pkgconf 1.5.3
Message-ID: <20181213211051.1D1FC8D2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c23a2025f2c08f78c22d0bb064bb85c8507d872c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xmessage uses the appdefaultdir variable from xt.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/ca1ce01dfef8b1a9cbb27e444c0c884f37f9cd7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index bae5da670d..9d426974bd 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -10,5 +10,6 @@ XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
+XAPP_XMESSAGE_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
