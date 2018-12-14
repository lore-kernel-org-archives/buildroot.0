From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:23:13 +0100
Subject: [Buildroot] [git commit] xapp_xedit: fix build with pkgconf 1.5.3
Message-ID: <20181214202215.3BF8D80E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72f3e2c0e5b87376ee27df8dd03b1b6a018090a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xapp_xedit uses the appdefaultdir variable from xt.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on xt.pc.

Fixes:
 - http://autobuild.buildroot.org/results/1b46f950fc0d957d04c0a60a24176d701ff16bd9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xedit/xapp_xedit.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 0f42e2cb0d..1cb99dc6f4 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -11,6 +11,8 @@ XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw
 
-XAPP_XEDIT_CONF_OPTS = --disable-selective-werror
+XAPP_XEDIT_CONF_OPTS = \
+	--disable-selective-werror \
+	--with-appdefaultdir=/usr/share/X11/app-defaults
 
 $(eval $(autotools-package))
