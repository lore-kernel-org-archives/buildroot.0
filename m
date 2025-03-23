Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C33BC36005
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 17:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFAC81F8E;
	Sun, 23 Mar 2025 17:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acv8xm2dVy17; Sun, 23 Mar 2025 17:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF69F81F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF69F81F8D;
	Sun, 23 Mar 2025 17:28:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4055C1C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26B06608F6
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgVReHtzmryg for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 17:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 246AC60866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246AC60866
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 246AC60866
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3025616f8f.2
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742750898; x=1743355698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bTTVe2GESeKL1985yYPgEPTCMQRQSnsEh7UzTodsDOw=;
 b=VUvzLoOgJl9GSCJCcYmTSCo+CGt+e5p2Hk6LEsNEUPJPeWjaRTKP9//ju7SEjndQfd
 vMMrmsrXXsskYPTvXSdhMdVz40ntbu8OB02Sqnf5f04hCeWKjHsTyLwkfed0Fj1ous+j
 +JIwa8NqjaVukg6ZRvJNgh3zkAHpqoDextuxqlZ9PNyr6nOFhROu4vINotxMy+NpEman
 kdGMg4Ewhyhp159OuLTlLk7xsq506ykCBuVUzoy3GxqLvjV34m+EWsGyGQWHiApne0Sz
 KrXsYN5MoMSk8z+YNZbTxR6Fn1LDwc/PxOQ4ea+CD17jDx1JLzK0cyRAvGZHDddI3sEn
 ojJw==
X-Gm-Message-State: AOJu0YwsuhVQAJfx2iUd7JXfSSUf1RlWYf3T+m9PFx7PB71R/4IFxZXn
 weKEE6ojkVn/0DEmP9A+LE7uRfYnSqVVcfcoUk5HUsD0e7m6PBnfOALl4kUd
X-Gm-Gg: ASbGnculBw7T85xv/jO2WywOMmnC2rLKkd94d+36Ud0/X5DxXUQ7MDpNmAXV9KImPsU
 dFr8aAuQ23SdpeTi9D18eNeJXygMP2t5kGt8a8VUR2e0KgZigMQL4/709o7V58Gtle7XhVsdbUR
 1eHuOCZBtPuFZ0UOIBHJKtUgsdqP3lbjXcLdHdOZIEOjdKyLn2/CScMZDp5R5tsRgEB7XDSEV0G
 RtJlZva+UCYAxyNuCBT/W9Thkjlr/lKlbx9r2eWZdIJTYSAiiqMr/s2PVFBWU2tH04ytAvkPjH7
 DEuKXw+SznVzHvNOM3gc4u80t7w//0u+kXW6TT8K6K6WqQMUiMYbw8Nzh6HGOY2UFsVQttYCXft
 RM5hhBkStsPzWj2XO2PpLF3rZLJFT
X-Google-Smtp-Source: AGHT+IHDwZFGwdijHVUe8lXKvibtuJTVTYeFcHj8vesOOcHY8e7Hn9QrZ6MMRIUumxBBXhw5kf5Zsw==
X-Received: by 2002:a5d:5987:0:b0:391:43cb:43e3 with SMTP id
 ffacd0b85a97d-3997f940621mr8367484f8f.46.1742750897818; 
 Sun, 23 Mar 2025 10:28:17 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abafed528sm4875241f8f.27.2025.03.23.10.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 10:28:17 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Sun, 23 Mar 2025 18:28:04 +0100
Message-Id: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742750898; x=1743355698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bTTVe2GESeKL1985yYPgEPTCMQRQSnsEh7UzTodsDOw=;
 b=idYi8ymfzl6GIhHBcSq+jnlwxqgvw2+bIefT1g6GA31v1EccxVP3/V8xiJbHcsJXKb
 4IV/EnsVrtqH93puhioa4zK7Y9ZKUWQk+UW1+EgfchWxj5ikPfRDbS3KmaEMxoem0Wa+
 PMTOIdJuGgNFu7VunuXErw9dv/yB9pRLWNfzuGe5ysFaXvuBfIDx/LvWXjVcxhTULbYc
 c915Gcu69Uku3BVHN5SDNWro58kgf9er4TOi18HxiwkkMBPHCOgGVhxdsWYEt3uQmXQm
 V+pP+GEVXoPCqLcTC8OrdWtRcriYXdJFNm2NOCT7KtGzGGhe0Xmy+nD3+zLAnQVM/+JU
 Q7Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=idYi8ymf
Subject: [Buildroot] [PATCH 0/2] Add support for the HiFive Unmatched board
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

Hi,

This is an updated version of the previous series [1] to add support
for the HiFive Unmatched board based on mainline kernel and u-boot.

Cheers,
Francois

[1] https://lore.kernel.org/buildroot/20240617201232.1804524-1-francois.dugast.foss@gmail.com/

Francois Dugast (2):
  configs/hifive_unleashed: extract common configuration
  configs/hifive_unmatched: new board

 .../genimage_sdcard.cfg                       |   0
 .../genimage_spi-nor.cfg                      |   0
 .../linux.config.fragment                     |   0
 .../post-build.sh                             |   0
 board/sifive/hifive-unleashed/readme.txt      |   2 +-
 board/sifive/hifive-unmatched/boot.cmd        |   4 +
 board/sifive/hifive-unmatched/readme.txt      | 100 ++++++++++++++++++
 configs/hifive_unleashed_defconfig            |   6 +-
 configs/hifive_unmatched_defconfig            |  38 +++++++
 9 files changed, 146 insertions(+), 4 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 rename board/sifive/{hifive-unleashed => common}/post-build.sh (100%)
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
 create mode 100644 board/sifive/hifive-unmatched/readme.txt
 create mode 100644 configs/hifive_unmatched_defconfig

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
