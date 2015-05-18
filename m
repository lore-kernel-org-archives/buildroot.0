From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 18 May 2015 11:24:47 -0300
Subject: [Buildroot] [PATCH v2 5/6] nommu/flat: don't add -elf2flt for some
	toolchains
In-Reply-To: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1431959088-15257-6-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains (OSELAS 2014.12.0, for instance) internally do elf2flt
conversion without having to add anything to {C,CXX,LD}FLAGS. So, add an
option that allows to not add these flags.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/Makefile.in | 3 +++
 toolchain/Config.in | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index a0c5a7a..0ac1a94 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -142,12 +142,15 @@ TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
+# Don't add any flags for toolchains that don't require it
+ifneq ($(BR2_TOOLCHAIN_DONT_ELF2FLT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
 TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
 TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
 endif
+endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7e66de0..fd8dc43 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -23,6 +23,9 @@ config BR2_TOOLCHAIN_USES_UCLIBC
 config BR2_TOOLCHAIN_HAS_RESOLVER
 	bool
 
+config BR2_TOOLCHAIN_DONT_ELF2FLT
+	bool
+
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
 	select BR2_USE_WCHAR
-- 
2.1.4
