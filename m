Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB42DCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAD9416E0;
	Sun,  7 Apr 2024 10:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J47gAsyP3Oz2; Sun,  7 Apr 2024 10:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D3C417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D3C417F7;
	Sun,  7 Apr 2024 10:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 255151BF954
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1255A822AF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTEdmZq00zBq for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06B99822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B99822A9
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B99822A9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d80baf621eso39037801fa.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486117; x=1713090917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjkx1G1Z9V1cO7Wriss47M8Lw39FZhZROiaI4y2hCfg=;
 b=wpaENgWNkKpijG1T7EX6R/UUPnEVG9msMKsGGWbR6sCVQJfwoZpx5BfG3haQxz1kux
 b0uP3jZFqNharXODDrawOCXc886hjveESH6FYhLZ5PZWUUp+/Jh2He/81FgWDoge9qHx
 jufIu4WZkthYZeVZ311J4YrUq8H25JiWmxrALll6VWq4UfAYhdPGeSZ79dBIiBmL0WKe
 OA1rFvqOUHVPfU1CZ+xPD39pPeOIJOZwwWtkB2ec3hSKUidzCcH6jmIiRTv0kDlZYF1c
 2i6Seo9FemSqH/zXFCU3RetCJY3bUwCEe9G4AP/MAZ6wBHCLjDP+MoNPXC10S9Fxmz6H
 hErw==
X-Gm-Message-State: AOJu0YwDJfSY5oZrHZeQPI0p+mjlTOw5EKC4qDYkk1ftglsY34L6zkU6
 cu6qLHazRYsc4p0oNu8Fu2reE8pgVFJao942uS5xRe/hZsxOQxf8RE+D9kZMyacWG5a8dBgoqDZ
 W
X-Google-Smtp-Source: AGHT+IEyIUcpv+fpBnzhKLHzYGz1W/V27Q7adyD8SI1B7KJMciHp44njzc2EMb3mYwnbk/3YLMT2LQ==
X-Received: by 2002:a2e:a417:0:b0:2d6:f16a:857f with SMTP id
 p23-20020a2ea417000000b002d6f16a857fmr3387119ljn.0.1712486116746; 
 Sun, 07 Apr 2024 03:35:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:16 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:55 +0200
Message-ID: <20240407103512.1112712-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486117; x=1713090917;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjkx1G1Z9V1cO7Wriss47M8Lw39FZhZROiaI4y2hCfg=;
 b=THx6NZRGBWgMrex7wljbiewp2q8M0ap5moABs+c2qPenoETLzn18qqTyt2DUvdMgUt
 QP67otOaqAo6DRdS5jVDn38LGW25sjZIvicg2UwDvjLpMr/xZQc0eRqQcUs17tCk8zh3
 RKlkhEBogfqipkqisQM9hFqX9CTX+z9pvgy10KbT8p/TJyNoiwze98fTJd9RZdY/+GG6
 Uy9lD5PXklL1dDXdF8bGNeZxOQWz1fcc1vN8FDlec03Zn8La59NN6wxZFfG+M79913ok
 DfsBbEorLXC5sZF72l6n2KB9t2Ayu1ZEZC8wGPGlFjHtZ7BlHZy99h5cvVKYshfW/Qcf
 6enA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=THx6NZRG
Subject: [Buildroot] [PATCH v12 02/16] board/ti/am6{2,
 4}x-sk: add arm-trusted-firmware v2.7 hash
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES by default
to enforce downloads to have at least one valid hash including
those that use a custom version.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash

diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
