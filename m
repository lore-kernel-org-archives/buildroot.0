Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F11CC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D6F481D34;
	Sat, 20 Jul 2024 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMQyNV4U-Lml; Sat, 20 Jul 2024 20:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5056A81DF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5056A81DF8;
	Sat, 20 Jul 2024 20:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEBF41BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B5F81D34
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Avznf_-QSvsq for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAEEA81D24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAEEA81D24
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAEEA81D24
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:17:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so912677e87.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506631; x=1722111431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/yS1DYM3pnm9EOV7siVfIn58s8oLWjaD9awRH0MXOw=;
 b=OImeFMCixiNXc8K3ntgiFgysJO0eov5ep9Fu7mAUUn0L2Pqqs6VC4//EnYfD50szeF
 LS1mxXQQf9okKyGOAlubAL6ZG6P4gp7HzK5vzNv7HkW7g0IPvFCzHk1XH2cvRPR9e3Q8
 jZl7Fik+pEfbsf2kTWXzdhax9RUoMtGiwCoO532ZKy+d0CB3sQGwpAsFywfep3m+SC36
 ovF7oFO5z7OxcS8uleo0Ssp3l281gANkYZdqg8X8tisaZZ0ToACTl5g0lmWeR05EsZs7
 6Q9uiL8lH0CE5CTZYe9qNCcanxjDFWYWtvXBPiygBwqAgTwbcmvqcnnMPBayKwUYBlm5
 qw3g==
X-Gm-Message-State: AOJu0Yx0EOwS+3vdoJmywiD8MtZ5abtTtz0aOL9KtN2e66nttj1RWyrN
 AKfMaAICjrBRGU4B+JHOt3s7SFVj7anHcenSduxze82RuL18LQQ9ClcMg1RANcngWiqQjK+q7pS
 W1M8=
X-Google-Smtp-Source: AGHT+IE7H6ecSg06iTIxOHp2mKBd8iK6PC/m7s/dYHfeH15qnjuiYJkcZs51IVHr7MOiQ+htxuw5ig==
X-Received: by 2002:a05:6512:3d1a:b0:52e:7684:a385 with SMTP id
 2adb3069b0e04-52efb7e8f75mr1440553e87.52.1721506630979; 
 Sat, 20 Jul 2024 13:17:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-80-180-25-123.retail.telecomitalia.it. [80.180.25.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e7871sm204723766b.96.2024.07.20.13.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:17:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:16:56 +0200
Message-ID: <20240720201659.2253736-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721506631; x=1722111431;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/yS1DYM3pnm9EOV7siVfIn58s8oLWjaD9awRH0MXOw=;
 b=Hpq2UK5FMeas8NCZoZI415wcgodzvYzeNfQqbb4ekTZFFYx/V5ht6+SJ8ycoF0VEXk
 uYnvWn/zYyI3ICAfZ5DYnzoO+qijaqLXoZRU8NbltXTMens6ozdzEgHAaG6MAeuYX/OK
 zxSsnvGLoi9ub2YU9+y8sC9l+Wzn3EPC/svZ4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Hpq2UK5F
Subject: [Buildroot] [PATCH 2/5] configs/beaglebone_qt5: drop U-Boot tools
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e2520d0ff3d8e ("configs/beaglebone_qt5: bump kernel and U-Boot,
add weston") selected host-uboot-tools with FIT support to create the
images. They are no longer necessary now.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/beaglebone_qt5_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 6201507770aa..e58255a1086c 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -44,5 +44,3 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
