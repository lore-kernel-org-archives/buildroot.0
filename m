From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 08:07:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070731150707.8BB3DA493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 08:07:06 -0700 (Tue, 31 Jul 2007)
New Revision: 19353

Log:
- add possibility to select which cross-compilers to build
- add prerequisites from the config


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-31 15:02:06 UTC (rev 19352)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-31 15:07:06 UTC (rev 19353)
@@ -156,6 +156,18 @@
 	help
 	  Any additional gcc configure options you may want to include....
 
+config BR2_GCC_CROSS_CXX
+	bool "C++ cross-compiler support"
+	default n
+	help
+	  Build a C++ cross-compiler
+
+config BR2_GCC_CROSS_FORTRAN
+	bool "Fortran cross-compiler support"
+	default n
+	help
+	  Build a Fortran cross-compiler
+
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	default n

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-31 15:02:06 UTC (rev 19352)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-31 15:07:06 UTC (rev 19353)
@@ -75,10 +75,31 @@
 
 GCC_TARGET_LANGUAGES:=c
 
-GCC_COMMON_PREREQ= $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran* $(BASE_DIR)/include/config/br2/prefer/ima* $(BASE_DIR)/include/config/br2/toolchain/sysroot* $(BASE_DIR)/include/config/br2/use/sjlj/exceptions* $(BASE_DIR)/include/config/br2/gcc/shared/libgcc*)
-GCC_TARGET_PREREQ += $(GCC_COMMON_PREREQ) $(wildcard $(BASE_DIR)/include/config/br2/extra/target/gcc/config/options*)
-GCC_STAGING_PREREQ+= $(GCC_COMMON_PREREQ) $(wildcard $(BASE_DIR)/include/config/br2/extra/gcc/config/options*)
+GCC_CROSS_LANGUAGES:=c
+ifeq ($(BR2_GCC_CROSS_CXX),y)
+GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),c++
+endif
+ifeq ($(BR2_GCC_CROSS_FORTRAN),y)
+GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),fortran
+endif
+ifeq ($(BR2_GCC_CROSS_OBJC),y)
+GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),objc
+endif
 
+GCC_COMMON_PREREQ= $(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/install/libgcj*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/install/objc*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/install/fortran*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/prefer/ima*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/toolchain/sysroot*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/use/sjlj/exceptions*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/shared/libgcc*)
+GCC_TARGET_PREREQ += $(GCC_COMMON_PREREQ) \
+$(wildcard $(BR2_DEPENDS_DIR)/br2/extra/target/gcc/config/options*)
+GCC_STAGING_PREREQ+= $(GCC_COMMON_PREREQ) \
+$(wildcard $(BR2_DEPENDS_DIR)/br2/extra/gcc/config/options*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/cross/*)
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
@@ -232,7 +253,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--enable-languages=$(GCC_TARGET_LANGUAGES) \
+		--enable-languages=$(GCC_CROSS_LANGUAGES) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(BR2_CONFIGURE_BUILD_TOOLS) \
 		--disable-__cxa_atexit \
