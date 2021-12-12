Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EF2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1F882A95;
	Sun, 12 Dec 2021 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4G9anTzkfBY; Sun, 12 Dec 2021 15:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E93AB82C61;
	Sun, 12 Dec 2021 15:55:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54D901BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACB74230E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_-HAdRNp7xu for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:53:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206D742313
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:53:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 192248353E; Sun, 12 Dec 2021 15:48:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:51:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9687db111e65432b21b0640079f4a8bdff2c66e
X-Git-Newrev: 77e208730e7c666a463c967387220a2be93f3b7f
X-Patchwork-Hint: ignore
Message-Id: <20211212154839.192248353E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a64_olinuxino: bump to
 Linux kernel 5.15.7, u-boot 2021.10 and ATF v2.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=77e208730e7c666a463c967387220a2be93f3b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1) Now u-boot needs SCP environment variable specified that can point to
the or1k coprocessor firmware while if coprocessor is not used it must
be passed /dev/null as we do in this case.
2) We now use the u-boot-sunxi-with-spl.bin instead of u-boot.itb since
it's produced by u-boot anymore.
3) U-Boot 2021.10 requires python 3 and openssl so let's enable them.
4) Remove local patches for uboot and linux.
5) Remove global patches path from defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/olimex/a64-olinuxino/genimage.cfg            | 12 ++---
 ...-Remove-redundant-YYLOC-global-declaratio.patch | 52 ----------------------
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ------------
 configs/olimex_a64_olinuxino_defconfig             | 25 +++++------
 4 files changed, 14 insertions(+), 103 deletions(-)

diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
index 44fcb3cb59..ac59e915d9 100644
--- a/board/olimex/a64-olinuxino/genimage.cfg
+++ b/board/olimex/a64-olinuxino/genimage.cfg
@@ -14,17 +14,11 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40K
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1032K # 1MB - 8KB + 16KB(GPT)
 	}
 
 	partition boot {
diff --git a/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
deleted file mode 100644
index 71ae991816..0000000000
--- a/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f9df4186c17d686f1ca38f973d7a3a49e8e37c01 Mon Sep 17 00:00:00 2001
-From: Dirk Mueller <dmueller@suse.com>
-Date: Tue, 14 Jan 2020 18:53:41 +0100
-Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
-
-gcc 10 will default to -fno-common, which causes this error at link
-time:
-
-  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
-
-This is because both dtc-lexer as well as dtc-parser define the same
-global symbol yyloc. Before with -fcommon those were merged into one
-defintion. The proper solution would be to to mark this as "extern",
-however that leads to:
-
-  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
-   26 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-In file included from dtc-lexer.l:24:
-dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
-  127 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-cc1: all warnings being treated as errors
-
-which means the declaration is completely redundant and can just be
-dropped.
-
-Signed-off-by: Dirk Mueller <dmueller@suse.com>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-[robh: cherry-pick from upstream]
-Cc: stable@vger.kernel.org
-Signed-off-by: Rob Herring <robh@kernel.org>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index 06c040902444..d1b3810156c7 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
- 
--YYLTYPE yylloc;
- extern bool treesource_error;
- 
- /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
--- 
-2.25.1
-
diff --git a/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch b/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
deleted file mode 100644
index ec60fc5825..0000000000
--- a/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
-From: Peter Robinson <pbrobinson@gmail.com>
-Date: Thu, 30 Jan 2020 09:37:15 +0000
-Subject: [PATCH] Remove redundant YYLOC global declaration
-
-Same as the upstream fix for building dtc with gcc 10.
-
-Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index fd825ebba6..24af549977 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
- 
--YYLTYPE yylloc;
- extern bool treesource_error;
- 
- /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
--- 
-2.20.1
-
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 7df52dfbdc..53e8c2ece5 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -2,33 +2,30 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# System
-BR2_GLOBAL_PATCH_DIR="board/olimex/a64-olinuxino/patches"
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
@@ -36,7 +33,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
