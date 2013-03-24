From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 19:50:40 +0100
Subject: [Buildroot] [git commit] gnuplot: new package
Message-ID: <20130324194036.6D5649B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83d871809c52c3f79989164a07c6b9021bfa1851
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: Improved by adding support to use readline functionality, gd
functionality, and various fixes.]

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/gnuplot/Config.in                          |    6 ++
 ...ot-0001-configure-add-without-demo-option.patch |   66 ++++++++++++++++++++
 .../gnuplot-0002-use-gdlib-config-properly.patch   |   27 ++++++++
 package/gnuplot/gnuplot.mk                         |   50 +++++++++++++++
 5 files changed, 150 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c66e139..5f33e45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -106,6 +106,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+source "package/gnuplot/Config.in"
 source "package/rrdtool/Config.in"
 
 comment "graphic libraries"
diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
new file mode 100644
index 0000000..603c194
--- /dev/null
+++ b/package/gnuplot/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GNUPLOT
+	bool "gnuplot"
+	help
+	  A portable command-line driven graphing utility.
+
+	  http://www.gnuplot.info/
diff --git a/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
new file mode 100644
index 0000000..ccca4e3
--- /dev/null
+++ b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
@@ -0,0 +1,66 @@
+Add options to enable/disable docs and demos
+
+Originally written by Anthony Viallard
+<viallard@syscom-instruments.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: gnuplot-4.6.0/configure.in
+===================================================================
+--- gnuplot-4.6.0.orig/configure.in	2012-03-08 05:34:42.000000000 +0100
++++ gnuplot-4.6.0/configure.in	2013-01-07 11:50:03.003804463 +0100
+@@ -748,6 +748,16 @@
+ AC_ARG_WITH(lisp-files,dnl
+ [  --without-lisp-files    do not build emacs lisp files])
+ 
++dnl Whether we want to build the demo files
++dnl Does nothing here, is passed on to the demo subdir
++AC_ARG_ENABLE(demo,dnl
++[  --disable-demo    do not build demo files])
++
++dnl Whether we want to build the doc files
++dnl Does nothing here, is passed on to the doc subdir
++AC_ARG_ENABLE(doc,dnl
++[  --disable-doc    do not build doc files])
++
+ dnl Sort help/subtopic tables by row or column
+ AC_ARG_WITH(row-help,dnl
+ [  --with-row-help         format help and subtopic tables by row (default)
+@@ -1200,6 +1210,24 @@
+ fi
+ AC_SUBST(LISPDIR)
+ 
++dnl build demo files
++if test "$enable_demo" != no; then
++  AC_CONFIG_SUBDIRS(demo)
++  DEMOSUBDIR=demo
++else
++  DEMOSUBDIR=
++fi
++AC_SUBST(DEMOSUBDIR)
++
++dnl build doc files
++if test "$enable_doc" != no; then
++  AC_CONFIG_SUBDIRS(docs)
++  DOCSUBDIR=docs
++else
++  DOCSUBDIR=
++fi
++AC_SUBST(DOCSUBDIR)
++
+ dnl Substitute variables
+ AC_SUBST(PACKAGE)
+ AC_SUBST(VERSION_MAJOR)
+Index: gnuplot-4.6.0/Makefile.am
+===================================================================
+--- gnuplot-4.6.0.orig/Makefile.am	2013-01-04 14:07:02.239120935 +0100
++++ gnuplot-4.6.0/Makefile.am	2013-01-07 11:51:12.034846363 +0100
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+ AUTOMAKE_OPTIONS = foreign 1.2h
+ 
+-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
++SUBDIRS = config m4 term src $(DOCSUBDIR) $(LISPDIR) man $(DEMOSUBDIR) tutorial share
+ 
+ EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
diff --git a/package/gnuplot/gnuplot-0002-use-gdlib-config-properly.patch b/package/gnuplot/gnuplot-0002-use-gdlib-config-properly.patch
new file mode 100644
index 0000000..690a826
--- /dev/null
+++ b/package/gnuplot/gnuplot-0002-use-gdlib-config-properly.patch
@@ -0,0 +1,27 @@
+Fix usage of gdlib-config
+
+gnuplot configure.in script properly takes care of finding
+gdlib-config using AC_PATH_PROG... but then directly uses gdlib-config
+instead of going through the GDLIB_CONFIG variable that AC_PATH_PROG
+has defined. Which means that whenever a gdlib-config binary not in
+the PATH is being used, it does not use it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -537,9 +537,9 @@
+ if test "$with_gd" != no; then
+   AC_PATH_PROG([GDLIB_CONFIG], [gdlib-config])
+   if test -n "$GDLIB_CONFIG"; then
+-    libgd_CPPFLAGS=`gdlib-config --cflags`
+-    libgd_LDFLAGS=`gdlib-config --ldflags`
+-    libgd_LIBS=`gdlib-config --libs`
++    libgd_CPPFLAGS=`$GDLIB_CONFIG --cflags`
++    libgd_LDFLAGS=`$GDLIB_CONFIG --ldflags`
++    libgd_LIBS=`$GDLIB_CONFIG --libs`
+   elif test -d "$with_gd"; then
+     libgd_CPPFLAGS="-I$with_gd/include"
+     libgd_LDFLAGS="-L$with_gd/lib"
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
new file mode 100644
index 0000000..a68c7ae
--- /dev/null
+++ b/package/gnuplot/gnuplot.mk
@@ -0,0 +1,50 @@
+#############################################################
+#
+# gnuplot
+#
+#############################################################
+
+GNUPLOT_VERSION = 4.6.2
+GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
+GNUPLOT_LICENSE = gnuplot license (open source)
+GNUPLOT_LICENSE_FILES = Copyright
+
+GNUPLOT_AUTORECONF = YES
+
+GNUPLOT_CONF_OPT = --without-x \
+		--disable-raise-console \
+		--disable-mouse \
+	        --without-tutorial \
+		--disable-demo \
+	        --without-row-help \
+		--disable-history-file \
+	        --without-lisp-files \
+	        --disable-wxwidgets \
+	        --without-lua \
+		--without-latex \
+	        --without-cairo
+
+ifeq ($(BR2_PACKAGE_GD),y)
+GNUPLOT_CONF_OPT += --with-gd
+GNUPLOT_DEPENDENCIES += gd
+GNUPLOT_CONF_ENV += \
+	ac_cv_path_GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config
+else
+GNUPLOT_CONF_OPT += --without-gd
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GNUPLOT_CONF_OPT += --with-readline=gnu
+GNUPLOT_DEPENDENCIES += readline
+else
+GNUPLOT_CONF_OPT += --without-readline
+endif
+
+# Remove Javascript scripts, lua scripts, PostScript files
+define GNUPLOT_REMOVE_UNNEEDED_FILES
+	$(RM) -rf $(TARGET_DIR)/usr/share/gnuplot
+endef
+
+GNUPLOT_POST_INSTALL_TARGET_HOOKS += GNUPLOT_REMOVE_UNNEEDED_FILES
+
+$(eval $(autotools-package))
