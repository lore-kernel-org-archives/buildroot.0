Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F79EECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13DDF82B08;
	Sat, 27 Aug 2022 07:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13DDF82B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrNrbxg3P1pp; Sat, 27 Aug 2022 07:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3A782AEF;
	Sat, 27 Aug 2022 07:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3A782AEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 116D41BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DACF660AB7
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACF660AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfNlw4GadFax for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC726060A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADC726060A
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:38:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v16so1472421wrm.8
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 00:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vcqok8Tg31Lg/jBMEMBD10C/BgK6pPdLU5iyinOL4VE=;
 b=gBaSNuksi0wVzH/yPIvsUjR8NxzBJJTGTRJ+7PPIZr2kR+l/x9gBYHWM6x5HjZgxMk
 RwxgNLb3fIP5ZZF/yXfBnNsHa6dh89um+ge16nHolD3GtkA9FINEo4NhjwdtPC+D1p+a
 ZpwR8c1l6k/pTHyfEifyLiLzJZCA2qBi95ll4X3B7l2WG1mkDsF2xr4EypybMxbQ+ifR
 AdUc7MxUdXFnE+eVjm+VMd6F/8ezhrywMgUcgx8n4vOgD99aoQLy8kst6HWLe8WEpX3p
 FyWyCGyn3+JuAAEYYw5t+PeaWWj0UpQNCGM4i9848kEZKFCdRtgEqhD71LMsyCwXIQNG
 gRzg==
X-Gm-Message-State: ACgBeo10GDmZWY1ZUdtFvTCQ1Pp5vXbw+jTPReqAduw0g7XUUf3XUBM/
 jVKyFB/zTBVSwVfA1rG/Vs4r5itsNXk=
X-Google-Smtp-Source: AA6agR5QXK04fq1aFWM011cYM2j4MzrA75KMiJWHcyNgH4unkIEj9bNXDkA1L2Caqtw4U6Hq22ak0w==
X-Received: by 2002:a05:6000:144e:b0:225:7fba:3081 with SMTP id
 v14-20020a056000144e00b002257fba3081mr1577141wrx.230.1661585902420; 
 Sat, 27 Aug 2022 00:38:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003a601a1c2f7sm1851961wmo.19.2022.08.27.00.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 00:38:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:38:15 +0200
Message-Id: <20220827073816.59961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=vcqok8Tg31Lg/jBMEMBD10C/BgK6pPdLU5iyinOL4VE=;
 b=QTa+6XMRQBbf2YxJkUiK+jgBJQQ1L8sC/Kfz0tFmNmtrqyoQQbfaz1WqVXbdEylQ+s
 PB6yh6jD3BJ8/tUNIMeWQPJFMl+v/tIbFJgsbDDxpYuOQcpFEPrFBW6mTnwY1E14VwKt
 d7NJLbDYTxTyymbiTVOesLBo498NFoQLe/uEQWhR4sasUdkrt44zp0gtZj16+9Q1/nMe
 ncW0HfdDBDDSGwzOutwWz1kz0F6q2VBgwJ8Ng1GcZ5aSYrMN2EovvsQbQvfUyE3vRjfz
 DM1yoAJHsd6nQ8ukBd78CwnZUIgIrD5qgZPI3JIB1ix/HX60GDiOrfcVUr8WTe+NQFQ3
 AF1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QTa+6XMR
Subject: [Buildroot] [PATCH 1/2] package/dbus-broker: add
 DBUS_BROKER_CPE_ID_VENDOR
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:dbus-broker_project:dbus-broker is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adbus-broker_project%3Adbus-broker

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus-broker/dbus-broker.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 22c5e8d8b7..85c3f75a3b 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -23,6 +23,7 @@ DBUS_BROKER_LICENSE_FILES = \
 	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
 	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
 
+DBUS_BROKER_CPE_ID_VENDOR = dbus-broker_project
 DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
