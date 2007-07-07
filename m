From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  7 Jul 2007 00:34:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070707073437.22ECBA682B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-07 00:34:37 -0700 (Sat, 07 Jul 2007)
New Revision: 19014

Log:
Avoid stripping a script file

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-06 16:57:06 UTC (rev 19013)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 07:34:37 UTC (rev 19014)
@@ -249,7 +249,15 @@
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
+	if [ -e $(STAGING_DIR)/usr/bin/*-gccbug ] ; then \
+		mkdir -p "$(STAGING_DIR)/tmp" ; \
+		mv $(STAGING_DIR)/usr/bin/*-gccbug  $(STAGING_DIR)/tmp ; \
+		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
+		mv $(STAGING_DIR)/tmp/*-gccbug $(STAGING_DIR)/usr/bin ; \
+		rmdir "$(STAGING_DIR)/tmp" ; \
+	else \
+		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
+	fi
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ] ; then \
