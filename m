Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51116ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E3D82FF9;
	Tue,  6 Sep 2022 19:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E3D82FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3ZDly4UaRzw; Tue,  6 Sep 2022 19:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1F983089;
	Tue,  6 Sep 2022 19:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1F983089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 564D41BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB3B40305
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB3B40305
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tlZaFiUkENQ for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 19:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E17402DC
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E17402DC
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 19:36:30 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c198so2537200pfc.13
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 12:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mio0lyoTm6W7KtmvIVkCV+l2uK3wVo+5KDkiOtb6nHM=;
 b=VVsMV59TXGounM8L3m1HoMO9SuZOCYp4ZNh6x4KULl3PpzaW0hgqYSi7GpwyJsvdHS
 r3pP1KY1oDis2z/+eY+TmpHGJ4HhZ1oN0qQvnLHq1pLDv8EePD3yZsks88U/cvw9TQMO
 nR3auCb7WfFY01EXp6cv3lCq9P5PS31COukovYPqbqTcil4BtvPC8OhsWT8tYfQ/615k
 AfED8Eu4xGZEsVhuuUtGne0rL8+X7noo/OE2MKCL9Nq35QGvU7TELf6ePqx0dZnVWmep
 POd4Y01rHnxLosgwfVNQ2Dcm2qSHakIoB++z8JupQ6mnburs3UzV1yvvKQbmfyvnOi1C
 ey4w==
X-Gm-Message-State: ACgBeo3yC8R6C/9YAI18fz95S9EHXZEN1YIVp3jtzvWsH90LDe8iXdcr
 bKjnXqCFmXgzJqrm6res1ipIBtap55MuiQmv
X-Google-Smtp-Source: AA6agR6GBqom7mhxWl/GD1f/ChQ6B8PpYBX63fpByE98njr8cLwgMotBncDqDuvLO1x/AcFs8LrRkA==
X-Received: by 2002:a05:6a00:1a0b:b0:52f:3789:9604 with SMTP id
 g11-20020a056a001a0b00b0052f37899604mr4426pfv.61.1662492989421; 
 Tue, 06 Sep 2022 12:36:29 -0700 (PDT)
Received: from chris-jammy.socal.rr.com
 (2603-8000-3f01-0100-8cb2-b692-12b4-bda3.res6.spectrum.com.
 [2603:8000:3f01:100:8cb2:b692:12b4:bda3])
 by smtp.googlemail.com with ESMTPSA id
 b68-20020a62cf47000000b00537bdc9c2f2sm10904135pfg.170.2022.09.06.12.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:36:29 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 12:36:20 -0700
Message-Id: <20220906193620.2778490-2-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906193620.2778490-1-chris.dimich@boundarydevices.com>
References: <20220906193620.2778490-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mio0lyoTm6W7KtmvIVkCV+l2uK3wVo+5KDkiOtb6nHM=;
 b=Wb4CBb4jGxWONFquokdJz4jAKTxFgSfzT0lNEvdFHSet+/66PWaR9aa3waBPrjPeS5
 DibzQV5YXs7X4ozKjGQpDMwkLH4cfLbUX3NSByh69P5EMMHGHdl5FWcpw6xyREG6cSBo
 S020lmYcOQfbKl7/mNMNw8nHTKFGzeGSXbAVQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Wb4CBb4j
Subject: [Buildroot] [PATCH]
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
