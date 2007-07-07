From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  7 Jul 2007 05:28:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070707122829.87266A65CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-07 05:28:25 -0700 (Sat, 07 Jul 2007)
New Revision: 19020

Log:
Avoid stripping scripts

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 11:06:08 UTC (rev 19019)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 12:28:25 UTC (rev 19020)
@@ -247,17 +247,13 @@
 		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/" ; \
 		rmdir "$(STAGING_DIR)/lib64" ; \
 	fi
+	# Move gcc bug reporting script out of path of real executables
+	mv -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gccbug \
+		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gccbug
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	if [ -e $(STAGING_DIR)/usr/bin/*-gccbug ] ; then \
-		mkdir -p "$(STAGING_DIR)/tmp" ; \
-		mv $(STAGING_DIR)/usr/bin/*-gccbug  $(STAGING_DIR)/tmp ; \
-		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
-		mv $(STAGING_DIR)/tmp/*-gccbug $(STAGING_DIR)/usr/bin ; \
-		rmdir "$(STAGING_DIR)/tmp" ; \
-	else \
-		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
-	fi
+	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*
+	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/faked
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ] ; then \
