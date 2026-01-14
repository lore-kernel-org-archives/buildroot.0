Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8304AD39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C3640175;
	Wed, 14 Jan 2026 19:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEP6et3dx7du; Wed, 14 Jan 2026 19:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6A34001F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420565;
	bh=3W11pwgMuYepYeGbTqQ5PogpbMocpBAf5FvjAMvSNMw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pVu1srbbijhej/DW3l4XiJCSJMd4XlT4gBeGY/FLZX7EaTldEPZxiocM+G8QWJrhS
	 JRciaq6XF7xIlqCggLdgAfM7mnKNgWQziBjr0qCZJS+Zo6726v0B4Eapgg8QGMfEbK
	 s62ngpmNhndWpY77SlFZMF3FZti9lPA7cgA6vX1RyyRZcj6waOFHK331tv7YLw5rUW
	 uXX0onNNCy2BFA+ayIOWleTyBm1Wc8Xb8+dhHrhxsyBiqchDyAZ3T33XdySuRy6mfY
	 wN4sMxwgOymeUYFNUqu15wC6UoXt/s64a1ZGJxX80ZDAe+vfOQgL/FXfA68RHYpRMi
	 KQuo6Adgl03MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6A34001F;
	Wed, 14 Jan 2026 19:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF25232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF2D40AF5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUTF8jbZQbL5 for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D61D840AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61D840AFA
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D61D840AFA
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6yBvKnf2clBZg6yCv3IPy; Wed, 14 Jan 2026 20:55:57 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:55:53 +0100
Message-ID: <20260114195554.3979278-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfACgS0SaFmenMesKMlGu5gGBEj75cDlkmVJaLZeX/qpUJixB/k/tGqd1JjxkllqL9VX8wq/4ztYa56k2tYTJlvBploGO4ctRJwxqw+FvOtDvpKSNtHrr
 ViC2HrhsR8Pn1KYI/zg01HdIGdaqClgR076HDSb/buJvfXoqhcToeJjUbXk0wkheHXOIHojkclHTvFlTK6SLgYJkoEeCrQUusaEgA3VzXjNupULG+IMczzMY
 GavpW3WIZoQmYiL3HmfhJUBqm9AMWUVa6QshO+H9xvVPDit5BUKKdezg2J0DVjMLJo1OKdJUnz9qiE5P+Xcj2LvABHVVJHUFsY1rFE6NClyYujVFGq5ohBTO
 e7WpXVNlvSDM0PDXUCOIJS8sN6kFe6BEtXdtLW2A5SyzBDnV9NXw99I9vhtN70BToPdO9TqG7IAEgFnoptsTUjCTEkStMI8GHW/zOe+GQf84y1yNttFEhuku
 j2SZ0lDScamCcFEt5zIH6jMbCP8UUy9kERE6SOr5QpcB8NLczW+nraeOdlgF4mSM3XVQszLhNNZ4C8R+
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420557; bh=oIk+WojQzWVeotULiBA2w7v1GCpf73dek9A6tSAXo0E=;
 h=From:To:Subject:Date:MIME-Version;
 b=X7cDX8MxX/8fXg480g/2LyfBgb3/xRQLLU3Wu5BvETvHSYxOkwtBqGUH6H02y7EHz
 WCu8u1nrG+/AgRmbW5sEFQDMhEmAx41Hl/ZCmmxCp/gWZGlnbTdP7I2SjhhA9R0UL/
 nRljPRpemVu3LV2omiZ6v/0WlWCjyfe4dnrehsvo4Sj4m6lQlCVPt/oDYP103z+RAa
 rp4HENMaIXOdZprhbZtVriIZ/w7KrR6ICX6SrNKjG8rW17RQjs72QE3ON3BWjke3UM
 uWGEjSAEh9kYLAY6szYoaDZLi+B4Le5utiYApII1IuJ8TIRzKJ1eNmz7we66fg9CiY
 KD3cactP9pCwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=X7cDX8Mx
Subject: [Buildroot] [PATCH 17/17] configs/olimex_a64_olinuxino: bump Linux
 to 6.18.5 and U-Boot to 2026.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.5
* bumps U-Boot to version 2026.01
* bumps ATF to version 2.14.0
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/a64-olinuxino/boot.cmd     |  6 -----
 board/olimex/a64-olinuxino/genimage.cfg | 34 -------------------------
 configs/olimex_a64_olinuxino_defconfig  | 20 ++++++++-------
 3 files changed, 11 insertions(+), 49 deletions(-)
 delete mode 100644 board/olimex/a64-olinuxino/boot.cmd
 delete mode 100644 board/olimex/a64-olinuxino/genimage.cfg

diff --git a/board/olimex/a64-olinuxino/boot.cmd b/board/olimex/a64-olinuxino/boot.cmd
deleted file mode 100644
index 28ed6d9dc9..0000000000
--- a/board/olimex/a64-olinuxino/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-a64-olinuxino.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
deleted file mode 100644
index ac59e915d9..0000000000
--- a/board/olimex/a64-olinuxino/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-olinuxino.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1032K # 1MB - 8KB + 16KB(GPT)
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index ad446ea18c..55181ebeb7 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -1,31 +1,36 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/axx-common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Olimex A64-OLinuXino"
+BR2_ROOTFS_OVERLAY="board/olimex/axx-common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a64-olinuxino/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/axx-common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.14.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
@@ -33,6 +38,3 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
