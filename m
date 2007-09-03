From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  2 Sep 2007 23:10:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070903061002.63243A6805@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-02 23:10:01 -0700 (Sun, 02 Sep 2007)
New Revision: 19769

Log:
Cleanup handling of gccbug script

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-02 22:12:07 UTC (rev 19768)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-03 06:10:01 UTC (rev 19769)
@@ -282,7 +282,7 @@
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
+	strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-02 22:12:07 UTC (rev 19768)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-03 06:10:01 UTC (rev 19769)
@@ -288,13 +288,9 @@
 		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
 		rmdir "$(STAGING_DIR)/lib64"; \
 	fi
-	# Move gcc bug reporting script out of path of real executables
-	mv -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gccbug \
-		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gccbug
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
 	strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/faked
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
