From: Paul Enman <paul.enman@gmail.com>
Date: Sun, 13 Dec 2015 19:28:40 -0600
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb mode
	configuration option
In-Reply-To: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
Message-ID: <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: penman <paul.enman@gmail.com>

Signed-off-by: Paul Enman <paul.enman@gmail.com>
---

When buildroot is configured to build uClibc with thumb, it uses a workaround
 for that relies on interworking between arm and thumb instructions and does
 not set the config file to enable compile in thumb mode.

This patch enables buildroot to configure and compile uClibc in thumb mode.

 arch/Config.in.arm       | 18 +++++++++---------
 package/uclibc/uclibc.mk | 12 ++++++++++++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 67ff384..2d318f2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -374,6 +374,15 @@ config BR2_ARM_INSTRUCTIONS_ARM
 	  This option instructs the compiler to generate regular ARM
 	  instructions, that are all 32 bits wide.
 
+config BR2_ARM_INSTRUCTIONS_THUMB2
+	bool "Thumb2"
+	depends on BR2_ARM_CPU_HAS_THUMB2
+	help
+	  This option instructions the compiler to generate Thumb2
+	  instructions, which allows to mix 16 bits instructions and
+	  32 bits instructions. This generally provides a much smaller
+	  compiled binary size.
+
 config BR2_ARM_INSTRUCTIONS_THUMB
 	bool "Thumb"
 	depends on BR2_ARM_CPU_HAS_THUMB
@@ -389,15 +398,6 @@ comment "Thumb1 is not compatible with VFP"
 	depends on BR2_ARM_CPU_HAS_THUMB
 	depends on !BR2_ARM_SOFT_FLOAT
 
-config BR2_ARM_INSTRUCTIONS_THUMB2
-	bool "Thumb2"
-	depends on BR2_ARM_CPU_HAS_THUMB2
-	help
-	  This option instructions the compiler to generate Thumb2
-	  instructions, which allows to mix 16 bits instructions and
-	  32 bits instructions. This generally provides a much smaller
-	  compiled binary size.
-
 endchoice
 
 config BR2_ARCH
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c62a40f..6685325 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -91,6 +91,17 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
+define UCLIBC_ARM_THUMB_CONFIG
+	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+else
+define UCLIBC_ARM_THUMB_CONFIG
+	$(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+endef
+endif
+
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
 define UCLIBC_ARM_BX_CONFIG
 	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
@@ -373,6 +384,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
+	$(UCLIBC_ARM_THUMB_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
-- 
1.9.1
