Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A4ECD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DA4810AE;
	Sun,  1 Sep 2024 21:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfzz6Yb8At_r; Sun,  1 Sep 2024 21:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06873810BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06873810BC;
	Sun,  1 Sep 2024 21:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 854971BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6707810A5
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YanE35B4DHtB for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6068810A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6068810A2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6068810A2
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c1120a32so775998f8f.1
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225638; x=1725830438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7JFCPmexbY7rNex4S8rqjbfluWf2VQ8X3V/6Ap5Mub4=;
 b=HwHfEpJ/82kwg3/xWtXf6vPR8VJiVSWGEqNPqChYfn47pKYnLmIyFF3nj9TcjmS/dl
 jr752qLcdVt/ZdAAGCYhnxNAB8Tp0ZE6rAqxCNbgzAyFpAJ8yYi/7KzU0IXoG7n4S4vK
 8hfyzMBSuQgSI1Zu7Admvwikhvdc3XDDJI/Fna4R2oSxA0zcH3oWpI1Ghw6iIKZ3MfFu
 Gcbq2cZ8HmBriMjUIGxj+jmbA//sOhwYuLL70KUTlotUih3dA9LV6V9tiIMh2pFZJOlS
 ZX+uDQc0yDD2HXMZdcBV95ZAbebSe+C5ubie18act4RkveOjFW1G4C8KLZQZn5BzoXVa
 bP2Q==
X-Gm-Message-State: AOJu0Yy+FN0ss5luZkkAm93pK2PhStz31ms13IzPhczaNhmNV7bYzyQl
 TiccawtzeV+bRqn9F8yh5JHf7pi6N8uNaxyUdjYo2LuftE2n6DX/05kQKA==
X-Google-Smtp-Source: AGHT+IGcG+BV3arVaSOftNsPdeqE5RAkBNEHQa6SYkdjeNkuUv74dxE81OcGVfg6YJaNDPPh6a8Fxw==
X-Received: by 2002:a5d:55ca:0:b0:371:8750:419e with SMTP id
 ffacd0b85a97d-374bcfe5ea4mr3341836f8f.47.1725225638224; 
 Sun, 01 Sep 2024 14:20:38 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a5edsm9742102f8f.1.2024.09.01.14.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:38 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:32 +0200
Message-ID: <3e75739fad18fd52de513761ef94139a922511be.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225638; x=1725830438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JFCPmexbY7rNex4S8rqjbfluWf2VQ8X3V/6Ap5Mub4=;
 b=Ii3bzLlg9vVe1ERDQLpRZNvRqil28MpRmM0iTodbs7WS4+QsPim+pgDJPCcV9w2W0K
 42+lao5Or+0oWJcHcZblBevBdE+3pb4NCcZIs+NBXgT3k5vvP6aCLh9jsNXKaEymkLjl
 UF6NzKXWTAGhZ1uhEHafn+NhjOseG17HlPsCOXwyXaJSIaWFle2XjXs9ozSGgSK/Ylfs
 SHgIhD1ey5Ttwt/mO7r4JLVbUkPbH74PRHKumuqbZwq6mKCxryW+gOb9V7kJcImvp2Ib
 OElaTaqc/jci3/DLz6ygCSKjpx+A1k61ZXealM90kBK5T3Wc31mklKFdkfla29gTYAL+
 Ka5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ii3bzLlg
Subject: [Buildroot] [PATCH 1/6 v3] package/gobject-introspection: don't
 depend on cairo
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, goi depends on cairo.

So far, this would not cause any issue, but once we bump libglib2 and
goi, that would cause a circular dependency chain, where goi would
depend on cairo, cairo on libglib2, and libglib2 back on goi...

However, in goi, cairo is only needed to build some tests, and thus we
do not need that dependency, even before we update goi+libglib2.

Thanks to Fiona for helping sorting the issue out.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/gobject-introspection/gobject-introspection.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index ad72af22a2..af27781cf7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -47,12 +47,7 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
 	-Dbuild_introspection_data=true \
 	-Ddoctool=disabled
 
-ifeq ($(BR2_PACKAGE_CAIRO),y)
-GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
-GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
-else
 GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled
-endif
 
 # GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to ${HOME}
 GOBJECT_INTROSPECTION_CONF_ENV = \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
