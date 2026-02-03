Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC9CE8783F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C5E40C16;
	Tue,  3 Feb 2026 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTY4xZLXVtKn; Tue,  3 Feb 2026 15:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635324116E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133015;
	bh=Ki4pTvHYGTJmEWqeHPCJT1PNma+C+gv/rnkkL5SqZj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hcree6JP/4rJmwZ538y97+bbUaSjDp0cUpsJeusiXBbogHMcdbCXFs2DpjlYbMj+v
	 peub6VKJecmQKCCZCc2Rg/poyaFbDZSOUeTaz4pDAAlvcSCOxSdSolyGHxcurJ0EyM
	 dfpPUSB167R20Zx2TW1MhpyXQ8YvdsHqGajlnBT0KYjX+uKUPJDMrlaxuTh7xbkKQn
	 gkZopmj4MnzdeeQC11QWhzN2C9RPQr5vjH1Z1/8NdbvaDfBiBWOeBcFr5cMS3JBKFD
	 skiArqP1+vJDSP1RyQquMKXkZ9qKD1FGLsfcHWPdpDDd0RMLOeVE3nqHBQrSsy6zNP
	 LOTPloPOIthUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635324116E;
	Tue,  3 Feb 2026 15:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C173B13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA7E40497
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaEWmjKUy7d1 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6D1C4044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6D1C4044C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6D1C4044C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so55415695e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133010; x=1770737810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mIkeFWA2v2RnChS7jEuxpm6CIBFtToxl5jykTtgJnlM=;
 b=B0SkNCd455Nh4OipgMFLwIMkradfNsCqsEzwhOi8KdzEemaj4fHv3cdlaErdowjML0
 8uBBkjxqv0Ru8RjcE5S0pSFhnOWolPNwYDz7Arkv8OTZ1leHbUNGKRmRcQAFjwQut23p
 6SfDczZLXt8QX+qe6iGyHzgV0DUz6PeB/mZ0PVIn9ot7VCB5QzhbSlkzN0KlM0vkF2b8
 KYakV/PLT+xWZMKce4Mt9XKu9EdIGTFNe+ALH6f8xW8SvrWEtQsnlokifM2Ez4yGkFS/
 D5Hgfm8ch2usLAb5UTQJtfgnj17hjVo0EJMuPQxod+hJp2P5UW/Wd+EaEHBr5EHXHfTx
 W+RA==
X-Gm-Message-State: AOJu0YzjggEjfPrHW8/YGowwmvpkase18Knna8nzOfFJ2WvQxcXzW5N8
 Cxf1+tu5mA0ySbXrSV2NnBYkeFY9MY40KkkYQpQVPgEd4o+akmjlCYvFPbzTiE6U
X-Gm-Gg: AZuq6aKAG6lccgA5F5QQFqMbjq2AfGwEZTmXmObMAqPFYre+V45ZDiP4yUJOErpZFqc
 a4xZVuas5Sa0cj+jKf2r0r73ao2xLi/BLODU0Kbh2smBX2mJ2FkCHp0GhDTfwxIud+L1a47xHik
 6qAsE8g8PMYsMaWzyEWQH9vgF3N5H35txeEUfbiUufPhLg62Ds8QUZ5I9IGRAFh0XPt/OY2IQDd
 ckEJBViHkH2Rk9nI3VBlwg+lEqfzji9jtJQUxRHHMu3U+s2aWDtiY1Plk29tlJidQtMdDEbsKbQ
 BGLh6MNvEaycs1BqwTnS8UtOjTLWxjSyXqpiqPRJqWkgCGoNrvD69owUSUEmV7Ntkbv2wCx/xKI
 /K27NHJDq6+wmkjPrdEsGqfIeYyzxwWopWysAk70xzxQpsFKKVU/y+e3ww98q2kt914Sen3y3xr
 sueeG3hoORIZj2SOUZNcFN+O6iPqf+CD2kAROeZQ==
X-Received: by 2002:a05:600c:1e1d:b0:480:6bef:63a0 with SMTP id
 5b1f17b1804b1-4830e9681c5mr455575e9.21.1770133010193; 
 Tue, 03 Feb 2026 07:36:50 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:17 -0800
Message-ID: <20260203153617.80012-11-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133010; x=1770737810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIkeFWA2v2RnChS7jEuxpm6CIBFtToxl5jykTtgJnlM=;
 b=fzl2n4LvZJX+FOwBlMXjCsa0kNUTli0iAfY7toTYJsHZsaAq8ioDie/anOpeH7Ed85
 QF8da3Mj5D4nmOnyTPH8+WJTeaBki7j5elFYk0gQ2elYWJEyPqnumzmJ2F1WrJ4xkmO8
 RRLa3eowZ1QpNgHNv5wk8LiZL6EuZQRO7phm3q9HtjXfDYRuA73G6ZzfJZgU4LjBbMAJ
 MysTxn+aviXeS1kkcIY3WOzFpdnR9YAH9mBgIbRYqMbrHJMXWCnvicA2yy9U0zJlqYG1
 +irRieilpsaNi7vOJDeU6gy0LzKOBGlg3Mwuz0XY55+kmZV2N9BtGXyRQqntBNUhTItI
 2whw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fzl2n4Lv
Subject: [Buildroot] [PATCH 10/10] configs/freescale_imx95_15x15_frdm: new
 defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add defconfig for NXP's IMX95-15x15-FRDM board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx95-15x15-frdm/patches/linux/linux.hash |  2 +
 .../imx95-15x15-frdm/patches/uboot/uboot.hash |  2 +
 board/freescale/imx95-15x15-frdm/readme.txt   | 63 +++++++++++++++++++
 configs/freescale_imx95_15x15_frdm_defconfig  | 37 +++++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx95-15x15-frdm/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/linux/linux.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx95-15x15-frdm/readme.txt
 create mode 100644 configs/freescale_imx95_15x15_frdm_defconfig

diff --git a/board/freescale/imx95-15x15-frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx95-15x15-frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..e22710afce
--- /dev/null
+++ b/board/freescale/imx95-15x15-frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2d68cdaa32240904a461dc0c0e475b7148f4447780379abc64c0a51bfe54446a  imx-atf-lf-6.12.49-2.2.0.tar.gz
diff --git a/board/freescale/imx95-15x15-frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx95-15x15-frdm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx95-15x15-frdm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx95-15x15-frdm/patches/linux/linux.hash b/board/freescale/imx95-15x15-frdm/patches/linux/linux.hash
new file mode 100644
index 0000000000..b138642633
--- /dev/null
+++ b/board/freescale/imx95-15x15-frdm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  linux-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/board/freescale/imx95-15x15-frdm/patches/uboot/uboot.hash b/board/freescale/imx95-15x15-frdm/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..5d57adfa22
--- /dev/null
+++ b/board/freescale/imx95-15x15-frdm/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  212ea4d8d442153ab732ab724282fef64450e9dab5cfe9565eec4f618e305a80  uboot-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/board/freescale/imx95-15x15-frdm/readme.txt b/board/freescale/imx95-15x15-frdm/readme.txt
new file mode 100644
index 0000000000..97c92169ab
--- /dev/null
+++ b/board/freescale/imx95-15x15-frdm/readme.txt
@@ -0,0 +1,63 @@
+***************************
+NXP i.MX95 15x15 FRDM board
+***************************
+
+This file documents the Buildroot support for the i.MX95 15x15 FRDM board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX95 15x15 FRDM board:
+
+    make freescale_imx95_15x15_frdm_defconfig
+
+Build all components:
+
+    make
+
+When this command completes, the generated image containing everything
+to boot from the SD card is located in "output/images/sdcard.img".
+
+Create a bootable SD card
+=========================
+
+To determine the device associated with the SD card, have a look in the
+/proc/partitions file:
+
+    cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on an SD card. Launch the following
+command as root:
+
+    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx9.
+
+Boot the i.MX95 15x15 FRDM board
+================================
+
+To boot your newly created system (refer to the i.MX95 15x15 FRDM
+Documentation [TODO] for guidance):
+- insert the SD card in the SD slot of the board;
+- configure the boot switch as follows:
+  SW1: 11 SW1[1-2] ("USDHC2 4-bit SD3.0" Boot Mode)
+- connect a USB Type-C cable into the USB-DBG port and connect using
+  a terminal emulator at 115200 bps, 8n1;
+- power on the board by connecting a USB Type-C cable into the PWR IN
+  Power USB port.
+
+Note: the debug USB connector presents 4 UARTS (for example
+/dev/ttyACM[0-3]), the AP UART should be the first one (in the previous
+example, /dev/ttyACM0), while the SM UART should be the second one
+(in the previous example, /dev/ttyACM1).
+
+Enjoy!
+
+References
+==========
+
+TODO: update this section when NXP officially releases the board
diff --git a/configs/freescale_imx95_15x15_frdm_defconfig b/configs/freescale_imx95_15x15_frdm_defconfig
new file mode 100644
index 0000000000..3588759e56
--- /dev/null
+++ b/configs/freescale_imx95_15x15_frdm_defconfig
@@ -0,0 +1,37 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx95-15x15-frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_LPDDR4X=y
+BR2_PACKAGE_IMX_SM=y
+BR2_PACKAGE_IMX_OEI=y
+BR2_PACKAGE_IMX_OEI_TARGET_BOARD="mx95lp4x-15"
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.49-2.2.0)/imx-atf-lf-6.12.49-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx95"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.49-2.2.0)/uboot-imx-lf-6.12.49-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx95_15x15_frdm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx95-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.49-2.2.0)/linux-imx-lf-6.12.49-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx95-15x15-frdm"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
