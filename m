From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Sep 2019 09:40:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/gengetopt: disable documentation
Message-ID: <20190922074002.20631-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to disable documentation through a --disable-doc option
which is already passed by autotools infrastructure

Fixes:
 - http://autobuild.buildroot.org/results/63554a4168a69a0e68a222bee2269b5aaeee2021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-configure.ac-add-disable-doc-option.patch | 51 +++++++++++++++++++
 package/gengetopt/gengetopt.mk                |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 package/gengetopt/0001-configure.ac-add-disable-doc-option.patch

diff --git a/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
new file mode 100644
index 0000000000..d43714a3df
--- /dev/null
+++ b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
@@ -0,0 +1,51 @@
+From 250bee9e02546846d70dbe88ac36bb83c6a7ebdf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Sep 2019 09:27:24 +0200
+Subject: [PATCH] configure.ac: add --disable-doc option
+
+Add --disable-doc option to allow the user to disable documentation
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Sent upstream: https://savannah.gnu.org/bugs/index.php?56931]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 7 +++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dbb5719..2db307a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,6 +18,10 @@
+ ACLOCAL_AMFLAGS = -I m4 -I gl/m4
+ 
+ EXTRA_DIST = configure TODO LICENSE gl/m4/gnulib-cache.m4
+-SUBDIRS = gl src doc tests
++SUBDIRS = gl src tests
++
++if ENABLE_DOC
++SUBDIRS += doc
++endif
+ 
+ gengetoptdoc_DATA = ChangeLog COPYING NEWS THANKS INSTALL README LICENSE
+diff --git a/configure.ac b/configure.ac
+index 0ee89db..915706c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,6 +61,13 @@ AC_ARG_ENABLE(
+ 	AC_COMPILE_WARNINGS
+ )
+ 
++AC_ARG_ENABLE(
++	[doc],
++	[--enable-doc			enable documentation],
++	[enable_doc=$enableval],
++	[enable_doc=yes])
++AM_CONDITIONAL(ENABLE_DOC, test x"$enable_doc" = xyes)
++
+ AC_ARG_WITH(
+ 	[gengen],
+ 	[  --with-gengen=mygengen       gengen to use],
+-- 
+2.23.0
+
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
index 37f7de1ee8..5ecd44bc77 100644
--- a/package/gengetopt/gengetopt.mk
+++ b/package/gengetopt/gengetopt.mk
@@ -9,5 +9,7 @@ GENGETOPT_SOURCE = gengetopt-$(GENGETOPT_VERSION).tar.xz
 GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt
 GENGETOPT_LICENSE = GPL-3.0+
 GENGETOPT_LICENSE_FILES = COPYING LICENSE
+# We're patching configure.ac
+HOST_GENGETOPT_AUTORECONF = YES
 
 $(eval $(host-autotools-package))
-- 
2.23.0
