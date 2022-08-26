Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D24ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82AD4198E;
	Fri, 26 Aug 2022 06:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A82AD4198E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGSUjzgs1xGI; Fri, 26 Aug 2022 06:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803C041974;
	Fri, 26 Aug 2022 06:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803C041974
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 432911BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BCA3400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BCA3400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqHMtP-347Su for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 664B540012
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 664B540012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:33 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w10so977247edc.3
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KEvs9xJN64s5gbBCshPlMYjkfsGnuEYMY1UurxsEgPY=;
 b=oQtQayIUJvRuuXgWCRRuDKNgNa0B2dFfpd1mumHo0YMccNW620AyTpNUiL/k2TQNJk
 W3KCxSdMid3f7nVS2CFtXIsX9ETBZBxGjhtiIK0vaoRPEDQ+PEo3+6MmXqVSfv8tFgr9
 Hk8SDeCRknlRN0pJH8k+eefmlnIIbswToFAAoUKtGdWE4H8ndZRqjHBkEdkrM4MM9G4m
 EhfLyBIEs1NZyl0kH7/z1wnoQcbgsjr2qmhw6gGrKCDsIrk5k+IlGj41bNfu3V1A01W5
 KBeBJf3tmypan604SiCAJpGmd3GJJW0O5XIpJvc5CALXpNr8Mm6i/mLd78X5R5SdG6yJ
 d0bg==
X-Gm-Message-State: ACgBeo3w8NUtxdOvdRSbLQrSELA19ZC9wm7q0twK8E0QkxpGCGtBfvTl
 dr8fNWw7/6Df2BopRb1ZlW0OACG9HJG6jPiq
X-Google-Smtp-Source: AA6agR5AJf37sLT8f0AjP2C5cmzn06eHQUV4z1eMZJIpE2ODnJVsYEk+d9mTNzGZkFe3AcurB8aYRg==
X-Received: by 2002:a05:6402:5ca:b0:445:c80a:3c2 with SMTP id
 n10-20020a05640205ca00b00445c80a03c2mr5699452edx.247.1661496511188; 
 Thu, 25 Aug 2022 23:48:31 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:30 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:58 +0200
Message-Id: <20220826064758.3968647-30-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KEvs9xJN64s5gbBCshPlMYjkfsGnuEYMY1UurxsEgPY=;
 b=RRtnQXwyvwt53Tw8Euy+eej2hdn9hnIDoIrJyzx9P+ns/EZxGx2r6gHYaIkGWZ2KlP
 lUinGP+mE12obO9kAbfb6aFORblukr0yhDJsMwFzp4IE7OOg7kHuKpYOxVQ2MTu/Ysn+
 OfsGnfSTWSuf5Ix8YMJ5u7eWbugbev1XyniVYBcvkL3y6trVlSwBP1TcMr3sgXmnAUet
 aEnmnJYhTxg4wkF+UJ59CwQI5OqJe57JwH+VGvntdq8EBJMWh0JY8Rbk/wqcmbR73UvJ
 aC9vvo8v/nkU6Ms5oCcWUMXWE/EulvaIbw+v+3KhN6tGXhRJV2A6qWArHgUjPA40blIh
 9PoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RRtnQXwy
Subject: [Buildroot] [PATCH v2 29/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  |  4 ++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f33dd2c636..244e7d6760 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -217,6 +217,10 @@ config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
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
index 5e9b504b87..2324d3825c 100644
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
