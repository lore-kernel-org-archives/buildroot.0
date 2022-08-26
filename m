Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620C0ECAAD6
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB49D40D24;
	Fri, 26 Aug 2022 06:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB49D40D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DL4ZYfM7Utye; Fri, 26 Aug 2022 06:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76BB40C39;
	Fri, 26 Aug 2022 06:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76BB40C39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478561BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9735440919
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9735440919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gg3j8T7L5EAK for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A3B40336
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2A3B40336
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x93so805775ede.6
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CkXUx+OUJc4PF1TVvSiqmZQW6BbqugaO5YEPdzqV6kg=;
 b=NSmPW2CUpqKkoYFPEISYplQjon7KJHnOSd/X4T4jmxMTYu3wbE91mlZU95zwFrP/PG
 e8SC8oaIF8c6AYLqRHp4eUKGQyqyFDxZZdpNaEwGXgNnXICeDskNrfQyJ0y/uyZg98+o
 mrdqQgT9xtqyewwsKFidBhkZA4I1eKoZev7eQ6tayHA/fyHgxZf6RBDzVG9UvuBMezJU
 vb0vBGbmAOCEpMzwO6oNiBMWvEw+S9kTAKMbR9uN0I04Dg4imZsS74qOQ18ytfahd/ER
 36i9Xxy6ClAhQGNvkkdd3VgxQ0TCSHLux0z7cyBBX5VVe+41zqFW1yeoosNMONUwlepp
 QGyQ==
X-Gm-Message-State: ACgBeo0BXhhdkmQ8NPNhlsV6p7x+BRiAI0dxEYsX9z7bHJ4WEkAGdsIO
 jDx/lZ+7EQEarjWB79Vi8FnjdbmrcILlaCCo
X-Google-Smtp-Source: AA6agR4oeSA+4qogkE1SCobiGXbu3dROSP90S/+rY2A8duxvxpfmATn8dINrqlk+FAP/NHKy2+oyxA==
X-Received: by 2002:a05:6402:350b:b0:43e:f4be:c447 with SMTP id
 b11-20020a056402350b00b0043ef4bec447mr5835493edd.427.1661496497026; 
 Thu, 25 Aug 2022 23:48:17 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:16 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:44 +0200
Message-Id: <20220826064758.3968647-16-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CkXUx+OUJc4PF1TVvSiqmZQW6BbqugaO5YEPdzqV6kg=;
 b=HeCIY2tkhTdLaOpH8Mxk5dZZxg1U+Dv68SGrhgoghHAiZsOU/+uk96OUUpvqg+L5jt
 gYRmln/Q+RAlxznC3lFoQNYNAFvktR65sGGBuS5h1L8EaS/RiXpN/ilinIZDb4/Xdi2m
 CFpr9vLaVz/YKN8Vj/kH1NCkbFug/BKWyGWN9oPFwMXBeA0T1yPJmfwM7NsBnoGVqrYJ
 DHA+Yz88PWYjeg5qbhGac/xjl5c3Rl9OFlnwoK2lGcYm1yqJzbxR9i3T+5QfJ+glJomL
 +1KNSmoGmibvj1Azk4lXrPt5+Q+AuvI3hpZtkt4WhUkTLCx17WN1DVwT9PbNcJf7cy2X
 T7Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HeCIY2tk
Subject: [Buildroot] [PATCH v2 15/29] package/qt6/qt6base: add qt icu support
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 15 +++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 4d75fcb111..e9bb7602a9 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -57,4 +57,19 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_ICU
+	bool "Enable ICU support"
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	select BR2_PACKAGE_ICU
+	help
+	  This option enables ICU support in Qt6. This is for example
+	  needed for Qt6Webkit.
+
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9784a9bd73..aa2def64ae 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -115,6 +115,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
 QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
