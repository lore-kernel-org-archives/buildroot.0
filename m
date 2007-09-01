From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:09:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070901170908.BD5BEA65B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:09:08 -0700 (Sat, 01 Sep 2007)
New Revision: 19748

Log:
- GCC_CROSS_LANGUAGES for non-sysroot enabled gcc


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-01 17:06:53 UTC (rev 19747)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-01 17:09:08 UTC (rev 19748)
@@ -80,16 +80,26 @@
 #
 #############################################################
 
+
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
+
+
 GCC_TARGET_LANGUAGES:=c
-
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
-
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),java
 endif
-
 ifeq ($(BR2_INSTALL_OBJC),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
@@ -237,7 +247,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--enable-languages=$(GCC_TARGET_LANGUAGES) \
+		--enable-languages=$(GCC_CROSS_LANGUAGES) \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
