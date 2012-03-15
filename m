From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Mar 2012 23:54:09 +0100
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
Message-ID: <1331852049-12761-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix two things in the giblib package:

1- fix prefix breakage
   - s/STAGING/STAGING_DIR/ (Thomas)
   - prefix is .../usr, not .../usr/lib or .../usr/bin

2- fix the configure.ac/Makefile.am breakage
   - imlib2 sets IMLIB2_(LIBS|CFLAGS), not IMLIB_(LIBS|CFLAGS)
   - autoreconf the package, install missing files
     Note that both configure.ac and configure.in are present in the
     package, so both are fixed, although only configure.ac is used
     (configure.in is the legacy name).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/giblib/giblib-fix-imlib2-detection.patch |  127 ++++++++++++++++++++++
 package/giblib/giblib.mk                         |    6 +-
 2 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/package/giblib/giblib-fix-imlib2-detection.patch b/package/giblib/giblib-fix-imlib2-detection.patch
new file mode 100644
index 0000000..2323107
--- /dev/null
+++ b/package/giblib/giblib-fix-imlib2-detection.patch
@@ -0,0 +1,127 @@
+configure.ac + Makefile.am: fix the imlib2 detection
+
+Although imlib2 is correctly checked for, the variables used to get
+the CFLAGS and LIBS are wrong (perhaps a remnant of the pre-imlib2
+era, when giblib was using imlib).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
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
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 8288b74..75012ea 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -8,7 +8,9 @@ GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
-GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
-		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
+GIBLIB_AUTORECONF = YES
+GIBLIB_AUTORECONF_OPT = --install
+GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
+		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.2.5
