From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Tue, 21 Jul 2015 16:46:02 +0800
Subject: [Buildroot] [PATCH V3 3/5] aarch64: ilp32: add ilp32 compiler and
	linker flags
In-Reply-To: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437468364-19245-4-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In aarch64, lp64 is the default ABI. Need pass the special flags if
the user want to compile and link ilp32 application.
Pass the special flags to linker to ensure that linker see the
same abi with compiler.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
---
 package/Makefile.in | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..fa81b44 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -107,6 +107,17 @@ ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
 TARGET_ABI += -matomic
 endif
 
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+ifeq ($(BR2_ENDIAN), "BIG")
+TARGET_ABI_LDFLAGS += -Xlinker -EB -Xlinker -maarch64linux32b
+else
+TARGET_ABI_LDFLAGS += -Xlinker -maarch64linux32
+endif
+TARGET_ABI += -mabi=ilp32 $(TARGET_ABI_LDFLAGS)
+endif
+endif
+
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
@@ -140,7 +151,7 @@ endif
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
-TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS)) $(TARGET_ABI_LDFLAGS)
 
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-- 
2.1.4
