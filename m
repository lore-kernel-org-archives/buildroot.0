Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A7C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E24580B4F;
	Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbhpuPmUYGth; Sun, 21 Apr 2024 09:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF5C80B4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF5C80B4C;
	Sun, 21 Apr 2024 09:54:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77F901BF2F0
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6336B605F7
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ag2BhSYdBQLD for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 09:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EBC2605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EBC2605DF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EBC2605DF
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 09:53:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso4048578a12.2
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 02:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713693236; x=1714298036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87NP9pKXcWvqv56vTD5gLflMEajm8HDOfoRzFDdoe28=;
 b=LfkM1l9wHLGrjr4l7Yv8i0HB+vbSESQ42eLf4COohi/WdeAdThfZwUH7H7ioaLDx5w
 1ywRWQRvdfCy2TKJi9hGpcpmxzAtZV+5/ZRzuuaswIRh4fQJNwp4z1aM8OssYW3/WDwz
 pRdXB/982U8dqN2Ds5AZY7ze0OMrUdSREHP8SckmDDWDkcct/Sk7VhCthcHRGgRHseCJ
 LbJD6bXbQnjyzXSDkcl+FNudgEpt4tkaP6A0MZ7JO4e8F8EOblpkvFDRcBmzTq0OH+U3
 Ha/AflQr10RZ1ML/iUAI/3pSKTPW0wQe8wprRHMCg7EC7H4W2Hksc8gpquj6pJQZDPee
 oYsg==
X-Gm-Message-State: AOJu0YyOh6NkCrjzmkjxPua1gLfxgYzlXlmp1H3eg5tBre++26kYAtcF
 D89Y5L28f3moNu7NeyHk2isz+jJWi2hSe1CydbIyeh9p8BeJWYozNT1m0jO/th880ym1Ys0QpPK
 Q5Zg=
X-Google-Smtp-Source: AGHT+IGahSJQ3dBfvVkBKX+NrrIu2NW+AEfAYKWh+gArRzXC+d9TutcRo1fCRdKJA/ef9yFbdD43Rg==
X-Received: by 2002:a50:bb62:0:b0:570:1ddc:5e4f with SMTP id
 y89-20020a50bb62000000b005701ddc5e4fmr4137355ede.8.1713693236432; 
 Sun, 21 Apr 2024 02:53:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f15-20020aa7d84f000000b00571db231915sm2318427eds.78.2024.04.21.02.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 02:53:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 11:53:51 +0200
Message-ID: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713693236; x=1714298036;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87NP9pKXcWvqv56vTD5gLflMEajm8HDOfoRzFDdoe28=;
 b=UtC/eHpXc6wh615h3ayHvq0o+uDsiA8/AlKXwCt+N9DeGgTSdJetS8+H/Uyn3gP91T
 3c5SS+B1xLKDktBK5/QbA95bwFAR4HgD3xjbhnxC/7yvRi1kDeROHrFVKeYuhCEYY5uz
 sGVxmHBBOdtU8QmZ4y9Z238V28iYZkWDBWb0Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UtC/eHpX
Subject: [Buildroot] [RFC PATCH 0/2] Add support to genimage.sh for creating
 a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series adds to the `genimage.sh` script an option for creating a
bmap image, which significantly reduces the time required to write an
image to an SD card. It also includes a use case applied to the
`ti_am62x_sk_defconfig` configuration to demonstrate how to use the
new option.

Dario Binacchi (2):
  support/scripts/genimage.sh: support creating a bmap image
  configs/ti_am62x_sk_defconfig: create the bmap image

 configs/ti_am62x_sk_defconfig |  3 ++-
 support/scripts/genimage.sh   | 21 +++++++++++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
