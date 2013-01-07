From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Mon,  7 Jan 2013 14:30:16 +0100
Subject: [Buildroot] [PATCH 4/5] gnuplot : add --without-doc and
	--without-demo options
In-Reply-To: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
References: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <1357565417-16782-4-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a generic patch to disable compilation/installation
of docs and demo with configure options.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 ...ot-0001-configure-add-without-demo-option.patch |   59 ++++++++++++++++++++
 1 file changed, 59 insertions(+), 0 deletion(-)
 create mode 100644 package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch

diff --git a/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
new file mode 100644
index 0000000..acdc91d
--- /dev/null
+++ b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
@@ -0,0 +1,59 @@
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
++AC_ARG_WITH(demo,dnl
++[  --without-demo    do not build demo files])
++
++dnl Whether we want to build the doc files
++dnl Does nothing here, is passed on to the doc subdir
++AC_ARG_WITH(doc,dnl
++[  --without-doc    do not build doc files])
++
+ dnl Sort help/subtopic tables by row or column
+ AC_ARG_WITH(row-help,dnl
+ [  --with-row-help         format help and subtopic tables by row (default)
+@@ -1200,6 +1210,24 @@
+ fi
+ AC_SUBST(LISPDIR)
+ 
++dnl build demo files
++if test "$with_demo" != no; then
++  AC_CONFIG_SUBDIRS(demo)
++  DEMODIR=demo
++else
++  DEMODIR=
++fi
++AC_SUBST(DEMODIR)
++
++dnl build doc files
++if test "$with_doc" != no; then
++  AC_CONFIG_SUBDIRS(docs)
++  DOCDIR=docs
++else
++  DOCDIR=
++fi
++AC_SUBST(DOCDIR)
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
++SUBDIRS = config m4 term src $(DOCDIR) $(LISPDIR) $(DEMODIR) man tutorial share
+ 
+ EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
-- 
1.7.10.4
