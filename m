Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2DEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9071683ED6;
	Fri, 25 Feb 2022 07:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eg3J2WEvHXtV; Fri, 25 Feb 2022 07:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC23A83ED3;
	Fri, 25 Feb 2022 07:27:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC0D01BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CACD0611F4
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swGvUbTMBDem for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD4E6061B
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:31 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w27so7905543lfa.5
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgjOflK+6gxu9sNcSbHUh87RYaCigNFfLgAAtaFAUDk=;
 b=TuPIbSO/NXDLD2UkO560NWFRPkmRZjJzNhQd+e8qbSrt9nDJcpZFSzLwqMtT+yTbkl
 t1548NcVsETxuHXqi6Lsf5aMDh4R2LUtgN0BSY1CA57pbIOibTpjj7KDWW78cugO8Kdy
 mRz4hAQLutDRF3sy3i1rbOtZH3UFqU/II67/f/qzkQK/HBa2xc5/eKR9rdNNFsyyz8DG
 nJcExHvjdu7BJdNHRGM5eczk0QiaprX22/eW1dpOOFm0cKv+pFK8NX2vTlrnNUgmUu8v
 u81z33YqiOlpc2iAAidAjNwHyE3ULUL/kIjiaOoe+V6uM1S5VMyz23e3TmxLNWFRJWuJ
 puTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgjOflK+6gxu9sNcSbHUh87RYaCigNFfLgAAtaFAUDk=;
 b=MfZ7oFnAeLsaO9ouZ6EKAm1kPWSCoghCHoKDpOcFuyHVjV0dYXWCBFE0sAfVmfBuyz
 PLU4CTrHEJNOIF356pRiHmJ4f2Q3Htt+62GKLiKPqR95/va+ppgFXcF2SXAD4IP6bEzV
 TN7nSSCU8OKcF7G8SqTKqE0RZhtnc/vg8/fDi+wuo16cJBONGfzvLapeSJDL6ClXBol1
 xeYxNIFEV92KmTz3mDCG/KIWy1YTyat7dSzlIAkfKttyKoxYrw8oTK/HDW11Pnv23GqC
 zdXBTDx04+LWU4Sk1FnIkinSUy9GC+a0OklnEIQZ7d7b2QbMvfjbDF5PTo8lgb6AfSOX
 ebIQ==
X-Gm-Message-State: AOAM530r/jWGaJYXF3e5gUBkZb1JtagBQSCVLpT22s6NNSviongRmns6
 bKOGzsrD58TF7AI4IimTb02zP23WFjQ=
X-Google-Smtp-Source: ABdhPJyIKSH83Xi/M/EXd7sjcHf2pW6epS29n2K3MABByARW+cRsDhaFjf3eUPfNw2MRvHeaAWWGmA==
X-Received: by 2002:ac2:4577:0:b0:443:fac7:d701 with SMTP id
 k23-20020ac24577000000b00443fac7d701mr4069587lfm.384.1645773988863; 
 Thu, 24 Feb 2022 23:26:28 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:28 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:22 +0300
Message-Id: <20220225072622.3584480-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] DEVELOPERS: add Sergey Matyukevich for
 orangepi-zero-plus2
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..f29e889c52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2545,10 +2545,12 @@ F:	board/linksprite/pcduino
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
+F:	board/orangepi/orangepi-zero-plus2/
 F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
+F:	configs/orangepi_zero_plus2_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
