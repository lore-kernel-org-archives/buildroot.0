Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE57C4829A
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E0641573;
	Wed,  7 Feb 2024 10:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxWBNgsLmIBY; Wed,  7 Feb 2024 10:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B192E4040D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B192E4040D;
	Wed,  7 Feb 2024 10:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 854641BF831
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F67B42205
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZompgY1ATgx for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5EC842204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EC842204
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5EC842204
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51168572090so364246e87.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300311; x=1707905111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydSUz+a/C5ZhBgHmI83UbCRVosZ1BuS+4iHlV3z9Pjw=;
 b=Tgy4yuJgLTOde7nGzVazpNBeBiNAVHkztOslZaO2hGIs/tijHB1apwmj9JwJlPu/1b
 VhhT42FB49Bno72OUoKL/a56jHGlGcKL16HEmflBNpir/x1L7ZpB0AfQ4Nrxna6Gs7/m
 JoISqaUSLVVeFeV5oxMtSJMEkhk8/b8wu3cMsYC6zWaTBDoQglB9mVEROmRZ5r6MpwdW
 ULuy60XFlB9a45VL18Rhencrbu4MulnpNqlOTF1yxJ9UXylUbFWTNTd4yX5sUrHoCA9R
 VZ+W7GsB/Gd0sJ7Rba7UxuLWHC/ASmydgZTyVtkN8ZsmK3v4+7PfGFPQBA5ellvk/Aty
 xR+A==
X-Gm-Message-State: AOJu0Yx8BYi4uENMPqUCIhKkmPfc6KmDjy02v/iy8SkBPOwqdN7y37dj
 4pWF+Y1Pso2e0kJNTUJnnJvvn8UrFs0eTkNyAXkP4K7rgpY5HazyW7LZ+D7NSELyGGi7zZ0NCM1
 jO/Y=
X-Google-Smtp-Source: AGHT+IEHr2gEU4m5M5SOBDfEm3ezWtNnsxNo4hCNYSFVh6AWjiqIjMYOT0R4hgdcQlsUi6lL8kT/KQ==
X-Received: by 2002:a19:6446:0:b0:511:5da0:c1e7 with SMTP id
 b6-20020a196446000000b005115da0c1e7mr3200622lfj.0.1707300311286; 
 Wed, 07 Feb 2024 02:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2IhDQGOPuYaCPCOBDu5io67WTanThpZV/Pyh2NzSvtZpNSyvsrFUk2EPFxNzCKV7zOIvZt616FvM5/4YkGL4Q7pAhVsDOOJ8d0dRImBy8LKiwJg==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b0040faf3df118sm1523363wmb.32.2024.02.07.02.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 02:05:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 11:04:59 +0100
Message-ID: <20240207100459.2896502-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
References: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707300311; x=1707905111;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydSUz+a/C5ZhBgHmI83UbCRVosZ1BuS+4iHlV3z9Pjw=;
 b=YC49vV7QaoIo4rgyHq8H53U0CKZ739cwm3MMyB0cJRRTl0CWoHWvtCGnQ2NpfcBotO
 KctcQSkbEJHhtJVWV0+PfSprDOuzu+abBQ7vMPUXPiFvosZeCAezObZ6q4ISFdMnGUPU
 ILrRO3qvcafU4vKm0KEddGxp0Z3h4TGGdAbkI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YC49vV7Q
Subject: [Buildroot] [PATCH 4/4] configs/stm32f769_disco_sd_defconfig: drop
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
 configs/stm32f769_disco_sd_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 2ae27fb2d852..725c985ec04e 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
