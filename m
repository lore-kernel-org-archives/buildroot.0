Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4AC54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51D3E40571;
	Sat, 24 Feb 2024 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsNyGT1RE3uh; Sat, 24 Feb 2024 20:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6B5405AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6B5405AA;
	Sat, 24 Feb 2024 20:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 868DF1BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749DA6067C
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jfb43M3CbuYD for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF99B60671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF99B60671
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF99B60671
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3e85a76fa8so173869166b.1
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808251; x=1709413051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=k94+fJ6fEIz9/jFz9vYIwqop5w0x202QPs1cwD9EhjkKBqeCLzfzvu8d0RP6FlCgAd
 HsGJVkhjwMgyWSaIFo1mLzUQ3pL6PmHim0hGNMzsRH9gTbmJfRSh7NM3TqmCZ6vUvUFw
 aGe2qH4ybvoAWjgKRjT3vPhVplp6tnmbJSF7hylUvlwAOfCLACH6VrLpKboV4RYz4S98
 c1kN368/XCYjuVNpL3rbFP1eIxi342FBE3hmyAnXeX84bcl9nXa8U4H5oWoVub6JAbFZ
 2maWm0ngUYpKYLXczFICqjF/Iy+d+IYUSbgh5L3nX7DSWQk4adJ+eZ4yQ70DMc2AvGWU
 VkQw==
X-Gm-Message-State: AOJu0YxplJ+Hh+IJV27SzAZ4HqTvjL95gyLGT0gAk37viRt1mqWpxm6f
 3e3QCtXMtW1wnP48OJLhlrrqZ8ma1d0PE3t07QE7JVBE45UPK7vbjrRV3vbBRQSfKYLwVA96n5x
 2gXg=
X-Google-Smtp-Source: AGHT+IFh7tD2gpSLh6GBaNQF9EF0wg3qQteuL0awN+cZKyd42S04UYol8eTM8aPyvr31jWvWAUe9WA==
X-Received: by 2002:a17:906:f817:b0:a3e:eb81:ab5b with SMTP id
 kh23-20020a170906f81700b00a3eeb81ab5bmr2088731ejb.54.1708808251688; 
 Sat, 24 Feb 2024 12:57:31 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:41 +0100
Message-ID: <20240224205654.1546744-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808251; x=1709413051;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0ukM1ysdi9ISjJrZMGotHcNyrgvpCD8kyvBew01Sr8=;
 b=VfL52dm8evRRclPWeNtldv5jEwgoEldR1LVYn/HSYNmGFgbpXzAhWMxxlJtGlwi/pk
 3VHptIlLNKirPZYGC2o31M6F/jazL0hT3AvgEwaEWPDck2zr/9UyKfHATgUyvkmnF+Ue
 UQRNvMS/tSHFFTql0Dew3ZU6OMKe3a18t2ps8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VfL52dm8
Subject: [Buildroot] [PATCH v6 04/16] configs/ti_am64x_sk_defconfig:
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
