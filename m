From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:06:16 +0200
Subject: [Buildroot] [git commit] xlib_libXt: bump version
Message-ID: <20120922194121.87376996DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfc29d721a890c4ee05eac73b4b2737bddfd260f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Allan W. Nielsen.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xlib_libXt-1.0.7-fix-cross-compile.patch       |   96 --------------------
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    3 +-
 2 files changed, 1 insertions(+), 98 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
deleted file mode 100644
index fc5ea7d..0000000
--- a/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From da5ba611fbff6f939a7cec9ca41fa7df0f76a197 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
-Date: Thu, 5 Nov 2009 11:55:22 +0100
-Subject: [PATCH] fix cross-compile again
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-makestrs should always be built for the target arch. When cross-compiling,
-create a native version "xmakestrs" which will always be noinst, and use it
-to generate the other sources.
-
-This avoids installing a makestrs built for the wrong arch.
-
-Based on this patch :
-http://overlays.gentoo.org/proj/embedded/browser/openmoko/trunk/openmoko-target/x11-libs/libXt/files/libXt-1.0.7-crosscompile-makestr.patch
-
-Signed-off-by: R??mi Cardona <remi@gentoo.org>
----
- configure.ac     |    2 ++
- src/Makefile.am  |    8 +++++++-
- util/Makefile.am |   15 ++++++++++-----
- 3 files changed, 19 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6a66d45..73bfbc0 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,6 +40,8 @@ AC_PROG_LIBTOOL
- AM_PROG_CC_C_O
- XORG_DEFAULT_OPTIONS
- 
-+AM_CONDITIONAL(CROSS_COMPILING, [ test $cross_compiling = yes ])
-+
- if test x"$CC_FOR_BUILD" = x; then
- 	if test x"$cross_compiling" = xyes; then
- 		AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
-diff --git a/src/Makefile.am b/src/Makefile.am
-index a43fb22..6b767a7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -92,12 +92,18 @@ BUILT_FILES = $(BUILT_SOURCE) $(BUILT_HEADER)
- 
- STRING_LIST = $(top_srcdir)/util/string.list
- 
-+if CROSS_COMPILING
-+MAKESTRS=$(top_builddir)/util/xmakestrs
-+else
-+MAKESTRS=$(top_builddir)/util/makestrs
-+endif
-+
- all-local: $(BUILT_FILES)
- 
- $(BUILT_HEADER): $(BUILT_SOURCE)
- 
- $(BUILT_SOURCE):
--	$(top_builddir)/util/makestrs -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
-+	$(MAKESTRS) -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
- 	mkdir -p $(top_builddir)/src
- 	mkdir -p $(top_builddir)/include/X11
- 	cp StringDefs.h $(top_builddir)/include/X11
-diff --git a/util/Makefile.am b/util/Makefile.am
-index d51365e..6853d89 100644
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -1,13 +1,10 @@
- if INSTALL_MAKESTRS
- bin_PROGRAMS = makestrs
-+noinst_PROGRAMS = $(MAKESTRS_PROG)
- else
--noinst_PROGRAMS = makestrs
-+noinst_PROGRAMS = makestrs $(MAKESTRS_PROG)
- endif
- 
--CC = @CC_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = \
- 	Shell.ht \
- 	StrDefs.ct \
-@@ -45,3 +42,11 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
- 
- .man.$(APP_MAN_SUFFIX):
- 	$(AM_V_GEN)$(SED) $(MAN_SUBSTS) < $< > $@
-+
-+if CROSS_COMPILING
-+MAKESTRS_PROG=xmakestrs$(EXEEXT)
-+
-+xmakestrs$(EXEEXT): makestrs.c
-+	$(AM_V_GEN)$(CC_FOR_BUILD) $(X11_CFLAGS) $(CPPFLAGS_FOR_BUILD) \
-+	$(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ makestrs.c
-+endif
--- 
-1.6.5.2
-
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 740dc17..b2667d3 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.0.7
+XLIB_LIBXT_VERSION = 1.0.9
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXT_AUTORECONF = YES
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
