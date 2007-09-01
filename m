From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 11:46:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/libfloat
	toolchain/gcc toolchain etc...
Message-ID: <20070901184647.B6117A6046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 11:46:46 -0700 (Sat, 01 Sep 2007)
New Revision: 19758

Log:
- add sequence-point for toplevel parallel builds: uClibc needs an initial gcc


Modified:
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 18:21:09 UTC (rev 19757)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 18:46:46 UTC (rev 19758)
@@ -47,7 +47,7 @@
 	(cd $(TARGET_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
 	(cd $(TARGET_DIR)/usr/lib; ln -snf /lib/libfloat.so libfloat.so)
 
-libfloat: gcc_initial $(STAGING_DIR)/lib/libfloat.so
+libfloat: $(gcc_initial) $(STAGING_DIR)/lib/libfloat.so
 
 libfloat-clean:
 	-$(MAKE) -C $(LIBFLOAT_DIR) clean

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-01 18:21:09 UTC (rev 19757)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-01 18:46:46 UTC (rev 19758)
@@ -206,10 +206,12 @@
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 	touch $@
 
-$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
+gcc_initial = $(GCC_BUILD_DIR1)/.installed
+$(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
 	#rm -f $(STAGING_DIR)/bin/gccbug $(STAGING_DIR)/bin/gcov
 	#rm -rf $(STAGING_DIR)/info $(STAGING_DIR)/man $(STAGING_DIR)/share/doc $(STAGING_DIR)/share/locale
+	touch $(gcc_initial)
 
 gcc_initial: uclibc-configured binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-01 18:21:09 UTC (rev 19757)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-01 18:46:46 UTC (rev 19758)
@@ -213,10 +213,12 @@
 	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 	touch $@
 
-$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
+gcc_initial = $(GCC_BUILD_DIR1)/.installed
+$(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
 	#rm -f $(STAGING_DIR)/usr/bin/gccbug $(STAGING_DIR)/usr/bin/gcov
 	#rm -rf $(STAGING_DIR)/usr/info $(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc $(STAGING_DIR)/usr/share/locale
+	touch $(gcc_initial)
 
 gcc_initial: uclibc-configured binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-01 18:21:09 UTC (rev 19757)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-01 18:46:46 UTC (rev 19758)
@@ -341,7 +341,7 @@
 endif
 	touch $@
 
-$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(LIBFLOAT_TARGET)
+$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TARGET)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
@@ -382,7 +382,6 @@
 			$(STAGING_DIR)/usr/include/; \
 	fi
 else
-
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
 			$(STAGING_DIR)/usr/include/; \
