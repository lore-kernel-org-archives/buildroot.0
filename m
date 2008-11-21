From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 21 Nov 2008 06:51:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081121145110.9D0373C8FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-21 06:51:10 -0800 (Fri, 21 Nov 2008)
New Revision: 24115

Log:
Revert r24000: "Fix external toolchain build"

This breaks builds with internal toolchain, so let's revert this until we find
a proper solution.

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-11-21 14:36:48 UTC (rev 24114)
+++ trunk/buildroot/package/Makefile.in	2008-11-21 14:51:10 UTC (rev 24115)
@@ -38,8 +38,7 @@
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \
-	-Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
+	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
@@ -90,9 +89,7 @@
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include \
-	 -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
@@ -129,8 +126,7 @@
 #"))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-# Make sure that STAGING_DIR/usr/bin is in path for freetype-config etc.
-TARGET_PATH="$(STAGING_DIR)/usr/bin:$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
@@ -200,9 +196,7 @@
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
 		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
