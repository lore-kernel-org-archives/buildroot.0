Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D49C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF2542118;
	Thu, 21 Dec 2023 00:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF2542118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsrPcv9jetBB; Thu, 21 Dec 2023 00:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3156C42117;
	Thu, 21 Dec 2023 00:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3156C42117
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D57521BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A834A60B09
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A834A60B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORFWU-mq5N3w for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:29 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6364560A74
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6364560A74
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d3e05abcaeso2156735ad.1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117968; x=1703722768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4tR44QyhUS/pHlV3j7GWe/7H1NshiZCdSBvMvEY6BOE=;
 b=mezIWb37Ld0Ht2+nqatIOkrB85243T7aw8HChnenNfeF6H9AbMYgNF6D15PnMZNWxV
 o8Xt6XNivESE93WncFGaBtLn+V+TS551IxyeqYL3MEmnHZrn50vydfV3mzBCvfFx6Y+Q
 XTZ92tnmQEHcB8wMSh8zvOKazfegUJCccyr8z/aBHWK1J37PVtvguLklQaeH0l/qlLXj
 ZRc+rM1XIqK108c7O4+YQWmK3BoeHg08WrEVSQk/TP6XM4D/A36Y2vZAGuEIG09EpNri
 w1U3DkML2GGkMTcjlwxodxou1YxYW1uVdoZhkGyxwixqplJMXsv6FJxZ8KMSpZuG4dwp
 hwKg==
X-Gm-Message-State: AOJu0YyZjwbA0fIvYaTIGSt0Ph3FT5FVD15pZgqY+67lN49sEkaG4xNx
 TdvKdAD6Pm3HTzImZ0R5fEeU9V50xqwdB0LJJPg=
X-Google-Smtp-Source: AGHT+IEv5hv/Jwxob7Z3Zb9Gb8wUNZvWxmsV3QLopehKMQwHeh+Vmyx0ong/u7/m91G+ZnAgVFpUpQ==
X-Received: by 2002:a17:902:8c8e:b0:1d2:ea56:a57b with SMTP id
 t14-20020a1709028c8e00b001d2ea56a57bmr10031979plo.79.1703117967965; 
 Wed, 20 Dec 2023 16:19:27 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:15 -0700
Message-ID: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117968; x=1703722768;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4tR44QyhUS/pHlV3j7GWe/7H1NshiZCdSBvMvEY6BOE=;
 b=ktyOi8lilty8rQqvKOIF4wxF8xj2F/vld0gr+uWm6yF/Z9v3OOhiKGOTmHsHKxOMT+
 WOINrkBjtmXm7lYHT9QVOyDj12GBMZshSQT/4o12OelGoowMMILN1q9B2mvGTTrjwjno
 KN2YZFaktaWMiVDP3TFSEFVfAP+qyfOTdJNkY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ktyOi8li
Subject: [Buildroot] [PATCH v3 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As per backend/drm/meson.build:1-7

hwdata = dependency('hwdata', required: false, native: true)
if hwdata.found()
	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
	pnp_ids = files(hwdata_dir / 'pnp.ids')
else
	pnp_ids = files('/usr/share/hwdata/pnp.ids')
endif

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/wlroots/Config.in  | 2 ++
 package/wlroots/wlroots.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index fb23e9069c..7622a3033b 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index b478e57abb..bb5c8f497d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -13,6 +13,7 @@ WLROOTS_INSTALL_STAGING = YES
 WLROOTS_DEPENDENCIES = \
 	host-pkgconf \
 	host-wayland \
+	hwdata \
 	libinput \
 	libxkbcommon \
 	libegl \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
