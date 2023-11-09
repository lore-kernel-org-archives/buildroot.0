Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 04:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4840C60E5D;
	Thu,  9 Nov 2023 04:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4840C60E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18CPKijwtUel; Thu,  9 Nov 2023 04:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2A661263;
	Thu,  9 Nov 2023 04:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2A661263
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86CFA1BF2EA
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 03:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DCE980BF5
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 03:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCE980BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHon0PKrPQON for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 03:59:51 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DFE880BA0
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 03:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFE880BA0
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-41c157bbd30so3256361cf.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 19:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699502389; x=1700107189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plZiHEQMTpyWPdzSYlN27K7+DD6Tqdtf1sM4oNwoqIk=;
 b=T1sW2HIW3fzYki24OHPLVN+1UFiYgna/ECv2GpiK7oTTxE9PdQFEbhYcholla7K0Bi
 NnMB9pKO3WemUikmUZf1Ygb9RYPJIEcnbvMVlxai00ZROL0QwNn/iqo/jA4kDIvzJ0wv
 ICa7q+wKdfooVubS7w4N+GSOFalIjytmaNdnhVPjJyEzVAGUjDZ/B7W/AlN6CVcavPjJ
 s3Dv/gBMyOlwkuRW9p1+motfGFs/BHQp8/4xBu4e9SRp0vHglv2cK0XlZcZjwni+BuAJ
 aZhMbWOd55Yas/gEzWe8wpaglzVgFnlGlaES0GAtIEL18LWfKgaKaYRMsl6XIcRzABkJ
 hEYQ==
X-Gm-Message-State: AOJu0YzEo7uz2mnM58E2tn9xAkNdtr2TVX2QzUiFGchTmPowwkiDA9l9
 HFgZFNdBvXwVMqI72FA7tbOqe9JP8oQ=
X-Google-Smtp-Source: AGHT+IHNnIRFStSsnNtJ6o7zKL/msvPsYkTS7p9gdnHDIW9Bv+FOqosq0/0UK94kRmxTGJvB824NkQ==
X-Received: by 2002:a05:622a:1116:b0:418:1787:8aed with SMTP id
 e22-20020a05622a111600b0041817878aedmr3821200qty.41.1699502389249; 
 Wed, 08 Nov 2023 19:59:49 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 ([2600:4040:57a5:1e00:2ef0:5dff:fe59:88ba])
 by smtp.gmail.com with ESMTPSA id
 j2-20020ac84c82000000b00419b67d2823sm1586636qtv.34.2023.11.08.19.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 19:59:48 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 22:59:47 -0500
Message-ID: <20231109035947.1852675-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699502389; x=1700107189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plZiHEQMTpyWPdzSYlN27K7+DD6Tqdtf1sM4oNwoqIk=;
 b=aI3adBx+ztCjBtpOidRwYsMhsJjbmpN+reVlAdz6mg73/Nci1zxrGJ1gUU8UjK6iih
 GhK9f0OrE+b4E8pbGkUgdBi9RJM9SvYvgSHKgkYKOzL8NkCCzhMhiSKHlL1LqloRuYZY
 7vz6xh38mcMBnTpHpMMOV1myp/AqILMNwgVZcqhjV7XO50jZYKomdpYxHXN9/ccKIO/c
 UagaAOucQXuKcYMecjLjZtDyjw/CVdaa/9kgqtOIKMag5FJxFGsmCdOEEtsRpBhkTpCn
 EBQFWYeObLBZcJts+X0LqZ+NxsshFaKJBC5N8ZrWsd8jXoNSJLSGYgfE17eaoRodRh66
 hDvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aI3adBx+
Subject: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Use zImage instead of
 uImage
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imxrt1050-evk was using uImage switch to using zImage
now.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 board/freescale/imxrt1050evk/genimage.cfg   | 2 +-
 board/freescale/imxrt1050evk/uboot.fragment | 2 +-
 configs/imxrt1050-evk_defconfig             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
index daa51bdbe0..64fc8452f8 100644
--- a/board/freescale/imxrt1050evk/genimage.cfg
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -1,7 +1,7 @@
 image boot.vfat {
 	vfat {
 		files = {
-			"uImage",
+			"zImage",
 			"imxrt1050-evk.dtb",
 		}
 	}
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
index 1c5bb6af35..dd45ca4c29 100644
--- a/board/freescale/imxrt1050evk/uboot.fragment
+++ b/board/freescale/imxrt1050evk/uboot.fragment
@@ -1,2 +1,2 @@
 CONFIG_USE_BOOTCOMMAND=y
-CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
+CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 zImage;bootz 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 0eb6f626c9..85d4783579 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
-BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
