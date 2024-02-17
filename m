Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B286C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 310D480AAF;
	Sat, 17 Feb 2024 16:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K3WMCRbNFkY; Sat, 17 Feb 2024 16:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E136A83C8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E136A83C8F;
	Sat, 17 Feb 2024 16:03:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DADCE1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F374076E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j07ko2fEqE67 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D953B4076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D953B4076A
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D953B4076A
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so401774a12.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185778; x=1708790578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8ihKOPSN/NZ9MCVF7/RjnvvbBWognxcyWiU/eEmu7g=;
 b=X85sRfUGfYxl/GcXic1Oa93TdiM2CLsaQBKThY19mDFPqlc4dFpTKb2VYqZ/XkqhVh
 DVpJhCEEBxkGPqP/MXTHXK939VMWGgpFcFrl2kRAnIMyYuZnefSaSGiukyzv9+kqZk3j
 y0zlOPD9BCN/McdASil1kUo2IAJZlwfh1MrKRwa/c1wAha09u+VrDCBN6/GVa41MdmT6
 BSgFH1DReiH+7T4RHOw54rW8kkITGIbOnK8lOutAJU0BfB459b0Vu/ny7etyBwPnXZQP
 1I/pdji6f5KTRNhDua/cXn/02QtJbJcUNo+euc/17QIjfQx7NN4tibj8eqmEI8hGhgRH
 hlCw==
X-Gm-Message-State: AOJu0YyQsz/poLe5mPXUCKPO3GJ3QIS+ozRJVdYQAfRgEP0G1lw6WWI3
 eOg1nhFiuDP2Mab75PcPzYhIZ8AFZldn7xYvnskEOqwY85RdFOF2MH2PLdqr72Mj/2QgP/mAlNY
 ydbQ=
X-Google-Smtp-Source: AGHT+IGo2m5ENBnQywyPut6+TpwLksyKjgn3k/52Dh2Dxg9RygeN1glqXwvrfshH8mXmmZYrjEqxWw==
X-Received: by 2002:a05:6402:1844:b0:564:3830:b9a5 with SMTP id
 v4-20020a056402184400b005643830b9a5mr523785edy.21.1708185778137; 
 Sat, 17 Feb 2024 08:02:58 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:02:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:25 +0100
Message-ID: <20240217160244.1320482-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185778; x=1708790578;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8ihKOPSN/NZ9MCVF7/RjnvvbBWognxcyWiU/eEmu7g=;
 b=rhLHeJr1YAr5hvwroYkojgATr5ZLzwcaOSMweHW/lcA24B6ZJDZJfYAbCAeIbbof8G
 uzoEU/vhMaVOj/1xLdg9Fu3R0BUSRDw3RC6lPsOUMl50F269uoAYzRud+wKqK449Ih84
 f/Q4XXuezq46QyaoIIn1lFOcPCM6MP7q6u7nQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rhLHeJr1
Subject: [Buildroot] [PATCH v4 01/20] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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

Checking the output of the command `git grep PLATFORM | grep k3`, we can
found the proper settings for the optee-os package:

.github/workflows/ci.yml:          _make PLATFORM=k3-am62x
.github/workflows/ci.yml:          _make PLATFORM=k3-am62x CFG_ARM64_core=y
...
core/arch/arm/plat-k3/conf.mk:ifneq (,$(filter ${PLATFORM_FLAVOR},am65x j721e j784s4 am64x am62x))

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index f88252a89c68..fde6f8f5636a 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
