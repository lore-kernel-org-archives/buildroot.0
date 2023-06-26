Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE807EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9B141902;
	Mon, 26 Jun 2023 16:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9B141902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-FlW-vClBDN; Mon, 26 Jun 2023 16:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D573E41A49;
	Mon, 26 Jun 2023 16:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D573E41A49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 573591BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 311E940493
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 311E940493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2lIvfwMz15C for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56D55401A4
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56D55401A4
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:45 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b809354a15so5588835ad.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795245; x=1690387245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fxuFIDWhfg7llbIxoyHaoQqGTfwJRrUaQIttoGM6H4=;
 b=AVbbEjkZWYWrsqY+kz5dqI4KG3dq+KmqNOSI9kMwHrX4WRlZETiLJffmDFfGpXFGbU
 oO5sEOdufCzvE5JkIUTdBQoLv3esTCP77A2/rCc00jKwYhiN5RVP1nRr0WvVSp2nAeoT
 eVYrpPnMVOqE6XHZLoGwXKCvwCf9bAnnejILQfAwZu/sHqiS+brHiP0/swu9/Xxe+mSo
 hCbs+5EX1MgxrhS3Xw0szUYotpCQYqYDhrwSzQRnw7TnfdTrLQt70Y8pffh1n7TxAbU2
 N+nm/sdO2FHS/5ceYIPp5C22dg27xQ6buTfjBaXcVz6j9hMDT1BgJn3pp1XakUez7NUg
 vlOw==
X-Gm-Message-State: AC+VfDz6Q8fATnGUVjo8Gfk/tGgFyzPBdua5X4ueCNThAaMnwjs8g9Gq
 QndY2u2CojDxcHPAmzXL7jURGd2o3BZTvg==
X-Google-Smtp-Source: ACHHUZ5yC7R3I/yJdP85DhxGF6oIfiPbPrQb8NR7ZR/vJNqk/SuMrL19O4l1jHsGwSQRC4yodGnz0g==
X-Received: by 2002:a17:903:2301:b0:1b6:b245:2429 with SMTP id
 d1-20020a170903230100b001b6b2452429mr3850602plh.32.1687795244643; 
 Mon, 26 Jun 2023 09:00:44 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:22 +0800
Message-Id: <20230626160030.93063-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795245; x=1690387245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fxuFIDWhfg7llbIxoyHaoQqGTfwJRrUaQIttoGM6H4=;
 b=b0Lkuuu3ZHMNvCoIFMlDNKB7P/YicE5vl+7DzUVA+4cPjN7xSlRcqf1TkohPElJ7qc
 d6RpgOG0hpE+TuMR7buhA055FE0jreFr5vP2BuiLak7e8F6yQKRGJysP+XOGrhjytK23
 NQqi11ulYlx05T2wOxngZbwtnGhq98bjOT1Nalpfpe8zJo+9OzgvX6RBiKL+fohcO4N4
 hl3AA98yD44HUWc7Kq/oJ+OwZcRRy3uskhzCBxzC50BHxlilOTrr1QNpVwnr/SArWnZG
 KAHIwFbIbw6VtLWCbvgJAM9+3GiiFvMlkJP7hOtWf+SQAhtEj9lnfnztdgYGSs46NZiS
 6WRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b0Lkuuu3
Subject: [Buildroot] [PATCH 02/10] configs/hifive_unleashed: Update to use
 U-Boot v2023.04
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

With upstream commit ae2d9506a36c ("riscv: sifive: Rename fu540 board to unleashed")
in U-Boot v2021.07 release, the defconfig for SiFive Unleashed board
has been changed to sifive_unleashed_defconfig.

Also newer U-Boot has deprecated the usage of SPL_FIT_GENERATOR
to generate u-boot.itb hence there is no 'u-boot.itb' target in
the U-Boot Makefile anymore. Instead binman is used to assemble
the u-boot.itb image.

We will need to switch to BR2_TARGET_UBOOT_FORMAT_CUSTOM for
installing u-boot.itb.

Switch over to use the latest U-Boot v2023.04 release.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 configs/hifive_unleashed_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 0440b14ba5..35cb3558f9 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -42,12 +42,13 @@ BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_fu540"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
-BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 
 # Host tools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
