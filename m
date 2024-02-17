Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BCFC48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3AE83CB0;
	Sat, 17 Feb 2024 16:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIrX-oP_SD16; Sat, 17 Feb 2024 16:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 573BB83D09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 573BB83D09;
	Sat, 17 Feb 2024 16:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C29261BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B68DE83C8F
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFfDVuHCvnmj for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C852B83C73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C852B83C73
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C852B83C73
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso3647233a12.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185781; x=1708790581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyQinuhnLRjPm2u3ADkjZO7r3zUKIBszBg1CHphMg4A=;
 b=FZnAeWjhxGfZmF3FJi+CaQgJK1zgQpJCMta4M19oOFf3CtEuXK/QXuEuqVJuYQpVuN
 gY6qkSKKXgjQpb1UEPMYhCP7Zrp+SgBq6Zrm3SlBlDXHh1fd6dQ2h6xjezCJXxrRJK2A
 oaosJUWy5wyR8tNtx8DiRuCN7FdLKZOXR0xDm0TtGS2J8SSTBEeyM+KeYaJMoQecwEL3
 93ZvbO5W7AQHxYS2Z8uhhnta8buhrZrYTne1gjU1tTdKcWGPnk+qAy1yVOquDL7rQmTU
 p9Z8E+nR0IJPiUOvgflOMlcdfgeofR9KlXCfsBkn0Mg1Kbke9qlHa+lTe8N013sP0LT8
 C2Xg==
X-Gm-Message-State: AOJu0Yw7/rFNOpbluT4mshMvjNDrQtjnfXS7NBefWCYzCqp4RPW/mdSe
 99pFGma8v8zP1m5Sa+OtoRSYyluIAHcF7s5n1UKXNDsTASJMGuVonJPiBmooNtoaYoGU32bvpIe
 7DO0=
X-Google-Smtp-Source: AGHT+IHfvFmeCWyRV771abOfG7jBSCxklCA8KU51NwvG6QwJkDht6SudK96+pz20qAUZkqqxBk+NFg==
X-Received: by 2002:aa7:da14:0:b0:564:3f11:47dc with SMTP id
 r20-20020aa7da14000000b005643f1147dcmr293468eds.23.1708185781302; 
 Sat, 17 Feb 2024 08:03:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:27 +0100
Message-ID: <20240217160244.1320482-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185781; x=1708790581;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyQinuhnLRjPm2u3ADkjZO7r3zUKIBszBg1CHphMg4A=;
 b=JkNgxENJNEQd2C2GrQ08TJNCW4Rvu6xhEFnF7E9nIq9SQ5wLQWupzRuVbQDgJSF1PW
 XaJyV3JH4CU5+cu3FGS495Di9bLA28NEsruQfkkNxMNHzz3v/Ly99xzauUd9dj01kwVN
 yvT7KMocUiUqMZPaq25HM6+sWLUQkPVWa/bGY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JkNgxENJ
Subject: [Buildroot] [PATCH v4 03/20] configs/ti_am62x_sk_defconfig:
 explicitly set the ti-k3-r5-loader version
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig") forgot to
specify the ti-k3-r5-loader, so do that now.

When the defconfig was added, the default version was 2022.10, so use it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index fde6f8f5636a..a4cffe09ce72 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -26,6 +26,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
