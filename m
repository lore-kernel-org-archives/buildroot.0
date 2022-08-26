Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A20ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E0C44014C;
	Fri, 26 Aug 2022 06:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E0C44014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwxE12s37EZh; Fri, 26 Aug 2022 06:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D1340D7B;
	Fri, 26 Aug 2022 06:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D1340D7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13C001BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE27983E86
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE27983E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzbNl6Hd2C8g for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E07B83E8F
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E07B83E8F
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c93so967014edf.5
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9N9ZT53pxE8kWgzuwmU9T+7u8IsxTZCjtaYkLXHLIqA=;
 b=e+nYNNtq4omrco+SsicQNLo5zocHzMUGxaxMThWKeAM7Bgjr+M+IffYzI9nb5kyYCh
 46ZtVNcuEIoJ1CEl0yS1i9oTpqs64lNfxpBDYttO8YZbvhYgNfcafBTmQJY3zieDUBNN
 jhDOyeCYspyMidVXOQYzDvOx1oOIX2ePhQrXLf0An9VM718z/gfR+hxb2VTU1Fav8dWs
 Dhd6B0BUzOG8UHsXkqEvlOh/1eUdOZSDPXwallncSm1+8PJdxjDKJt1QdZC8rkyvjKib
 yGldiavJTBxPnKw3nrPHAPlLX1shYWxbsWnddQy5swpTGZf9gu9ZLK+1yXP+GWInE+EU
 7T4A==
X-Gm-Message-State: ACgBeo2qsnJkRRrX5zSJsISO30BYxXT7GzuQ39TUc44lRMmAmYJvLTQL
 +3w159bV0Yci2vqn24laAV11zU5Uqow3W1qT
X-Google-Smtp-Source: AA6agR5og4aBfEGGYIxSbfp21jL2i0d1aMQN2fYJcNNfRF+IjT7nk1oRpTQQLVqQ1vmkseW08Dzi6w==
X-Received: by 2002:a05:6402:270a:b0:446:c9e9:6e00 with SMTP id
 y10-20020a056402270a00b00446c9e96e00mr5539489edd.315.1661496509236; 
 Thu, 25 Aug 2022 23:48:29 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:28 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:56 +0200
Message-Id: <20220826064758.3968647-28-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9N9ZT53pxE8kWgzuwmU9T+7u8IsxTZCjtaYkLXHLIqA=;
 b=Zb/GveL8OfinXkvWzzl1fiJHAtGq9DyBvsFAXmHcAND4knRo+qXsrDbncdu59OLFMi
 ffXoSdr1GOoRl62qL0ndlyhQWzw+yfsx02FJOpJUBfHIgKHuQpR66JZPV7sQ1uuqV4zZ
 X8rjKshQlEZM4XW+o1Yn79RcTAaTlrcsHvdgm9DZiTSG6ESmXVjA8HxMaYZ6O8a8BqWC
 mM2ICOj1DM9rubZzLhslV6Gwpcx10v8z4m88yUrz9v2SstxKp0wKUKjK7EXALD6bUkgf
 +cfGHRiKKNzeapponWIwOP3POS8R69rLRvQJQZPbOHjZQNwyfK1r7+Vg4wrSYjhxNU0e
 95nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zb/GveL8
Subject: [Buildroot] [PATCH v2 27/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3644abc4f9..7f76b195d5 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
