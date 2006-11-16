From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 16 Nov 2006 01:55:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061116095520.2C13848594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-11-16 01:55:20 -0800 (Thu, 16 Nov 2006)
New Revision: 16536

Log:
Make sure libgcc_s.so.1 and friends always gets installed in TARGET_DIR.
Patch by Lars Munch.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-11-16 02:27:24 UTC (rev 16535)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-11-16 09:55:20 UTC (rev 16536)
@@ -250,6 +250,9 @@
 	#
 	# Ok... that's enough of that.
 	#
+	touch $(GCC_BUILD_DIR2)/.installed
+
+gcc-target-libs: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -266,10 +269,9 @@
 	-cp -a $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -a $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
-	touch $(GCC_BUILD_DIR2)/.installed
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
-	$(GCC_BUILD_DIR2)/.installed $(GCC_TARGETS)
+	$(GCC_BUILD_DIR2)/.installed gcc-target-libs $(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
