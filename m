From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 11:18:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090122111844.D8E3F765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-22 11:18:44 +0000 (Thu, 22 Jan 2009)
New Revision: 24961

Log:
toolchain/gcc: make version detection more robust

Thanks to Bernhard for noticing (and less so for causing the problem in
the first place :P)

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-22 11:01:56 UTC (rev 24960)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-22 11:18:44 UTC (rev 24961)
@@ -347,7 +347,7 @@
 	# Now for the ugly 3.3.x soft float hack...
 	#
 ifeq ($(BR2_SOFT_FLOAT),y)
-ifeq ($(findstring 3.3.,$(GCC_VERSION)),3.3.)
+ifeq ($(findstring x3.3.,x$(GCC_VERSION)),x3.3.)
 	# Make sure we have a soft float specs file for this arch
 	if [ ! -f toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float ]; then \
 		echo soft float configured but no specs file for this arch; \
@@ -464,20 +464,20 @@
 #
 # gcc-lib dir changes names to gcc with 3.4.mumble
 #
-ifeq ($(findstring 3.4.,$(GCC_VERSION)),3.4.)
+ifeq ($(findstring x3.4.,x$(GCC_VERSION)),x3.4.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 else
 GCC_LIB_SUBDIR=lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
 # sigh... we need to find a better way
-ifeq ($(findstring 4.0.,$(GCC_VERSION)),4.0.)
+ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
+ifeq ($(findstring x4.1.,x$(GCC_VERSION)),x4.1.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
-ifneq ($(findstring 4.2.,$(GCC_VERSION)),4.2.)
+ifeq ($(findstring x4.2,x$(GCC_VERSION)),x4.2)
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 REAL_GCC_VERSION=$(shell cat $(GCC_SRC_DIR)/gcc/BASE-VER)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(REAL_GCC_VERSION)
 else
@@ -485,7 +485,7 @@
 endif
 endif
 GCC_INCLUDE_DIR:=include
-ifeq ($(findstring 4.3,$(GCC_VERSION)),4.3)
+ifeq ($(findstring x4.3,x$(GCC_VERSION)),x4.3)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 GCC_INCLUDE_DIR:=include-fixed
 endif
@@ -499,7 +499,7 @@
 	# Now for the ugly 3.3.x soft float hack...
 	#
 ifeq ($(BR2_SOFT_FLOAT),y)
-ifeq ($(findstring 3.3.,$(GCC_VERSION)),3.3.)
+ifeq ($(findstring x3.3.,x$(GCC_VERSION)),x3.3.)
 	# Add a specs file that defaults to soft float mode.
 	cp toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float $(TARGET_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs
 	# Make sure gcc does not think we are cross compiling
