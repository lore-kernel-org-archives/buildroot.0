From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 28 Sep 2007 13:10:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package toolchain
Message-ID: <20070928201023.95C6930078@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-28 13:10:22 -0700 (Fri, 28 Sep 2007)
New Revision: 20094

Log:
- add FC, remove some duplicate entries, cleanup
- fixup after Ulf: CXX doesn't take CFLAGS but CXXFLAGS


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-28 19:56:16 UTC (rev 20093)
+++ trunk/buildroot/Makefile	2007-09-28 20:10:22 UTC (rev 20094)
@@ -91,6 +91,9 @@
 ifndef HOSTCXX
 HOSTCXX:=g++
 endif
+ifndef HOSTFC
+HOSTFC:=gfortran
+endif
 ifndef HOSTCPP
 HOSTCPP:=cpp
 endif
@@ -107,6 +110,7 @@
 HOSTAS:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)" || type -p $(HOSTAS) || echo as)
 HOSTCC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)" || type -p $(HOSTCC) || echo gcc)
 HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
+HOSTFC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
 HOSTCPP:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCPP)" || type -p $(HOSTCPP) || echo cpp)
 HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
@@ -114,7 +118,13 @@
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif
-export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
+ifndef CXXFLAGS_FOR_BUILD
+CXXFLAGS_FOR_BUILD:=-g -O2
+endif
+ifndef FCFLAGS_FOR_BUILD
+FCFLAGS_FOR_BUILD:=-g -O2
+endif
+export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 
 
 ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-28 19:56:16 UTC (rev 20093)
+++ trunk/buildroot/package/Makefile.in	2007-09-28 20:10:22 UTC (rev 20094)
@@ -10,14 +10,14 @@
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
 
+#########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
-
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
-#TARGET_LDFLAGS=-Wl,$(BR2_SYSROOT)
+TARGET_LDFLAGS+= $(BR2_SYSROOT)
 endif
 
 CC_TARGET_TUNE_:=$(strip $(subst ",,$(BR2_GCC_TARGET_TUNE)))
@@ -87,10 +87,13 @@
 KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
+TARGET_AR=$(TARGET_CROSS)ar
+TARGET_AS=$(TARGET_CROSS)as
 TARGET_CC=$(TARGET_CROSS)gcc
 TARGET_CXX=$(TARGET_CROSS)g++
-TARGET_AR=$(TARGET_CROSS)ar
+TARGET_LD=$(TARGET_CROSS)ld
 TARGET_RANLIB=$(TARGET_CROSS)ranlib
+TARGET_OBJCOPY=$(TARGET_CROSS)objcopy
 TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
 INSTALL=/usr/bin/install
 ifeq ($(BR2_STRIP_strip),y)
@@ -134,26 +137,28 @@
 		NM=$(TARGET_CROSS)nm \
 		CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
-		CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
 		CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
+		CXX="$(TARGET_CROSS)g++ $(TARGET_CXXFLAGS)" \
+		FC="$(TARGET_CROSS)gfortran $(TARGET_FCFLAGS)" \
+		RANLIB=$(TARGET_CROSS)ranlib \
+		STRIP=$(TARGET_CROSS)strip \
+		OBJCOPY=$(TARGET_CROSS)objcopy \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		GCC_FOR_BUILD="$(HOSTCC)" \
 		CXX_FOR_BUILD="$(HOSTCXX)" \
+		FC_FOR_BUILD="$(HOSTFC)" \
 		LD_FOR_BUILD="$(HOSTLD)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
 		AR_FOR_TARGET=$(TARGET_CROSS)ar \
 		AS_FOR_TARGET=$(TARGET_CROSS)as \
 		CC_FOR_TARGET=$(TARGET_CROSS)gcc \
 		LD_FOR_TARGET=$(TARGET_CROSS)ld \
 		NM_FOR_TARGET=$(TARGET_CROSS)nm \
-		RANLIB=$(TARGET_CROSS)ranlib \
-		STRIP=$(TARGET_CROSS)strip \
-		OBJCOPY=$(TARGET_CROSS)objcopy \
-		OBJDUMP=$(TARGET_CROSS)objdump \
 		DEFAULT_ASSEMBLER=$(TARGET_CROSS)as \
 		DEFAULT_LINKER=$(TARGET_CROSS)ld \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
@@ -170,7 +175,7 @@
 		NM="$(HOSTNM)" \
 		CC="$(HOSTCC) $(HOST_CFLAGS)" \
 		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
-		CXX="$(HOSTCXX)" \
+		CXX="$(HOSTCXX) $(HOST_CXXFLAGS)" \
 		CPP="$(HOSTCPP) $(HOST_CFLAGS)" \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
@@ -178,9 +183,11 @@
 		GCC_FOR_BUILD="$(HOSTCC)" \
 		CXX_FOR_BUILD="$(HOSTCXX)" \
 		LD_FOR_BUILD="$(HOSTLD)" \
+		FC_FOR_BUILD="$(HOSTFC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
 		AR_FOR_TARGET=$(TARGET_CROSS)ar \
 		AS_FOR_TARGET=$(TARGET_CROSS)as \
 		CC_FOR_TARGET=$(TARGET_CROSS)gcc \

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-09-28 19:56:16 UTC (rev 20093)
+++ trunk/buildroot/toolchain/Makefile.in	2007-09-28 20:10:22 UTC (rev 20094)
@@ -42,8 +42,7 @@
 
 # late binding check to see if the target cc supports -fwhole-program
 CFLAGS_WHOLE_PROGRAM = $(call cc-option,-fwhole-program,)
-# gcc-3.4 would need -combine, I only support 4.2, which correctly uses '--'
-CFLAGS_COMBINE = $(call cc-option,--combine,)
+CFLAGS_COMBINE = $(call cc-option,-combine,)
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
