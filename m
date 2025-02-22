Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF4AC021B5
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 21:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558A360ACE;
	Sat, 22 Feb 2025 21:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heBwhoprmnAc; Sat, 22 Feb 2025 21:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FFE460B0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFE460B0A;
	Sat, 22 Feb 2025 21:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A709943
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250A34035F
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U51T9kz7tf7x for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 21:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6400C40392
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6400C40392
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6400C40392
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:46 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso55234325ad.1
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740259725; x=1740864525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UB/T+KBjdp+fGWatG+9hYQ7bxjv9eUey1BVfUcQZUQ0=;
 b=ajlncD+sOn0MrrvSqxIXjkjSFysd+jIfszPBbAqObMbUPopYC5sJCxVlCmbfz9+f4M
 luHyEMvaYYSb36NfvXxoKyJbf1WO6BeQKAqEK23Wxz1sLPpdrNHFGHjN35D/TNZNKCko
 Ugp/VlFq58i4x36fOVqmy+1H07V3p28nXzMAJIBYQ4gks59HHZ1IY6Dzw5tEyG7UI2qM
 u6aqvJkB1i4jD2SetLxNcG0EzEmUQuXsYvNIdKEQUO/HU7931drT5ehptfhAfNk6Kifh
 MhMV9bdTv8jHW5NCJ4e+EmyvDiqCuOjn9gugOidq98FlwDgmZwOwYQCD2xD/1Io5nKqc
 ABKg==
X-Gm-Message-State: AOJu0YzscS1IDznI31tgnCSe44hlxsDgAj5g9eO6k57mRcNCCpzhkuDf
 3O34N/rr0bju1I+B919w/pQFQ9EuBx3J3fyNqwpaSKN3qvYJ8408baVqzg==
X-Gm-Gg: ASbGncsl2t/3e4xI961q6ON3LZ4Z6o+GmTM8sF5eUw8Rl+ep0jesLGE8VGuv3EtY12k
 27gGyakRmwMD7KrIZHd5G88uhIJHZMVua8cxkk9uHGc96UWoCApfucDw4kqvsg+mqJqU0QERrbE
 2Sp2KZEHyY4MaxouQ2fAd9U5TQk50tbg0cAnePyag2R28jqAHXDq/pQ+8D+3ZQkPbl4i+EDZh7d
 nRotzfSUmOt3arZubjffLIzzrKeyUVI8aHbXzxadzat3wGFiDGLwAL0BREQZjGc/ZVaX0nj58dF
 CoIihYtAuuG6voq9J9HBoYnuLQIxjcl2rFDpXvaY
X-Google-Smtp-Source: AGHT+IHNqTCZOoe+FSNeGrV6Txasx/e41m/kPcgrxolnwgAEYa3WPc5Zf+S9XMwCdCXN7Fe/pYha8A==
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id
 d9443c01a7336-2218c3f4333mr201914085ad.13.1740259724784; 
 Sat, 22 Feb 2025 13:28:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fc1a:61c2:8ac8:ba50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb10fb43sm3558688a91.35.2025.02.22.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 13:28:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: gilles.talis@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Feb 2025 18:28:37 -0300
Message-Id: <20250222212837.3745977-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740259725; x=1740864525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UB/T+KBjdp+fGWatG+9hYQ7bxjv9eUey1BVfUcQZUQ0=;
 b=VM94B3+tuGikxh/dCTzO7InBSrkpGcdKT/GDdsbDdF1KrppQJbSoGcv2YhTlTejthf
 QC2gCVnaIxwW6ys/RACV03XzFaVr3J9oFAezrV7O3f/INSwdSicGW2fjYqfCkGGY+NAM
 FHAjmRYIzFBKwWqhfX5Ea3k8ovhvpa/mirQJux0zuovqT9JT3f6KpNBaT2SMYDDkN10Z
 eCvEg3id4YM079+GE9Lq48HI9+NA2Mf6DhV3ZwQiPaR+qb4ZXbqrFhu8goRNsuvVub4D
 fdf4/8QyK6fdfGwWk/u8UimNaGo2GlxO5bt6gdTxvtpelYAsj3MYcQ/ymRlF4WWf/rGN
 KyXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VM94B3+t
Subject: [Buildroot] [PATCH] configs/polyhex_debix_model_a_defconfig: Remove
 BR2_PACKAGE_HOST_IMX_MKIMAGE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_PACKAGE_HOST_IMX_MKIMAGE is only needed when the NXP U-Boot
version is used.

polyhex_debix_model_a_defconfig uses mainline U-Boot, which builds flash.bin
directly, without using the NXP imx-mkimage tool.

Remove such unneeded package.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/polyhex_debix_model_a_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/polyhex_debix_model_a_defconfig b/configs/polyhex_debix_model_a_defconfig
index 97348b7b3346..6f8ec494107f 100644
--- a/configs/polyhex_debix_model_a_defconfig
+++ b/configs/polyhex_debix_model_a_defconfig
@@ -42,6 +42,5 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_IMX_MKIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
