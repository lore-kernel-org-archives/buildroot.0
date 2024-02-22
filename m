Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FB1C5478C
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A40141B5A;
	Thu, 22 Feb 2024 10:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVwYXxoInRWr; Thu, 22 Feb 2024 10:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1306241B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1306241B8B;
	Thu, 22 Feb 2024 10:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5A2A1BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFD4941B5B
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ss1LGspTAAFZ for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18B3941907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B3941907
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B3941907
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso21929161fa.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597009; x=1709201809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Js6re1cNZnkdKlpxuJ10eiMtCKJbntgPb35mWC0eE5c=;
 b=VPdEsBmTzAOoWuiV9e5noMDMpQIkd3ufye7HMdR8UY+1D62bLBf/uZ6XX5QH9I8/w7
 OhwFFBdv4992lkS9kJHAta+fgndwjNjndgi6ZhP8GkZNyu5DTy4s06knuF9F1dyvVJyT
 1tR15XN/Tz5w5AFuhNVOxdaG2I6N6j4wEgwz+FuhnnJu7TT3yQW5hCYCXAYmu5e7aTTO
 3QwkCU8MxZ9GWTPAs77XC5xFrfuay+QLamEyX4HZRh/qMa2J1L8/Otp4/H29QYMYpsvv
 laG70i60jRlspAyBtKzj3p1ueM6/GQshQoFQI+Ul5LHnBn54hS7eewPA/hY0em0O2Hsk
 yFIQ==
X-Gm-Message-State: AOJu0YxRLd8vFOjzgewH0Fsvr49J3h6R3zeKQHfH8Y3KUXBeGSvVe0Dv
 PFvXUf+C/83rx+oz6zrUaJi68OlfAX3fztFQhNtsX/wySNpPKwgA+LfyU+SuB/Y3b42qVQ5JSsE
 9WlQ=
X-Google-Smtp-Source: AGHT+IG8/mNsoQwgTFGE3D3xN94iyzEwmIEge9FBLtkuuDwBAcib8eKWO8ipq0GlsJfraKM9hg/Plg==
X-Received: by 2002:a2e:8791:0:b0:2d2:64c9:214b with SMTP id
 n17-20020a2e8791000000b002d264c9214bmr309276lji.50.1708597009593; 
 Thu, 22 Feb 2024 02:16:49 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:04 +0100
Message-ID: <20240222101617.18422-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597009; x=1709201809;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Js6re1cNZnkdKlpxuJ10eiMtCKJbntgPb35mWC0eE5c=;
 b=V508rWREzuqfZ9DhsB3Lnc8ohuPQfHpfxXN7/5S+kCoRvAUCI7v3gpc9E0iqdD7T3J
 h11MSVKPnfwrXWs2ufllyXDmcXEmZ3URQqH4hOklVvRnpOKJWBNrbsoDNOf94DLDfMIj
 JEC0f7jVH8EAdJF4jE41Wtz2tsaEctlqAtqJY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=V508rWRE
Subject: [Buildroot] [PATCH v5 03/16] configs/ti_am62x_sk_defconfig:
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

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v4

Added in v4

 configs/ti_am62x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index c3ad555a8184..a129e216d25b 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -25,6 +25,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
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
