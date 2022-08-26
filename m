Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8B2ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB5F610B1;
	Fri, 26 Aug 2022 06:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB5F610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0h_leleYnFY; Fri, 26 Aug 2022 06:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F2660B56;
	Fri, 26 Aug 2022 06:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F2660B56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699101BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12A440919
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12A440919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJyqkjBHHgNB for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E482E40336
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E482E40336
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x93so805839ede.6
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eJanuHmJDj8ZtvNPJGTbzwx2HP90eMSc+Qxt1/FhMBQ=;
 b=UpuvL4T6dIM0kvz3u9dbS8wfLaCf0nwkFjMXKkWfDzoXtswYACGroNFsySYYqRtotK
 z5YQkJH0+g9bhKOQ6cTkO4Nmqc4xZnUtjsGfqEHOuQTkR1K5FWixDtuISYajkJHBV3sk
 c6sM+EjxPE6e6NA6+GzCRvD07dpl99dvpBA0aTewwBz5YBXKICGW1qcOkoZFAJlBrvIG
 RzIM0mQKqxGjl68712olIe0dmm3XF2VVXegnRzcngI/Pu+dHaKIZoYTOXIKkCs5pRv5h
 hhwDl2iZ+YHE0yEDZRHdz3ZdOXno86w2P5v+YkA8Dp/f5ELIjzaQbAU5j/aMyQpzCrYx
 G0FA==
X-Gm-Message-State: ACgBeo3Ik+YwHjCLvctbK2cxR2UN8xqTxpKmiq4gziFQlmXCoU7eMunA
 TrRsGYh9mckE/nEemGDfBGE5zX6bCkmgYT70
X-Google-Smtp-Source: AA6agR53QvhpUBCKWjVWK6aye6pY8bhqmCnhgeR/JAmY8iRPthBBKn+LRvp6r08sbPim8G02USjyqQ==
X-Received: by 2002:aa7:c956:0:b0:43b:206d:c283 with SMTP id
 h22-20020aa7c956000000b0043b206dc283mr5671040edt.381.1661496499082; 
 Thu, 25 Aug 2022 23:48:19 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:18 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:46 +0200
Message-Id: <20220826064758.3968647-18-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eJanuHmJDj8ZtvNPJGTbzwx2HP90eMSc+Qxt1/FhMBQ=;
 b=Qv27N7jn/sMQO8bB0Q92iUBwAxUYo7qF8hBzonneieJ6svbguhZwzunwttqpeDWdbw
 GEu/WWjhB8mQRibWMTBHJy/CFRG1/3ZZDkbTXMEAEXDuFil1q5tcBtORJV8wK81NzKu+
 EQE8QaQO7CBOXFIkp6B5tmwCB2tkraza4ex6VzzXXLcYoUibd16KtFEVA0iES7Br+DHc
 xbMMUQRsQeD3srge6ySZbydyHJ6DmFURgnQJmH3XlrePxAhinO37Pj0X5qBfP+KSOOp1
 FcraLThCmwxlc2qmEK2u6fYhEUQHrWeDWE23v9zMl8vRLhs6zTxtm9VqD1RjFt1AhRau
 04Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qv27N7jn
Subject: [Buildroot] [PATCH v2 17/29] package/qt6/qt6base: add qt libglib2
 support
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
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 22034c8b3e..4a51d530d7 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -121,6 +121,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
+QT6BASE_DEPENDENCIES += libglib2
+else
+QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
 QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
 QT6BASE_DEPENDENCIES += icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
