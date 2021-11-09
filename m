Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E08C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76BC161027
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76BC161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36AC24038C;
	Tue,  9 Nov 2021 17:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3X47NObfIbB; Tue,  9 Nov 2021 17:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72E7940186;
	Tue,  9 Nov 2021 17:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1116E1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F30E1401F9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21ppDzBtfYVK for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:21:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 528FC401BF
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:21:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r8so34156037wra.7
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rcgsQwmV0M2PJUt3QoezpyfE4RPNaKXchODPqjMV+9U=;
 b=N6B/Do3tpIwkOM1pDTGCFLn+5r29ArFMQmqrnlvYXmxI2B9tdP2RocyGara8nVwiWP
 NIIubh7fZOLwhUy1aGR0iepL+rvKEQkqnunZ/i9ZtV2vrSbV6OW+RsLUTqLPmSNfKRGV
 inS52wo7QxEf5SicpvXQW/q/JJqe5CSwMYiHvboWIQA4feoneHqSCzoGwnFsPX8epx97
 rqsO3/JD5cosaveMvX36I500mLTP3bNMgMrl9YAxWQY6Yf4bDrE8h0GjGpAiw1wucbdR
 wZOwRRzpbm+y+65ut2u7meRgFHK1mmXcN54uytAR9nse3YOtWKfyK/JOTvXg187iviag
 ME5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rcgsQwmV0M2PJUt3QoezpyfE4RPNaKXchODPqjMV+9U=;
 b=oyvElnGKZtVlzp8OzkKfJHj1KJMPm7E+hfQ/jyOhBsWSy69MuUsuyj6JpuRciQ1DNX
 h6ja18NToEGIKCGZ0+Hatkhtm+fD7jeVXbhQIDFlZqkCLwkXpRGTB3ciC4yd9OaNUJX7
 ZuEAp2dv22zGLhaDdY7eXUAw5eDBE3+XZUV0VoZ7KLCxj59LBq5MXlY1UTvhUsveyPaR
 P4A9/OOfGeEs81pNOker+CigT9LJllJvSl9toqezGO433HcqlJ3IG+vhfX83vtufxpiB
 RFdVjwvsiem9DbwVByALG2FKTEex99VtM4wGdcZc0XrubR3YX2YaLYb4KtcHMNlTaViz
 euSw==
X-Gm-Message-State: AOAM530e+ESJs3QyGnf/y813BkrE/5ekjNSrk00m+0ARe09d3OehVzqH
 kzkpYCmLEZvBtmDI1QeEys0BmuSxTio=
X-Google-Smtp-Source: ABdhPJwXeI0xu957GXY6ih56VRX880OPWyfX+Ft4kYgkzWoexCGCjkWDfWJbW6rbvkHJkmekpueomw==
X-Received: by 2002:adf:d852:: with SMTP id k18mr10868270wrl.391.1636478462213; 
 Tue, 09 Nov 2021 09:21:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h2sm5386780wrz.23.2021.11.09.09.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:21:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:19:07 +0100
Message-Id: <20211109171907.456986-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/uboot: don't override dependencies
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

Don't override UBOOT_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2eb1792de9..a10e224501 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -525,7 +525,7 @@ UBOOT_DEPENDENCIES += \
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
-UBOOT_KCONFIG_DEPENDENCIES = \
+UBOOT_KCONFIG_DEPENDENCIES += \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
