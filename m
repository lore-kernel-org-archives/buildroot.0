From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  5 Feb 2007 05:01:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070205130108.EC8CB4866B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-05 05:01:08 -0800 (Mon, 05 Feb 2007)
New Revision: 17779

Log:
- proposed fix for gethostent_r: if no host was found, return HOST_NOT_FOUND instead of garbage.


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch	2007-02-05 13:01:08 UTC (rev 17779)
@@ -0,0 +1,13 @@
+Index: uClibc/libc/inet/resolv.c
+===================================================================
+--- uClibc/libc/inet/resolv.c	(revision 17775)
++++ uClibc/libc/inet/resolv.c	(working copy)
+@@ -1689,7 +1689,7 @@
+ int gethostent_r(struct hostent *result_buf, char *buf, size_t buflen,
+ 	struct hostent **result, int *h_errnop)
+ {
+-    int ret;
++    int ret = HOST_NOT_FOUND;
+ 
+     __UCLIBC_MUTEX_LOCK(mylock);
+     if (__gethostent_fp == NULL) {
