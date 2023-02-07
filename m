Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F40C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403A6813A2;
	Tue,  7 Feb 2023 17:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403A6813A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7dMSEMB1wJ7; Tue,  7 Feb 2023 17:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAF081380;
	Tue,  7 Feb 2023 17:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAF081380
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CDE31BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C9748138C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9748138C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfmEXTAHEkhL for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C738A81371
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C738A81371
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i5so7102372wrc.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sES87t5RZXLYfZSf9KyNEWtWU5IEeAi+zEeTbVAwZsc=;
 b=mzpmSDYwpepCMAgeOokbRWdlaI3Y1L9dpEij90gaEqv2IEn12UYlc23A/6b9cdG3Ql
 PAhQesM1owWUSDmwQ1pk0wf7mMROjHlfWUd0z/VLou1rVTtkVI8r9KqnNKLtJcHDwt66
 T6Hn65oVqyY/2pI3pqvIcIs+pFA7H8og/FDgaWyVz5bsnW+g4FEwN7ktNvsd79SZaXdh
 MF5ALcNUr4B7l3+WiwhACFD0gO0wNAVUzh12SZP03B74zyMJLrxSB4kFWWT+eDAJ8otc
 QIXD1TyNMxrdlM91lS5BFYg2CZJoQ8r9/4JWVtz2/0p4sVMl/7EzuIf4SUVEiXEi5TDy
 sGdg==
X-Gm-Message-State: AO0yUKXZl4+uilzGcUoAolgY1rkXYzBCBR8awUW0AhWSOWBPhwUTszZY
 4vmDGGOz65g/JCCrTyjPc0aN+e8SwUmAGIlC88KZKA==
X-Google-Smtp-Source: AK7set9KxRaQII4nJoKZv5RiIMLD44oUu73XzVUv5kk8J6jMX3smePBmLjOEzn9XoLFmJbMWtjN9iA==
X-Received: by 2002:a5d:4452:0:b0:2c3:f2a3:c37c with SMTP id
 x18-20020a5d4452000000b002c3f2a3c37cmr3514618wrr.9.1675790254269; 
 Tue, 07 Feb 2023 09:17:34 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:33 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:13 +0100
Message-Id: <20230207171721.2973997-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sES87t5RZXLYfZSf9KyNEWtWU5IEeAi+zEeTbVAwZsc=;
 b=iZOk6PgZsySM30LDiVgpG1Boxj3d0EtpRMGCNJpxz2Gr0f7k6Rx9OfqPyqg/2LlNoj
 GUMb0MWhd0fOq51rv2icspACj1Vy3nMjBbu+taJH8Afj0n4sx0SXEYqW3Ye+85hpDep/
 aF3Sbp/HWTbXakRPxAi0FFBBsHO2OxRApp9zo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iZOk6PgZ
Subject: [Buildroot] [PATCH v6 05/13] package/qt6/qt6base: add support for
 widgets gtk backend
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

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index cf3c7b1ad1..f936d19c68 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -215,6 +215,17 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
