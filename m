From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:54:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
Message-ID: <20061117115445.7111B48613@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:54:45 -0800 (Fri, 17 Nov 2006)
New Revision: 16558

Log:
- I had to apply this patch to get it to build with a uClibc-snapshot..


Added:
   trunk/buildroot/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch

Modified:
   trunk/buildroot/package/sfdisk/sfdisk.mk


Changeset:
Added: trunk/buildroot/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch	2006-11-17 11:52:58 UTC (rev 16557)
+++ trunk/buildroot/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch	2006-11-17 11:54:45 UTC (rev 16558)
@@ -0,0 +1,12 @@
+--- sfdisk/sfdisk.c.oorig	2006-10-09 16:24:06.000000000 +0200
++++ sfdisk/sfdisk.c	2006-10-09 16:24:20.000000000 +0200
+@@ -47,6 +47,9 @@
+ #include <sys/stat.h>
+ #include <sys/utsname.h>
+ #ifdef __linux__
++#define _LIBC
++#include <sys/syscall.h>
++#undef _LIBC
+ #include <linux/unistd.h>	/* _syscall */
+ #endif
+ #include "nls.h"

Modified: trunk/buildroot/package/sfdisk/sfdisk.mk
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.mk	2006-11-17 11:52:58 UTC (rev 16557)
+++ trunk/buildroot/package/sfdisk/sfdisk.mk	2006-11-17 11:54:45 UTC (rev 16558)
@@ -10,10 +10,13 @@
 $(DL_DIR)/$(SFDISK_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SFDISK_SITE)/$(SFDISK_SOURCE)
 
-$(SFDISK_DIR): $(DL_DIR)/$(SFDISK_SOURCE)
+$(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
 	bzcat $(DL_DIR)/$(SFDISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SFDISK_DIR) package/sfdisk/ sfdisk.\*.patch
+	touch $@
+	
 
-$(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)
+$(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)/.patched
 	$(MAKE) \
 		CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$(TARGET_CFLAGS)" \
 		-C $(SFDISK_DIR)
