Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C376CC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57FFF82ED2;
	Fri, 29 Jul 2022 21:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57FFF82ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2fAO6GZ-adg; Fri, 29 Jul 2022 21:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFC982B97;
	Fri, 29 Jul 2022 21:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFC982B97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1881BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65CB760812
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CB760812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Ed1H6WH6UPT for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:04:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6013160774
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6013160774
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:04:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so613903ejx.1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkrP1Gz5qcO8GAzPZ0jZemDa/h2xQ8wpC4R3UhgxYsQ=;
 b=lI26d8400GiT6qPhfLntrPyzUeA0HEmtAefvmBfRNde/cs49ciV2aX6IOpWZakyfto
 htu33/ytujmDJG4y5L13Zuvle2ZSdZ+TvBIKCzSHfnhRiRPGWhSx+n/1N+/KlLwenqj8
 hglSKh4XHk5HbIRkdkOEQRkQNB/tlTKZwCyNbJeTLwmdYup159TsVBi+w98R1pMC6YpW
 G9ImFgpWJaf7rfSgyWs4jZBOP2V5IgRU0o7a5U1OYRi73i1yESyry4n7QaJZbWm4IF2h
 oWcQkj0A/DLQw7rrztPnjRXzHOUx5rU4KK8P7yhfhTulttKZjmwJAL5VovqEq7HtvL6t
 DcJw==
X-Gm-Message-State: AJIora+//eRiq78Qir0BxBOXay60qEo1oMeZYDq/GTLVGnyQMzGlyscv
 r6L7OhHzevr5+rmAkNJlIuKQqjpjvNjCHA==
X-Google-Smtp-Source: AGRyM1uje+Fyk6Q1qBmZ9IRD3S1W8zsCYHdZnOOm6JQV0McxTs641lUmPjUMvkP+sLQn0E8pqhTEAQ==
X-Received: by 2002:a17:907:d26:b0:72b:8311:a167 with SMTP id
 gn38-20020a1709070d2600b0072b8311a167mr4158614ejc.89.1659128692226; 
 Fri, 29 Jul 2022 14:04:52 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a17090618aa00b00704fa2748ffsm340141ejf.99.2022.07.29.14.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 14:04:51 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 23:04:44 +0200
Message-Id: <20220729210444.1787668-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkrP1Gz5qcO8GAzPZ0jZemDa/h2xQ8wpC4R3UhgxYsQ=;
 b=IGI7mKrkbnK+wSj5F9YB/N8J0LQgRHJGBwRR3P+A3DmBD18eLIjd7q0icfMLI/Ye4M
 MmQzZup2iPafGjfXkP9Ekw2fAV0yHJA9W4XGp47lgfJkwgBeXyrdws2cu4U7O23sjiJI
 59YLFStw/z0rz3Dig1QB3x5gN5GEvA9QXAui5nL95FXrDha1s4tsUeZ/hjdCObOS3/dU
 5Fo4e6rcxCcRAPyU6pNhIKAQ/wlAZ2BafNskXrV3f34eFfxEH9z2OALKVCi+W7+ffln8
 KK6SJRY04Fm8iBn/E9rlXRAixSqNQgOoj018sVg95BBeBIEWlaK9PVYqSg/YtUDXI1NZ
 1F/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IGI7mKrk
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: set CFLAGS from
 environment, not override
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
Cc: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Older versions of TF-A don't support setting CFLAGS on the make command
line. They use 'CFLAGS += ...' in the Makefile, which is still
overridden by the CFLAGS on the command line.

Fix this by moving the CFLAGS setting to the environment. Both older and
newer versions of TF-A handle this correctly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954
and a large number of other defconfigs

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Kory Maincent <kory.maincent@bootlin.com>
---
v2: updated commit message to show that it's fine for new versions as
well.
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 6b0405a44a..7c4e7edb00 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -60,13 +60,13 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
+	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
