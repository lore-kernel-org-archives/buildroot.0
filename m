Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE67ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4FBE40FEC;
	Fri, 26 Aug 2022 14:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4FBE40FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSdOKxBU6PFi; Fri, 26 Aug 2022 14:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3BB740FD1;
	Fri, 26 Aug 2022 14:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3BB740FD1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9AC1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 079C040FBD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 079C040FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqFfJ4ttn3ag for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F51440192
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F51440192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id cu2so3378310ejb.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=60UBVY2mjkol2dhHjpGxdypDw4unvrhOYjahABaNWdk=;
 b=MPXch9Ey1dHazP5/e6DQQ8ExmjKh1zr/cS7CvphW49AlIR5zYmTSozon64zZm4mMJa
 ZneKpD4uwFu1pDqEEnY4xZlzYGqLCSm1gus2Xwwv+aKy2c4Dv33UOoeaV+Nc/9z3k+Cc
 p+kNagDCYxGGSYC49+9RyheT41PXBpkFmINTFyiXRPEQfn1mo2S8tpI3CpODRTfHi0u9
 u3cpaKkqOK5IqokpqktN9dUpnlmshTfa+Zrm0M8R8YZv7SeH1I3o98A2AXUEyEAXBGBw
 yGYYXnH5Pxb7JLkY6kzCDIfqk+BvGeHdW+rg3t8M8+GNuYWT7pg/GYcy5FskAczUx3DZ
 UGmQ==
X-Gm-Message-State: ACgBeo1lXcTyoP0JtbdMlnGP1KmRcNAS8Ru+MaeD+lcZMwDsyZWT3uFK
 pgtScmRZ5016FihvHIQs+q2HsS4K/2PBLfVy
X-Google-Smtp-Source: AA6agR6VvuZ/XiiD8QH09ouaE4cVJIi5geKY3lRXUnT2D4x98rL7elhmiaOmiBdbw+OlgNwxDl9vCw==
X-Received: by 2002:a17:907:6285:b0:738:e862:a1b with SMTP id
 nd5-20020a170907628500b00738e8620a1bmr5750249ejc.70.1661522134251; 
 Fri, 26 Aug 2022 06:55:34 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:33 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:55:02 +0200
Message-Id: <20220826135503.20612-29-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=60UBVY2mjkol2dhHjpGxdypDw4unvrhOYjahABaNWdk=;
 b=QBJK9lfnLQ77KixkAMm1XFTAWxoAlBypsdpyXW7MaO9Twt57bgiOKzgpd0riSbTia8
 Up7B0Ebowr/X5w5rQynTeCV9Cu2FL3Wb71JWyEPpYv16LIWhO0lpEMt89MSc/QBNyNNU
 abPqMtx7PLgZIJgvbksAYTcnkWzwbJGVU5Ry4vK7vBUkutG5Rv4F62IxTb0eTFZAC6iW
 cXsvP7cCM8EYJ5iM08utiSNv46dHb81I1/R6WJdNSs9nz9pOsvjuitf+poHGPxxfHe3y
 D0twUs2eJz3l32qZEihEqWeNHADkEOfPOQAMBzNlRPUuYcjsdbIXk1bIoxFSM5ALOPL2
 XcGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QBJK9lfn
Subject: [Buildroot] [PATCH v4 28/29] package/qt6/qt6base: add support for
 gui module printsupport/cups
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  |  4 ++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 648afa78a4..ffa5a56b40 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -146,6 +146,10 @@ config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
 	  target. You can choose a different platform at runtime with
 	  the -platform option.
 
+config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+	def_bool y
+
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 424dc6f754..9b5328e5f2 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -175,6 +175,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT), y)
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+ifeq ($(BR2_PACKAGE_CUPS), y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
 QT6BASE_DEPENDENCIES += libdrm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
