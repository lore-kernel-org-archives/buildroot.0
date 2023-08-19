Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26061EE49A0
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 02:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714778418D;
	Sat, 19 Aug 2023 02:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714778418D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evbdH5Sn5mFk; Sat, 19 Aug 2023 02:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E66C84192;
	Sat, 19 Aug 2023 02:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E66C84192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F75B1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 02:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66D8184192
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 02:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66D8184192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmV6e0C2kGUD for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 02:16:26 +0000 (UTC)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 784228418D
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 02:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784228418D
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-64ab0347caeso8358846d6.3
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 19:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692411385; x=1693016185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=js/o45aC5sb4JYuhjeJqdHZcYGscs0frcw3CnMZU+O0=;
 b=g2B6QV9qQmpxao4J4AaUb1jPlhZTuCeOsTtuxSwrmAB5IiyXAZ++XooSb8FgmcM3aB
 JYRPLH9w370kIg5bDw2UqzcgHitnwog4esP1d5KYptyiG4+2Hp+UODmAidirWCwIezIR
 Rzn8Qu7E1dySgf7YAhkLUU5/FZOVUGjUCA1OLD3nIZw9sbbfvnZSVTTzkLzexWq+cJao
 lsOIMsQKW+YqJZiwlEfB8LevmdfKh1ytHiGBgVFCCKwaIwVhgZhOhgZhrFuYpIwy81ZW
 N6L0YJ5Yy8tAmiXoFlzAdWONGLt7F4C0pnaTM5b8pleRSFgclFnCDW6N3FDYVt6tsy/G
 WykQ==
X-Gm-Message-State: AOJu0YwKjhMSVW53t9oceZUqTbsMwxga7stWf+sUGz+hhFJkXAr7bYUN
 L3agyGCHd1QXeREumys5aXJdjfFqAkI=
X-Google-Smtp-Source: AGHT+IHi2km2RsBvizhKUfekfTV5CtBtbMHRU0I51zuwiAu958wuU6XoLoIcCfS4x6qwLsVqgi01QQ==
X-Received: by 2002:a0c:f3ca:0:b0:647:4189:de11 with SMTP id
 f10-20020a0cf3ca000000b006474189de11mr1099885qvm.6.1692411385023; 
 Fri, 18 Aug 2023 19:16:25 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 ([2600:4040:57a3:100:f24a:f408:75e7:7e13])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a0cb31a000000b006375f9fd170sm1127777qve.34.2023.08.18.19.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 19:16:24 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 22:16:23 -0400
Message-Id: <20230819021623.3961269-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692411385; x=1693016185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=js/o45aC5sb4JYuhjeJqdHZcYGscs0frcw3CnMZU+O0=;
 b=kL7Qzk9dtdRWrOZljAKlu3BrQhrzBlPLlA8wv0/z4/WqlcSmExQR8+28ePWXqBllKI
 Ulk6OgS7hjkqAtmVy8TLT2PDojUEiGkrc1IJsG+g+sgMPoQgYYH5UXkRO3KA3jPbi7xO
 rXYBiIvIxCU7TSAP9lPJ1XVbHAZfCind5l3ejyNoGJXOI9VHwn9xNDgA0Bv/ToI/9kUI
 6oJe+xymNDJ2HEQV+i4n0U+ucf8FtXtblPFC+XtHYRWgZ64kzK12PJNrVwIJDd+V9hNC
 r6ucmdsjpMZRHwnqZhsYBVRyniPWzvjs+ZNSzNgE1q2j+UJj+2d/Hs3pt2GBaM001Cmu
 WupQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kL7Qzk9d
Subject: [Buildroot] [PATCH] package/busybox: Use minimal.config for no MMU
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Jesse Taube <Mr.Bossman075@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Jesse Taube <Mr-Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building Busybox for no MMU systems both umask and mask
are not built. During boot-up, they will be called even though they are
not present. This issue is fixed when using busybox-minimal.config
To prevent confusion for future no-mmu boards select minimal.config
for !MMU targets.

Signed-off-by: Jesse Taube <Mr-Bossman075@gmail.com>
---
 package/busybox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 5e5c586762..3c2aa515f8 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_BUSYBOX
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
+	default "package/busybox/busybox-minimal.config" if !BR2_USE_MMU
 	default "package/busybox/busybox.config"
 	help
 	  Some people may wish to use their own modified BusyBox
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
