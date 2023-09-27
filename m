Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF17E82CAE
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 956B5428F2;
	Wed, 27 Sep 2023 16:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956B5428F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVVKDrWCw9eR; Wed, 27 Sep 2023 16:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F1042C29;
	Wed, 27 Sep 2023 16:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F1042C29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4A9C1BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CFCB428DF
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CFCB428DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fw-zPnbIzihI for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:14 +0000 (UTC)
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3858E428DE
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3858E428DE
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-496a2ff7780so4234728e0c.2
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833233; x=1696438033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rb8BqVohLgGuTXmm9Ullvvp9acKa51UQTxIqkl1UkQg=;
 b=SLxh+6JpUzkRcYlk9mLBw96BVBW1Ov1fuuK7kEmG9op/UhZ09EEYqj6Bnsz6ZDnlAM
 qu1/4+dmvkxk0WBIHD1v33Sv1Sokzzry/VqWiOuVbIAxpnuo+QK/0qClfer1VNMa2FxM
 B1GRzHJcQAh9dsnimp3+xQQD54cZcgnDrrJgmz13tcJNW0RywiiXUceB/tBDCCDhRLA0
 9A7LPie3wX+QA4D1S1cfQGDhhsC1i3wKjrQSNk4PZ1OTttNR//G7xPOlGEXSHwI+rcZA
 aVmZeZSAxOj8RqXay9XSdP2lzbj62M78HxP2gr23XxVjfkCW5jd+eKE54ll7g6utWnLJ
 eVug==
X-Gm-Message-State: AOJu0Yye2v+zApybU+AD2Raze/JZhb3ee4jEa4j/5GscBQowxRA5Djk5
 qjMEtg/pySataI2p+4aRIqc3iTWtM4J+H2Xc
X-Google-Smtp-Source: AGHT+IEi8IUGlxd8HBezhRemtE+YRzdohAElrx9gy/tzNGRHDO5DcSmn6G1ADLzOElov/5IM047mZw==
X-Received: by 2002:a1f:c645:0:b0:47e:8a9:478c with SMTP id
 w66-20020a1fc645000000b0047e08a9478cmr1969800vkf.16.1695833232771; 
 Wed, 27 Sep 2023 09:47:12 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:12 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:38 -0700
Message-Id: <20230927164640.67592-4-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833233; x=1696438033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rb8BqVohLgGuTXmm9Ullvvp9acKa51UQTxIqkl1UkQg=;
 b=eIXshINePjd1QW6vG5v9FATwnv43CiAlRsJkSTDcTdFlAdwnXHRDQxeD2Hw9LBe5/U
 BABTphHZ4o1txxJqUjaI4WP2zju9eEduWZ7yrdBAQwT6aCm8BauPb/ep2Zqzcz8L21YP
 WVCoEN6SmdUI4kyzOkbVNx3rSzr+6QetfwU0erRmIMlBuzF0uqAc0lIPFJ7bt7V9rDMD
 HUO6qkctUFSLNCAJ9UsOITpHp1vh4CEB2WeKkEeytNeX3AKs9LIFd3yLqP4wj97eSok2
 eej+dAL3wg7HPYz+5XLPZoH4Kgeq0FfkTrWd6budEu7uwC7MNNIpUQ7uXM6bGDRKuS+r
 Ylag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eIXshINe
Subject: [Buildroot] [PATCH 3/5] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.11.p1.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.22-2.0.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v45.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 8bb6a6fe32..580b31e453 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  65427c12b43c7bb3838ec2bc91a5853c310652b920a65b2b52bacad8e761a8e4  imx-gpu-g2d-6.4.11.p1.0-arm.bin
-sha256  9bf8ebbfc85245d75ab7d133c3e135a4c5f23a0430c75883af9700e9cb82c151  imx-gpu-g2d-6.4.11.p1.0-aarch64.bin
-sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
-sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
+sha256  1ed29a4818161198b658ffc428dff7c154c38f5ba48d7358ed9b0be261d72b99  imx-gpu-g2d-6.4.11.p1.2-arm.bin
+sha256  cdf096c9b15c773ad600b24ec8888c1c4a33711c195c655e9411d4b66a992c25  imx-gpu-g2d-6.4.11.p1.2-aarch64.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index a93c51cba3..87fe08ebe3 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p1.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p1.2-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p1.0-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p1.2-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
