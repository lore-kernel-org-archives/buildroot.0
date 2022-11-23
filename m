Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E78C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D09E940C33;
	Wed, 23 Nov 2022 19:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D09E940C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtmSMgW6BKLh; Wed, 23 Nov 2022 19:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BF9B40C28;
	Wed, 23 Nov 2022 19:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BF9B40C28
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F041B1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB21A40647
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB21A40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMDQlTjS9JZX for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C97F40610
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C97F40610
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:28 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id f3so17655351pgc.2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P98x0K1vtPk6ZjxtiMjvBCVFVq9uZo+8d3xiQooucRM=;
 b=upE2XNgo1p2nZEnkhV3ZE5eSoiOuMzB6NwrH+sDnZ8SJdKahckapimIHrjpybpv7Bv
 02sPSmCZ6tF2kV5IZFY2bcGiNDyErSDGAYOq/OPzBY3ozvFA3hxckp3mm53tYQX5Pn9s
 lYxeScy9KfLvOtM/N3j6Qh+50l/QXuHFxDGQvVyn36FQUiUYfxqqeVlP1QNG1M6noLFZ
 XfcjdCX0tr3pqWCc7PaA9kEpkLfUuWtkx91KpLvVcE0nOiJCCfc5x+2sFfgyhSPs9bsu
 XYkYAvtgAQTi/CnA2GVJCpwc54ysDI9IJSbLdbtj57X/jQdQkRyxJ/3uO+A6e48yeN9f
 8/mw==
X-Gm-Message-State: ANoB5pmkKHCuD2XB2wZtPa6Khi84TDXyLLr8p7PPEfxw0qbgKz38ZdxD
 SHTWgvCkxyY1OmyUhdAVnGfKjvrF9z/1DQ==
X-Google-Smtp-Source: AA0mqf6SDAcJlP6Yeeykb6QEuTMCS+vvUJzRseXTiupL5PmZMXNFSMWKMVAmkirREd6vR6fOUwb71Q==
X-Received: by 2002:a63:570e:0:b0:477:a381:84d with SMTP id
 l14-20020a63570e000000b00477a381084dmr7604192pgb.207.1669233207582; 
 Wed, 23 Nov 2022 11:53:27 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:27 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:53:01 -0800
Message-Id: <20221123195304.1582783-11-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P98x0K1vtPk6ZjxtiMjvBCVFVq9uZo+8d3xiQooucRM=;
 b=HXAt0NZ44gCd7zEfWdVbPehlWqW82zhE0iDUQxP0BBaTvHM6yLrekGz0MrBTIBCOgf
 xozwj7WJMf4li7TS3lqEktaezHyfMg29mWjtDg1tfqDJjTJWKDuV+vC/dFbK7Jx2CLek
 xADSZgvIK6r7TjI4+7DxJW8we6ANcmzawtWu8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=HXAt0NZ4
Subject: [Buildroot] [PATCH 4/7] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 5.15.52-2.1.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 4d28b037d0..27f6a438d1 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  39fe307916e19a0892a514621121086e276a43858af90230372a1344852116a2  imx-gpu-g2d-6.4.3.p2.0-arm.bin
-sha256  2642a49e088daae4cf568a150d01e7c095995e8a6ff1883c02c3fa6d26d254b3  imx-gpu-g2d-6.4.3.p2.0-aarch64.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  7737a3372bcde34e2d275397df67c307df5033d5b133ac770f75cac4e1ec2580  imx-gpu-g2d-6.4.3.p4.4-arm.bin
+sha256  8341d6e2cde3f3ffa035dc95b0487dd04a50531cc80f4cddc5a689ebc4946e02  imx-gpu-g2d-6.4.3.p4.4-aarch64.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index c5df87e618..d94da24d8f 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p2.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.3.p4.4-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p2.0-arm
+IMX_GPU_G2D_VERSION = 6.4.3.p4.4-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
