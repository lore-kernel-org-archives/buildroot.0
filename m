From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 20:20:05 +0200
Subject: [Buildroot] [git commit] fakeroot: bump version, cleanup package
Message-ID: <20120405193916.5390A969E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c8244251e730c9873776f2d8d86d23d5a12af6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LFS patch is now upstream, and we don't support building fakeroot for the
target anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fakeroot/fakeroot-doc.patch        |   20 --------------------
 package/fakeroot/fakeroot-uclibc-LFS.patch |   14 --------------
 package/fakeroot/fakeroot.mk               |   18 +++---------------
 3 files changed, 3 insertions(+), 49 deletions(-)

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
index c69f31e..64203b8 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -3,20 +3,8 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.9.5
-FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=http://snapshot.debian.org/archive/debian/20080427T000000Z/pool/main/f/fakeroot/
+FAKEROOT_VERSION = 1.18.2
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
 
-define FAKEROOT_PATCH_FAKEROOT_IN
-	# If using busybox getopt, make it be quiet.
-	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
-		$(@D)/scripts/fakeroot.in
-endef
-
-FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
-
-# The package for the target cannot be selected (build problems when
-# largefile is enabled), but is needed for the host package to work
-# due to deficiencies in the package infrastructure.
-$(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
