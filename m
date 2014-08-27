From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 27 Aug 2014 23:53:21 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/xscreensaver: fix linking with
	intl
Message-ID: <1409176401-13970-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xscreensaver doesn't build with (e)glibc toolchain when gettext package is
selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
by gettext.

If "LIBS=-lintl" is removed from XSCREENSAVER_CONF_ENV, then the -lintl is
missing during xscreensaver build if the toolchain needs gettext.

xscreensaver.o: In function `main':
undefined reference to `libintl_bindtextdomain'
undefined reference to `libintl_textdomain'

Backport a patch applied in 5.28 that fix linking issue with intl and remove
"LIBS=-lintl" from XSCREENSAVER_CONF_ENV.

Note:
gettext package is always selected with xscreensaver when BR2_NEEDS_GETTEXT is
set due to dependencies on libgtk2 and libglib2.

Fixes:
http://autobuild.buildroot.net/results/39b/39b6ad07ad59d87afeca6e427c69f580bed35700/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3:
    Check if xscreensaver needs gettext if BR2_NEEDS_GETTEXT or
    BR2_NEEDS_GETTEXT_IF_LOCALE (Thomas Petazzoni)
    Select gettext only if BR2_NEEDS_GETTEXT_IF_LOCALE is set
    Add a backported patch to fix the linking issue with intl
    Remove "LIBS=-lintl" from XSCREENSAVER_CONF_ENV
v2:
    Select gettext package only when the toolchain needs gettext (Thomas Petazzoni)
    (ie: when BR2_NEEDS_GETTEXT is set)
    Build tested with an glibc based toolchain and without gettext package selected.
    Build tested with an uClibc based toolchain and with gettext package selected.
---
 package/xscreensaver/Config.in                     |  1 +
 ...nsaver-0003-driver-fix-linking-with-lintl.patch | 35 ++++++++++++++++++++++
 package/xscreensaver/xscreensaver.mk               |  2 --
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index e2534a6..6260040 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  XScreenSaver is the standard screen saver collection shipped on most
 	  Linux and Unix systems running the X11 Window System.
diff --git a/package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch b/package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch
new file mode 100644
index 0000000..51551c6
--- /dev/null
+++ b/package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch
@@ -0,0 +1,35 @@
+From 2336fa7901733a434c38637bf39f3e282e78e1c1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 27 Aug 2014 22:44:21 +0200
+Subject: [PATCH 1/1] driver: fix linking with lintl
+
+The libintl is missing during xscreensaver build if
+glib2 was build with gettext.
+
+xscreensaver.o: In function `main':
+undefined reference to `libintl_bindtextdomain'
+undefined reference to `libintl_textdomain'
+
+Backport a patch applied in 5.28
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ driver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/driver/Makefile.in b/driver/Makefile.in
+index af077ca..ce7055c 100644
+--- a/driver/Makefile.in
++++ b/driver/Makefile.in
+@@ -776,7 +776,7 @@ XScreenSaver_Xm_ad.h: XScreenSaver-Xm.ad
+ # The executables linked in this directory.
+ #
+ xscreensaver: $(SAVER_OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $(SAVER_OBJS) $(SAVER_LIBS)
++	$(CC) $(LDFLAGS) -o $@ $(SAVER_OBJS) $(SAVER_LIBS) $(INTL_LIBS)
+ 
+ xscreensaver-command: $(CMD_OBJS)
+ 	$(CC) $(LDFLAGS) -o $@ $(CMD_OBJS) $(CMD_LIBS)
+-- 
+1.9.3
+
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 0e84d27..751a0c9 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -14,8 +14,6 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 
-XSCREENSAVER_CONF_ENV = $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
-
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
 XSCREENSAVER_CONF_OPT = \
-- 
1.9.3
