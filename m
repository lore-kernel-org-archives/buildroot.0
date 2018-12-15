From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 15:39:54 +0100
Subject: [Buildroot] [PATCH 1/1] xdata_xcursor-themes: fix build with
 pkgconf 1.5.3
Message-ID: <20181215143954.854-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

xdata_xcursor-themes uses the icondir variable from xcursor.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the cursordir to use
explicitly instead of relying on xcursor.pc.

Fixes:
 - http://autobuild.buildroot.org/results/ddb6d634085e4e364b78b182c3c6ef9764420626

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 048291008b..19cb67cc75 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -12,5 +12,6 @@ XDATA_XCURSOR_THEMES_LICENSE_FILES = COPYING
 
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
+XDATA_XCURSOR_THEMES_CONF_OPTS = --with-cursordir=/usr/share/icons
 
 $(eval $(autotools-package))
-- 
2.14.1
