From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 19:10:31 +0000 (UTC)
Subject: [Buildroot] svn commit: [25881]
	trunk/buildroot/package/x11r7/xlib_libX11
Message-ID: <20090329191031.28B0477487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-29 19:10:30 +0000 (Sun, 29 Mar 2009)
New Revision: 25881

Log:
libX11: fix build on hosts without libx11-dev

Make sure the build doesn't use keysymdef.h from the host.

Added:
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch

Removed:
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-makekeys-nocc.patch

Modified:
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk


Changeset:
Added: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch	2009-03-29 19:10:30 UTC (rev 25881)
@@ -0,0 +1,40 @@
+[patch]: configure: add --with-keysymdef argument for cross compilation
+
+Based on a similar patch from Openembedded.
+
+The libX11 configure script hardcodes the location to keysymdef.h as
+<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
+but breaks with cross compilation as that directory is a location on
+the target, not the build host.
+
+Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
+===================================================================
+--- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
++++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
+@@ -221,13 +221,21 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	dir=`pkg-config --variable=includedir xproto`
++	KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+-        AC_MSG_RESULT([$KEYSYMDEF])
++	AC_MSG_RESULT([$KEYSYMDEF])
+ else
+ 	AC_MSG_ERROR([Cannot find keysymdef.h])
+ fi
++
+ AC_SUBST(KEYSYMDEF)
+ 
+ AM_CONDITIONAL(UDC, test xfalse = xtrue)

Deleted: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-makekeys-nocc.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-makekeys-nocc.patch	2009-03-29 19:10:26 UTC (rev 25880)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-makekeys-nocc.patch	2009-03-29 19:10:30 UTC (rev 25881)
@@ -1,38 +0,0 @@
-diff -urN xlib_libX11-1.1.5.orig/src/util/Makefile.in xlib_libX11-1.1.5/src/util/Makefile.in
---- xlib_libX11-1.1.5.orig/src/util/Makefile.in	2009-01-31 19:59:12.000000000 -0800
-+++ xlib_libX11-1.1.5/src/util/Makefile.in	2009-01-31 19:59:53.000000000 -0800
-@@ -50,9 +50,8 @@
- makekeys_SOURCES = makekeys.c
- makekeys_OBJECTS = makekeys-makekeys.$(OBJEXT)
- makekeys_LDADD = $(LDADD)
--makekeys_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
--	--mode=link $(CCLD) $(makekeys_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
--	$(LDFLAGS) -o $@
-+HOST_CC = gcc
-+makekeys_LINK = $(HOST_CC) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
- DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/src -I$(top_builddir)/include/X11
- depcomp = $(SHELL) $(top_srcdir)/depcomp
- am__depfiles_maybe = depfiles
-@@ -311,18 +310,18 @@
- @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
- 
- makekeys-makekeys.o: makekeys.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.o -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
-+ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makekeys-makekeys.o -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
- @am__fastdepCC_TRUE@	mv -f $(DEPDIR)/makekeys-makekeys.Tpo $(DEPDIR)/makekeys-makekeys.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makekeys.c' object='makekeys-makekeys.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
- 
- makekeys-makekeys.obj: makekeys.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.obj -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
-+ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makekeys-makekeys.obj -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
- @am__fastdepCC_TRUE@	mv -f $(DEPDIR)/makekeys-makekeys.Tpo $(DEPDIR)/makekeys-makekeys.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makekeys.c' object='makekeys-makekeys.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo

Modified: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2009-03-29 19:10:26 UTC (rev 25880)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2009-03-29 19:10:30 UTC (rev 25881)
@@ -7,10 +7,25 @@
 XLIB_LIBX11_VERSION = 1.1.5
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBX11_AUTORECONF = NO
+XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
-XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
-XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static
+XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes
+XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static --with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
+
+# src/util/makekeys is executed@build time to generate ks_tables.h, so
+# it should get compiled for the host. The libX11 makefile unfortunately
+# doesn't know about cross compilation so this doesn't work.
+# Long term, we should probably teach it about HOSTCC / HOST_CFLAGS, but for
+# now simply disable the src/util Makefile and build makekeys by hand in
+# advance
+$(XLIB_LIBX11_HOOK_POST_EXTRACT):
+	echo '' > $(@D)/src/util/Makefile.am
+	touch $@
+
+$(XLIB_LIBX11_HOOK_POST_CONFIGURE):
+	cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
+		-I$(STAGING_DIR)/usr/include -o makekeys makekeys.c
+	touch $@
