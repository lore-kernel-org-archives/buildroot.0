From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  1 Oct 2007 05:56:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071001125625.F2C76A685D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-01 05:56:24 -0700 (Mon, 01 Oct 2007)
New Revision: 20161

Log:
- add additional EXTRA_GCC_CONFIG_OPTIONS for initial, cross and target compiler


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 12:05:12 UTC (rev 20160)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 12:56:24 UTC (rev 20161)
@@ -54,8 +54,8 @@
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
+GCC_SRC_DIR=$(GCC_DIR) # for stage2 and stage3 compilers. Usually same as stage1
 
-
 ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 GCC_NO_MPFR:=y
 endif
@@ -63,14 +63,16 @@
 GCC_NO_MPFR:=y
 endif
 
+GCC_TARGET_PREREQ=
+GCC_STAGING_PREREQ=
+
 #############################################################
 #
 # Setup some initial stuff
 #
 #############################################################
 
-GCC_TARGET_PREREQ=
-GCC_STAGING_PREREQ=$(STAGING_DIR)/usr/lib/libc.a
+GCC_STAGING_PREREQ+=$(STAGING_DIR)/usr/lib/libc.a
 
 GCC_TARGET_LANGUAGES:=c
 
@@ -206,7 +208,9 @@
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+		$(EXTRA_GCC1_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
@@ -216,8 +220,6 @@
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
 $(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-	#rm -f $(STAGING_DIR)/usr/bin/gccbug $(STAGING_DIR)/usr/bin/gcov
-	#rm -rf $(STAGING_DIR)/usr/info $(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc $(STAGING_DIR)/usr/share/locale
 	touch $(gcc_initial)
 
 gcc_initial: uclibc-configured binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
@@ -242,7 +244,7 @@
 # guarantees. mjn3
 
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
-$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
+$(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important! Required for limits.h to be fixed.
 	ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
@@ -250,7 +252,7 @@
 	#ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
-		$(GCC_DIR)/configure \
+		$(GCC_SRC_DIR)/configure \
 		--prefix=$(BR2_SYSROOT_PREFIX)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
@@ -271,7 +273,9 @@
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+		$(EXTRA_GCC2_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
@@ -390,7 +394,7 @@
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_GCC_FLAGS) \
-		$(GCC_DIR)/configure \
+		$(GCC_SRC_DIR)/configure \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
@@ -410,7 +414,9 @@
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS))
+		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
+		$(EXTRA_GCC3_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
@@ -435,7 +441,7 @@
 endif
 ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
 ifneq ($(findstring 4.2.,$(GCC_VERSION)),4.2.)
-REAL_GCC_VERSION=$(shell cat $(GCC_DIR)/gcc/BASE-VER)
+REAL_GCC_VERSION=$(shell cat $(GCC_SRC_DIR)/gcc/BASE-VER)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(REAL_GCC_VERSION)
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
