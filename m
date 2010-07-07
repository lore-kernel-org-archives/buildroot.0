From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:56 +0200
Subject: [Buildroot] [PATCH 03/20] xlib_libXt: fix build issues
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ff15966c2ecc9258232ac49edf31c7f904eaf225.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .mk file was hacking the CC_FOR_BUILD value so that
$(STAGING_DIR)/usr/include is added to the include path. This is not
correct since $(STAGING_DIR) contains target stuff, not host
stuff. The correct fix is to add a dependency on host-xproto_xproto,
which will install the needed headers in $(HOST_DIR)/usr/include.

In addition to that, a patch is added to make xlib_libXt build system
behave properly in the cross-compilation case, where the makestrs tool
needs to be built on the host as part of the compilation process. This
was working before because of our quirky TARGET_CONFIGURE_OPTS, but
those are going to be fixed in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xlib_libXt-1.0.7-fix-cross-compile.patch       |   96 ++++++++++++++++++++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    3 +-
 2 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch

diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
new file mode 100644
index 0000000..fc5ea7d
--- /dev/null
+++ b/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
@@ -0,0 +1,96 @@
+From da5ba611fbff6f939a7cec9ca41fa7df0f76a197 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
+Date: Thu, 5 Nov 2009 11:55:22 +0100
+Subject: [PATCH] fix cross-compile again
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+makestrs should always be built for the target arch. When cross-compiling,
+create a native version "xmakestrs" which will always be noinst, and use it
+to generate the other sources.
+
+This avoids installing a makestrs built for the wrong arch.
+
+Based on this patch :
+http://overlays.gentoo.org/proj/embedded/browser/openmoko/trunk/openmoko-target/x11-libs/libXt/files/libXt-1.0.7-crosscompile-makestr.patch
+
+Signed-off-by: R??mi Cardona <remi@gentoo.org>
+---
+ configure.ac     |    2 ++
+ src/Makefile.am  |    8 +++++++-
+ util/Makefile.am |   15 ++++++++++-----
+ 3 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6a66d45..73bfbc0 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,8 @@ AC_PROG_LIBTOOL
+ AM_PROG_CC_C_O
+ XORG_DEFAULT_OPTIONS
+ 
++AM_CONDITIONAL(CROSS_COMPILING, [ test $cross_compiling = yes ])
++
+ if test x"$CC_FOR_BUILD" = x; then
+ 	if test x"$cross_compiling" = xyes; then
+ 		AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a43fb22..6b767a7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -92,12 +92,18 @@ BUILT_FILES = $(BUILT_SOURCE) $(BUILT_HEADER)
+ 
+ STRING_LIST = $(top_srcdir)/util/string.list
+ 
++if CROSS_COMPILING
++MAKESTRS=$(top_builddir)/util/xmakestrs
++else
++MAKESTRS=$(top_builddir)/util/makestrs
++endif
++
+ all-local: $(BUILT_FILES)
+ 
+ $(BUILT_HEADER): $(BUILT_SOURCE)
+ 
+ $(BUILT_SOURCE):
+-	$(top_builddir)/util/makestrs -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
++	$(MAKESTRS) -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
+ 	mkdir -p $(top_builddir)/src
+ 	mkdir -p $(top_builddir)/include/X11
+ 	cp StringDefs.h $(top_builddir)/include/X11
+diff --git a/util/Makefile.am b/util/Makefile.am
+index d51365e..6853d89 100644
+--- a/util/Makefile.am
++++ b/util/Makefile.am
+@@ -1,13 +1,10 @@
+ if INSTALL_MAKESTRS
+ bin_PROGRAMS = makestrs
++noinst_PROGRAMS = $(MAKESTRS_PROG)
+ else
+-noinst_PROGRAMS = makestrs
++noinst_PROGRAMS = makestrs $(MAKESTRS_PROG)
+ endif
+ 
+-CC = @CC_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = \
+ 	Shell.ht \
+ 	StrDefs.ct \
+@@ -45,3 +42,11 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
+ 
+ .man.$(APP_MAN_SUFFIX):
+ 	$(AM_V_GEN)$(SED) $(MAN_SUBSTS) < $< > $@
++
++if CROSS_COMPILING
++MAKESTRS_PROG=xmakestrs$(EXEEXT)
++
++xmakestrs$(EXEEXT): makestrs.c
++	$(AM_V_GEN)$(CC_FOR_BUILD) $(X11_CFLAGS) $(CPPFLAGS_FOR_BUILD) \
++	$(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ makestrs.c
++endif
+-- 
+1.6.5.2
+
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index e3e43e4..38ebe1c 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -10,8 +10,7 @@ XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = YES
 XLIB_LIBXT_LIBTOOL_PATCH = NO
 XLIB_LIBXT_INSTALL_STAGING = YES
-XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb
-XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
+XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static --disable-install-makestrs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXt))
-- 
1.7.0.4
