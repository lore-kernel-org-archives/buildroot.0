From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 16 Apr 2007 12:14:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070416191434.9F5B4485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-16 12:14:34 -0700 (Mon, 16 Apr 2007)
New Revision: 18459

Log:
- uclibc is nowadays identified via __UCLIBC__
- fix build error when no ftw() is available.


Added:
   trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch


Changeset:
Added: trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch
===================================================================
--- trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch	                        (rev 0)
+++ trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch	2007-04-16 19:14:34 UTC (rev 18459)
@@ -0,0 +1,24 @@
+diff -rdup mdadm-2.6.1.orig/mdadm.h mdadm-2.6.1/mdadm.h
+--- mdadm-2.6.1.orig/mdadm.h	2007-02-22 04:59:28.000000000 +0100
++++ mdadm-2.6.1/mdadm.h	2007-04-16 20:53:53.000000000 +0200
+@@ -382,7 +382,7 @@ struct stat64;
+ #define HAVE_NFTW  we assume
+ #define HAVE_FTW
+ 
+-#ifdef UCLIBC
++#if defined __UCLIBC__ || /* older did use that? */ defined UCLIBC
+ # include <features.h>
+ # ifndef  __UCLIBC_HAS_FTW__
+ #  undef HAVE_FTW
+diff -rdup mdadm-2.6.1.orig/util.c mdadm-2.6.1/util.c
+--- mdadm-2.6.1.orig/util.c	2006-12-19 03:35:27.000000000 +0100
++++ mdadm-2.6.1/util.c	2007-04-16 21:05:56.000000000 +0200
+@@ -468,7 +468,7 @@ int nftw(const char *path, int (*han)(co
+ 	return ftw(path, add_dev_1, nopenfd);
+ }
+ #else
+-int add_dev(const char *name, const struct stat *stb, int flag, struct FTW *s)
++int add_dev_1(const char *name, const struct stat *stb, int flag, struct FTW *s)
+ {
+ 	return 0;
+ }
