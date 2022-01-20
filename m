Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 13:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 778ED60F32;
	Thu, 20 Jan 2022 13:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53RvZ-FIGBOl; Thu, 20 Jan 2022 13:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B018F60D66;
	Thu, 20 Jan 2022 13:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38B0E1BF384
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 13:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EA881CE1
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SStMMeas1Dax for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 13:53:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1491B81ABA
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 13:53:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f21so28934773eds.11
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3lXubPjn4YXypifxn029IyNc3Rgy9JGg/2pAbTJw7o=;
 b=lRFb9YCTnCpSK3Tk3APhHa9b3UWznmwAyUtyFuY9DCQWrZBhkGMX4c3NDTrzyKS3yy
 Yx6myuzLQPsl5IIgNnS9/LM/Du1XkC7pQDAZlIGAtnYv4qmv9bNlBPpyOssA/SspiIfF
 wEqFjZ5GGTMqosaQ/4OIP3zwhblX0Shg9kxSheA/m3mx8g23DXadAvlvzBbL656Y/fw3
 82BHJP109XQ/3OkhiNlbQoPhhX1wp9uokuJLnwbLEtuJcMJPjRbIwoIz4zf6ZDLhiYVQ
 f9Xp9EjfIRH+FYwjGkyHphY6pZ9WuzbJvzKvr5CFKm/NsLRpGK21yku1LxV0kAOexoMx
 XbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3lXubPjn4YXypifxn029IyNc3Rgy9JGg/2pAbTJw7o=;
 b=xz8S0qNN9Nal/ay+oGlWTObBCitJaJyqBQhQlmyK8CuJ/KN1LMn2IhbQrrLcUvQ7Ra
 TxXEbkUkFlEapZNWXcIQRInAWnNV/SJYRIn7rXqkI0PGeeVdIlg/eu8WSFTdv5AG55xA
 mXTqHHKC18/pENXJYYpu8nZDUsJaYY6Y+OJkY6K5EqA2sIvX3W4i7kuFzB8xFGIxEXUi
 5pfCyaNu1lCSlWnvt3VUKc3x9bPo5VD0UPIjSqcNtP1xujTko+K6lD4+jP2yB81MIOOm
 dUEu1NbkK+2DSkn9VyaUYFPFAX2VUzF9a1O3MTwzCiNsrcHh7XlNURkjS9MyZ6wxYBvr
 Xh4Q==
X-Gm-Message-State: AOAM530o+z3zvMVW/iT6a0Fy9pUbkExxCAfMcmTDgJ+/gH0fGvroMiWS
 z00XWkvKrPe4fU6J8ksJ9dVq/uRZ14FxFA==
X-Google-Smtp-Source: ABdhPJwJ1POqhaBWuKCWoZsbnMFO4rQTqIObXnIOiudk5Gv5V0bTq5T51pDGg89U1D/AvAstOvM+vg==
X-Received: by 2002:a05:6402:7cf:: with SMTP id
 u15mr1379209edy.325.1642686786981; 
 Thu, 20 Jan 2022 05:53:06 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id h15sm1038444ejg.144.2022.01.20.05.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:53:06 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 14:52:52 +0100
Message-Id: <20220120135251.4225-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: remove
 BR2_ARM_FPU_VFPV3
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The FP setting is not used for aarch64 in buildroot. The FPU options are
set implicit.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 7f9c0eeae8..8f756f5246 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -1,6 +1,5 @@
 # Architecture
 BR2_aarch64=y
-BR2_ARM_FPU_VFPV3=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
