From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:29 -0700
Subject: [Buildroot] [PATCH 07/21] fakeroot: bump to 1.14.4
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-8-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/fakeroot/fakeroot-1.14.4-doc.patch |   23 +++++++++++++++++++++++
 package/fakeroot/fakeroot-doc.patch        |   20 --------------------
 package/fakeroot/fakeroot-uclibc-LFS.patch |   14 --------------
 package/fakeroot/fakeroot.mk               |    6 +++---
 4 files changed, 26 insertions(+), 37 deletions(-)
 create mode 100644 package/fakeroot/fakeroot-1.14.4-doc.patch
 delete mode 100644 package/fakeroot/fakeroot-doc.patch
 delete mode 100644 package/fakeroot/fakeroot-uclibc-LFS.patch

diff --git a/package/fakeroot/fakeroot-1.14.4-doc.patch b/package/fakeroot/fakeroot-1.14.4-doc.patch
new file mode 100644
index 0000000..daa3f5d
--- /dev/null
+++ b/package/fakeroot/fakeroot-1.14.4-doc.patch
@@ -0,0 +1,23 @@
+--- fakeroot/Makefile.am.orig	2006-04-19 11:50:35.000000000 -0600
++++ fakeroot/Makefile.am	2006-04-19 11:50:59.000000000 -0600
+@@ -1,5 +1,5 @@
+ AUTOMAKE_OPTIONS=foreign
+ ACLOCAL_AMFLAGS = -I build-aux
+-SUBDIRS=scripts doc test
++SUBDIRS=scripts test
+ 
+ noinst_LTLIBRARIES = libcommunicate.la
+ libcommunicate_la_SOURCES = communicate.c
+--- fakeroot/Makefile.in.orig	2006-04-19 11:50:43.000000000 -0600
++++ fakeroot/Makefile.in	2006-04-19 11:51:21.000000000 -0600
+@@ -293,7 +293,7 @@
+ top_srcdir = @top_srcdir@
+ AUTOMAKE_OPTIONS = foreign
+ ACLOCAL_AMFLAGS = -I build-aux
+-SUBDIRS = scripts doc test
++SUBDIRS = scripts test
+ noinst_LTLIBRARIES = libcommunicate.la libmacosx.la
+ libcommunicate_la_SOURCES = communicate.c
+ libmacosx_la_SOURCES = libfakeroot_inode64.c libfakeroot_unix2003.c patchattr.h
+
+
diff --git a/package/fakeroot/fakeroot-doc.patch b/package/fakeroot/fakeroot-doc.patch
deleted file mode 100644
index 51a64ca..0000000
--- a/package/fakeroot/fakeroot-doc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- fakeroot/Makefile.am.orig	2006-04-19 11:50:35.000000000 -0600
-+++ fakeroot/Makefile.am	2006-04-19 11:50:59.000000000 -0600
-@@ -1,5 +1,5 @@
- AUTOMAKE_OPTIONS=foreign
--SUBDIRS=scripts doc test
-+SUBDIRS=scripts test
- 
- noinst_LTLIBRARIES = libcommunicate.la
- libcommunicate_la_SOURCES = communicate.c
---- fakeroot/Makefile.in.orig	2006-04-19 11:50:43.000000000 -0600
-+++ fakeroot/Makefile.in	2006-04-19 11:51:21.000000000 -0600
-@@ -230,7 +230,7 @@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
- AUTOMAKE_OPTIONS = foreign
--SUBDIRS = scripts doc test
-+SUBDIRS = scripts test
- noinst_LTLIBRARIES = libcommunicate.la
- libcommunicate_la_SOURCES = communicate.c
- lib_LTLIBRARIES = libfakeroot.la
diff --git a/package/fakeroot/fakeroot-uclibc-LFS.patch b/package/fakeroot/fakeroot-uclibc-LFS.patch
deleted file mode 100644
index 53f0b86..0000000
--- a/package/fakeroot/fakeroot-uclibc-LFS.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -urN fakeroot-1.9.3.orig/communicate.h fakeroot-1.9.3/communicate.h
---- fakeroot-1.9.3.orig/communicate.h	2008-03-11 09:42:05.000000000 -0400
-+++ fakeroot-1.9.3/communicate.h	2008-03-11 10:58:10.000000000 -0400
-@@ -35,7 +35,9 @@
- #endif
- 
- /* Then decide whether we do or do not use the stat64 support */
--#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
-+#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) \
-+    || (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
-+    || (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
- # define STAT64_SUPPORT
- #else
- # warning Not using stat64 support
\ No newline at end of file
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index fd60dbe..eb25815 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -3,9 +3,9 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.9.5
-FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
+FAKEROOT_VERSION:=1.14.4
+FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
+FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot/
 FAKEROOT_LIBTOOL_PATCH=NO
 
 define FAKEROOT_PATCH_FAKEROOT_IN
-- 
1.7.2.3
