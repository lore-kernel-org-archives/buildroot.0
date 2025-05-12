Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84CC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5883F40713;
	Mon, 12 May 2025 17:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxiuLc-xy5GM; Mon, 12 May 2025 17:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B374071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B374071A;
	Mon, 12 May 2025 17:03:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98E49154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A6D1402F3
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxE-PzD0Zr4O for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:03:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D743C400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D743C400BD
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D743C400BD
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:02:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a1b8e8b2b2so2397805f8f.2
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747069378; x=1747674178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cpqror1k+7XGHVClK7E477LbmK0kdRoMEJHk3CoMphI=;
 b=CveyLM9xK8WaEuPQ6UuuxhoDH2b4LehaklcjbGXEs3LPoe5MsWl9Z9jKmdI+MIY+1i
 RHsVK7HjDMnePZeu2Ob7pEwKOIdq0Ay3ha7WwEacecD8OXE1yoHOoSeFewoUGcmSUCHw
 vfkRW7XVJkEwRMtJOcFkn5CNoGaE2BpJuLcfS8vXZyvIjihOGzXYXE0twv6dgt9DYx+1
 n21YA6UPxuGLd8y53WlFzBKd/37HEDDMqbsK9eAvdJ6BjFIT7jC6wv1KJNsc7ojWXDOT
 Z9KYZIIVZKpGHZqH/To4tvpU+YHnT26AeHRhJ36+5n2l4xCzUKonbfbZQrdi9FCjTj9V
 hoHg==
X-Gm-Message-State: AOJu0Yxe/h7aypc3ko6H0HDqE8uVWvObLLphz6Csv7tGf2+DRHAxkR+d
 0Jt9yS0n9NJq1YkM+UqmzzvNmD+CZ8LQxJqfTrDIVzBjQmmjBs/8/c6q/FxOz2tcqsRcsO4zVXv
 Piq4=
X-Gm-Gg: ASbGncv2RqeMwA5U58uxmy2FNsak62zr2ls5Gh+Nxadfb5FcNzjeWS1Ef/wA/8Nd7Ir
 KsFHOpIVIDl7kCoulAVk7mXUeQEMWq95BtLItOrcdWFOae8U8WNenCBXN0sieqYcTj2HFq4wi3I
 a1MnHfRUL9QzbU1R1czJWnAPIPRFvSGyHSakeqavefNHjva5/ImVpoZcFjGDJh5gNSu3OBZKgP5
 LBtP2B5U1jXwpIeYEliz6JXHAlJxJIx/nk2T2bdUxBiyTzTtEIvirK+i81NzkCoUT/TTfrU5Yye
 1ee34dcXKeRBaxm+THjNC2gVB/5mVR20KTUeW/8eQqeoI/NPEV3Yu57/6DjQerscYGyjQeKSDdm
 RxOiAFBrA6P2TW3oHeh4efHfdSaNszFUCvxdOvtl2iufQwaPqtgmR/E+RDA==
X-Google-Smtp-Source: AGHT+IGFAZ9lhI5SQz40cqp+CBo7Ww0YQ8raQ/O9lWTeheCMdmal1naZKFg2pX2+jzRwidV1qgRPWA==
X-Received: by 2002:a05:6000:2485:b0:39c:3107:c503 with SMTP id
 ffacd0b85a97d-3a1f6445b00mr12610337f8f.31.1747069377598; 
 Mon, 12 May 2025 10:02:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5d6sm12943467f8f.83.2025.05.12.10.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:02:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 12 May 2025 19:02:55 +0200
Message-ID: <20250512170255.1526135-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747069378; x=1747674178;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cpqror1k+7XGHVClK7E477LbmK0kdRoMEJHk3CoMphI=;
 b=rNNuMXsqF+YrZgWZWYlvSqVWP5HLPFV51h6ae2PvaTyRdoNWP0puw7G6L2HqHHteyC
 uOAAEaVw34KCkX/vhriQ7ZprrZaLCGTdjZXqcXresxZyPzTidfzjiyH8GUfqsc+8eo/S
 Y0HtNuteQ4X3UTapKB6ByAqPzqJWiyWC9bH+8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rNNuMXsq
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx6ulz-bsh-smm-m2: flash U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the board flashing by adding the bootloader, which I had mistakenly
forgotten to include in the script.

Fixes: 322e8d845196 ("configs/imx6ulz_bsh_smm_m2_defconfig: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst | 2 ++
 configs/imx6ulz_bsh_smm_m2_defconfig       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
index 7c5a884d65c8..bf3866e414b8 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
+++ b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
@@ -25,6 +25,8 @@ SDPV: jump
 
 FB: ucmd setenv fastboot_buffer ${loadaddr}
 FB[-t 60000]: ucmd nand erase.chip
+FB: download -f _image
+FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
 FB[-t 60000]: ucmd ubi part rootfs
 FB[-t 60000]: ucmd ubi create root -
 FB: download -f _filesystem
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 2169ab446581..ffb0c691fd33 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -42,3 +42,4 @@ BR2_PACKAGE_HOST_E2FSPROGS=y
 BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UUU=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
