From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Apr 2010 23:27:58 +0200
Subject: [Buildroot] [PATCH 1/4] external toolchains: take into account
	architecture variant
In-Reply-To: <cover.1270502861.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270502861.git.thomas.petazzoni@free-electrons.com>
Message-ID: <70b8176dc9591fa0767f9e9a3559213d856aa9c3.1270502861.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, many TARGET_CFLAGS where missing when using an external
toolchain, due to how package/Makefile.in was written. Now, a lot more
definitions are common between the Buildroot toolchain case and the
external toolchain case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2bd3640..7461b32 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -34,16 +34,7 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
-
-#########################################################################
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
-ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
-TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
-TARGET_LDFLAGS+= $(BR2_SYSROOT)
-endif
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
@@ -86,11 +77,20 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
+
+#########################################################################
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
+ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
+TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
+TARGET_LDFLAGS+= $(BR2_SYSROOT)
+endif
 
 #########################################################################
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
+TARGET_CFLAGS+=--sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
-- 
1.6.3.3
