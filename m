Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328BFC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9E3740136;
	Wed,  7 Feb 2024 10:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c38Xnmo6Y3CO; Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BEC3403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BEC3403E2;
	Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC2CE1BF831
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 998E0820B9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIO6uQYvDnzN for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6FD88203B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6FD88203B
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6FD88203B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:05:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511689ef2b3so159614e87.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300308; x=1707905108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZaRJwfKr4euH85rhB0CqnuHQ7Eaz8NwY/pt71QEvbk=;
 b=qxnBFUeu6OJF/tltTBKiGMKHwbWMzg4fZad8deS1h0egwGWX5iIRu9LwlkiztxmCtj
 SY1GgsQZrPEqVPE9Mhn8CqIJs3IOtg46VDJvaoxLf6dWNeE5tgOnS2G5CZsvuWYedNCY
 sx/hQ7j453pszHN/AnB/CrMYtQVuA/T3ZpIbqZaxheL8IkqpYgJikeo8qZ/fXdOZcxy8
 mOcWW5BXr5zgnvzLlG3GbqqdEU0xPPOyaYG3H0/aGnPFRe/AhOmUJDKonpYD+R5yWutM
 0pindOopw9zID4Sim4HGlsX1IsfMOD7hFX3tFeociy6ohyiSphsEJDSZ0+9xhCONwVBD
 IH6Q==
X-Gm-Message-State: AOJu0YzBj9hl4aMFK9AWcqyKHLZ2TEcRQ29fWOY6kwJPdg1bzQEQ361X
 FqBiATIRbI+FghNw4NMArGCfF1mtR2nJXAhCurm+/0GvBF8TqmEu+SYyRCUwEopTNaoSv9k90/H
 NISk=
X-Google-Smtp-Source: AGHT+IEqdEyMLhtfILm5J9jPDtM5TPFYeCHplJQEMnDLCuPrCycBntrBDtmEGybBM4F/NHN7I5hyQQ==
X-Received: by 2002:a05:6512:1107:b0:511:6458:4c4d with SMTP id
 l7-20020a056512110700b0051164584c4dmr1637945lfg.43.1707300308315; 
 Wed, 07 Feb 2024 02:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhXfzvDENY/IHgn+vxgik8XroKCDo5SVyN7Sbgri4KXCXWHKZ0t6CaRw4/RP//PSDpEEEscFcO8X2dXSxGRdQIHs0Fu3V80VGlR4Nv3gMr7ffTBg==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b0040faf3df118sm1523363wmb.32.2024.02.07.02.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 02:05:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 11:04:56 +0100
Message-ID: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707300308; x=1707905108;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RZaRJwfKr4euH85rhB0CqnuHQ7Eaz8NwY/pt71QEvbk=;
 b=OhoFmfmtVnKTWiWa8kEcc3BNeLqQutOSm4mcAdv8MHGRyCd2/dTRm8TbxG/yldYrl/
 ZpK3Zb/ysN/gc9aH4C2xixyjZZINPSMVRDFCOfVY0Tfj6GcPTDm+F3U2nRg+fZ4x+286
 +F3QMY9n3dNln85vpNz+UDiUfyAQNZeXQ11cI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OhoFmfmt
Subject: [Buildroot] [PATCH 1/4] configs/stm32f429_disco_xip_defconfig: drop
 redundant defconfig choice
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
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package/busybox/busybox-minimal.config is the default configuration
for MMU-less systems, so the setting is redundant and can be removed
without effect.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f429_disco_xip_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index d4e000487a80..99ae8cc7533b 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
