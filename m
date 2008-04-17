From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu, 17 Apr 2008 06:23:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
Message-ID: <20080417132321.210B43C4FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-17 06:23:20 -0700 (Thu, 17 Apr 2008)
New Revision: 21754

Log:
* Fix _llseek not being defined in some cases
* Add index & rindex defines if they're not defined either (legacy susv4 functions)


Added:
   trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch
   trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch


Changeset:
Added: trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch	2008-04-17 13:23:20 UTC (rev 21754)
@@ -0,0 +1,21 @@
+diff -ur sfdisk_vanilla/sfdisk.c sfdisk_llseek-fix/sfdisk.c
+--- sfdisk_vanilla/sfdisk.c	2004-01-13 13:03:11.000000000 +0000
++++ sfdisk_llseek-fix/sfdisk.c	2008-04-17 08:42:35.000000000 +0000
+@@ -134,9 +137,17 @@
+  * Note: we use 512-byte sectors here, irrespective of the hardware ss.
+  */
+ #if defined(__linux__) && !defined (__alpha__) && !defined (__ia64__) && !defined (__x86_64__) && !defined (__s390x__)
++#if defined(_llseek)
+ static
+ _syscall5(int,  _llseek,  unsigned int,  fd, ulong, hi, ulong, lo,
+        loff_t *, res, unsigned int, wh);
++#else
++static int _llseek (unsigned int fd, unsigned long oh,
++		unsigned long ol, long long *result,
++		unsigned int origin) {
++	return syscall (__NR__llseek, fd, oh, ol, result, origin);
++#endif
++}
+ #endif
+ 
+ static int

Added: trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch	2008-04-17 13:23:20 UTC (rev 21754)
@@ -0,0 +1,21 @@
+diff -ru sfdisk_llseek-fix/sfdisk.c sfdisk_index-rindex-fix/sfdisk.c
+--- sfdisk_llseek-fix/sfdisk.c	2008-04-17 08:42:35.000000000 +0000
++++ sfdisk_index-rindex-fix/sfdisk.c	2008-04-17 09:50:17.000000000 +0000
+@@ -58,6 +58,17 @@
+ 
+ #define SIZE(a)	(sizeof(a)/sizeof(a[0]))
+ 
++/* 
++ * Why these wouldn't be defined in string.h, I don't know, there is a block
++ * testing for BSD, and no other mention of these functions ... NK
++ */
++#if !defined(index)
++#  define index(s,c) strchr((s), (c))
++#endif
++#if !defined(rindex)
++#  define rindex(s,c) strrchr((s), (c))
++#endif
++
+ /*
+  * Table of contents:
+  *  A. About seeking
