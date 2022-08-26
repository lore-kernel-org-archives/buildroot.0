Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7FECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F24283F46;
	Fri, 26 Aug 2022 14:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F24283F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSphAHU6kQyj; Fri, 26 Aug 2022 14:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A529783F32;
	Fri, 26 Aug 2022 14:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A529783F32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5311BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E42441A35
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E42441A35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQjCF-TtSE9f for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D47541A10
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D47541A10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p16so181295ejb.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ckvSyThIzpREuD5XU30JXh6rJsdPJIryo9j6ItbAzE0=;
 b=YAKzI0zqbkwgHF6lbqRZZGDu8dfmVgqvOP4fC7xTN4YyK5y0iQUrrzaql7dhO6NsC5
 4nX5UcEp/jQs5PqSjovG0z3tGJOaAeY4BpmgQCZTTdnSIgfSmcFUJ5Wo/CTj//MNurpr
 KxWaR2zsghjULMeyMAxhJqRQRV5C7gsQ/Ev0jxphkYTD/u4GyFUO0TmX5wO1TodrLrUt
 Rol/4T6aHKfHDZb3Zw2ht3TaFWbb0+Rot5S3qFiZ9Xr8GFlMuWO6CI+5pqktpKP93r+R
 G62g27qhBGW5/vpuXGkhuqwlYDJdRjOvqceJDPK8/3bMf1JST4eesEih1/fGKuShZKC6
 zHEQ==
X-Gm-Message-State: ACgBeo0A8p86I575om5H5Oxr/tUq6tr2bocs53ouSEeXJngEuzqx/qPT
 kdVa7zbvYNXPLJiGfG2xq48I0iiFt7ATFZCm
X-Google-Smtp-Source: AA6agR6b1JEktg3AR+MJ5fjDfsxJOEgBbqeQw94iiBFYfillhJj6VaGxTcoUXHAygCfxyw8z5/5sgA==
X-Received: by 2002:a17:906:7c4a:b0:73d:9279:2c42 with SMTP id
 g10-20020a1709067c4a00b0073d92792c42mr5491170ejp.597.1661522132257; 
 Fri, 26 Aug 2022 06:55:32 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:31 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:55:00 +0200
Message-Id: <20220826135503.20612-27-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ckvSyThIzpREuD5XU30JXh6rJsdPJIryo9j6ItbAzE0=;
 b=FWUG3w8VXzXqgbBcXbxbf86iAgNIqlNe5K5MDiHx6x41wsdFc3VyXejiHD3yn0Ckyj
 iyOhxhiXzL/n60Yk0Jval20c5c98wgIT4JblQrKzbnfQX7gX1QBOanq9MbJDyyTmWLdN
 /FAHljaGHWAwl6wlDC3X1uhaG3GveCZTKmYOKUsgqxoSyQw9TapTn5RBdGCzm7zlvCTj
 jgOh+VHOF+0sdOP8zg9lzsCQgf3cTIxMgg1tdxQO/dOHvBiLGp0EEoAW/lvqrVF4ucsp
 BnvWEmtBKe02wFE1Dyi3T+FUEYh3rnu5I4kyBxJPy6zH6atkQWkMOM5T1N1A0Z8qzXKv
 /LkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FWUG3w8V
Subject: [Buildroot] [PATCH v4 26/29] package/qt6/qt6base: add support for
 gui module libinput
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
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b5b67ec100..2911555963 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
