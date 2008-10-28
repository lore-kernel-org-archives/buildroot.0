From: Daniel J Laird <daniel.j.laird@nxp.com>
Date: Tue, 28 Oct 2008 14:58:19 +0100
Subject: [Buildroot] LDFLAGS setting in buildroot
In-Reply-To: <20081028131817.GA3139@mx.loc>
References: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>
	<20081028131817.GA3139@mx.loc>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B20D9256@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The proposed patch would be something like this:

--- buildroot/SVN/buildroot/package/Makefile.in 
+++ buildroot/SVN/buildroot.new/package/Makefile.in 
@@ -39,7 +39,7 @@
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
 TARGET_LDFLAGS+= $(BR2_SYSROOT)
@@ -91,7 +91,7 @@
 else
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
@@ -126,7 +126,8 @@
 #"))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+# Make sure that STAGING_DIR/usr/bin is in path for freetype-config etc.
+TARGET_PATH="$(STAGING_DIR)/usr/bin:$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
@@ -196,7 +197,8 @@
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
+		LD="$(TARGET_LD)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \

Let me know your thoughts
