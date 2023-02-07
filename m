Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2DAC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B0F881E2D;
	Tue,  7 Feb 2023 17:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B0F881E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FapjnsXpdUQ1; Tue,  7 Feb 2023 17:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A62181398;
	Tue,  7 Feb 2023 17:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A62181398
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 487261BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FCFE418BD
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCFE418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMzRLNAXF5Nz for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B0ED418A0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B0ED418A0
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m14so14237139wrg.13
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KV3CO5Ox99yX+ORx3yMEOYmOGIyaUEjytjr2OZmGDl8=;
 b=mZhb1VDFj5vFhkB2XKfUvuimER1wSCRQmQLYv22r5Ddii4guoxr7pyluk20qp+mOS4
 ncXBf2y4GhgYisC3xJ05NgYJ2SL4t+IoZfEvYpApZX5BMtj3esfGFi8Eb4NtSM3izDM7
 rxCGt9xwXztRln1JaFsGIn4HoiP1eABwoq6Eu/OHcvIpDDBN0gDioivfL3pYelh6dolU
 xiHImo5ObKKsRIz1dCrXGCu+v4g3rsqvflsgyKntesfNKR1BntDhIqIFwaV/u4F6VHcN
 A92mfUEZAoa44VCuuiPDZNOyd42DsPp/94HufrEEHGTel+Ya4M8oQI+PXRrgqs4ZhlJW
 65KA==
X-Gm-Message-State: AO0yUKWl2wJUDXWO7zOHvbNa6htvosPAiT6IN7OnJXyBL7egP/k14Hu8
 VAm0lp+wfEvAMonwMC7TxG9ruYvp2P5ejaolWk6Ycw==
X-Google-Smtp-Source: AK7set/VdwQv96GxQCM/+lwz/tcmUFppQIJpKb5WYbGp0FDtPTHhXGArspiTxeH7qUOffDleY9BTkg==
X-Received: by 2002:a5d:58d8:0:b0:2c3:f5a2:d179 with SMTP id
 o24-20020a5d58d8000000b002c3f5a2d179mr2809061wrf.15.1675790257849; 
 Tue, 07 Feb 2023 09:17:37 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:37 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:16 +0100
Message-Id: <20230207171721.2973997-9-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KV3CO5Ox99yX+ORx3yMEOYmOGIyaUEjytjr2OZmGDl8=;
 b=jICWLAdQDWuRE21PM75I+ziAufSakzchw2ZNHyOhTGzXOUa03PI0tpbkr9HvoWD1TV
 K+XZBnvQr8VNdsJAyWWJrP/7ATeCgiTva8bDK1gQ1lLRg+trVXnzCJe3QVjwyMcrbrCq
 4um8UG80ihr6V8cRquTnd54WuEHZ7eR9p7D2o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jICWLAdQ
Subject: [Buildroot] [PATCH v6 08/13] package/qt6/qt6base: add support for
 tslib
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
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 065725049d..d5d6d3569d 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -224,6 +224,12 @@ config BR2_PACKAGE_QT6BASE_TEST
 	help
 	  This options enables the Qt6Test library.
 
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a3c0c20d6e..3942af6758 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -228,6 +228,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
 QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
 QT6BASE_DEPENDENCIES += libegl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
