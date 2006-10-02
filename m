From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  2 Oct 2006 12:40:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061002194044.E0AF84859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-02 12:40:44 -0700 (Mon, 02 Oct 2006)
New Revision: 16292

Log:
add a know to enable/disable building a shared libgcc


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2006-10-02 18:52:49 UTC (rev 16291)
+++ trunk/buildroot/toolchain/gcc/Config.in	2006-10-02 19:40:44 UTC (rev 16292)
@@ -126,3 +126,9 @@
 	default n
 	help
 	    Build/install Objective-C compiler and runtime?
+
+config BR2_GCC_SHARED_LIBGCC
+	bool "Build/install a shared libgcc?"
+	default y
+	help
+	    Build/install a shared libgcc library

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-10-02 18:52:49 UTC (rev 16291)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-10-02 19:40:44 UTC (rev 16292)
@@ -55,6 +55,12 @@
 TARGET_LANGUAGES:=$(TARGET_LANGUAGES),fortran
 endif
 
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+GCC_SHARED_LIBGCC:=--enable-shared
+else
+GCC_SHARED_LIBGCC:=--disable-shared
+endif
+
 #############################################################
 #
 # build the first pass gcc compiler
@@ -119,11 +125,11 @@
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=c \
-		--disable-shared \
 		--with-sysroot=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		--disable-shared \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
@@ -175,10 +181,10 @@
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=$(TARGET_LANGUAGES) \
-		--enable-shared \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		$(GCC_SHARED_LIBGCC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
@@ -264,7 +270,7 @@
 	touch -c $(TARGET_DIR)/lib/libgcc_s.so.1
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
-	$(TARGET_DIR)/lib/libgcc_s.so.1 $(GCC_BUILD_DIR2)/.installed $(GCC_TARGETS)
+	$(GCC_BUILD_DIR2)/.installed $(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
@@ -294,11 +300,11 @@
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=$(TARGET_LANGUAGES) \
-		--enable-shared \
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		$(GCC_SHARED_LIBGCC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
