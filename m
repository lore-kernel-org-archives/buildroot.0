Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBFAD41C07
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 06:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA8E80ACF;
	Wed, 13 Nov 2024 06:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YBp-uCTuGvj; Wed, 13 Nov 2024 06:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A7180BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A7180BA4;
	Wed, 13 Nov 2024 06:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D461E2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE9940A82
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZMBMGwIeGTI for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 06:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2733940A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2733940A0E
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2733940A0E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:43 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7ea7e2ff5ceso4554642a12.2
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 22:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731477882; x=1732082682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8p64aGOqs2dO0ySrrr05Iu8Lfcjx6bvgj5CTxBv44KQ=;
 b=rT+KQU8GYOhCvdRwXCrS/k1wdNRdt3AHQRCQscBwVNZNnSctDUqrGRwoRtS0TzXz9D
 y+Uqxo2bN9+4C167raxVQS7TkWihxmA2DhtYKPyAx+SBkkLF7Nu2wPS5ZioU+X5AV7Hy
 SBSFKVECVRNfVnljcmGNw7vpfesoeSRCAaWVxFD4QZsfiAwPFv5/BemzFxQAmQT1Ko56
 dN2RAFXhKUu8L/R8O4AQG5IJnB8ACWxWwNpgKY7D1QwbHC+ta2cevG6lUp0zwZnTbrrS
 C1fX4HkioZ3l8ZxkfV5HtqnaeHQf2YuGKiiuRro6Cu5s6RjxoAbjy/HZs6TjCAQ/IUO2
 mN4w==
X-Gm-Message-State: AOJu0YxwWi1EKjNN9M2HX2xRSLV7zVAvnzKSqaVEPzXCW/JS7YltqcvL
 yik04hKJgtSToDmMBEbeT+S05k4TeqirunMpQklIYQa7BlnzcCJ39IEFUg==
X-Google-Smtp-Source: AGHT+IHCjFrhF0NgQkhbg4a65aPO1eM0fwYVEkoyiGNnjeM+9aOd39GyZ5X/+3tF7hVm9xPMiWApGA==
X-Received: by 2002:a05:6a20:72a1:b0:1db:db2f:f3a5 with SMTP id
 adf61e73a8af0-1dc5f90b7f1mr6954029637.21.1731477882008; 
 Tue, 12 Nov 2024 22:04:42 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc9073sm103097265ad.1.2024.11.12.22.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 22:04:41 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Wed, 13 Nov 2024 14:04:16 +0800
Message-ID: <20241113060418.1207859-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113060418.1207859-1-fancp2007@gmail.com>
References: <20241113060418.1207859-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731477882; x=1732082682; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8p64aGOqs2dO0ySrrr05Iu8Lfcjx6bvgj5CTxBv44KQ=;
 b=MOxeudRlOJsHfAXCck7kmVjIccL30A2/gQrbKYXJygLMfgkMSkpxuNukJKrJDnjFz/
 jgGqRdY6ib1DMh3hRxPI7qLHoPyeChOb2rqgG9kD3Nne15H7R/OYdzdOZ+L3BMGM8vv2
 Aw+mFtLwahG5cDn4J/rBufBA72nZJ3TPhLzCJk9Ci6KQyLWt6h0F7tVoFG6zKfqe2snU
 ow5Z/KOihOv8hyTpVFeSGj1zkVEeNALX6YwvmHJ45i9ZBDWZ+w19lNutg944E7iM+w3/
 Mck8to8XTFiwtvuQutFyhzVEP7qsAcw9xN1jdNMk5sYysr3XWSEmaSg3wrqmhvDPs5Jh
 82Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MOxeudRl
Subject: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: bump rockchip
 firmware version to 2024-09-05
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

Release Notes:
https://github.com/rockchip-linux/rkbin/blob/master/doc/release/RK3588_EN.md
https://github.com/rockchip-linux/rkbin/blob/master/doc/release/RK3588_CN.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 configs/rock5b_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 38b5aad206..5c74916bbf 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -24,8 +24,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
-BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.47.elf"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
