From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 19:44:18 -0300
Subject: [Buildroot] [PATCH 3/4] uclibc: remove blackfin bits
In-Reply-To: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426632259-1972-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we don't support the internal blackfin toolchain any more
remove unnecessary bits, conditionals and tweaks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 19 +++++++------------
 package/uclibc/uclibc.mk | 40 ----------------------------------------
 2 files changed, 7 insertions(+), 52 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 58c6884..f2e484d 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -24,11 +24,9 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
-		       if !BR2_bfin
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
-		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
-		       if !BR2_bfin && !BR2_x86_i386
+		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL if !BR2_x86_i386
 		depends on !(BR2_arc || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_ARC_GIT
@@ -39,12 +37,11 @@ choice
 
 	config BR2_UCLIBC_VERSION_NG
 		bool "uClibc-ng"
-		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
-		       if BR2_bfin || BR2_m68k
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if BR2_m68k
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
-		       if BR2_bfin || BR2_m68k || BR2_arm || BR2_armeb
+		       if BR2_m68k || BR2_arm || BR2_armeb
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
-		       if !BR2_arc && !BR2_bfin && !BR2_m68k && !BR2_x86_i386
+		       if !BR2_arc && !BR2_m68k && !BR2_x86_i386
 
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
@@ -53,10 +50,10 @@ choice
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
-		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS if !BR2_bfin && !BR2_xtensa
+		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS if !BR2_xtensa
 		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
-		       if !BR2_bfin && !BR2_x86_i386 && !BR2_xtensa
+		       if !BR2_x86_i386 && !BR2_xtensa
 		depends on !(BR2_arc)
 
 endchoice
@@ -167,7 +164,6 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 config BR2_UCLIBC_INSTALL_UTILS
 	bool "Compile and install uClibc utilities"
-	depends on !BR2_bfin
 	default y
 	help
 	  Enabling this option will compile and install the getconf,
@@ -200,7 +196,6 @@ config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
-	default "bfin"	   if BR2_bfin
 	default "m68k"	   if BR2_m68k
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "powerpc"  if BR2_powerpc
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 13994ad..72a46d9 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -157,45 +157,6 @@ endef
 endif # powerpc
 
 #
-# Blackfin definitions
-#
-
-ifeq ($(UCLIBC_TARGET_ARCH),bfin)
-ifeq ($(BR2_BINFMT_FDPIC),y)
-define UCLIBC_BFIN_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
-ifeq ($(BR2_BINFMT_FLAT_ONE),y)
-define UCLIBC_BFIN_CONFIG
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
-ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
-define UCLIBC_BFIN_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
-ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-define UCLIBC_BFIN_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
-endif # bfin
-
-#
 # x86 definitions
 #
 ifeq ($(UCLIBC_TARGET_ARCH),i386)
@@ -418,7 +379,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_SH_TYPE_CONFIG)
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
-	$(UCLIBC_BFIN_CONFIG)
 	$(UCLIBC_X86_TYPE_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_LARGEFILE_CONFIG)
-- 
2.0.5
