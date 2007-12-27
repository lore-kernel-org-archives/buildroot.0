From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Thu, 27 Dec 2007 03:23:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20071227112312.EBFDC1200F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2007-12-27 03:23:11 -0800 (Thu, 27 Dec 2007)
New Revision: 20691

Log:
Closing bug #1819 and 1709


Modified:
   trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	2007-12-26 21:49:33 UTC (rev 20690)
+++ trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	2007-12-27 11:23:11 UTC (rev 20691)
@@ -1,14 +1,14 @@
-diff -u fakeroot-1.7.1.orig/communicate.h fakeroot-1.7.1/communicate.h
---- fakeroot-1.7.1.orig/communicate.h	2005-10-02 17:35:36.000000000 +0200
-+++ fakeroot-1.7.1/communicate.h	2007-09-20 19:43:38.000000000 +0200
+diff -u fakeroot-1.8.10.orig/communicate.h fakeroot-1.8.10/communicate.h
+--- fakeroot-1.8.10.orig/communicate.h  2007-11-20 21:56:53.000000000 -0500
++++ fakeroot-1.8.10/communicate.h       2007-12-13 11:00:03.000000000 -0500
 @@ -35,7 +35,9 @@
  #endif
  
  /* Then decide whether we do or do not use the stat64 support */
--#if defined(sun) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
-+#if defined(sun) \
-+	|| (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
-+	|| (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
+-#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
++#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) \
++       || (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
++       || (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
  # define STAT64_SUPPORT
  #else
  # warning Not using stat64 support

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-12-26 21:49:33 UTC (rev 20690)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-12-27 11:23:11 UTC (rev 20691)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.8.2
+FAKEROOT_VERSION:=1.8.10
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
