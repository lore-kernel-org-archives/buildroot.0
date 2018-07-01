From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:17:27 +0200
Subject: [Buildroot] [git commit] arch: drop now useless support for FDPIC
Message-ID: <20180701131530.2B353821BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58dcd28dfbed481becb822b009583a63efbc6ffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we dropped support for blackfin, we no longer have any
architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
is never selected, so we can't select BR2_BINFMT_FDPIC.

Drop all of that now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in           | 14 --------------
 package/uclibc/uclibc.mk |  8 --------
 2 files changed, 22 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index a16012bdfd..7d1aeb2174 100644
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
@@ -344,7 +341,6 @@ config BR2_READELF_ARCH_NAME
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
@@ -356,16 +352,6 @@ config BR2_BINFMT_ELF
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
index bb44da28b4..63d36943ed 100644
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
