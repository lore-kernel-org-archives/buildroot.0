Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA645ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AF240327;
	Tue,  6 Sep 2022 19:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5AF240327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 235HQDx6ksV1; Tue,  6 Sep 2022 19:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B16E40304;
	Tue,  6 Sep 2022 19:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B16E40304
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A85181BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82AA283089
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82AA283089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Mxoo6dPTD_k for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 19:36:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE99382FF9
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE99382FF9
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 19:36:27 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso16058091pjk.0
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 12:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mio0lyoTm6W7KtmvIVkCV+l2uK3wVo+5KDkiOtb6nHM=;
 b=uZgRGnq6WOmDU4YwX2E2vh/m1WBYtpdTFY9HMMRVpxupoS8NuQ8OZgkZgZKwhmQWdI
 EqLw22tIqdyVC88daMAEJzFPSvCSCMJO24m9rAINI8T5m9YPgeSJC4X4vWR5B3JjUtGF
 9V9jO1xY19Ma8jtY0e4x2pE/4yGICbhjRJ3SwybFy3H8jeDo3MQ56441fm2L7uF3t7Tj
 ij7biFRSkl3oADwvpGtjrrCaRF6JloYZzy6QBwlaCTxJAH7OanS3DU8loUvpagqwdgJV
 QKzqqd+SzYFmAcMC7sqiEKO6GGfm5nkgth6Irg0SPyWUQRIFPdgLFZf907OKj/GdbGWW
 qoxA==
X-Gm-Message-State: ACgBeo1x+fXRyCsNGWik+7cKOAEPHAePi/KvSUn3c46xifkLJ994jcsY
 s7p3cMOP+uoJ396GR/E/HIJYu698zFdU2YmY
X-Google-Smtp-Source: AA6agR4t4LUUd4e2LOAtUIjxUpPVd5FWQ92IyccIJRlzuYEmTmYgH39gZJJe9fq5DgwFnhYV27AWdQ==
X-Received: by 2002:a17:90b:390:b0:200:4c58:efb with SMTP id
 ga16-20020a17090b039000b002004c580efbmr12862pjb.97.1662492987036; 
 Tue, 06 Sep 2022 12:36:27 -0700 (PDT)
Received: from chris-jammy.socal.rr.com
 (2603-8000-3f01-0100-8cb2-b692-12b4-bda3.res6.spectrum.com.
 [2603:8000:3f01:100:8cb2:b692:12b4:bda3])
 by smtp.googlemail.com with ESMTPSA id
 b68-20020a62cf47000000b00537bdc9c2f2sm10904135pfg.170.2022.09.06.12.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:36:26 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 12:36:19 -0700
Message-Id: <20220906193620.2778490-1-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=mio0lyoTm6W7KtmvIVkCV+l2uK3wVo+5KDkiOtb6nHM=;
 b=PrLxEdTioG5WBzV1SqbmvCzTO++5hZe8PiNKGmi5oHYaWWVUQVTAYnnhRSmvpEQ0PE
 vTQ2TO+pf7M7AxvE2MWOBxM+PerQAAUDPVtK56L/2tCCcwDvaVE8pBidLtAOKSJ9C/+v
 5HkY+AMNSdmk69ft7MHCSp58zmSAABLNn5XE4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=PrLxEdTi
Subject: [Buildroot] [PATCH 1/1]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 5.15.32-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index ee105ef82c..ccb28bc4f6 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
+sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 10505fdf17..d301494a0b 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
