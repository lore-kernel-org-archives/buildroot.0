From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 15:31:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sysklogd
Message-ID: <20090305153103.477B87626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 15:30:57 +0000 (Thu, 05 Mar 2009)
New Revision: 25548

Log:
sysklogd: fix build

Added:
   trunk/buildroot/package/sysklogd/sysklogd-susv3-legacy.patch

Modified:
   trunk/buildroot/package/sysklogd/sysklogd.mk
   trunk/buildroot/package/sysklogd/sysklogd.patch


Changeset:
Added: trunk/buildroot/package/sysklogd/sysklogd-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/sysklogd/sysklogd-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/sysklogd/sysklogd-susv3-legacy.patch	2009-03-05 15:30:57 UTC (rev 25548)
@@ -0,0 +1,20 @@
+[PATCH] replace susv3 legacy functions with modern equivalents
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ syslog.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: sysklogd-1.4.1/syslog.c
+===================================================================
+--- sysklogd-1.4.1.orig/syslog.c
++++ sysklogd-1.4.1/syslog.c
+@@ -178,7 +178,7 @@
+ 		return;
+ 	(void)strcat(tbuf, "\r\n");
+ 	cnt += 2;
+-	p = index(tbuf, '>') + 1;
++	p = strchr(tbuf, '>') + 1;
+ 	(void)write(fd, p, cnt - (p - tbuf));
+ 	(void)close(fd);
+ }

Modified: trunk/buildroot/package/sysklogd/sysklogd.mk
===================================================================
--- trunk/buildroot/package/sysklogd/sysklogd.mk	2009-03-05 14:17:55 UTC (rev 25547)
+++ trunk/buildroot/package/sysklogd/sysklogd.mk	2009-03-05 15:30:57 UTC (rev 25548)
@@ -25,7 +25,7 @@
 	touch $(SYSKLOGD_DIR)/.unpacked
 
 $(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY): $(SYSKLOGD_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) -C $(SYSKLOGD_DIR)
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(SYSKLOGD_DIR)
 	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY)
 	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY)
 

Modified: trunk/buildroot/package/sysklogd/sysklogd.patch
===================================================================
--- trunk/buildroot/package/sysklogd/sysklogd.patch	2009-03-05 14:17:55 UTC (rev 25547)
+++ trunk/buildroot/package/sysklogd/sysklogd.patch	2009-03-05 15:30:57 UTC (rev 25548)
@@ -66,11 +66,10 @@
 
 --- sysklogd-1.4.1/ksym_mod.c.orig	2005-11-24 23:15:01.000000000 +1000
 +++ sysklogd-1.4.1/ksym_mod.c	2005-11-24 23:11:54.000000000 +1000
-@@ -89,17 +89,22 @@
+@@ -89,17 +89,21 @@
  #include <errno.h>
  #include <sys/fcntl.h>
  #include <sys/stat.h>
-+#include <linux/linkage.h>
 +#include <linux/version.h>
  #if !defined(__GLIBC__)
  #include <linux/time.h>
