Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF55BC48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907C141B7E;
	Thu, 22 Feb 2024 10:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNoaBMls9tmt; Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BB4A41B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB4A41B7F;
	Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96BED1BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84AA58235A
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g182t3fRWTOq for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9885482358
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9885482358
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9885482358
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:50 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so31350851fa.3
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597008; x=1709201808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWG88zHw6gEdJiHuN5pH8j4okm5sHKxvKuBfUsrt+28=;
 b=rA5R9XOhGg8UsVHrz36+BxW0V+qEZyD3yInJa37NSSbSrPYdd5iKaPYZ7P4kVpOkdo
 yZArzSqT1L+bT+MgqlZRdk1qyiS3ClbZoN9DL9YJwu5ObSjUKrfy00kUhF5liABInSPn
 goVDlSMdieL5L8Pcew0AxF4hn+xG+znNxh5YV9Dcfa6WGCD9cIcnZHPc7iVw5Y8nkfLA
 DQs3omCVrD5w2Oej6vaglCJFUIfXr95PSfq3poqdQx9cFvZ2tjsvkkzXIRaY2zeik6Iz
 x1bGsD1iYDPf7VmJhZ64kMukdDa5q3hIJytDplZTnM7rGBmAxK65HAFTZ5CZtYb9RWJ6
 +4Gg==
X-Gm-Message-State: AOJu0YyEXsnWXFjV4jwI1NXCFsR3MZNcGXK5mwprEOileCMg8JFTJAPS
 LuhuJZvJw1idpTx/JH1bga3vrrVPG6oI8IBttuu+ehcMxkEsnTVBwJcf2cNnE4mCMjMdYExd806
 YaK4=
X-Google-Smtp-Source: AGHT+IH5SkW7mjAavZg7S2tCz4xO7xkrL8KoXPgK6GH8qSkQBvVIXHwhXaPclsS8iKX16teUdR78iw==
X-Received: by 2002:a2e:98d8:0:b0:2d2:4d19:c914 with SMTP id
 s24-20020a2e98d8000000b002d24d19c914mr4481101ljj.2.1708597008263; 
 Thu, 22 Feb 2024 02:16:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:03 +0100
Message-ID: <20240222101617.18422-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597008; x=1709201808;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWG88zHw6gEdJiHuN5pH8j4okm5sHKxvKuBfUsrt+28=;
 b=ekJIB6fDKpxD6ALVA3yB8K83g0iUl6T0PNaspqaAKz25KAMj6U4WzP7ZizH8MsmLa9
 9twZ5DcwW3GLzRrn41QyVFk/XBuPGQxTPKLI/+dHuEE6+U2oaXeHuLmF4uYi6Xerm6Hl
 w1ZaJaz8sw87u6z1R/JoPgauhB8evcKmZ5X0E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ekJIB6fD
Subject: [Buildroot] [PATCH v5 02/16] configs/ti_am64x_sk_defconfig: fix
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

.github/workflows/ci.yml:          _make PLATFORM=k3-am64x
.github/workflows/ci.yml:          _make PLATFORM=k3-am64x CFG_ARM64_core=y
...
core/arch/arm/plat-k3/conf.mk:ifneq (,$(filter ${PLATFORM_FLAVOR},am65x j721e j784s4 am64x am62x))

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5
- Drop BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR option

Added in v4

 configs/ti_am64x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 4bfd31f0c8d3..097175bd8f39 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
