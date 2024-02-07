Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68443C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB55C40363;
	Wed,  7 Feb 2024 10:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EgEjnUO-caX; Wed,  7 Feb 2024 10:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DCF403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34DCF403E2;
	Wed,  7 Feb 2024 10:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD61E1BF831
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B84F7820B9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhi2DR3CrrWg for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B36D98203B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36D98203B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B36D98203B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:05:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fe03cd1caso3761405e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300310; x=1707905110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8HhLOVhdT41HZotZ+MTGx6pY+v7IKzTZ2WvIYO2GXA=;
 b=u+exKO36zQf561KM4+K+8X9Xmvc6tWR1vlp9n4w6lFg5PjIfGaFKZwtfu0v95sy6mA
 aFcV93aoNIVkK7iyTN+31CWWgjz6iuLtJv+hU7hQ2jRWMGVui3YVSEp4ORMnoxtqLZrN
 vDrNLo8kJhDk7uX60m1r6/nafTmyBdBAoUrGdMyCy80sfVeI9W/A5caR1x0o7i+SKUzc
 NvV4uSEekZsgXZfTUN0Gq1fHCpd6C4K7Oy7Mg4WVq/B2+x62VwEfZlLOgyCqgLA84BBu
 ogWZXN9IR8ZjpRXMqSxwKxqERLSZdyf1NOpYnALXFhD/W6JoahZmTq3F3lLodU11HvDI
 DcSg==
X-Gm-Message-State: AOJu0YwNo9ueOjEmT7BofSkoGkgxH0Jf8W3lyNEsi+XdOb+eKVXuItBV
 /t3TLaew5Qo86MfA9Egy5LN6HhXWKjMlkvjLQ7tbdB/S7iECLKyz7yC6exuFtB6Uf7IDEvFwNqw
 ZFJY=
X-Google-Smtp-Source: AGHT+IEE3zdaO0G9m143cJZgERQKeUKj8lAWnoqEY/vHaUDdB7zzYoPNFFyKX2KHZOAa4Tx5jHKGQQ==
X-Received: by 2002:a05:600c:4588:b0:40f:dd19:2abb with SMTP id
 r8-20020a05600c458800b0040fdd192abbmr4253370wmo.5.1707300310372; 
 Wed, 07 Feb 2024 02:05:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJbjCTHnnkzXDpIwrBLnu+LPf2Zo7DiEhaUBP+kP7lXbHOR/a0cLtHMzTQPE4G+lhPzM6zi1MPLG+NZP2U6RXHVRkEZW/gupIqNK5Zyq3HapeXOA==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b0040faf3df118sm1523363wmb.32.2024.02.07.02.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 02:05:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 11:04:58 +0100
Message-ID: <20240207100459.2896502-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
References: <20240207100459.2896502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707300310; x=1707905110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8HhLOVhdT41HZotZ+MTGx6pY+v7IKzTZ2WvIYO2GXA=;
 b=MdWzCIp9cA5YVm7E40yVVW/dGPS++4zmbChr7a3FcvW2e99WRpmDC5dfIbwM5A9JKH
 UW+ksnq5NF5iD3QaqlTIIEHPnRyQLjktyvF+EZcBPTORUfHVMnRo1cGq2MWuo1ijJTRs
 guxQPuBkpoPFFsmAVanDWgSqQbdKOEOctLASo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MdWzCIp9
Subject: [Buildroot] [PATCH 3/4] configs/stm32f469_disco_xip_defconfig: drop
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
 configs/stm32f469_disco_xip_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e362a9985116..6e6ead0fdebb 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
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
