From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Oct 2006 08:15:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061026151509.31D464868D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-10-26 08:15:08 -0700 (Thu, 26 Oct 2006)
New Revision: 16442

Log:
Fix missing libgcc_s.so.1 with BR2_GCC_SHARED_LIBGCC

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-10-26 01:47:34 UTC (rev 16441)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-10-26 15:15:08 UTC (rev 16442)
@@ -250,12 +250,11 @@
 	#
 	# Ok... that's enough of that.
 	#
-	touch $(GCC_BUILD_DIR2)/.installed
-
-$(TARGET_DIR)/lib/libgcc_s.so.1: $(GCC_BUILD_DIR2)/.installed
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -a $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -a $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
 endif
@@ -267,7 +266,7 @@
 	-cp -a $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -a $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
-	touch -c $(TARGET_DIR)/lib/libgcc_s.so.1
+	touch $(GCC_BUILD_DIR2)/.installed
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
 	$(GCC_BUILD_DIR2)/.installed $(GCC_TARGETS)
