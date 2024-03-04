Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D66C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA87440474;
	Mon,  4 Mar 2024 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lMA-7jaVp_N; Mon,  4 Mar 2024 15:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA7034119C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA7034119C;
	Mon,  4 Mar 2024 15:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6BDE1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C47D160C1E
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQNjem1YKHGu for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EA4A60C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA4A60C18
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EA4A60C18
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a44628725e3so580257566b.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566453; x=1710171253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=k/xONxddwT+yQOlUpCBPuNS7Lsl7wop02VAr9jqFsV/MD+7DwLTgzdRbxa/np+PJyA
 CSbp/2aj+gl4XXYHaIW4R1HkODOtbAXTyvyeS+B69C/JNcGzGCLdpQXDpD+R9h7YfFZS
 +wKXS2rwamndngN5uEKjbM4gHFNg5r8jo/gzifu2sKJ0QnMH+wM02a0WPSEJdSExi+ho
 XF52ySj8VnOl4fPsudMlUKyO6NznHay24GuiKp8g2dHC5aPpr7P7uVggUFGfEjgSoPjr
 Jt9t38j958b2/FVLneAyBs8nvwB+d0V+VjG1pS0mYqwVS/OO68CoSn/daM/IsiHfn6GF
 3ElQ==
X-Gm-Message-State: AOJu0Yzf/b0RzAYNZpTB0YxMmKRiGMOq3J6oxgOVLfTGU2pCjQgZNd5K
 r2fRn4gwl8Y/XDCtguwuNNq3GpQurGrDiLUyFnDNhiWI2J62stJGBoYio6ffmYnFtEhGCn1ftoy
 O5aI=
X-Google-Smtp-Source: AGHT+IG2na3zlWA/e7Zn5bqKL/tsCH+vAadvHu7y9H0BssIuRHRKWQ/fFJrsFb5RyyjUs9YnARRJzg==
X-Received: by 2002:a17:906:714f:b0:a3f:20b9:2b68 with SMTP id
 z15-20020a170906714f00b00a3f20b92b68mr6562371ejj.10.1709566452928; 
 Mon, 04 Mar 2024 07:34:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:35 +0100
Message-ID: <20240304153253.732708-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566453; x=1710171253;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=oOEqI2QXwCWrVjJr3KwS45qBRGzjEm1YSoOuaZjIGsNfPo+AiKPqja6vARAkcjItEN
 CTXelvrlkuKaehtttTAkO0txnGB/555kaJ1HnYh0g4VupTWNirgi1ua4FjBrIsSD0sBf
 SRJytxDWcIeVhaL6WGz9LHwXAm2WoMrJihUBQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oOEqI2QX
Subject: [Buildroot] [PATCH v9 04/22] configs/ti_am64x_sk_defconfig:
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
