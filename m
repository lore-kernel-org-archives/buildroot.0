From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 08:10:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/uClibc
Message-ID: <20070727151045.96614A4711@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 08:10:45 -0700 (Fri, 27 Jul 2007)
New Revision: 19283

Log:
- put dependency checking right to the start where any later stages can rely on the being ok.


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-27 15:06:25 UTC (rev 19282)
+++ trunk/buildroot/Makefile	2007-07-27 15:10:45 UTC (rev 19283)
@@ -213,7 +213,7 @@
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
 $(BASE_TARGETS): dirs
-world: dirs target-host-info $(TARGETS)
+world: dependencies dirs target-host-info $(TARGETS)
 
 
 .PHONY: all world dirs clean dirclean distclean source target-host-info \

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-27 15:06:25 UTC (rev 19282)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-27 15:10:45 UTC (rev 19283)
@@ -359,7 +359,7 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 
 uclibc: $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
