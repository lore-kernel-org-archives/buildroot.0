From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Wed, 18 Mar 2015 17:49:50 +0800
Subject: [Buildroot] [RFC PATCH v2 3/5] aarch64: ilp32: add ilp32 compiler
	and linker flags
In-Reply-To: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1426672192-21041-4-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In aarch64, lp64 is the default ABI. Need pass the special flags if
the user want to compile and link ilp32 application.

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 package/Makefile.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..23f376f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -106,6 +106,14 @@ ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
 TARGET_ABI += -matomic
 endif
 
+ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64),yy)
+TARGET_ABI += -mabi=ilp32 -Xlinker -maarch64linux32
+endif
+
+ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64_be),yy)
+TARGET_ABI += -mabi=ilp32 -Xlinker -EB -Xlinker -maarch64linux32b
+endif
+
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
@@ -142,7 +150,7 @@ endif
 
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
-TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS)) $(TARGET_ABI)
 
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-- 
1.8.4.5
