Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D7C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7A7423C1;
	Sat, 11 May 2024 20:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSA4-wza71M2; Sat, 11 May 2024 20:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329A842343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329A842343;
	Sat, 11 May 2024 20:18:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FA0E1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59DF540449
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PbvvIhq01QA for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA45400E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DA45400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCF4286FCC; Sat, 11 May 2024 20:18:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:17:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d5b3aac435880333833d4a3909b1818fe8af045
X-Git-Newrev: 5cfda60060dfd56d13ced4803625427abe79b056
X-Patchwork-Hint: ignore
Message-Id: <20240511201811.DCF4286FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: remove BINFMT_FLAT_SHARED support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cfda60060dfd56d13ced4803625427abe79b056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BINFMT_FLAT_SHARED was removed in the Linux Kernel by commit:
70578ff3367dd4ad8f212a9b5c05cffadabf39a8

It was m68k specific and got recently disabled in uClibc-ng, too.
See this commit:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=72b01dd20f9cea273809e3437b4aba849ae658af

Now that only BINFMT_FLAT_ONE is supported, remove the choice entirely.

BINFMT_FLAT_SEP_DATA was removed in 2018 from Buildroot by commit:
e2ea4157a9a6425506d8ec24a27de216536654a6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                          |  7 +++++++
 arch/Config.in                            | 25 -------------------------
 configs/canaan_kd233_defconfig            |  1 -
 configs/sipeed_maix_bit_defconfig         |  1 -
 configs/sipeed_maix_bit_sdcard_defconfig  |  1 -
 configs/sipeed_maix_dock_defconfig        |  1 -
 configs/sipeed_maix_dock_sdcard_defconfig |  1 -
 configs/sipeed_maix_go_defconfig          |  1 -
 configs/sipeed_maix_go_sdcard_defconfig   |  1 -
 configs/sipeed_maixduino_defconfig        |  1 -
 configs/sipeed_maixduino_sdcard_defconfig |  1 -
 package/Makefile.in                       | 13 -------------
 package/uclibc/uclibc.mk                  | 13 ++-----------
 13 files changed, 9 insertions(+), 58 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7989f97284..83bb88020a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_BINFMT_FLAT_SHARED
+	bool "FLAT shared binary format removed"
+	help
+	  Support for the FLAT shared binary format has been removed:
+	  its support was removed from the Linux kernel, and also from
+	  uClibc-ng, the only C library that supported it.
+
 config BR2_PACKAGE_OMXPLAYER
 	bool "omxplayer removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in b/arch/Config.in
index e7349e83ae..f39c33ef7f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -447,29 +447,4 @@ config BR2_BINFMT_FLAT
 
 endchoice
 
-# Set up flat binary type
-choice
-	prompt "FLAT Binary type"
-	default BR2_BINFMT_FLAT_ONE
-	depends on BR2_BINFMT_FLAT
-
-config BR2_BINFMT_FLAT_ONE
-	bool "One memory region"
-	help
-	  All segments are linked into one memory region.
-
-config BR2_BINFMT_FLAT_SHARED
-	bool "Shared binary"
-	depends on BR2_m68k
-	# Even though this really generates shared binaries, there is no libdl
-	# and dlopen() cannot be used. So packages that require shared
-	# libraries cannot be built. Therefore, we don't select
-	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
-	# Although this adds -static to the compilation, that's not a problem
-	# because the -mid-shared-library option overrides it.
-	help
-	  Allow to load and link indiviual FLAT binaries at run time.
-
-endchoice
-
 endmenu # Target options
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 672fee57a1..832f8363a7 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # Binary format
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 
 # Kernel
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index e45996879a..238e082a3d 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # Binary format
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 
 # Kernel
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 7e293e5a49..28aa143583 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # System
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index 0352382fcd..ee1b0d8372 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # Binary format
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 
 # Kernel
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 20658813ba..41a062c7a1 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # System
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index 27272dac4c..a5b09e17ac 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # Binary format
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 
 # Kernel
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 1bc12dd058..0e80d9c83a 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # System
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 3e04ea3a04..7ba7653e8d 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # Binary format
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 
 # Kernel
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 253ee7d7cf..7bdd36e1d0 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -15,7 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 
 # System
 BR2_BINFMT_FLAT=y
-BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
 BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 3e276d23d6..b350c4b7b5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -184,28 +184,15 @@ ifeq ($(BR2_BINFMT_FLAT),y)
 ifeq ($(BR2_RISCV_64),y)
 TARGET_CFLAGS += -fPIC
 endif
-ifeq ($(BR2_BINFMT_FLAT_ONE),y)
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
         -Wl$(comma)-elf2flt=-r)
-else
-ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt)
-endif
 TARGET_CFLAGS += $(ELF2FLT_FLAGS)
 TARGET_CXXFLAGS += $(ELF2FLT_FLAGS)
 TARGET_FCFLAGS += $(ELF2FLT_FLAGS)
 TARGET_LDFLAGS += $(ELF2FLT_FLAGS)
 endif
 
-ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
-TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
-TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
-TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
-endif
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
 else
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 9593e18d45..b7aba27b00 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -57,19 +57,10 @@ UCLIBC_LOCALES = \
 endif
 
 # noMMU binary formats
-ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+ifeq ($(BR2_BINFMT_FLAT),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT)
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF)
-endef
-endif
-ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-define UCLIBC_BINFMT_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT)
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF)
 endef
 endif
@@ -140,7 +131,7 @@ endif # arm
 ifeq ($(UCLIBC_TARGET_ARCH),m68k)
 
 # disable DOPIC for flat without separate data
-ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+ifeq ($(BR2_BINFMT_FLAT),y)
 define UCLIBC_M68K_BINFMT_FLAT
 	$(call KCONFIG_DISABLE_OPT,DOPIC)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
