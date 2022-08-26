Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC03ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E81740FB9;
	Fri, 26 Aug 2022 06:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E81740FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbXKj2LBC-NN; Fri, 26 Aug 2022 06:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A1340FBC;
	Fri, 26 Aug 2022 06:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A1340FBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5534A1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31531400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31531400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yE6uiiXwCsca for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6643A40012
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6643A40012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r4so952025edi.8
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=a91/LXs0GNmzrZPCXowCSicp0mb8BPoh0wC2OaG9J18=;
 b=y2AGjrPD3SG10HdiYJoiIntAcNX2x1KeoGAowF1S0EZhCZtXh5yvObhiRmBxMIgKB+
 tkLXpMBaEpniS1zhZOVcQxOeuT389M96h3Xwxrmo9Ydc/+lqFV/FtuNedOKOYjMwKwMy
 /V9RzAYYJPmdHBBGklPdrunE78gz1GERI+GGa77RZoVT8FjHu956MTuQkv6He27A0jIN
 VNUyqo/MYQTZizqzibvMgI0L9/JWJJ8MilOFKBytWKZEhi+YE8uv9PpPf9SdzkH+2uyE
 UNzLygKnjmyPBOTVFvH60fySIEoCL7wvybE3SYLXqL8XYNX9LK26yUKogIQ22CxJslMe
 8WhA==
X-Gm-Message-State: ACgBeo2JZmnJj+m3e+HBPBSOYLMKb0iDmTH9M3rqjhFFc5adzfrEfqrz
 TEWSouuQzAQJZTzG/HHWBI/XtDVhU+wjTbRg
X-Google-Smtp-Source: AA6agR6CiiIRcmm977Ugxjf4raGvpDIaxez1fvdHGYPrY/oApGrfGngVf0TVQHhyKAizMzqq16vRJQ==
X-Received: by 2002:a05:6402:1ccb:b0:446:4346:8597 with SMTP id
 ds11-20020a0564021ccb00b0044643468597mr5752329edb.177.1661496506115; 
 Thu, 25 Aug 2022 23:48:26 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:25 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:53 +0200
Message-Id: <20220826064758.3968647-25-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=a91/LXs0GNmzrZPCXowCSicp0mb8BPoh0wC2OaG9J18=;
 b=pJe4KYOt+E6beuuYBgKhNZFdUSKmugY36UZQyOHqEm0u2+4LT6DWGfFnMcgNXraAln
 AgCy9NlxV4bo8QPLsuX3qA6Ad15BM811TSKFZL6ezBdVIBpCn2+Ptm0LqTPC7z/vL24J
 CkRK3jwIqKndFaDN/CJOnFFkqVnSx/3oWK7zM5/mW0HUwpyFOvp1XoPfgIIo+d022JMn
 kmAzUsI60Kbl2/2Kx5XUOhM2zytFwL6z0BiXKm0NnDll1bBThr9stG7CM9nakysNFuVA
 vqCzJLlouLNp8mq9WHJG6E2I50QKFTLGVwktcyTArtcILn+l0bjTyWgqNEtanabHEOxX
 EwTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pJe4KYOt
Subject: [Buildroot] [PATCH v2 24/29] package/qt6/qt6base: Add support for
 gui module jpeg/png/gif image format
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
 package/qt6/qt6base/Config.in  | 19 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e78fd45421..128a2682e3 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -136,6 +136,25 @@ config BR2_PACKAGE_QT6BASE_HARFBUZZ
 	  if the toolchain supports __sync for 4 bytes, or the qt
 	  provided one which avoids this dependency by using QAtomic).
 
+config BR2_PACKAGE_QT6BASE_GIF
+	bool "GIF support"
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT6BASE_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option enables JPEG support using the system libjpeg
+	  library.
+
+config BR2_PACKAGE_QT6BASE_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This option enables PNG support using the system libpng
+	  library.
+
 endif
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c92239f2fd..877ab382a2 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -155,6 +155,26 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+QT6BASE_DEPENDENCIES += libpng
+else
+QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
+QT6BASE_DEPENDENCIES += jpeg
+else
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
