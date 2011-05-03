From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue,  3 May 2011 16:40:55 +0200
Subject: [Buildroot] [PATCH 2/2] Get rid of unneeded CFLAGS
In-Reply-To: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
References: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
Message-ID: <1304433655-1629-3-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we use a wrapper for external toolchains (and internal ones
default to the correct setting), we no longer need to explicitly pass
sysroot/march/mtune/mabi/floating point mode in TARGET_CFLAGS.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                 |    8 +++---
 package/Makefile.in                      |   41 +++--------------------------
 package/qt/qt.mk                         |    8 +++---
 toolchain/toolchain-external/ext-tool.mk |    4 +++
 4 files changed, 17 insertions(+), 44 deletions(-)

diff --git a/Makefile b/Makefile
index 2c5aefe..5f61b93 100644
--- a/Makefile
+++ b/Makefile
@@ -375,10 +375,10 @@ world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 $(O)/toolchainfile.cmake:
 	@echo -en "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
-	set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
-	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
-	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
+	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
 	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
 	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
diff --git a/package/Makefile.in b/package/Makefile.in
index faab365..31a9639 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -62,34 +62,12 @@ endif
 
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
-CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
-CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
-
-ifneq ($(CC_TARGET_TUNE_),)
-TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
-endif
-ifneq ($(CC_TARGET_ARCH_),)
-TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
-endif
-ifneq ($(CC_TARGET_ABI_),)
-TARGET_CFLAGS+=-mabi=$(CC_TARGET_ABI_)
-endif
-
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 ifeq ($(BR2_x86_64),y)
 TARGET_CFLAGS+=-fPIC -DPIC
 endif # PIC for dynamic objects on x86_64
 endif
 
-ifeq ($(BR2_SOFT_FLOAT),y)
-TARGET_CFLAGS+=-msoft-float
-endif
-
-ifeq ($(BR2_VFP_FLOAT),y)
-TARGET_CFLAGS+=-mfpu=vfp
-endif
-
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
@@ -99,7 +77,6 @@ TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -114,11 +91,11 @@ TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 # including the --sysroot option where necessary.
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
-TARGET_CC       = $(TARGET_CROSS)gcc $(TARGET_SYSROOT_OPT)
-TARGET_CPP      = $(TARGET_CROSS)cpp $(TARGET_SYSROOT_OPT)
-TARGET_CXX      = $(TARGET_CROSS)g++ $(TARGET_SYSROOT_OPT)
-TARGET_FC       = $(TARGET_CROSS)gfortran $(TARGET_SYSROOT_OPT)
-TARGET_LD       = $(TARGET_CROSS)ld $(TARGET_SYSROOT_OPT)
+TARGET_CC       = $(TARGET_CROSS)gcc
+TARGET_CPP      = $(TARGET_CROSS)cpp
+TARGET_CXX      = $(TARGET_CROSS)g++
+TARGET_FC       = $(TARGET_CROSS)gfortran
+TARGET_LD       = $(TARGET_CROSS)ld
 TARGET_NM       = $(TARGET_CROSS)nm
 TARGET_RANLIB   = $(TARGET_CROSS)ranlib
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
@@ -132,14 +109,6 @@ TARGET_CC  := $(CCACHE) $(TARGET_CC)
 TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
-# * CMake doesn't support having the --sysroot option directly in the
-#   compiler path, so move this option to CFLAGS/CXXFLAGS variables.
-# * Don't use ccache because then CMake will fail to detect compiler.
-CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
-CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX_NOCCACHE))
-CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC_NOCCACHE)) $(TARGET_CFLAGS)
-CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX_NOCCACHE)) $(TARGET_CXXFLAGS)
-
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8d7238e..7ec7ccc 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -451,16 +451,16 @@ define QT_CONFIGURE_CMDS
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
-	$(call QT_QMAKE_SET,CC,$(filter-out --sysroot=%,$(TARGET_CC)),$(@D))
-	$(call QT_QMAKE_SET,CXX,$(filter-out --sysroot=%,$(TARGET_CXX)),$(@D))
+	$(call QT_QMAKE_SET,CC,$(TARGET_CC),$(@D))
+	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX),$(@D))
 	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX),$(@D))
 	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX),$(@D))
 	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs,$(@D))
 	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY),$(@D))
 	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB),$(@D))
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP),$(@D))
-	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CFLAGS),$(@D))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CXXFLAGS),$(@D))
+	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS),$(@D))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS),$(@D))
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS),$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0034ddf..328f908 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -126,6 +126,10 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
 	-DBR_CROSS_PATH='"$(TOOLCHAIN_EXTERNAL_BIN)/"' \
 	-DBR_SYSROOT='"$(STAGING_DIR)"'
 
+CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
+
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
 ifneq ($(CC_TARGET_TUNE_),)
-- 
1.7.2.3
