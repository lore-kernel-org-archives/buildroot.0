From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 May 2018 18:17:06 +0200
Subject: [Buildroot] [PATCH] arch: drop now useless support for FDPIC
Message-ID: <20180521161706.3151-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we dropped support for blackfin, we no longer have any
architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
is never selected, so we can't select BR2_BINFMT_FDPIC.

Drop all of that now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in           | 14 --------------
 package/uclibc/uclibc.mk |  8 --------
 2 files changed, 22 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index a66ea0d03b..96d1ab1220 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -15,9 +15,6 @@ config BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_ARCH_HAS_MMU_OPTIONAL
 	bool
 
-config BR2_ARCH_HAS_FDPIC_SUPPORT
-	bool
-
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -340,7 +337,6 @@ config BR2_READELF_ARCH_NAME
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
@@ -352,16 +348,6 @@ config BR2_BINFMT_ELF
 	  and executables used across different architectures and
 	  operating systems.
 
-config BR2_BINFMT_FDPIC
-	bool "FDPIC"
-	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
-	select BR2_BINFMT_SUPPORTS_SHARED
-	help
-	  ELF FDPIC binaries are based on ELF, but allow the individual
-	  load segments of a binary to be located in memory
-	  independently of each other. This makes this format ideal for
-	  use in environments where no MMU is available.
-
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on !BR2_USE_MMU
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 7de9219873..d61e3e89ae 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -52,14 +52,6 @@ UCLIBC_LOCALES = \
 endif
 
 # noMMU binary formats
-ifeq ($(BR2_BINFMT_FDPIC),y)
-define UCLIBC_BINFMT_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-- 
2.14.1
