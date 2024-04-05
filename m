Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25E4C67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 14:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BCB1415A2;
	Fri,  5 Apr 2024 14:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSpooflyB1we; Fri,  5 Apr 2024 14:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3295841686
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3295841686;
	Fri,  5 Apr 2024 14:02:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 176081BF31D
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 14:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B1541DAD
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 14:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAGZFaRNxpiu for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 14:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.182;
 helo=mail-lj1-f182.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9054A41934
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9054A41934
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9054A41934
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 14:02:03 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d6fc3adaacso27063571fa.2
 for <buildroot@buildroot.org>; Fri, 05 Apr 2024 07:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712325720; x=1712930520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2rI6mXw8evFvvC05jq06sTo8DulmMhyrNVsVqWiH3c4=;
 b=qaMc7aHpTZgie/i148tbUqfPRS67wv7th/C+Aoymdi+IKGw2fjMyME3cYoNPfV04JQ
 wT5LjRI0sLleYskbXGV9fZ6cENLxrajpJKTV2tkx6fgCiGzj5WRpJ1zkBySSvdeAqxWY
 ljUV/2CffIHeYCt1B3kVJkuHeHgBJZY0Q5huaflYFiu2siB8XriBQJidgSH/dyaxOAve
 rCQmrzLiW1/3gQrLvEhQNC8BIXpD/fQR/j2lAYpekPRs+N+tZweWWH5OgCBRiaXcvLu0
 CxIbeN3PaPy0GZI+7tJWZvETK4nTz9dmF4yH9k/scs6xnemCvFgmiNQRm5GTkXOb80Ds
 T2yg==
X-Gm-Message-State: AOJu0YyJ0cguIiKoeLyA6GZe0QPqnqaF4HvvFCeU5HCPq70/9b1uE/uk
 ne4nMlKbRsPsHO+7Ut2EBGIn6ae35UiJEBfV/0iILEm8LrOZ3Zb3nGE3ec5a+S4=
X-Google-Smtp-Source: AGHT+IGvtw5yKP8oTh2F6TdZflBLG+ryr6cIZk8n24WKDVJ4W4O7rCJ1f981TqZDXYVTa6TE3z+ZVA==
X-Received: by 2002:a2e:a306:0:b0:2d8:48e4:fd49 with SMTP id
 l6-20020a2ea306000000b002d848e4fd49mr1066785lje.40.1712325720111; 
 Fri, 05 Apr 2024 07:02:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:92e2:c31a:681e:d1ef])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c230300b0041497707746sm5928842wmo.0.2024.04.05.07.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 07:01:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 16:01:53 +0200
Message-Id: <20240405140153.1625987-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/weston: fix xcb-util-cursor
 dependency for xwayland
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Jose Angel Torres <jose@source.parts>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

../../br-test-pkg/bootlin-armv7-glibc/build/weston-13.0.0/tests/meson.build:340:2: ERROR: Problem encountered: xcb and xcb-cursor required for running xwayland tests

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=15766

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/weston/Config.in | 1 +
 package/weston/weston.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 1b282fb362..e83eeb0f74 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -132,6 +132,7 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_CURSOR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XWAYLAND
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5ae9c22973..f87f1598c2 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -107,7 +107,7 @@ WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += -Dxwayland=true
-WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xcb-util-cursor xlib_libX11 xlib_libXcursor xwayland
 else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
