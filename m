From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 24 Apr 2009 18:42:18 +0000 (UTC)
Subject: [Buildroot] svn commit: [26202] trunk/buildroot/toolchain/uClibc
Message-ID: <20090424184219.14D7077148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-24 18:42:18 +0000 (Fri, 24 Apr 2009)
New Revision: 26202

Log:
toolchain/uClibc: 0.9.30.1 getaddrinfo fix for intfs without address

From uClibc r24336.

Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-fix-getaddrinfo.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-fix-getaddrinfo.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-fix-getaddrinfo.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-fix-getaddrinfo.patch	2009-04-24 18:42:18 UTC (rev 26202)
@@ -0,0 +1,13 @@
+[PATCH]: runp->ifa_addr can be NULL. Backport of r24336.
+diff -Narup uClibc-0.9.30.1.orig/libc/inet/getaddrinfo.c uClibc-0.9.30.1/libc/inet/getaddrinfo.c
+--- uClibc-0.9.30.1.orig/libc/inet/getaddrinfo.c	2009-02-26 21:49:14.000000000 +0900
++++ uClibc-0.9.30.1/libc/inet/getaddrinfo.c	2009-03-06 00:59:23.000000000 +0900
+@@ -187,6 +187,8 @@ static unsigned __check_pf(void)
+ 		}
+ 
+ 		for (runp = ifa; runp != NULL; runp = runp->ifa_next) {
++			if (runp->ifa_addr == NULL)
++				continue;
+ #if defined __UCLIBC_HAS_IPV4__
+ 			if (runp->ifa_addr->sa_family == PF_INET)
+ 				seen |= SEEN_IPV4;
