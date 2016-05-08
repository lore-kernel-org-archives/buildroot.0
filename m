From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 May 2016 11:02:07 +0200
Subject: [Buildroot] [PATCH 1/4] uclibc: generate valid config for BFLT/FDPIC
Message-ID: <20160508090207.GA32273@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Generate a valid configuration for architectures with
FDPIC and BFLT support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.mk | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b8ccee2..c17ed21 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -47,6 +47,40 @@ UCLIBC_LOCALES = \
 	$(firstword $(subst .,$(space),$(locale))))
 endif
 
+# noMMU binary formats
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_BINFMT_CONFIG
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+define UCLIBC_BINFMT_CONFIG
+       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
+define UCLIBC_BINFMT_CONFIG
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
+define UCLIBC_BINFMT_CONFIG
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+       $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
+
 #
 # ARC definitions
 #
@@ -382,6 +416,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,DEVEL_PREFIX,"/usr",$(@D)/.config)
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D)/.config)
 	$(UCLIBC_MMU_CONFIG)
+	$(UCLIBC_BINFMT_CONFIG)
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
-- 
2.1.4
