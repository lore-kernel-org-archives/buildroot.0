Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F9C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 06:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC1380B96;
	Wed, 14 Aug 2024 06:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFelIXWtqIyz; Wed, 14 Aug 2024 06:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F06380BC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F06380BC1;
	Wed, 14 Aug 2024 06:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 140B01BF844
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 06:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0406880BC1
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 06:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5iIM36yLGfJ for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 06:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A7F280B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A7F280B96
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A7F280B96
 for <buildroot@busybox.net>; Wed, 14 Aug 2024 06:39:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso66005351fa.3
 for <buildroot@busybox.net>; Tue, 13 Aug 2024 23:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723617582; x=1724222382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nV+E+0FRGB7Dd2m3qSmt4KivLd2Pdl7LgL+7Faca1vU=;
 b=rq/PsUU7YrEbHwypNYfBsIW8zrATFCyzlKQIvtCiYNi65aXasquAmhR/IWk0x1b2oh
 v5lKE7rmPc2+/S81OCH7jEhWM4LqG0Eemv1yCWB29njQLyRTam3uooHrUQFbHaDxY9mZ
 JTbC90ZIDdJncKcN+qqTYjlJKkEK5i0UcMDjsOFXz9IrolhYA+0X+6S+CDlxcY88qwPo
 YYbphGMONdB6wzeGHDvUtiWU6y5RabOi88tIQfgxFfVbmfpq2LgTgUJz4/SZhzIpCtZJ
 RGs1ysJcDlcnsjaroxO8nOYKJTuNRnEHbgyxmZv8O+14S5elObrhegIJ63Mmzau6caWw
 yqUw==
X-Gm-Message-State: AOJu0YwIAwvvU0UNuKPyGMMgb2psm9GxtUPvQ7XA40borQZLhH3raKNk
 wkXTDeJb68bZgvjAaqeFoeA7vw9MZZPNj3f39fET5FiUGnScGk+wXRb7Xkyr/GvPYb5iI/vGCQ4
 Ssw==
X-Google-Smtp-Source: AGHT+IE1EexAhDrOv8ladrQRDXXqT5BhwA76GDDEPHjqnj+bTSHHteQvCTU0XGBYehHkdEDV8e2hNA==
X-Received: by 2002:a2e:b894:0:b0:2ef:2e6b:4105 with SMTP id
 38308e7fff4ca-2f3aa200785mr11667321fa.34.1723617581710; 
 Tue, 13 Aug 2024 23:39:41 -0700 (PDT)
Received: from vm-2404.. (203.34.66.37.rev.sfr.net. [37.66.34.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f44aa9sm135635466b.34.2024.08.13.23.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 23:39:41 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Aug 2024 08:39:31 +0200
Message-ID: <20240814063932.2630721-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1723617582; x=1724222382; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nV+E+0FRGB7Dd2m3qSmt4KivLd2Pdl7LgL+7Faca1vU=;
 b=eoTJTyllDK/LfwY0HOkbEcbCh6Uw7ZngjJqBnXDtpD9scVUOrjsJCMWn6OqXDT3djV
 oxaEaQiaMW/pyE1smL5YSZDuiwzAcCF2Vi2cpX5LbpCygfj5+89Fmwg3TTtCqW5IHOVc
 r5f/kbgMJtCYDHvn+RD8H/jJU/8h53b+DJHYAQixy2ywQ2XcYpKU7myDJcpO35HGX5ub
 NwPaJ0O7PD9EmQFlb/vo6OteJGjdT8knTc+HNLDvKbrFW2hcfPJWbTinlqONL/Eh+/yV
 jOZySr368UsF+aLcE2GJBEkyA0UOgAz3JH0MMjijIRYzShidhaWUQSy7coI1qxntXyf+
 2k0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=eoTJTyll
Subject: [Buildroot] [PATCH] package/libgtk4: missing dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgtk4 needs png & pdf support (like libgtk3)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk4/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index af7f57b80..3a7836fe5 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_LIBGTK4
 	# https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_ZLIB
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_LIBEPOXY
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
