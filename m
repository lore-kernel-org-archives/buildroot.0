From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:23:11 -0500 (EST)
Subject: [Buildroot] [PATCH] replace the unused BR2_TARGET_OPTIMIZATION
Message-ID: <alpine.LFD.2.00.0812031422212.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The BR2_TARGET_OPTIMIZATION setting is not used anywhere.  Instead, a set
of discrete optimization levels are provided through the BR2_OPTIMIZE_*
symbols.

This replaces BR2_TARGET_OPTIMIZATION with BR2_TARGET_EXTRA_FLAGS which
can be used for specific customizations of the build, such as specific
optimizations, etc.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: toolchain/gcc/Makefile.in
===================================================================
--- toolchain/gcc/Makefile.in	(revision 24219)
+++ toolchain/gcc/Makefile.in	(working copy)
@@ -6,7 +6,7 @@
 
 GCC_VERSION:=$(strip $(subst ",, $(BR2_GCC_VERSION)))
 #"))
-TARGET_OPTIMIZATION:=$(strip $(subst ",, $(BR2_TARGET_OPTIMIZATION)))
+TARGET_EXTRA_FLAGS:=$(strip $(subst ",, $(BR2_TARGET_EXTRA_FLAGS)))
 #"))
 EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
 #"))
Index: toolchain/external-toolchain/Config.in
===================================================================
--- toolchain/external-toolchain/Config.in	(revision 24219)
+++ toolchain/external-toolchain/Config.in	(working copy)
@@ -99,10 +99,10 @@
 	  Set this option if the external toolchain has a C++
 	  cross-compiler.
 
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
+config BR2_TARGET_EXTRA_FLAGS
+	string "Target extra gcc flags"
+	default ""
 	help
-	  Optimizations to use when building for the target host.
+	  Extra gcc flags to use when building for the target host.
 
 endif
Index: toolchain/Config.in.2
===================================================================
--- toolchain/Config.in.2	(revision 24219)
+++ toolchain/Config.in.2	(working copy)
@@ -54,11 +54,11 @@
 #config BR2_SOFT_FLOAT_FP
 #	bool "Use softfp"
 
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
+config BR2_TARGET_EXTRA_FLAGS
+	string "Target extra gcc flags"
+	default ""
 	help
-	  Optimizations to use when building for the target host.
+	  Extra gcc flags to use when building for the target host.
 
 config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
 	bool "Include target utils in cross toolchain"
Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 24219)
+++ package/Makefile.in	(working copy)
@@ -37,7 +37,7 @@
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_EXTRA_FLAGS) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
@@ -89,7 +89,8 @@
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_EXTRA_FLAGS) \
+	-I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
