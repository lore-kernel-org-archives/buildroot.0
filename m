From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 21 Sep 2007 07:22:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070921142233.2E34FA60EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-21 07:22:29 -0700 (Fri, 21 Sep 2007)
New Revision: 19928

Log:
- add check for UCLIBC_HAS_LFS.
  Fixes compilation error if LARGEFLE support is off


Added:
   trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch

Removed:
   trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff


Changeset:
Deleted: trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff	2007-09-21 13:43:28 UTC (rev 19927)
+++ trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff	2007-09-21 14:22:29 UTC (rev 19928)
@@ -1,14 +0,0 @@
-diff -u fakeroot-1.7.1.orig/communicate.h fakeroot-1.7.1/communicate.h
---- fakeroot-1.7.1.orig/communicate.h	2005-10-02 17:35:36.000000000 +0200
-+++ fakeroot-1.7.1/communicate.h	2007-09-20 19:43:38.000000000 +0200
-@@ -35,7 +35,9 @@
- #endif
- 
- /* Then decide whether we do or do not use the stat64 support */
--#if defined(sun) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
-+#if defined(sun) \
-+	|| (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
-+	|| (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
- # define STAT64_SUPPORT
- #else
- # warning Not using stat64 support

Copied: trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch (from rev 19927, trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff)
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	                        (rev 0)
+++ trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	2007-09-21 14:22:29 UTC (rev 19928)
@@ -0,0 +1,14 @@
+diff -u fakeroot-1.7.1.orig/communicate.h fakeroot-1.7.1/communicate.h
+--- fakeroot-1.7.1.orig/communicate.h	2005-10-02 17:35:36.000000000 +0200
++++ fakeroot-1.7.1/communicate.h	2007-09-20 19:43:38.000000000 +0200
+@@ -35,7 +35,9 @@
+ #endif
+ 
+ /* Then decide whether we do or do not use the stat64 support */
+-#if defined(sun) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
++#if defined(sun) \
++	|| (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
++	|| (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
+ # define STAT64_SUPPORT
+ #else
+ # warning Not using stat64 support
