From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2012 00:21:39 +0100
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
Message-ID: <1331680899-25945-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do *NOT* apply this patch!

This is *absolutely untested* and is posted only for reference, after
our discussion on IRC late last night with 'kos_tom' and 'Kanibal'.

Fix two things in the giblib package:

1- fix prefix breakage
  - prefix is .../usr, not .../usr/lib or .../usr/bin

2- fix the imlib2 breakage
   - imlib2 sets IMLIB2_(LIBS|CFLAGS), not IMLIB_(LIBS|CFLAGS)
   - because I was not able to autoreconf giblib properly, I simply
     fixed the few files that had references to the bad variables

Further testing should be done on this patch, and probably it can
be cleaned up somewhat...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/giblib/giblib.mk    |    4 +-
 package/giblib/giblib.patch |  206 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+), 2 deletions(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 8288b74..b298606 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -8,7 +8,7 @@ GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
-GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
-		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
+GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr \
+		  --with-imlib2-exec-prefix=$(STAGING)/usr
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/giblib/giblib.patch b/package/giblib/giblib.patch
new file mode 100644
index 0000000..15df36a
--- /dev/null
+++ b/package/giblib/giblib.patch
@@ -0,0 +1,206 @@
+diff --git a/Makefile.in b/Makefile.in
+index f35f724..cc039a9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -75,8 +75,6 @@ GTK_CFLAGS = @GTK_CFLAGS@
+ GTK_CONFIG = @GTK_CONFIG@
+ GTK_LIBS = @GTK_LIBS@
+ HAVE_LIB = @HAVE_LIB@
+-IMLIB_CFLAGS = @IMLIB_CFLAGS@
+-IMLIB_LIBS = @IMLIB_LIBS@
+ LIB = @LIB@
+ LIBTOOL = @LIBTOOL@
+ LN_S = @LN_S@
+diff --git a/configure b/configure
+index 94937fa..77f6dbf 100755
+--- a/configure
++++ b/configure
+@@ -463,7 +463,7 @@ ac_includes_default="\
+ # include <unistd.h>
+ #endif"
+ 
+-ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA PACKAGE VERSION ACLOCAL AUTOCONF AUTOMAKE AUTOHEADER MAKEINFO SET_MAKE CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP EGREP build build_cpu build_vendor build_os host host_cpu host_vendor host_os LN_S ECHO AR ac_ct_AR RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP CXX CXXFLAGS ac_ct_CXX CXXCPP F77 FFLAGS ac_ct_F77 LIBTOOL MAINTAINER_MODE_TRUE MAINTAINER_MODE_FALSE MAINT IMLIB2_CONFIG IMLIB_LIBS IMLIB_CFLAGS IMLIB2_CFLAGS IMLIB2_LIBS LIBOBJS LTLIBOBJS'
++ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA PACKAGE VERSION ACLOCAL AUTOCONF AUTOMAKE AUTOHEADER MAKEINFO SET_MAKE CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP EGREP build build_cpu build_vendor build_os host host_cpu host_vendor host_os LN_S ECHO AR ac_ct_AR RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP CXX CXXFLAGS ac_ct_CXX CXXCPP F77 FFLAGS ac_ct_F77 LIBTOOL MAINTAINER_MODE_TRUE MAINTAINER_MODE_FALSE MAINT IMLIB2_CONFIG IMLIB2_CFLAGS IMLIB2_LIBS LIBOBJS LTLIBOBJS'
+ ac_subst_files=''
+ 
+ # Initialize some variables set by options.
+@@ -19866,8 +19866,6 @@ echo "$as_me: error: Cannot find imlib2: Is imlib2-config in the path?" >&2;}
+ 
+ 
+ 
+-IMLIB_LIBS=`imlib2-config --libs`
+-IMLIB_CFLAGS=`imlib2-config --cflags`
+ 
+ 
+ 
+@@ -20555,8 +20553,6 @@ s, at MAINTAINER_MODE_TRUE@,$MAINTAINER_MODE_TRUE,;t t
+ s, at MAINTAINER_MODE_FALSE@,$MAINTAINER_MODE_FALSE,;t t
+ s, at MAINT@,$MAINT,;t t
+ s, at IMLIB2_CONFIG@,$IMLIB2_CONFIG,;t t
+-s, at IMLIB_LIBS@,$IMLIB_LIBS,;t t
+-s, at IMLIB_CFLAGS@,$IMLIB_CFLAGS,;t t
+ s, at IMLIB2_CFLAGS@,$IMLIB2_CFLAGS,;t t
+ s, at IMLIB2_LIBS@,$IMLIB2_LIBS,;t t
+ s, at LIBOBJS@,$LIBOBJS,;t t
+@@ -21180,7 +21176,7 @@ $PACKAGE $VERSION
+ Configuration:
+ --------------
+ 
+-Imlib2 libs:	$IMLIB_LIBS
+-Imlib2 cflags:  $IMLIB_CFLAGS
++Imlib2 libs:	$IMLIB2_LIBS
++Imlib2 cflags:  $IMLIB2_CFLAGS
+ CFLAGS:			$CFLAGS
+ "
+diff --git a/configure.ac b/configure.ac
+index 6807d86..c8874f0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,16 +18,10 @@ AM_MAINTAINER_MODE
+ AM_WITH_DMALLOC
+ 
+ AC_PATH_GENERIC(imlib2, 1.0.0, [
+-  AC_SUBST(IMLIB_LIBS)
+-  AC_SUBST(IMLIB_CFLAGS) ],
++  AC_SUBST(IMLIB2_LIBS)
++  AC_SUBST(IMLIB2_CFLAGS) ],
+   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
+ 
+-dnl the above doesn't work for some reason :/
+-IMLIB_LIBS=`imlib2-config --libs`
+-IMLIB_CFLAGS=`imlib2-config --cflags`
+-AC_SUBST(IMLIB_LIBS)
+-AC_SUBST(IMLIB_CFLAGS)
+-
+ LIBS="$LIBS -lm"
+ CFLAGS="$CFLAGS -Wall"
+ 
+@@ -48,7 +42,7 @@ $PACKAGE $VERSION
+ Configuration:
+ --------------
+ 
+-Imlib2 libs:	$IMLIB_LIBS
+-Imlib2 cflags:  $IMLIB_CFLAGS
++Imlib2 libs:	$IMLIB2_LIBS
++Imlib2 cflags:  $IMLIB2_CFLAGS
+ CFLAGS:			$CFLAGS
+ "
+diff --git a/configure.in b/configure.in
+index 432cb16..6999095 100644
+--- a/configure.in
++++ b/configure.in
+@@ -17,16 +17,10 @@ AM_MAINTAINER_MODE
+ AM_WITH_DMALLOC
+ 
+ AC_PATH_GENERIC(imlib2, 1.0.0, [
+-  AC_SUBST(IMLIB_LIBS)
+-  AC_SUBST(IMLIB_CFLAGS) ],
++  AC_SUBST(IMLIB2_LIBS)
++  AC_SUBST(IMLIB2_CFLAGS) ],
+   AC_MSG_ERROR(Cannot find imlib2: Is imlib2-config in the path?) )
+ 
+-dnl the above doesn't work for some reason :/
+-IMLIB_LIBS=`imlib2-config --libs`
+-IMLIB_CFLAGS=`imlib2-config --cflags`
+-AC_SUBST(IMLIB_LIBS)
+-AC_SUBST(IMLIB_CFLAGS)
+-
+ LIBS="$LIBS -lm"
+ CFLAGS="$CFLAGS -Wall"
+ 
+@@ -45,7 +39,7 @@ $PACKAGE $VERSION
+ Configuration:
+ --------------
+ 
+-Imlib2 libs:	$IMLIB_LIBS
+-Imlib2 cflags:  $IMLIB_CFLAGS
++Imlib2 libs:	$IMLIB2_LIBS
++Imlib2 cflags:  $IMLIB2_CFLAGS
+ CFLAGS:			$CFLAGS
+ "
+diff --git a/giblib-config.in b/giblib-config.in
+index f3a7db6..cef1620 100644
+--- a/giblib-config.in
++++ b/giblib-config.in
+@@ -42,11 +42,11 @@ while test $# -gt 0; do
+       if test @includedir@ != /usr/include ; then
+         includes=-I at includedir@
+       fi
+-      echo $includes -I$prefix/include/giblib @IMLIB_CFLAGS@
++      echo $includes -I$prefix/include/giblib @IMLIB2_CFLAGS@
+       ;;
+     --libs)
+       libdirs=-L at libdir@
+-      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB_LIBS@
++      echo $libdirs -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
+       ;;
+     *)
+       echo "${usage}" 1>&2
+diff --git a/giblib.pc.in b/giblib.pc.in
+index df520ae..783e6e1 100644
+--- a/giblib.pc.in
++++ b/giblib.pc.in
+@@ -6,6 +6,6 @@ includedir=@includedir@
+ Name: giblib
+ Description: wrapper library for imlib2, and other stuff
+ Version: @VERSION@
+-Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB_LIBS@
+-Cflags: -I${includedir} -I${includedir}/giblib @IMLIB_CFLAGS@
++Libs: -L${libdir} -lgiblib @LDFLAGS@ @IMLIB2_LIBS@
++Cflags: -I${includedir} -I${includedir}/giblib @IMLIB2_CFLAGS@
+ 
+diff --git a/giblib/Makefile.am b/giblib/Makefile.am
+index d1edc09..49d8ac4 100644
+--- a/giblib/Makefile.am
++++ b/giblib/Makefile.am
+@@ -3,7 +3,7 @@ MAINTAINERCLEANFILES = Makefile.in
+ 
+ INCLUDES = \
+ -I. -I$(top_srcdir) \
+--DPREFIX=\""$(prefix)"\" @IMLIB_CFLAGS@
++-DPREFIX=\""$(prefix)"\" @IMLIB2_CFLAGS@
+ 
+ lib_LTLIBRARIES = libgiblib.la
+ 
+@@ -24,7 +24,7 @@ libgiblib_la_SOURCES = \
+     gib_utils.c gib_utils.h \
+ 	gib_queue.c gib_queue.h
+ 
+-libgiblib_la_LIBADD = @IMLIB_LIBS@
++libgiblib_la_LIBADD = @IMLIB2_LIBS@
+ libgiblib_la_DEPENDENCIES = giblib_config.h
+ libgiblib_la_LDFLAGS = -version-info 1:6:0
+ 
+diff --git a/giblib/Makefile.in b/giblib/Makefile.in
+index 46631a5..3e16965 100644
+--- a/giblib/Makefile.in
++++ b/giblib/Makefile.in
+@@ -75,8 +75,8 @@ GTK_CFLAGS = @GTK_CFLAGS@
+ GTK_CONFIG = @GTK_CONFIG@
+ GTK_LIBS = @GTK_LIBS@
+ HAVE_LIB = @HAVE_LIB@
+-IMLIB_CFLAGS = @IMLIB_CFLAGS@
+-IMLIB_LIBS = @IMLIB_LIBS@
++IMLIB2_CFLAGS = @IMLIB2_CFLAGS@
++IMLIB2_LIBS = @IMLIB2_LIBS@
+ LIB = @LIB@
+ LIBTOOL = @LIBTOOL@
+ LN_S = @LN_S@
+@@ -94,7 +94,7 @@ VERSION = @VERSION@
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-INCLUDES =  -I. -I$(top_srcdir) -DPREFIX=\""$(prefix)"\" @IMLIB_CFLAGS@
++INCLUDES =  -I. -I$(top_srcdir) -DPREFIX=\""$(prefix)"\" @IMLIB2_CFLAGS@
+ 
+ 
+ lib_LTLIBRARIES = libgiblib.la
+@@ -107,7 +107,7 @@ installed_headersdir = $(prefix)/include/giblib
+ libgiblib_la_SOURCES =      gib_debug.h     giblib.h     gib_list.c gib_list.h     gib_hash.c gib_hash.h     gib_btree.c gib_btree.h     gib_style.c gib_style.h     gib_imlib.c gib_imlib.h     gib_stack.c gib_stack.h     gib_utils.c gib_utils.h 	gib_queue.c gib_queue.h
+ 
+ 
+-libgiblib_la_LIBADD = @IMLIB_LIBS@
++libgiblib_la_LIBADD = @IMLIB2_LIBS@
+ libgiblib_la_DEPENDENCIES = giblib_config.h
+ libgiblib_la_LDFLAGS = -version-info 1:6:0
+ mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
-- 
1.7.2.5
