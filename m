Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F535C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C24B340578;
	Mon, 12 Dec 2022 07:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24B340578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTjq_UUOpBNz; Mon, 12 Dec 2022 07:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21CE40592;
	Mon, 12 Dec 2022 07:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21CE40592
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132EC1BF288
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F05384011C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F05384011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjKEyyeeVhJ0 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:29:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F2F401AD
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7F2F401AD
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:29:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 522FDCA5B2
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:18:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA9A81BF203;
 Mon, 12 Dec 2022 07:17:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p4d4R-00BryH-Bv; Mon, 12 Dec 2022 08:17:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:17:44 +0100
Message-Id: <20221212071747.2829022-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] nezha_defconfig: bump u-boot to current top
 of d1-wip
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is now based on U-Boot 2022.10 and has gained SPL support, so use that
instead of sun20-d1-spl.  With this we can also drop the u-boot patch and
patch directory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nezha/genimage.cfg                      | 26 ++-------
 ...pport-building-u-boot.toc1-for-nezda.patch | 54 -------------------
 configs/nezha_defconfig                       |  7 +--
 3 files changed, 6 insertions(+), 81 deletions(-)
 delete mode 100644 board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch

diff --git a/board/nezha/genimage.cfg b/board/nezha/genimage.cfg
index 783391fb99..836666ff8e 100644
--- a/board/nezha/genimage.cfg
+++ b/board/nezha/genimage.cfg
@@ -4,34 +4,16 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition boot0-1 {
-		in-partition-table = "no"
-		image = "boot0_sdcard_sun20iw1p1.bin"
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
 	}
 
-	partition boot0-2 {
-		in-partition-table = "no"
-		image = "boot0_sdcard_sun20iw1p1.bin"
-		offset = 128K
-	}
-
-	partition u-boot-1 {
-		in-partition-table = "no"
-		image = "u-boot.toc1"
-		offset = 12M
-	}
-
-	partition u-boot-2 {
-		in-partition-table = "no"
-		image = "u-boot.toc1"
-		offset = 16400K
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
 		bootable = "true"
-		offset = 18M
+		offset = 1M
 	}
 }
diff --git a/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch b/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
deleted file mode 100644
index 6e89a921df..0000000000
--- a/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4a923e0e4ef6d2b41cb89d658e269adada847573 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 4 Nov 2021 22:32:04 +0100
-Subject: [PATCH] Makefile: HACK: Support building u-boot.toc1 for nezda board
-
-For easier integration into Buildroot.  The boot0 / toc1 logic is WIP until
-U-Boot gains SPL support for the D1, so add a hack to make it easier to
-integrate in Buildroot as-is.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile  | 9 +++++++++
- nezha.cfg | 9 +++++++++
- 2 files changed, 18 insertions(+)
- create mode 100644 nezha.cfg
-
-diff --git a/Makefile b/Makefile
-index f911f70344..259d93bf80 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1084,6 +1084,15 @@ endif
- .binman_stamp: FORCE
- 	@touch $@
- 
-+fw_dynamic.bin: $(OPENSBI)
-+	$(call if_changed,copy)
-+
-+MKIMAGEFLAGS_u-boot.toc1 = -T sunxi_toc1
-+u-boot.toc1: nezha.cfg fw_dynamic.bin inputs
-+	$(call if_changed,mkimage)
-+
-+all: u-boot.toc1
-+
- ifeq ($(CONFIG_DEPRECATED),y)
- 	$(warning "You have deprecated configuration options enabled in your .config! Please check your configuration.")
- endif
-diff --git a/nezha.cfg b/nezha.cfg
-new file mode 100644
-index 0000000000..2d23b9b388
---- /dev/null
-+++ b/nezha.cfg
-@@ -0,0 +1,9 @@
-+[opensbi]
-+file = fw_dynamic.bin
-+addr = 0x40000000
-+[dtb]
-+file = arch/riscv/dts/sun20i-d1-nezha.dtb
-+addr = 0x44000000
-+[u-boot]
-+file = u-boot-nodtb.bin
-+addr = 0x4a000000
--- 
-2.20.1
-
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 5d0948a013..02f351d483 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,5 +1,4 @@
 BR2_riscv=y
-BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
@@ -20,18 +19,16 @@ BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
-BR2_TARGET_SUN20I_D1_SPL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,d1-2022-05-26)/uboot-d1-2022-05-26.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nezha"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.toc1"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
