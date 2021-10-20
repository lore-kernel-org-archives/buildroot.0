Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513A2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED3D60FE8
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BED3D60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92976826BB;
	Wed, 20 Oct 2021 16:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1yIypUQc5uh; Wed, 20 Oct 2021 16:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC68C83B65;
	Wed, 20 Oct 2021 16:56:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 021471BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9964A83A92
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDJFzZG4wfUZ for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00C4483A98
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:56:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 77-20020a1c0450000000b0030da2439b21so3341019wme.0
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/UACaNJvaWyzhUL3wMhLzsj9AhV359SABpDCVGNqDeQ=;
 b=egUOfOAM1+LnYe7bCfwd/IrZUT0DrQCopc5JPY2hguJ2Jdi2uQ3m8EJVFVgxpmZjXR
 A4DVs+8dc8sWyO3nbCnRqRJAds70yMpcudXdQ/LMzi0OqLUyRTxdrNScMzWA46evTZUw
 mchsc+RCGfLSyHklHsylE8crVz7jiJgNEEpOliSnj/J9LHKU46HxTG64UT2IXg/Yf2SV
 ulE6h0VTMzaXruX6PG63dTiI3+byqSG6P3dXlEsyHd113ZOrm1M29BGqw1FjMAvEGhRB
 4+9hET3FOdJXsyF9t0zmV2Otpn9TqhrB/PoCfaxvULAAKOwws7blchRakN6jKWFL/272
 XsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UACaNJvaWyzhUL3wMhLzsj9AhV359SABpDCVGNqDeQ=;
 b=OnX4X8mR21bR8v84pVbwRVsxTqNHH2rEZvTiNKu5f08sl3YlJkzo38atQN3nB+Jf9N
 yN4L+PZKpBNeGcntW0vI2ODwdRhMS2FsfdlM+LSCgoPt5V9k/8A2yjlgOA+5b9Zakirf
 IeM50IILYMyAkXKF1DbVb3/Cdy2NmD1c38P/fALP6sTRXC4qKF3sR5+AVDzjsdotMfy3
 LmcCpy0d0I7l6lqyYqEWx1bEiVHP8rEdoO3oh7V4knUlINLkZM2LwmlAtKaxW6vxZIxJ
 5WFi1X4gdHX3fRC4zbLT4vZp3vd2jS4dGUpjJCViaEOHGVlrfJhxKPe82JuEw1mm21bE
 V7nw==
X-Gm-Message-State: AOAM533+OjeiXxG2IrZFnThfIVlL/S6sb8tRXWi3lYVXeFKtCvT/U7Fo
 Mp/SU1ERsYsW7bhkpbL0MZk3KIPwDYc=
X-Google-Smtp-Source: ABdhPJzMfDF/qIAtbDHkq1wGTgmVjAuY16M5VNfCqYI4Jlo103CpFq+XPGBQV/VCCe67Tr7PWt6/wQ==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr14830255wmb.92.1634748968906; 
 Wed, 20 Oct 2021 09:56:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t14sm2439921wrr.75.2021.10.20.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:56:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:54:46 +0200
Message-Id: <20211020165446.2754391-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020165446.2754391-1-fontaine.fabrice@gmail.com>
References: <20211020165446.2754391-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ipcalc: add geoip support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Derrick Lyndon Pallas <derrick@meter.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipcalc/ipcalc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index 145b6904b9..8a43200456 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,7 +10,12 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
-IPCALC_CONF_OPTS = -Duse_geoip=disabled
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+IPCALC_CONF_OPTS += -Duse_geoip=enabled
+IPCALC_DEPENDENCIES += host-pkgconf geoip
+else
+IPCALC_CONF_OPTS += -Duse_geoip=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
 IPCALC_CONF_OPTS += -Duse_maxminddb=enabled
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
