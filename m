Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 11:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97131419C1;
	Thu, 28 Jul 2022 11:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97131419C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLPvur4tkKnw; Thu, 28 Jul 2022 11:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F374199D;
	Thu, 28 Jul 2022 11:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F374199D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49D451BF359
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 201AB60A8D
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201AB60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XL0ccVdxqpIC for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 11:52:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1990560A73
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1990560A73
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 11:52:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id b6so820859wmq.5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 04:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gbw/UwpNzeoGHhxUDHEcDgIpsWEbyag3LsBUm8qjpE=;
 b=lpqulWR9pfmJZl0IrHNQlFv1RLq0Tqn/2u9SZyXHkgkR6MEn8MZ4txRYuQ7/cfEYXb
 52oEyQIZPUDACQFpmCFnID4bORrIoeaHesQyfzLAvUk8NrXuX8Bhz1zgir7Noh4YzdWk
 HpNS+Wv/M6zf4Lh0xh+5ro3NmgqOQsvSAatQ4g05ODrl9LwWxEHujAYJZE/BLfpSbIFq
 xk8YMCaguHSJqjY57s6Vw2Upx7z0V5xe4cd4tTERBLe/uKXrewnT2vuoR+Tj66wPO9k8
 1oA2VVy47LOfjWM5KLZrcpXNfJ3g7I+n6URBJfk4iv8nvCVB05D8UhM4ceGjkrkvtost
 VnNg==
X-Gm-Message-State: AJIora+2NlgdVvYunjIgmMVWMfEU4fJfCspgDUl1JC9PC0r5e4Bv0rpJ
 /CeBOPwrAX28OEkRSZmr54e6MSa5Zlw=
X-Google-Smtp-Source: AGRyM1vbjX4SP5f2X2C2PdpzZPDe0IWUKelbin7tJxKrjOzPO2lc595cmQRezydxoSYyxocsgK8CcQ==
X-Received: by 2002:a05:600c:21d4:b0:3a3:10a0:cc4f with SMTP id
 x20-20020a05600c21d400b003a310a0cc4fmr6443705wmj.75.1659009135800; 
 Thu, 28 Jul 2022 04:52:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003a3279b9037sm5637772wmb.16.2022.07.28.04.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:52:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 13:52:04 +0200
Message-Id: <20220728115204.2465495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gbw/UwpNzeoGHhxUDHEcDgIpsWEbyag3LsBUm8qjpE=;
 b=nTnAcfQ4y6yXEFSlSE0qk0ARsZ1InBiG1DRqagKD8p1PHBZI+dWHHzju8iQUdVvmko
 v7rI78fxBZ1+t33ApUC9MarKt5IlrcMIawv8XusXbfURk5e5TJZ1b1h1ejoZX/PfYmPH
 a2gjODJ6tZcMjHAc1C5QvrRThljGj3N4mV52d9l/cPQPZZtVQ17guoR3cuGNlFBaudsB
 sjlv2vGmhLxS0eox79amE/ZExiLzYc80JKxA29l+1LOXx2It+Cqkqcw82HRwzU8Bs9OG
 oPDkbIn/XL9R4u/gxvkbweVcvu3Q4nSPZsfekbSlcLoIYCMgWqd9zy5/zEGeRPb+yLtb
 3o7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nTnAcfQ4
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix speex dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pulseaudio needs speexdsp, not speex resulting in the following build
failure since commit 7752afbe4bb9fa1def5ba89daf21564ea58af79a which
explicitly enable or disable speex:

../output-1/build/pulseaudio-16.1/meson.build:713:2: ERROR: Dependency "speexdsp" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/8d4c5d5bfd65744753ca75180dd45a01c90f0b91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 7b2d362316..38be3fa141 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -162,9 +162,9 @@ else
 PULSEAUDIO_CONF_OPTS += -Dx11=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
 PULSEAUDIO_CONF_OPTS += -Dspeex=enabled
-PULSEAUDIO_DEPENDENCIES += speex
+PULSEAUDIO_DEPENDENCIES += speexdsp
 else
 PULSEAUDIO_CONF_OPTS += -Dspeex=disabled
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
