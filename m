Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08542C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E168404B1;
	Wed,  7 Feb 2024 10:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PfcNzzu-Gfy; Wed,  7 Feb 2024 10:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C7F4040D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C7F4040D;
	Wed,  7 Feb 2024 10:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 871B31BF831
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73F2D42205
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AY0RNZhhP7Pz for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C9FF42204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C9FF42204
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C9FF42204
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:05:11 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-511616b73ddso726790e87.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300309; x=1707905109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VE1y5cDg3X0TcoUc5Dh+NFBtk+DqRKtEbq1t6woZeOs=;
 b=VEbxD+EqEKu5GbLpmGl4V2Gyc06k+IfUlEcoQbyVtOakIOlWxo8NCTGPyJ1M4MwqKH
 CS2m2xuOvYwroOzrr5P6/p+hsD8Et4+/l0A63il6ixNxbvFlAwkrDDnScT4RkPWglgdk
 GfhpS/9FvISVYvTnWiMUHQKo5FEhSL64JBcOK+PrecPhTwLiZwDmrQeKJ9naf4/l5jj6
 Ndyt1nt01rzwtfTuIUS/W4X1Ahophe6HmnxpRrpfSdNmg1KTpcuEpUoRyq/2SX1vS2v4
 YbV3Qv5SER9QV+1d2b1oKJjMTb8++qfxJMtFQyfLBURUGlptEMw+6M88Ju09QmoYu1/A
 Eiog==
X-Gm-Message-State: AOJu0YyVLxtSAPk275OWCJGBWHqOvHt0P+9Nn7TCOj79t9KUV/Bz7AlZ
 lFmowklFIE+ZTcjZU2w3zUev0mqOpqYo0DfKlRixirvzspL1o8PUbGqrx+PDty6vZLF9HWyGboY
 sFz4=
X-Google-Smtp-Source: AGHT+IFI1kRJ+Ky0pCjia6SknpE4V0464GsLiepgCRH2pVvymB0Rf38VHsPuNuOf1CJxdVzyDHZwzA==
X-Received: by 2002:a05:6512:241:b0:511:4dbd:5823 with SMTP id
 b1-20020a056512024100b005114dbd5823mr3308297lfo.48.1707300309355; 
 Wed, 07 Feb 2024 02:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyF4hFGrvD7rUlhLMhAyC4Vrn1KUqGFT+Ug+94pbCqAv6vJmscsljxJ31E5e+Uiz6SWFI2WUdPYJr7kNsSBvqfzEj8aZhdN3eeQ2PdJqU6VTpqVw==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b0040faf3df118sm1523363wmb.32.2024.02.07.02.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 02:05:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 11:04:57 +0100
Message-ID: <20240207100459.2896502-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
References: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707300309; x=1707905109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VE1y5cDg3X0TcoUc5Dh+NFBtk+DqRKtEbq1t6woZeOs=;
 b=qBN9DquIe1VyAVus98F+yW2UF6vN0xwhzgmKmoYVdScXfAl9IHb1bTnWn18gF/O1wi
 +RjvkQI/OpSv7bUrRJ0YAXyhlk1dTiC7BOsmyNGMw+YuI97hoNg0NTN9ttE7MYeVPUD8
 aO14HKs/p90LuoFmd8Tjq9SmqJ0QjFVcAQvTg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qBN9DquI
Subject: [Buildroot] [PATCH 2/4] configs/stm32f469_disco_sd_defconfig: drop
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
 configs/stm32f469_disco_sd_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 8b10bc674176..66840a774230 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
