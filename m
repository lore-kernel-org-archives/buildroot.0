Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDBAC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A270B40111;
	Wed, 14 Aug 2024 18:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87SToMbotVFU; Wed, 14 Aug 2024 18:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 671DA402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 671DA402BC;
	Wed, 14 Aug 2024 18:37:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87A8D1BF97A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 811DB402BC
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoUYtTwt5P33 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 501D740111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 501D740111
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 501D740111
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:37:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-428e3129851so608915e9.3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723660635; x=1724265435;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KX070B2MO0LlbCTVSf4S+yfyl6zxBeI63lG82PIx7Rk=;
 b=VkKsH3cn5+4MprTm7e9MLnHCb6f6Dr/C2U5/4q+AbGXNDLgUTe401IzuL4/hBGwdt5
 RwQhdrQt9ko73cyKhBvPNM+H9K+oCbqZ0SNdFFLPK8767gi7P6gTr2ru3zdSUMJHTV2Y
 JFCdFFuhRb6o5ZywnoAwUGCdhi0H9nbYvnuea0DppzntzeS8xhWYV8LU+rgmJyC6HNo9
 YAN7gy7dVF1NCUreejbI7XOHMlzLUDSKEiaUHHzsgIqsmhtY8DSiOmHINPB6JaWbIken
 xpovPijINhlapOlhMmm3WeyiEWZFPgAVEXVwLYJxMDUcVCLYFYn5Dw3Z0u87o8SDcVnL
 Xlcg==
X-Gm-Message-State: AOJu0YwRknYgOO0A+FU3Dn09aWi/10x6J8HhnA2+7YPbUfEJkQLyLngv
 FUFDg/08gY3Zj5x6jieqxm2+/eVVA35sUPZe7xQTZDQ30KdN6oEX8UTU7Q==
X-Google-Smtp-Source: AGHT+IH6Tla8AF7wxMVEdDmMPBAH+UkAT8NSLJmyQQDvoL1uzsV5mhg7HlM3VvwXCFK6l5naRT52WA==
X-Received: by 2002:a05:600c:3b20:b0:426:62c5:473e with SMTP id
 5b1f17b1804b1-429dd264729mr24828665e9.26.1723660634656; 
 Wed, 14 Aug 2024 11:37:14 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7c93esm27584735e9.41.2024.08.14.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:37:14 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Wed, 14 Aug 2024 20:37:01 +0200
Message-Id: <20240814-master-v1-0-7834f3deddcb@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE35vGYC/zXMywrCMBCF4VcpszaSG7Zx5XtIF+k4tgOmlaQEp
 eTdjUWX/+HwbZAoMiU4NxtEypx4mWuoQwM4+XkkwbfaoKW2stVOBJ9WisL4Fh0ODt1pgHp+Rrr
 za4eufe2J07rE9+5m9V1/hJF/IishhUHfdQ6VJW8vY/D8OOISoC+lfADp5UagnAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723660635; x=1724265435; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KX070B2MO0LlbCTVSf4S+yfyl6zxBeI63lG82PIx7Rk=;
 b=SUZstWuaXcXS64R02zoDnM9D5iv4k2+OaFx6BhKK09Rsy2Uafug+HhSOrygFEEHLSx
 Qyp390iAkTr1tmP2FLuRwk4iU1RqmZ0wc/mZdxbeCsQDvc7UN3GehNb81gwXuhKyO92p
 L8Y5vSd8yRgie0E3qpXU7OYBKm0YsJfPmIUcQyQ7IVMp4sISPC5ykWRjxrXJyNyDfyHt
 SfhcEsGMIVYd5DnUAFNqmdKC+AUg2MHIbE28UntW1hItM4zdBATgoX91+F4fSbO2F57B
 iYj9OdPuG3dK2UrJ0wLn8B3F+JgNuSj1O3zFsoOCQHW5CayOggnFNVd9mDQ0H4/9xoXF
 6b6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SUZstWua
Subject: [Buildroot] [RESEND PATCH 0/2] Enhance ST common folder and add new
 defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit series is a first attempt to improve the organization and
functionality of the STM32 platform in Buildroot. It comes with two
patches:

1. Reorder common ST folder:
   - Rename the common ST folder from stm32mp157 to stm32mp1xx.
   - Update references and paths in related configuration files.
   - Prepare to receive new stm32mp13 board.

2. Add new defconfig for STM32MP13:
   - Introduce a new defconfig file (stm32mp13_dk).
   - Boot following the TF-A/OP-TEE/U-Boot/Linux chain.
   - Include generic "multi_v7" defconfig for Linux configuration.

Since this is a RFC, please feel free to discuss how those changes can
be improved.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (2):
      board/stmicroelectronics/common/stm32mp157: rename folder
      configs/stm32mp135f-dk: new defconfig

 .checkpackageignore                                |  2 +-
 DEVELOPERS                                         |  2 +-
 .../genimage.cfg.template                          |  0
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  0
 .../patches/linux-headers/linux-headers.hash       |  0
 .../patches/linux/linux.hash                       |  0
 .../patches/uboot/uboot.hash                       |  0
 .../{stm32mp157 => stm32mp1xx}/post-image.sh       |  2 +-
 .../overlay/boot/extlinux/extlinux.conf            |  4 ++
 board/stmicroelectronics/stm32mp135f-dk/readme.txt | 38 ++++++++++++++
 configs/avenger96_defconfig                        |  2 +-
 configs/stm32mp135f_dk_defconfig                   | 59 ++++++++++++++++++++++
 configs/stm32mp157a_dk1_defconfig                  |  4 +-
 configs/stm32mp157c_dk2_defconfig                  |  4 +-
 14 files changed, 109 insertions(+), 8 deletions(-)
---
base-commit: a631d5b3da2db55f3209546bb6a8bf0c67924cb6
change-id: 20240729-master-3a7c9cb9c96b

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
