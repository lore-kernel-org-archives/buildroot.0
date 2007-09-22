From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 14:38:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: toolchain/gcc
	toolchain/uClibc
Message-ID: <20070922213816.8B7F3A65BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 14:38:15 -0700 (Sat, 22 Sep 2007)
New Revision: 19953

Log:
- rename the gcc base_target to the more appropriate term cross_compiler


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-22 21:37:27 UTC (rev 19952)
+++ trunk/buildroot/Makefile	2007-09-22 21:38:15 UTC (rev 19953)
@@ -169,7 +169,7 @@
 #
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-BASE_TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
+BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils
 else
 BASE_TARGETS:=uclibc
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-22 21:37:27 UTC (rev 19952)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-22 21:38:15 UTC (rev 19953)
@@ -350,7 +350,9 @@
 endif
 	touch $@
 
-gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
+cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+cross_compiler gcc: uclibc-configured binutils gcc_initial \
+	$(LIBFLOAT_TARGET) uclibc \
 	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
 	$(GCC_TARGETS)
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-22 21:37:27 UTC (rev 19952)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-22 21:38:15 UTC (rev 19953)
@@ -357,7 +357,9 @@
 endif
 	touch $@
 
-gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
+cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+cross_compiler gcc: uclibc-configured binutils gcc_initial \
+	$(LIBFLOAT_TARGET) uclibc \
 	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
 	$(GCC_TARGETS)
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-22 21:37:27 UTC (rev 19952)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-22 21:38:15 UTC (rev 19953)
@@ -424,7 +424,7 @@
 		install_runtime
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/ldd: $(TARGET_CROSS)gcc
+$(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
@@ -438,7 +438,7 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc: $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
+uclibc: $(cross_compiler) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
@@ -494,7 +494,7 @@
 endif
 	touch -c $@
 
-uclibc_target: gcc uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
+uclibc_target: cross_compiler uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
 uclibc_target-clean:
 	rm -rf $(TARGET_DIR)/usr/include \
