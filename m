From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 20 Jul 2015 19:25:40 +0800
Subject: [Buildroot] [PATCH 3/5] aarch64: ilp32: add ilp32 compiler and
	linker flags
In-Reply-To: <1437391542-13590-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437391542-13590-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437391542-13590-4-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In aarch64, lp64 is the default ABI. Need pass the special flags if
the user want to compile and link ilp32 application.
Pass the special flags to linker to ensure that linker see the
same abi with compiler.

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 package/Makefile.in | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2ed7cf7..c2a597a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -107,6 +107,16 @@ ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
 TARGET_ABI += -matomic
 endif
 
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+ifeq ($(BR2_ENDIAN), "BIG")
+TARGET_ABI_LDFLAGS += -Xlinker -EB
+endif
+TARGET_ABI_LDFLAGS += -Xlinker -maarch64linux32
+TARGET_ABI += -mabi=ilp32 $(TARGET_ABI_LDFLAGS)
+endif
+endif
+
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
@@ -140,7 +150,7 @@ endif
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
-TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS)) $(TARGET_ABI_LDFLAGS)
 
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-- 
1.8.4.5
