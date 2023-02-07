Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F07C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C26AA81E56;
	Tue,  7 Feb 2023 14:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C26AA81E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Sk88bRDC2vW; Tue,  7 Feb 2023 14:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A0081E4B;
	Tue,  7 Feb 2023 14:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A0081E4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224401BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092FC81E44
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092FC81E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pf0DYbP44Ywt for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B5081759
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37B5081759
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id u10so8110998wmj.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpYx6ITi7uvGsdFupDsp5Zl5kvIOYZAO4VfGRoKr0C8=;
 b=v6msfsiXJZAhXiof/Z849xefZ8Ay+VeoHEKtDrNke9Ya0g/fpbhFdO4EEnzj1hY02+
 y5C3bv+N8UquVRJ9KrxQHsZKXtQD2zlPi0XHC6NGPm2LX7r6ialo32Q6wge4qUaU3O6J
 UUipjrb8Gij7xHBsOb1DJ+Z6rIlvbQs26CQ4rf354WbTmxZ/OFfgTP45Cfsg8CSfU0Zc
 +REspXxvuoRYMPJMZKlruvvcYdY3DRcmqWJJHRPO+r/GuAcpmIDLX7fTobHOTA/PUg3z
 H6e3uSGqy5vrbuMDKbl9p6DbhZI+SGd2JopOw6o7zVzvh3jSBl5CrhFs4oLMxiskE86S
 vZBg==
X-Gm-Message-State: AO0yUKVcA+6IoqruYDDkYA0yplNLgTOUVSqjKF6ALz85z/hWQjQaO/Mq
 5Ig2VPdGuk3Xv8nudTt9YOUPL2WQl893sMX2hORaWg==
X-Google-Smtp-Source: AK7set9ZA0xdTeCUbaigtL0Nzv7nCKswXW4LrPdKoUaitJtGTxONMt+2d9oqVKiCblgvjtEtjtAmtw==
X-Received: by 2002:a05:600c:1693:b0:3dc:5baf:df01 with SMTP id
 k19-20020a05600c169300b003dc5bafdf01mr3275678wmn.5.1675780219554; 
 Tue, 07 Feb 2023 06:30:19 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:18 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:03 +0100
Message-Id: <20230207143006.2681335-10-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpYx6ITi7uvGsdFupDsp5Zl5kvIOYZAO4VfGRoKr0C8=;
 b=OGLIxuPZMKE5LjESvV86klsaieyODy50ZDxJbRFPtwmyWb8ZxTdSCyp4RfDh/+o7Nr
 Rzn12W5mjGieTtV3/wiqfN0pbDYW052ItGRRZSVkXAyF11LiLqsemxFmBzgnKVQ5S33A
 17I2iNiT6HTSwRYNgzgR+4uM+K30t3qEly2Pg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OGLIxuPZ
Subject: [Buildroot] [PATCH v5 09/12] package/qt6/qt6base: add support for
 libinput
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c878a2e2b6..be17b63c6a 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -231,6 +231,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
 QT6BASE_DEPENDENCIES += tslib
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
