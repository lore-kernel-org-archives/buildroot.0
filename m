Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF85C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D5340647;
	Wed, 23 Nov 2022 19:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D5340647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Tzbi2jLCetw; Wed, 23 Nov 2022 19:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBA3A40C5B;
	Wed, 23 Nov 2022 19:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA3A40C5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCA151BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B46409AA
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B46409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uc4Tjz1yOBKq for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C0340951
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1C0340951
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:25 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id v28so18268006pfi.12
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6VloSmWOrh9XS019LE6PPT4hhIIYpMGV56svMtfobKk=;
 b=jZG78yTvY9FX9Nswczp6xw/i6UG8KUBzb5w/YaAjfcw/o7muv4LJdoBI1qKzhnfgIj
 L34JRNJ4RFBV5X0UGBmz/pJqnYsy+mWn4S6wyirQCpSmoSn4GUO5DDgu05ezvEkOsM9V
 he7DL5O3hI+RD+4hytYlLUHD2kTpYGe5/TTEnNsG38Bhr2sv5GeXGy64WUvlfGd5F8tw
 PautrY5iaQ5jdon+SF9Tlnw1HNS4Y7g0u7ZFvLNLpni61RCu5WkcLBltwRnQJDE1UmrU
 iwjoA1cr38lShwgAnAqH2tTj53h4GlXcwlOql0xQygEharGV6lANWGTcyycUY+5TmOgP
 jX5w==
X-Gm-Message-State: ANoB5plWxzBebLkXRSNVvx6ahBHQ/QSZTWZZ5xSB9DaTNt1ZnR50gSt5
 s8GWv3gcWATZ/RbHx76/H4eYHd8zmyf/WA==
X-Google-Smtp-Source: AA0mqf7tKIS2PKnEKLk04+WqcH4XM8gUrDTM8szvASLsY4yOusjximL2/JRIkELJ8JgFL16iCJS9fA==
X-Received: by 2002:a63:114b:0:b0:46a:e00b:ada0 with SMTP id
 11-20020a63114b000000b0046ae00bada0mr12434236pgr.409.1669233205164; 
 Wed, 23 Nov 2022 11:53:25 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:24 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:59 -0800
Message-Id: <20221123195304.1582783-9-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VloSmWOrh9XS019LE6PPT4hhIIYpMGV56svMtfobKk=;
 b=Bp+vQGdXAwna+URap45bVxqcNbRG5IJLRZfq6F8AUVmKyyNquAEk6I/VZFIF6dpFFT
 iDBSBjXVEKkmx2ndiipt4FXKjAQCCEQghVPi2YRcloB7jN5AQ7mG2c+ei3QtlwAkWMKM
 ltibTZRzmeJFjMVFktp3pa1c36+tVyx8Ay1BU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Bp+vQGdX
Subject: [Buildroot] [PATCH 2/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.4
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

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash  | 4 ++--
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index ccb28bc4f6..5079de9840 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
-sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  kernel-module-imx-gpu-viv-00fe5a0bedc07337c873f93998da9025083116ed.tar.gz
+sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index d301494a0b..5c96ba0390 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 00fe5a0bedc07337c873f93998da9025083116ed
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
