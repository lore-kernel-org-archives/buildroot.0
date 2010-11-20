From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 05:29:40 -0500
Subject: [Buildroot] [PATCH] TARGET_CFLAGS: convert to kbuild-y style
Message-ID: <1290248980-16200-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Makefile.in |   67 ++++++++++++++------------------------------------
 1 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 971a7ed..e61be79 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -9,78 +9,49 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
-ifeq ($(BR2_OPTIMIZE_0),y)
-TARGET_OPTIMIZATION+=-O0
-endif
-ifeq ($(BR2_OPTIMIZE_1),y)
-TARGET_OPTIMIZATION+=-O1
-endif
-ifeq ($(BR2_OPTIMIZE_2),y)
-TARGET_OPTIMIZATION+=-O2
-endif
-ifeq ($(BR2_OPTIMIZE_3),y)
-TARGET_OPTIMIZATION+=-O3
-endif
-ifeq ($(BR2_OPTIMIZE_S),y)
-TARGET_OPTIMIZATION+=-Os
-endif
-ifeq ($(BR2_DEBUG_1),y)
-TARGET_DEBUGGING=-g1
-endif
-ifeq ($(BR2_DEBUG_2),y)
-TARGET_DEBUGGING=-g2
-endif
-ifeq ($(BR2_DEBUG_3),y)
-TARGET_DEBUGGING=-g3
-endif
-
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_CFLAGS-$(BR2_OPTIMIZE_0) += -O0
+TARGET_CFLAGS-$(BR2_OPTIMIZE_1) += -O1
+TARGET_CFLAGS-$(BR2_OPTIMIZE_2) += -O2
+TARGET_CFLAGS-$(BR2_OPTIMIZE_3) += -O3
+TARGET_CFLAGS-$(BR2_OPTIMIZE_S) += -Os
+TARGET_CFLAGS-$(BR2_DEBUG_1)    += -g1
+TARGET_CFLAGS-$(BR2_DEBUG_2)    += -g2
+TARGET_CFLAGS-$(BR2_DEBUG_3)    += -g3
 
 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 ifneq ($(CC_TARGET_TUNE_),)
-TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
+TARGET_CFLAGS-y += -mtune=$(CC_TARGET_TUNE_)
 endif
 ifneq ($(CC_TARGET_ARCH_),)
-TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
+TARGET_CFLAGS-y += -march=$(CC_TARGET_ARCH_)
 endif
 ifneq ($(CC_TARGET_ABI_),)
-TARGET_CFLAGS+=-mabi=$(CC_TARGET_ABI_)
+TARGET_CFLAGS-y += -mabi=$(CC_TARGET_ABI_)
 endif
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-ifeq ($(BR2_x86_64),y)
-TARGET_CFLAGS+=-fPIC -DPIC
-endif # PIC for dynamic objects on x86_64
-endif
-
-ifeq ($(BR2_SOFT_FLOAT),y)
-TARGET_CFLAGS+=-msoft-float
+TARGET_CFLAGS-$(BR2_x86_64) += -fPIC -DPIC
 endif
 
-ifeq ($(BR2_VFP_FLOAT),y)
-TARGET_CFLAGS+=-mfpu=vfp
-endif
+TARGET_CFLAGS-$(BR2_SOFT_FLOAT) += -msoft-float
+TARGET_CFLAGS-$(BR2_VFP_FLOAT) += -mfpu=vfp
 
 # enable VIS for v9a and v9b
 ifeq ($(findstring y,$(BR2_sparc_v9a)$(BR2_sparc64_v9a)$(BR2_sparc_v9b)$(BR2_sparc64_v9b)),y)
-TARGET_CFLAGS+=-mvis
+TARGET_CFLAGS-y += -mvis
 endif
 
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
-TARGET_CFLAGS+=-fno-pic -mno-abicalls
+TARGET_CFLAGS-y += -fno-pic -mno-abicalls
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
-TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-endif
+TARGET_CFLAGS-$(BR2_LARGEFILE) += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+TARGET_CFLAGS-$(BR2_TOOLCHAIN_BUILDROOT) += -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 
+TARGET_CFLAGS=$(TARGET_CFLAGS-y)
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
-- 
1.7.3.2
