Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20199C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8928F60812;
	Fri, 29 Jul 2022 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8928F60812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCRuyPfgnRGk; Fri, 29 Jul 2022 21:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A52F60601;
	Fri, 29 Jul 2022 21:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A52F60601
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 018021BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A3982883
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A3982883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4jz-9Ivr1ad for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D27182849
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D27182849
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:02:40 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z18so7192336edb.10
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 14:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZgqSFd98v9xhVQ6qQ7zcCkXVvUPcHc7qRMptadjaq0=;
 b=cjwlknAJFH1Gz6540Xb0JBori1axJr1z5xhPIJYZIByYm2x1pTrv9iPlPsLdEN9HFe
 sLJU1CZPYOL3/HKZbySvK+OhEYvCqbtqgrnMzxWucE8X27Cs0h5jueGPc8G4PmP25esD
 LiswWMDx1aBvqIyuHdU+lZ7WfJ8Fvc2c9oczsaK0rYVDCwVhoDq+v8nd5PJRko0yS8bA
 yOSts/wftQjqp1cBzNeKZmmOrZG3xnUYkwHTsbbvWwptqxBTIskHBeQSTJOtA2Pe9M/1
 YkYsnOBqbynHCaPXye/RwSJGGRWLsptt2STRXszvjWEMj4+sqZapd5t0WUVOEQjImWXy
 R86w==
X-Gm-Message-State: AJIora/BnWK5xFxSOPMf4uClTiXC3jRIu8ktz1uTE3BN6DkNM+D10BFW
 lJto0OsifodLb/rfMhslVx7bW/d2HJojjg==
X-Google-Smtp-Source: AGRyM1sAC8+JV25OSkr6MINE8YsJ+ZpklhmKe1q3+bFGTzP93rKVpd6j1LiLFc1Zj/Kx+xKNUyCCvQ==
X-Received: by 2002:a05:6402:350a:b0:43c:4528:4eb5 with SMTP id
 b10-20020a056402350a00b0043c45284eb5mr5313348edd.372.1659128558654; 
 Fri, 29 Jul 2022 14:02:38 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170906c20f00b006feb875503fsm2119601ejz.78.2022.07.29.14.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 14:02:38 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 23:02:30 +0200
Message-Id: <20220729210230.1787335-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZgqSFd98v9xhVQ6qQ7zcCkXVvUPcHc7qRMptadjaq0=;
 b=gTfLitvGR43YxPGd+KTDkP5y7iozc5HTyLaIsOLGgtSzrS8iE/lDrJP3WL0p3QpTIF
 X06DmSy+4Uw/DIti/bgOuLFYmCi2o6/f6lDStbFY5Jg3Dv7X04bNbNQn9l/34/+abyZJ
 QDfO7YVnviCmOZpSqY5qqMg8sHV/iqFg7XiVw+ZOnFw81glGUi155sCkyhMsLi9Q+hTr
 4DatXCnNF43PaxyQ0O5ezaAVmLpRJndv4dRyA3oSG5iIsX3dEe6TM4RG4RtJQ9A8XZQ3
 U9/n6Z14ZMEdb4Iq3Ubg3as3xEilVpKOnvU3nnBB++/QFo1U7hJNQbE8+4rw+5sQUg5L
 SjcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gTfLitvG
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

Fix this by moving the CFLAGS setting to the environment.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954
and a large number of other defconfigs

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Kory Maincent <kory.maincent@bootlin.com>
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
