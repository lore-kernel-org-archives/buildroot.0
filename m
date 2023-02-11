Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8977FC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 11:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0632660A69;
	Sat, 11 Feb 2023 11:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0632660A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YW7ko2voXzuT; Sat, 11 Feb 2023 11:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A5A60A65;
	Sat, 11 Feb 2023 11:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A5A60A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 048801BF5A8
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 11:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D266C41971
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 11:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D266C41971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tOdC-JgEKb1 for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 11:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFDD41970
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DFDD41970
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 11:41:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so21728712ejb.5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 03:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LB4/h3r3APIaD849r9EIQ8jJlvFy13GU838vrvAd6hU=;
 b=rsRTS1SMvTmHcbelfEHtKlhzjcSYByMcl7V4DFKT65V7uttWiHc9EB3lR2RCYVESdN
 LRyM+geTPc6lPbNevHVbVfB14eupC+hIcGw9w2ZhRSy/HWXAiLK7JEGBdTHTo8ECRjtj
 puAmtwmQvPzNKcmJUI8sjekNNby5/mcYIFbRqVo3AaT1ycnRTBpu9o6KSEo+DbVe/jO2
 9Px72pGwyIKSK1oOO5AhtgntAJJLa6jQCTeiJIR+e0aV6gRg00rWZ04upS2ApOfx1Ttr
 ZlnfExWDFqwxHPn31twCnJUg67r6IcLcF6MzRxL7UlaWl2jdN0WwZg8I4rz/3uLSZXXw
 Q/IQ==
X-Gm-Message-State: AO0yUKVJBMDFScS7fwdvx1dOsvBleOLT8vjh9vxhtvDxSOreM1RIULkV
 4zpT8CPRZNFH9q5MQWNHwGOvMTpnBmVEt2XfpiY=
X-Google-Smtp-Source: AK7set/wMC8r3OvKU1bm6ELQsbXmIM6baOz5WMarCZb1vb09wideDWg7XzOaDHxYM1NSQlhOeEkvwA==
X-Received: by 2002:a17:907:86a3:b0:8ae:d191:aa2b with SMTP id
 qa35-20020a17090786a300b008aed191aa2bmr14427091ejc.6.1676115681366; 
 Sat, 11 Feb 2023 03:41:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-201.retail.telecomitalia.it. [79.44.29.201])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170906271000b0073d796a1043sm3703760ejc.123.2023.02.11.03.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:41:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 12:41:08 +0100
Message-Id: <20230211114108.353855-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LB4/h3r3APIaD849r9EIQ8jJlvFy13GU838vrvAd6hU=;
 b=bsvsmfaXwC6X4kGaQ6eYajXkqqjh8c8VPyANE/gosoF72ouNWI8l/uWL0VKT9cmMN9
 JXmTGI8SEJhbq6T89PRwNiWsvbdlO0+OvHRcx612jYxZbRo9PR5/T0qmQoYx22hAD5fO
 ktIcdDShExVuYBlXBW3Z1zs7/QDB3Ud/8sfsk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bsvsmfaX
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_xip_defconfig: bump Linux
 version to 6.1.10
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
Cc: linux-amarula@amarulasolutions.com, dario.binacchi@amarulasolutions.com,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The size of xipImage has grown by 84KB but there are still 278KB left
before running out of 2MB of flash memory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f429_disco_xip_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index f9b3270ecd95..872e4b6a306c 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_KERNEL_HEADERS_5_15=y
+BR2_KERNEL_HEADERS_6_1=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
