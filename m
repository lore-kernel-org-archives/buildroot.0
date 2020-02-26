From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:40:05 +0100
Subject: [Buildroot] [git commit] package/gnuplot: bump to version 5.2.8
Message-ID: <20200309140905.E6B4E8FFE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f6b4d88eca75757d070393b707b5fdd0d36748c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-configure-add-without-demo-option: adapt patch to 5.2.8 version
0002-use-gdlib-config-properly: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-add-without-demo-option.patch   | 32 ++++++++++------------
 .../gnuplot/0002-use-gdlib-config-properly.patch   | 27 ------------------
 package/gnuplot/gnuplot.hash                       |  8 +++---
 package/gnuplot/gnuplot.mk                         |  2 +-
 4 files changed, 20 insertions(+), 49 deletions(-)

diff --git a/package/gnuplot/0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
index a9abfd06ba..a50e6c2c1b 100644
--- a/package/gnuplot/0001-configure-add-without-demo-option.patch
+++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
@@ -8,10 +8,9 @@ Originally written by Anthony Viallard
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-diff -rup a/configure.in b/configure.in
---- a/configure.in	2016-09-07 05:14:29.000000000 +0100
-+++ b/configure.in	2016-12-01 12:09:31.487464774 +0000
-@@ -818,6 +818,16 @@ if test "$with_cwdrc" = yes; then
+--- a/configure.ac	2019-11-27 23:52:29.000000000 +0100
++++ b/configure.ac	2020-02-13 10:24:50.801842269 +0100
+@@ -755,6 +755,16 @@ if test "$with_cwdrc" = yes; then
                 [ Define if you want to read .gnuplot from current directory (SECURITY RISK!).])
  fi
  
@@ -25,12 +24,12 @@ diff -rup a/configure.in b/configure.in
 +AC_ARG_ENABLE(demo,dnl
 +[  --disable-demo    do not build demo files])
 +
- dnl Sort help/subtopic tables by row or column
- AC_ARG_WITH(row-help,dnl
- [  --with-row-help         format help and subtopic tables by row (default)
-@@ -1303,6 +1313,24 @@ fi
- dnl No configuration option for this one yet
- AC_DEFINE(MAX_PARALLEL_AXES,7, [Maximum number of parallel axes supported])
+ dnl Disable experimental support for nonlinear axes
+ AC_ARG_WITH(nonlinear-axes,dnl
+ [  --without-nonlinear-axes     disable support for nonlinear axes])
+@@ -1236,6 +1246,24 @@ if test -n "${DIST_CONTACT}"; then
+   AC_DEFINE_UNQUOTED([DIST_CONTACT],["$DIST_CONTACT"],[Contact address for modified and binary distributed gnuplot versions])
+ fi
  
 +dnl build doc files
 +if test "$enable_doc" != no; then
@@ -53,15 +52,14 @@ diff -rup a/configure.in b/configure.in
  dnl Substitute variables
  AC_SUBST(PACKAGE)
  AC_SUBST(VERSION_MAJOR)
-diff -rup a/Makefile.am b/Makefile.am
---- a/Makefile.am	2014-05-30 17:38:08.000000000 +0100
-+++ b/Makefile.am	2016-12-01 12:09:31.488464794 +0000
+--- a/Makefile.am	2019-11-19 22:57:18.000000000 +0100
++++ b/Makefile.am	2020-02-13 10:17:55.753012739 +0100
 @@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
  AUTOMAKE_OPTIONS = foreign
  
--SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
-+SUBDIRS = config m4 term src $(DOCSUBDIR) $(LISPDIR) man $(DEMOSUBDIR) tutorial share
+-SUBDIRS = config m4 term src docs man demo tutorial share
++SUBDIRS = config m4 term src $(DOCSUBDIR) man $(DEMOSUBDIR) tutorial share
  
- EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS PORTING README RELEASE_NOTES \
+ EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
diff --git a/package/gnuplot/0002-use-gdlib-config-properly.patch b/package/gnuplot/0002-use-gdlib-config-properly.patch
deleted file mode 100644
index 690a82652a..0000000000
--- a/package/gnuplot/0002-use-gdlib-config-properly.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix usage of gdlib-config
-
-gnuplot configure.in script properly takes care of finding
-gdlib-config using AC_PATH_PROG... but then directly uses gdlib-config
-instead of going through the GDLIB_CONFIG variable that AC_PATH_PROG
-has defined. Which means that whenever a gdlib-config binary not in
-the PATH is being used, it does not use it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -537,9 +537,9 @@
- if test "$with_gd" != no; then
-   AC_PATH_PROG([GDLIB_CONFIG], [gdlib-config])
-   if test -n "$GDLIB_CONFIG"; then
--    libgd_CPPFLAGS=`gdlib-config --cflags`
--    libgd_LDFLAGS=`gdlib-config --ldflags`
--    libgd_LIBS=`gdlib-config --libs`
-+    libgd_CPPFLAGS=`$GDLIB_CONFIG --cflags`
-+    libgd_LDFLAGS=`$GDLIB_CONFIG --ldflags`
-+    libgd_LIBS=`$GDLIB_CONFIG --libs`
-   elif test -d "$with_gd"; then
-     libgd_CPPFLAGS="-I$with_gd/include"
-     libgd_LDFLAGS="-L$with_gd/lib"
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 1f3a08bb00..ef80a29d3d 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.6/
-md5 8ec46520a86a61163a701b00404faf1a  gnuplot-5.0.6.tar.gz
-sha1 f7b8948166b22e5bd658d5cf7579716f4821dba0  gnuplot-5.0.6.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.2.8/
+md5 2df8767c7399bee57a96296d46b4d5fb  gnuplot-5.2.8.tar.gz
+sha1 dc018b1e0a31b770d4635958badff13498babc4d  gnuplot-5.2.8.tar.gz
 # Locally computed
-sha256  5bbe4713e555c2e103b7d4ffd45fca69551fff09cf5c3f9cb17428aaacc9b460  gnuplot-5.0.6.tar.gz
+sha256  60a6764ccf404a1668c140f11cc1f699290ab70daa1151bb58fed6139a28ac37  gnuplot-5.2.8.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index d59605c570..694b6cb886 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.0.6
+GNUPLOT_VERSION = 5.2.8
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
