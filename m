From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 21 Aug 2012 12:45:49 +0800
Subject: [Buildroot] [PATCH 2/2 v2] package: Makefile.in: Add target
	compilation flags for Blackfin.
In-Reply-To: <1345524349-709-1-git-send-email-sonic.adi@gmail.com>
References: <1345524349-709-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1345524349-709-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

1) Add CPU type and revision CFLAGS
2) Add NOMMU compilation flags
3) Add FLAT ABI link flags
4) Add FLAT (Separate Data) ABI flags
5) Add share FLAT ABI flags

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.in |   28 +++++++++++++++++++++++++++-
 1 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 6fad224..1b9a612 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -85,7 +85,13 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
-TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+ifeq ($(BR2_GCC_TARGET_CPU_REVISION),)
+TARGET_CPU=-mcpu=$(BR2_GCC_TARGET_CPU)
+else
+TARGET_CPU=-mcpu=$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION)
+endif
+
+TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_CPU)
 
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
@@ -95,9 +101,29 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
+ifneq ($(BR2_USE_MMU), y)
+TARGET_CFLAGS += -D__NOMMU__ -D__uClinux__
+endif
+
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_ABI_FLAT),y)
+TARGET_LDFLAGS += -Wl,-elf2flt
+endif
+
+ifeq ($(BR2_BFIN_FLAT_SEP_DATA),y)
+TARGET_LDFLAGS += -msep-data
+TARGET_CFLAGS += -msep-data
+TARGET_CXXFLAGS += -msep-data
+endif
+
+ifeq ($(BR2_BFIN_SHARED_FLAT), y)
+TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
-- 
1.7.0.4
