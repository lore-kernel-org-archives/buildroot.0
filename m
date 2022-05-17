Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A84EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACAD7610B3;
	Tue, 17 May 2022 10:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDxdyhIb1MD3; Tue, 17 May 2022 10:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21F161089;
	Tue, 17 May 2022 10:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163331BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 049DA83E8F
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewns4vMqy-js for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CD4A83E3D
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:19:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id f10so5031949pjs.3
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJzS9hrOlgyqtRhKT4J0dARB+KOs/32AuFz3WY1u9Jo=;
 b=Q9rIsiCYlNQUss6QLbEyp+Ka7pSdrWMtTrvDzmOF/LXiaMCMxcikrV1hILdMMNZtvk
 Y20wwzQHk8aKMAnB1ns5gvc48yVRaNkQ9K/z/pR9BeWiMNYIbmn+lbVuVdipp314KfVG
 oymW83YhmdOwHnqD3tQHo3MtlR8mHB1mpEV8FfTjmNueY/HFY9uBchFVD0iLzlazOoP2
 6GLjwyhhB8q9APkd4/1Z8c3o0SPtj7W4sPaEjEfcQsr30MNc1QSjwtuM+HkdkzT+mKu8
 9B5ubOyC2aO4IBUiJHFWR+PitLvD61I0G4D6EoShdy0VOcioWh+O6QEPYyhhN/C6nzVg
 I2vw==
X-Gm-Message-State: AOAM530qCCA31mPmLlIyBmpIe715CVG4f/qWJs7AqfLmm+jQSf6wnzOy
 QBsXYlp00HkHcSOIH5mwkZtiXOcOoLZWow==
X-Google-Smtp-Source: ABdhPJwVZJ+2+00xcv+T1VtrUaG+VdykDBiLO5EREgYeuzpZkfCU4PHHN2qSgJX5NL1agsVNjQYfkA==
X-Received: by 2002:a17:90b:1c08:b0:1dc:eeb2:5a5a with SMTP id
 oc8-20020a17090b1c0800b001dceeb25a5amr24054168pjb.31.1652782755464; 
 Tue, 17 May 2022 03:19:15 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ep21-20020a17090ae65500b001df955c28f6sm752564pjb.37.2022.05.17.03.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 03:19:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:19:12 -0700
Message-Id: <20220517101912.3243181-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] boot/arm-trusted-firmware: allow
 enabling without uboot or edk2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It should be possible to compile ARM_TRUSTED_FIRMWARE without u-boot or EDK2.
For example, one might want to produce "bl31.bin" for use as an init stub for
the Raspberry Pi 4.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 boot/arm-trusted-firmware/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..99f8e36bb5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
-	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
-		   (BR2_TARGET_UBOOT || BR2_TARGET_EDK2)
+	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A)
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
