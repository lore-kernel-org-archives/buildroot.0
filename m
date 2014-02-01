From: Uwe Strempel <u.strempel@googlemail.com>
Date: Sat, 01 Feb 2014 12:31:13 +0100
Subject: [Buildroot] Patch for toolchainfile.cmake absolut path references
Message-ID: <52ECDB01.5070306@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've build a patch for BUG #6818


On build process of buildroot the toolchainfile.cmake is created, but
with wrong absolut path.
When shareing the toolchain or move the folder you get problems this
path settings.

A workarround for cmake files is
- get the path of the toolchainfile.cmake and set the the variables.

Regards
Uwe
-------------- next part --------------
diff --git a/package/Makefile.in b/package/Makefile.in
index 2e433fd..aa86fca 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -140,8 +140,10 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
+TARGET_CROSS_WITHOUT_HOST_DIR=/usr/bin/$(GNU_TARGET_NAME)-
 else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
+TARGET_CROSS_WITHOUT_HOST_DIR=/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
 # Quotes are needed for spaces et al in path components.
@@ -164,6 +166,9 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 TARGET_CC_NOCCACHE  := $(TARGET_CC)
 TARGET_CXX_NOCCACHE := $(TARGET_CXX)
 
+TARGET_CC_NOCCACHE_WITHOUT_HOST_DIR  := $(TARGET_CROSS_WITHOUT_HOST_DIR)gcc
+TARGET_CXX_NOCCACHE_WITHOUT_HOST_DIR :=  $(TARGET_CROSS_WITHOUT_HOST_DIR)g++
+
 ifeq ($(BR2_CCACHE),y)
 TARGET_CC  := $(CCACHE) $(TARGET_CC)
 TARGET_CXX := $(CCACHE) $(TARGET_CXX)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 13be557..d30991c 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -160,16 +160,17 @@ host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPE
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	@echo -en "\
+	get_filename_component(CMAKE_TOOLCHAIN_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)\n\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_COMPILER \"${CMAKE_TOOLCHAIN_PATH}/$(TARGET_CC_NOCCACHE_WITHOUT_HOST_DIR)\")\n\
+	set(CMAKE_CXX_COMPILER \"${CMAKE_TOOLCHAIN_PATH}/$(TARGET_CXX_NOCCACHE_WITHOUT_HOST_DIR)\")\n\
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_PROGRAM_PATH \"$(CMAKE_TOOLCHAIN_PATH)/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"${CMAKE_TOOLCHAIN_PATH}/${STAGING_SUBDIR}\")\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"${CMAKE_TOOLCHAIN_PATH}/${STAGING_SUBDIR}\")\n\
 	" > $@
