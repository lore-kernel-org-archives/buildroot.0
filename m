From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 21:40:22 +0100
Subject: [Buildroot] [git commit] xstroke: fix link issue
Message-ID: <20121218204102.F2A3F9A395@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ef90a63e845883aa45cedfdb26ed388d400f044
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The allyespackageconfig builds have trigerred a link issue on
xstroke. In fact, xstroke must be linked against Xrender, Xext and dl
in addition to the other libraries it was already be linked
against. We fix that by adding a patch that modifies configure.ac and
Makefile.am, and enabling autoreconf for this package.

In addition, since xstroke uses directly Xrender and Xext, we add
those dependencies to the package. In practice, it doesn't change
anything, since some of the xstroke dependencies were already pulling
those libraries, but as xstroke uses directly Xrender and Xext, it
makes sense to have them as dependencies as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xstroke/Config.in                     |    2 +
 package/xstroke/xstroke-fix-link-issues.patch |   35 +++++++++++++++++++++++++
 package/xstroke/xstroke.mk                    |    3 +-
 3 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 54cb38e..1269934 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_XSTROKE
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXPM
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Handwriting recognition for X
 
diff --git a/package/xstroke/xstroke-fix-link-issues.patch b/package/xstroke/xstroke-fix-link-issues.patch
new file mode 100644
index 0000000..9a6d71e
--- /dev/null
+++ b/package/xstroke/xstroke-fix-link-issues.patch
@@ -0,0 +1,35 @@
+Fix link issues by linking against all needed libraries
+
+Since gcc 4.6, all libraries that are directly used must be explicitly
+passed on the command line. In the case of xstroke, linking against
+Xrender, Xext and dl was missing. For the first two, they are added
+through addition PKG_CHECK_MODULES() checks, for the latter, it is
+added next to -lm and -lpthread in Makefile.am.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -40,7 +40,7 @@
+ BUILT_SOURCES = rec_parse.h rec_lex.h rec_lex.c
+ AM_YFLAGS = -d
+ 
+-xstroke_LDADD = @XSTROKE_LIBS@ -lm -lpthread $(X_LIBS) -lXpm -lXtst
++xstroke_LDADD = @XSTROKE_LIBS@ -ldl -lm -lpthread $(X_LIBS) -lXpm -lXtst
+ AM_CFLAGS = @XSTROKE_CFLAGS@ -DXSTROKE_CONF_DIR='"$(sysconfdir)/xstroke"' $(X_CFLAGS)
+ 
+ EXTRA_DIST = xstroke_active.xpm xstroke_inactive.xpm etc/alphabet
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,7 +26,7 @@
+ AC_CHECK_FUNCS([gettimeofday localtime_r])
+ 
+ AC_PATH_XTRA
+-PKG_CHECK_MODULES(XSTROKE, xft)
++PKG_CHECK_MODULES(XSTROKE, [xft xrender xext])
+ 
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 3459545..83f347d 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -7,7 +7,8 @@ XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
 XSTROKE_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
 
-XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
+XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm xlib_libXrender xlib_libXext
+XSTROKE_AUTORECONF = YES
 
 $(eval $(autotools-package))
 
