Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521AAC5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187F9410B7;
	Tue, 27 Feb 2024 16:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ao1K7LlZV7cY; Tue, 27 Feb 2024 16:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA681410C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA681410C0;
	Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 812111BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780F3405CA
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRrPgGTwcZau for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0467C4014B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0467C4014B
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0467C4014B
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:34 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so6941141a12.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051432; x=1709656232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=R9iHU4yTNn0RoK6KnNGsBiz4Zva41nN6wfLeO/2w1xyMkfCOHG+u8Vtlmxc3onZKBX
 0B0AjLxcQqzsLogzahiB2WNIyjKPhdmVVpR2mVTB/C1kSGmJh4hKnOfvU5qWAHG2qx/N
 IQZptkGqt7Hkc5tyQGH5d8NJ8Hq4upDBvkzC+BzuAQQ/Vkf56Sp5qwVlZRenDCnHEHXP
 H9M1wJjquDTUvTQC6Rluy/9EF5DBRRV2AZbl7p8HQ659ACzS1HsiPR06De3KExFsxzDH
 Z7ejXSGYSXQZSfPY5u8NPWl4ignQ0z0fN3yi2HNDx9TgTMMS1Cslt/RtxLV/wMiteXOQ
 4MpA==
X-Gm-Message-State: AOJu0YzXwRguKPod66Gq70MrqiGGlR1HemjM4/Zxw60ekuiy2pHoty8l
 PyRuLSv0gdUbu78gjiSiboTr+yr1lfaVmvmvx9iaUg8h2J3iHa4K4oyc0gYHNZTRK16yxIBHuPs
 GZFg=
X-Google-Smtp-Source: AGHT+IGoE5XVlnME4NEXusFrypokBFGeALIPa8iBsgKMHDYNKs/0l+tjhhrxmOVMDL6aL18w+BGASw==
X-Received: by 2002:aa7:cb45:0:b0:564:e0af:8b11 with SMTP id
 w5-20020aa7cb45000000b00564e0af8b11mr7149306edt.32.1709051432779; 
 Tue, 27 Feb 2024 08:30:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:06 +0100
Message-ID: <20240227163019.2876942-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051432; x=1709656232;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=T/d5XQHJx0lL0N4qWT4bI5v7clzIzitRubMZM8q50nuUye9DHg2S+BZrsdhwa2OvQK
 BZipqHD+2RLggCjSyEPjN8WMAysPIz/sGH5XrYc+wWtU49/QnaTg4L2UA+93PAFs/KNw
 0vzqJisEJGomJmOkiKtz2gLRGDh4ld3q5eyE8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=T/d5XQHJ
Subject: [Buildroot] [PATCH v7 04/17] configs/ti_am64x_sk_defconfig:
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

Commit 6b2329bb80 ("configs/ti_am64x_sk: new defconfig") forgot to
specify the ti-k3-r5-loader, so do that now.

When the defconfig was added, the default version was 2022.10, so use it.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v4

Added in v4

 configs/ti_am64x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 097175bd8f39..26195194c7d6 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -25,6 +25,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
