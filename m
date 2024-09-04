Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EDCCD4847
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 17:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17155812F7;
	Wed,  4 Sep 2024 17:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K54BTgKwK0EB; Wed,  4 Sep 2024 17:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA2A812F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA2A812F9;
	Wed,  4 Sep 2024 17:58:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1882E1BF473
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 051D840556
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Xj53gnb68p0 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 17:58:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 247EF4054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247EF4054E
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 247EF4054E
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 17:58:32 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-277efdcfa63so2035766fac.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 10:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725472711; x=1726077511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dsOs9gXfZMFiJmlJj4B8MtVT1A2oOJ2CvMIj2iRiOaY=;
 b=obtgVfVSJdx9SkdyKv/enToyBCg6KM3MzhCGGicolQRfhJnJticjx8zAym91vuu0nb
 Evt4Uinf0RC0btgSw6UiEysjNBA6W4/TvA6h7M4Fs2kEzaEJlhrCOR+BSJO/8lki0d4+
 8GWBRLk6qegVCReiS23HdC7DUx/sXgMerZXIoXaqzls7E694AD2IC45CDm1n8XpWuGn1
 jVB8puD58orASuFZQ1s95d/0kawF7+/eRFEZdU9CBw6XjSQ4lLv4fUBAJeFewMi4WznQ
 LP/EbVJOjS9gpb0dLaqe6ByGBOSwy7KSosGqcF74/9g0NW/XTEyoyx3sofQo+Xl5+44A
 jweA==
X-Gm-Message-State: AOJu0YxtVEtaq0O56aYAFVvdlBSHUh9e7hwH6aDQlpnp0yXVobzWolha
 HO1LC+bZSrftxesrXHSfUEttRSA+E7RyUc+7tIydYaURIVUwj6dyhVCjVw==
X-Google-Smtp-Source: AGHT+IFBOWb2SogBhdWHCwFkD9QcLLXXlRBAbt5uDkO1450HjwSxH41tzyeytwHqNQtg6+8RgoMSaA==
X-Received: by 2002:a05:6871:7508:b0:260:f50e:923f with SMTP id
 586e51a60fabf-277cce5f966mr17237150fac.42.1725472711030; 
 Wed, 04 Sep 2024 10:58:31 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b37a:332a:2373:a683])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d4fbda7b67sm1878152a12.72.2024.09.04.10.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 10:58:30 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:58:23 -0300
Message-Id: <20240904175823.2937072-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904175823.2937072-1-festevam@gmail.com>
References: <20240904175823.2937072-1-festevam@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725472711; x=1726077511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsOs9gXfZMFiJmlJj4B8MtVT1A2oOJ2CvMIj2iRiOaY=;
 b=A3m219IhE+2BYsjSOz0Jd7SRV1B86esx10s08vb0A7KLT90AMySik5JkdpGx18tP6C
 LryKA6Y4AJNZ0G3EpNtUPlCvacuPZ/ZjJYbymr2nCLIitP4AoRbyzt2JBP52irRUSbtH
 arQPuS1WLtDSam0RqIAkdB/wjFrNCKPpDu+kt9hYiTZDt61SvPIXHuUNTZEhbEjx63YR
 Nz8yBXQphpPrVq4zQeUXzyT3TD6fY42/I+Ynme47bGwuTjcZ7Hc1IS8y75jv5VUODeNS
 SPd72b5PMDZLeW2xtOBvRO7FpdBV7Ve3eVZ+tiziqq0Bt9xx05YXL6Q/bPAoBi6nsTk9
 PRSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A3m219Ih
Subject: [Buildroot] [PATCH 2/2] configs/imx6ulpico: Also install QCA9377
 firmware
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer versions of the imx6ulpico board come populated with QCA9377
Wifi chip instad of BRCM4339.

Also install the QCA9377 firmware so that Wifi can work by default
on the newer board revisions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulpico_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index a77eac5c5862..f01ab1975227 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -22,9 +22,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-pico-pi nxp/imx/imx6ul-pico-hob
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
-# wifi firmware for brcm4339
+# wifi firmware for brcm4339 and qca9377
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377=y
 
 # For automatic firmware loading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
