From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  2 Oct 2008 08:02:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20081002150239.193F73C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-02 08:02:38 -0700 (Thu, 02 Oct 2008)
New Revision: 23579

Log:
gcc: make installation of shared libraries multi-project safe

This patch modifies the rule for installing the shared libraries into the
project_foo/.../autotools-stamps directory. This will make the installation of
GCC shared libraries be multi-project safe.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-02 14:32:07 UTC (rev 23578)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-02 15:02:38 UTC (rev 23579)
@@ -330,7 +330,7 @@
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
-$(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
+$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -355,10 +355,12 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
 endif
+	mkdir -p $(@D)
 	touch $@
 
 cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
-cross_compiler gcc: gcc-config $(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
+cross_compiler gcc: gcc-config $(GCC_BUILD_DIR2)/.installed \
+	$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed \
 	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
@@ -383,7 +385,7 @@
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.libs_installed $(GCC_TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-02 14:32:07 UTC (rev 23578)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-02 15:02:38 UTC (rev 23579)
@@ -359,7 +359,7 @@
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
-$(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
+$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -385,12 +385,13 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
 endif
+	mkdir -p $(@D)
 	touch $@
 
 cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 cross_compiler gcc: uclibc-configured binutils gcc_initial \
-	$(LIBFLOAT_TARGET) uclibc \
-	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
+	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR2)/.installed \
+	$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed \
 	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
@@ -412,7 +413,7 @@
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.libs_installed $(GCC_TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 
