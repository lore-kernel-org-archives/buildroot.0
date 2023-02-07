Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED64C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F32940A93;
	Tue,  7 Feb 2023 14:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F32940A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nUSFJBtjyHi; Tue,  7 Feb 2023 14:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61AE640AA2;
	Tue,  7 Feb 2023 14:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61AE640AA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5946C1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 406D341583
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406D341583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBOvoB7KDH0e for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B553641529
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B553641529
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o36so11173705wms.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VXzoqwkNutsV5LTa2Uyeik8AoeE5vNq+6RitGM217g=;
 b=Nco2SCf/OXp4R/JTfyxaelLNEvlrifAAfLcGveMfh76LPVvsIYyFnI8jPlemcK8e5F
 WsIkFbFU7epUySv4CGJTWvtlAN+D2sYZfvYW4ogTKj8j3qjLd8S4mQnS89AxRjilCys3
 r33nEXMnDPnhF4kbgetU6Po7Wd6zUGbu7X+B9XQgn52XoRRGW+5D6RfcPEfXXktEr3qO
 nS2G4dmGT2HyXkcv23RkSjGfhpndfIynn4csw6dFZX/aylJLxQJvXBG6qccIGXR4k4/G
 n1fpMqiZDSZGoNRStiza8cRdzi5aTPA+rjUU3IKb2xuvut9L5uVAxGSDBALl/W7Ann75
 xgDg==
X-Gm-Message-State: AO0yUKWHg9JMifxXHfgTy5JSw5cxSUf+06/pxt9uLcO5ZxMaLbNI2cEs
 cecrsA8xjyFoDqfs55K/O24jZp1m4c/3tnMQXWXPfw==
X-Google-Smtp-Source: AK7set99pIow5CrfpAQxnmfttTRFbLVye/rYMJLyk845Rv0RFzeuNhz2YGn0k28gJdSQD6gLInq2uw==
X-Received: by 2002:a05:600c:3b06:b0:3df:f85a:46fe with SMTP id
 m6-20020a05600c3b0600b003dff85a46femr4079936wms.40.1675780221602; 
 Tue, 07 Feb 2023 06:30:21 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:20 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:05 +0100
Message-Id: <20230207143006.2681335-12-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VXzoqwkNutsV5LTa2Uyeik8AoeE5vNq+6RitGM217g=;
 b=CY3DaO3ziNS57+Rujt87/Z4+NQlu1MNovCdnwZKBvRe4ftrQ5Yo6s2t13sPAT3Zszw
 bPJIwZvgAoSE1JNYsqDnKFBeEB0qKClXaTkTFg6Ni1xqZ6DqF3DzHxg3jTgGwSdNURuB
 /bB5oKC9yIvwGM2IvvRkZU5uAFQ56yuVPCQ1Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CY3DaO3z
Subject: [Buildroot] [PATCH v5 11/12] package/qt6/qt6base: add support for
 printsupport/cups
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
 package/qt6/qt6base/Config.in  |  4 ++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index dbf9c93123..cb2d7d34c2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -168,6 +168,10 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+	def_bool y
+
 config BR2_PACKAGE_QT6BASE_SQL
 	bool "sql module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 8830e15388..9f82cfc276 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -184,6 +184,18 @@ else
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
