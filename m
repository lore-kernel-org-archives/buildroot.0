From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 04:59:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070129125918.82D6C485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 04:59:17 -0800 (Mon, 29 Jan 2007)
New Revision: 17630

Log:
- make fontconfig a little bit saner. It still tries to use the target stuff to create the binaries intended to run on the host, but this is a first step


Added:
   trunk/buildroot/package/fontconfig/002-fix-crosscompile-CC_FOR_BUILD-flags.patch
   trunk/buildroot/package/fontconfig/003-autoreconf.patch

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Added: trunk/buildroot/package/fontconfig/002-fix-crosscompile-CC_FOR_BUILD-flags.patch
===================================================================
--- trunk/buildroot/package/fontconfig/002-fix-crosscompile-CC_FOR_BUILD-flags.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/002-fix-crosscompile-CC_FOR_BUILD-flags.patch	2007-01-29 12:59:17 UTC (rev 17630)
@@ -0,0 +1,84 @@
+diff -X ../excl -rdup fontconfig-2.4.2.orig/configure.in fontconfig-2.4.2/configure.in
+--- fontconfig-2.4.2.orig/configure.in	2006-12-03 00:24:39.000000000 +0100
++++ fontconfig-2.4.2/configure.in	2007-01-16 17:54:48.000000000 +0100
+@@ -97,6 +97,10 @@ AM_CONDITIONAL(CROSS_COMPILING, test $cr
+ 
+ dnl ==========================================================================
+ 
++if test "x$BUILD_CFLAGS" = "x"; then
++	BUILD_CFLAGS="-O2 "
++fi
++AC_SUBST(BUILD_CFLAGS)
+ # Setup for compiling build tools (fc-glyphname, etc)
+ AC_MSG_CHECKING([for a C compiler for build tools])
+ if test $cross_compiling = yes; then
+diff -X ../excl -rdup fontconfig-2.4.2.orig/doc/Makefile.am fontconfig-2.4.2/doc/Makefile.am
+--- fontconfig-2.4.2.orig/doc/Makefile.am	2006-12-02 23:14:42.000000000 +0100
++++ fontconfig-2.4.2/doc/Makefile.am	2007-01-16 17:47:17.000000000 +0100
+@@ -22,8 +22,9 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ 
+ CC = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ 
+ DOC_SRC = $(srcdir)
+ DOC_MODULE = fontconfig
+diff -X ../excl -rdup fontconfig-2.4.2.orig/fc-arch/Makefile.am fontconfig-2.4.2/fc-arch/Makefile.am
+--- fontconfig-2.4.2.orig/fc-arch/Makefile.am	2006-09-05 11:05:07.000000000 +0200
++++ fontconfig-2.4.2/fc-arch/Makefile.am	2007-01-16 17:48:11.000000000 +0100
+@@ -23,8 +23,9 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ 
+diff -X ../excl -rdup fontconfig-2.4.2.orig/fc-case/Makefile.am fontconfig-2.4.2/fc-case/Makefile.am
+--- fontconfig-2.4.2.orig/fc-case/Makefile.am	2006-09-05 11:04:31.000000000 +0200
++++ fontconfig-2.4.2/fc-case/Makefile.am	2007-01-16 17:48:03.000000000 +0100
+@@ -23,8 +23,9 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ 
+diff -X ../excl -rdup fontconfig-2.4.2.orig/fc-glyphname/Makefile.am fontconfig-2.4.2/fc-glyphname/Makefile.am
+--- fontconfig-2.4.2.orig/fc-glyphname/Makefile.am	2006-09-05 11:04:47.000000000 +0200
++++ fontconfig-2.4.2/fc-glyphname/Makefile.am	2007-01-16 17:47:37.000000000 +0100
+@@ -23,8 +23,9 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ 
+diff -X ../excl -rdup fontconfig-2.4.2.orig/fc-lang/Makefile.am fontconfig-2.4.2/fc-lang/Makefile.am
+--- fontconfig-2.4.2.orig/fc-lang/Makefile.am	2006-09-05 11:03:45.000000000 +0200
++++ fontconfig-2.4.2/fc-lang/Makefile.am	2007-01-16 17:47:49.000000000 +0100
+@@ -23,8 +23,9 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ 

Added: trunk/buildroot/package/fontconfig/003-autoreconf.patch
===================================================================
--- trunk/buildroot/package/fontconfig/003-autoreconf.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/003-autoreconf.patch	2007-01-29 12:59:17 UTC (rev 17630)
@@ -0,0 +1,275 @@
+diff -rdup fontconfig-2.4.2.orig/Makefile.in fontconfig-2.4.2/Makefile.in
+--- fontconfig-2.4.2.orig/Makefile.in	2006-12-03 00:27:34.000000000 +0100
++++ fontconfig-2.4.2/Makefile.in	2007-01-16 18:08:30.000000000 +0100
+@@ -122,6 +122,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+diff -rdup fontconfig-2.4.2.orig/doc/Makefile.in fontconfig-2.4.2/doc/Makefile.in
+--- fontconfig-2.4.2.orig/doc/Makefile.in	2006-12-03 00:27:32.000000000 +0100
++++ fontconfig-2.4.2/doc/Makefile.in	2007-01-16 18:10:09.000000000 +0100
+@@ -79,10 +79,10 @@ DEFAULT_INCLUDES = -I. -I$(srcdir) -I$(t
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+ COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
++	$(CPPFLAGS) $(AM_CFLAGS) $(BUILD_CFLAGS)
+ LTCOMPILE = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(DEFS) \
+ 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	$(AM_CFLAGS) $(CFLAGS)
++	$(AM_CFLAGS) $(BUILD_CFLAGS)
+ CCLD = $(CC)
+ SOURCES = $(edit_sgml_SOURCES)
+ DIST_SOURCES = $(edit_sgml_SOURCES)
+@@ -118,6 +118,7 @@ AWK = @AWK@
+ CC = @CC_FOR_BUILD@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+@@ -254,7 +255,7 @@ sbindir = @sbindir@
+ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ DOC_SRC = $(srcdir)
+ DOC_MODULE = fontconfig
+ DOC2HTML = docbook2html
+diff -rdup fontconfig-2.4.2.orig/fc-arch/Makefile.in fontconfig-2.4.2/fc-arch/Makefile.in
+--- fontconfig-2.4.2.orig/fc-arch/Makefile.in	2006-12-03 00:27:32.000000000 +0100
++++ fontconfig-2.4.2/fc-arch/Makefile.in	2007-01-16 18:24:19.000000000 +0100
+@@ -80,10 +80,10 @@ DEFAULT_INCLUDES = -I. -I$(srcdir) -I$(t
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+ COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
++	$(CPPFLAGS) $(AM_CFLAGS) $(BUILD_CFLAGS)
+ LTCOMPILE = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(DEFS) \
+ 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	$(AM_CFLAGS) $(CFLAGS)
++	$(AM_CFLAGS) $(BUILD_CFLAGS)
+ CCLD = $(CC)
+ SOURCES = fc-arch.c
+ DIST_SOURCES = fc-arch.c
+@@ -105,6 +105,7 @@ AWK = @AWK@
+ CC = @CC_FOR_BUILD@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+@@ -241,7 +242,7 @@ sbindir = @sbindir@
+ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ INCLUDES = -I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ TMPL = fcarch.tmpl.h
+ STMPL = ${top_srcdir}/fc-arch/fcarch.tmpl.h
+diff -rdup fontconfig-2.4.2.orig/fc-case/Makefile.in fontconfig-2.4.2/fc-case/Makefile.in
+--- fontconfig-2.4.2.orig/fc-case/Makefile.in	2006-12-03 00:27:32.000000000 +0100
++++ fontconfig-2.4.2/fc-case/Makefile.in	2007-01-16 18:23:16.000000000 +0100
+@@ -80,10 +80,10 @@ DEFAULT_INCLUDES = -I. -I$(srcdir) -I$(t
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+ COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
++	$(CPPFLAGS) $(AM_CFLAGS) $(BUILD_CFLAGS)
+ LTCOMPILE = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(DEFS) \
+ 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	$(AM_CFLAGS) $(CFLAGS)
++	$(AM_CFLAGS) $(BUILD_CFLAGS)
+ CCLD = $(CC)
+ SOURCES = fc-case.c
+ DIST_SOURCES = fc-case.c
+@@ -105,6 +105,7 @@ AWK = @AWK@
+ CC = @CC_FOR_BUILD@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+@@ -241,7 +242,7 @@ sbindir = @sbindir@
+ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ INCLUDES = -I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ TMPL = fccase.tmpl.h
+ STMPL = ${top_srcdir}/fc-case/${TMPL}
+diff -rdup fontconfig-2.4.2.orig/fc-cat/Makefile.in fontconfig-2.4.2/fc-cat/Makefile.in
+--- fontconfig-2.4.2.orig/fc-cat/Makefile.in	2006-12-03 00:27:32.000000000 +0100
++++ fontconfig-2.4.2/fc-cat/Makefile.in	2007-01-16 18:13:33.000000000 +0100
+@@ -110,6 +110,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+diff -rdup fontconfig-2.4.2.orig/fc-glyphname/Makefile.in fontconfig-2.4.2/fc-glyphname/Makefile.in
+--- fontconfig-2.4.2.orig/fc-glyphname/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/fc-glyphname/Makefile.in	2007-01-16 18:10:59.000000000 +0100
+@@ -80,10 +80,10 @@ DEFAULT_INCLUDES = -I. -I$(srcdir) -I$(t
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+ COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
++	$(CPPFLAGS) $(AM_CFLAGS) $(BUILD_CFLAGS)
+ LTCOMPILE = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(DEFS) \
+ 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	$(AM_CFLAGS) $(CFLAGS)
++	$(AM_CFLAGS) $(BUILD_CFLAGS)
+ CCLD = $(CC)
+ SOURCES = fc-glyphname.c
+ DIST_SOURCES = fc-glyphname.c
+@@ -105,6 +105,7 @@ AWK = @AWK@
+ CC = @CC_FOR_BUILD@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+@@ -241,7 +242,7 @@ sbindir = @sbindir@
+ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ INCLUDES = -I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
+ TMPL = fcglyphname.tmpl.h
+ STMPL = ${top_srcdir}/fc-glyphname/${TMPL}
+diff -rdup fontconfig-2.4.2.orig/fc-list/Makefile.in fontconfig-2.4.2/fc-list/Makefile.in
+--- fontconfig-2.4.2.orig/fc-list/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/fc-list/Makefile.in	2007-01-16 18:20:18.000000000 +0100
+@@ -110,6 +110,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+diff -rdup fontconfig-2.4.2.orig/fontconfig/Makefile.in fontconfig-2.4.2/fontconfig/Makefile.in
+--- fontconfig-2.4.2.orig/fontconfig/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/fontconfig/Makefile.in	2007-01-16 18:12:57.000000000 +0100
+@@ -74,6 +74,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+diff -rdup fontconfig-2.4.2.orig/src/Makefile.in fontconfig-2.4.2/src/Makefile.in
+--- fontconfig-2.4.2.orig/src/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/src/Makefile.in	2007-01-16 18:21:17.000000000 +0100
+@@ -119,6 +119,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/conf.d/Makefile.in	2006-12-03 00:27:31.000000000 +0100
++++ fontconfig-2.4.2/conf.d/Makefile.in	2007-01-16 18:35:32.000000000 +0100
+@@ -94,6 +94,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/fc-lang/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/fc-lang/Makefile.in	2007-01-16 18:38:07.000000000 +0100
+@@ -105,6 +105,7 @@ AWK = @AWK@
+ CC = @CC_FOR_BUILD@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/test/Makefile.in	2006-12-03 00:27:34.000000000 +0100
++++ fontconfig-2.4.2/test/Makefile.in	2007-01-16 18:38:20.000000000 +0100
+@@ -61,6 +61,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/fc-cache/Makefile.in	2006-12-03 00:27:32.000000000 +0100
++++ fontconfig-2.4.2/fc-cache/Makefile.in	2007-01-16 18:38:26.000000000 +0100
+@@ -110,6 +110,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/fc-match/Makefile.in	2006-12-03 00:27:33.000000000 +0100
++++ fontconfig-2.4.2/fc-match/Makefile.in	2007-01-16 18:40:17.000000000 +0100
+@@ -110,6 +110,7 @@ AWK = @AWK@
+ CC = @CC@
+ CCDEPMODE = @CCDEPMODE@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
++BUILD_CFLAGS = @BUILD_CFLAGS@
+ CFLAGS = @CFLAGS@
+ CONFDIR = @CONFDIR@
+ CPP = @CPP@
+--- fontconfig-2.4.2.orig/configure	2006-12-03 00:27:35.000000000 +0100
++++ fontconfig-2.4.2/configure	2007-01-16 18:54:49.000000000 +0100
+@@ -871,6 +871,7 @@ WARN_CFLAGS
+ CROSS_COMPILING_TRUE
+ CROSS_COMPILING_FALSE
+ CC_FOR_BUILD
++BUILD_CFLAGS
+ EXEEXT_FOR_BUILD
+ ARCHITECTURE
+ ICONV_LIBS
+@@ -20231,7 +20232,9 @@ else
+   CROSS_COMPILING_FALSE=
+ fi
+ 
+-
++if test "x$BUILD_CFLAGS" = "x"; then
++  BUILD_CFLAGS="-O2 "
++fi
+ 
+ # Setup for compiling build tools (fc-glyphname, etc)
+ { echo "$as_me:$LINENO: checking for a C compiler for build tools" >&5
+@@ -24541,6 +24544,7 @@ WARN_CFLAGS!$WARN_CFLAGS$ac_delim
+ CROSS_COMPILING_TRUE!$CROSS_COMPILING_TRUE$ac_delim
+ CROSS_COMPILING_FALSE!$CROSS_COMPILING_FALSE$ac_delim
+ CC_FOR_BUILD!$CC_FOR_BUILD$ac_delim
++BUILD_CFLAGS!$BUILD_CFLAGS$ac_delim
+ EXEEXT_FOR_BUILD!$EXEEXT_FOR_BUILD$ac_delim
+ ARCHITECTURE!$ARCHITECTURE$ac_delim
+ ICONV_LIBS!$ICONV_LIBS$ac_delim
+@@ -24575,7 +24579,7 @@ LIBOBJS!$LIBOBJS$ac_delim
+ LTLIBOBJS!$LTLIBOBJS$ac_delim
+ _ACEOF
+ 
+-  if test `sed -n "s/.*$ac_delim\$/X/p" conf$$subs.sed | grep -c X` = 54; then
++  if test `sed -n "s/.*$ac_delim\$/X/p" conf$$subs.sed | grep -c X` = 55; then
+     break
+   elif $ac_last_try; then
+     { { echo "$as_me:$LINENO: error: could not make $CONFIG_STATUS" >&5

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-29 12:55:00 UTC (rev 17629)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-29 12:59:17 UTC (rev 17630)
@@ -24,7 +24,7 @@
 	(cd $(FONTCONFIG_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
-	CCexe="$(HOSTCC)" \
+	BUILD_CFLAGS="-O2 -I$(FREETYPE_HOST_DIR)/include/freetype2 -I$(FREETYPE_HOST_DIR)/include" \
 	ac_cv_func_mmap_fixed_mapped=yes \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
@@ -49,7 +49,7 @@
 	touch $(FONTCONFIG_DIR)/.configured
 
 $(FONTCONFIG_DIR)/.compiled: $(FONTCONFIG_DIR)/.configured
-	$(MAKE) CCexe="$(HOSTCC)" -C $(FONTCONFIG_DIR)
+	$(MAKE) -C $(FONTCONFIG_DIR)
 	touch $(FONTCONFIG_DIR)/.compiled
 
 $(STAGING_DIR)/lib/libfontconfig.so: $(FONTCONFIG_DIR)/.compiled
@@ -69,7 +69,7 @@
 	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-list
 
-fontconfig: uclibc freetype $(TARGET_DIR)/lib/libfontconfig.so
+fontconfig: uclibc freetype host-freetype $(TARGET_DIR)/lib/libfontconfig.so
 
 fontconfig-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall
