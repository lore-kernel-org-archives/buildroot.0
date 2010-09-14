From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:34 -0700
Subject: [Buildroot] [PATCH 07/21] fakeroot: bump to 1.14.4
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-7-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                    |    4 ++--
 package/fakeroot/fakeroot-doc.patch        |   11 +++++++----
 package/fakeroot/fakeroot-uclibc-LFS.patch |   14 --------------
 package/fakeroot/fakeroot.mk               |    6 +++---
 4 files changed, 12 insertions(+), 23 deletions(-)
 delete mode 100644 package/fakeroot/fakeroot-uclibc-LFS.patch

diff --git a/CHANGES b/CHANGES
index b9cdd48..0492e3b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	Toolchain: ARM cortex A9 support
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
-	berkeleydb, bison, busybox, ccache, dropbear, iptables, kismet,
-	openvpn, qt, usbutils
+	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, iptables,
+	kismet, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/fakeroot/fakeroot-doc.patch b/package/fakeroot/fakeroot-doc.patch
index 51a64ca..daa3f5d 100644
--- a/package/fakeroot/fakeroot-doc.patch
+++ b/package/fakeroot/fakeroot-doc.patch
@@ -2,6 +2,7 @@
 +++ fakeroot/Makefile.am	2006-04-19 11:50:59.000000000 -0600
 @@ -1,5 +1,5 @@
  AUTOMAKE_OPTIONS=foreign
+ ACLOCAL_AMFLAGS = -I build-aux
 -SUBDIRS=scripts doc test
 +SUBDIRS=scripts test
  
@@ -9,12 +10,14 @@
  libcommunicate_la_SOURCES = communicate.c
 --- fakeroot/Makefile.in.orig	2006-04-19 11:50:43.000000000 -0600
 +++ fakeroot/Makefile.in	2006-04-19 11:51:21.000000000 -0600
-@@ -230,7 +230,7 @@
- top_builddir = @top_builddir@
+@@ -293,7 +293,7 @@
  top_srcdir = @top_srcdir@
  AUTOMAKE_OPTIONS = foreign
+ ACLOCAL_AMFLAGS = -I build-aux
 -SUBDIRS = scripts doc test
 +SUBDIRS = scripts test
- noinst_LTLIBRARIES = libcommunicate.la
+ noinst_LTLIBRARIES = libcommunicate.la libmacosx.la
  libcommunicate_la_SOURCES = communicate.c
- lib_LTLIBRARIES = libfakeroot.la
+ libmacosx_la_SOURCES = libfakeroot_inode64.c libfakeroot_unix2003.c patchattr.h
+
+
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
