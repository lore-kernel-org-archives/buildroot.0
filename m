From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 26 Aug 2014 01:13:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xscreensaver: fix linking with
	intl
Message-ID: <1409008386-21000-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xscreensaver doesn't build with (e)glibc toolchain when gettext package is selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.

Linking with intl is only needed if the toolchain needs gettext.

Fixes:
http://autobuild.buildroot.net/results/39b/39b6ad07ad59d87afeca6e427c69f580bed35700/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
V2:
    Select gettext package only when the toolchain needs gettext (Thomas Petazzoni)
    (ie: when BR2_NEEDS_GETTEXT is set)
    Build tested with an glibc based toolchain and without gettext package selected.
    Build tested with an uClibc based toolchain and with gettext package selected.
---
 package/xscreensaver/Config.in       | 1 +
 package/xscreensaver/xscreensaver.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index e2534a6..11c01ae 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  XScreenSaver is the standard screen saver collection shipped on most
 	  Linux and Unix systems running the X11 Window System.
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 0e84d27..dba15bf 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -12,9 +12,10 @@ XSCREENSAVER_LICENSE = MIT-like GPLv2+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+	$(if $(BR2_NEEDS_GETTEXT),gettext)
 
-XSCREENSAVER_CONF_ENV = $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
+# Linking with intl is only needed when the toolchain needs gettext
+XSCREENSAVER_CONF_ENV = $(if $(BR2_NEEDS_GETTEXT),LIBS=-lintl)
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
-- 
1.9.3
