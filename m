From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20081222221038.CC1BC7688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:38 +0000 (Mon, 22 Dec 2008)
New Revision: 24513

Log:
strace: fix build on ARM (no <asm/cachectl.h>)

Added:
   trunk/buildroot/package/strace/strace-arm-no-cachectl.patch


Changeset:
Added: trunk/buildroot/package/strace/strace-arm-no-cachectl.patch
===================================================================
--- trunk/buildroot/package/strace/strace-arm-no-cachectl.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-arm-no-cachectl.patch	2008-12-22 22:10:38 UTC (rev 24513)
@@ -0,0 +1,21 @@
+ARM defines SYS_cacheflush, but doesn't have <asm/cachectl.h>
+---
+ system.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: strace-4.5.18/system.c
+===================================================================
+--- strace-4.5.18.orig/system.c
++++ strace-4.5.18/system.c
+@@ -70,9 +70,11 @@
+ #include <linux/capability.h>
+ #endif
+ 
++#ifndef ARM
+ #ifdef SYS_cacheflush
+ #include <asm/cachectl.h>
+ #endif
++#endif
+ 
+ #ifdef HAVE_LINUX_USTNAME_H
+ #include <linux/utsname.h>
