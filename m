Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89D1CFA750
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 08:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4380340553;
	Fri,  4 Oct 2024 08:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sMw_f-pHcR7; Fri,  4 Oct 2024 08:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF33240656
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF33240656;
	Fri,  4 Oct 2024 08:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394191BF33F
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 08:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35BAE6075B
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mq_e1RrHqO5L for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 08:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06C8960754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C8960754
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06C8960754
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 08:18:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42e5e1e6d37so17502925e9.3
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 01:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728029903; x=1728634703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HHlK2TdNayTyvSL/HtqSYcS+EZtlJlq40OO8bWh7GE=;
 b=TnTM3WA/POeq6AjCZmOUn+j7VRCYpITSUtciwlCA0LIDsmyjqeMl0QnoZ/TnWpBMC2
 gnYWqbiwfIzTSYyJMa2M4RUHi4190RRgtpe5itl0AaNi5K1U7uo0BpiBgPStnt6nlNNF
 Qh84Y49XPx+Rc63KL3uC71kQuXciEloC6uue4queyyAaS0NbT5+r1T1ckpA1h9ALAViv
 qyxGz4U2Os6tWu3z3fg2NyKvVM8falL24L93Y8ezpxjOkUv8B4VkXrdNN1Fs7ha03lNC
 RnI+ARmgKEGGxEo8xfYrXwZUyPSRKdyra4lLmR2MD1rB8wkL1lmC7HqEGX/YBs6eRb0p
 ZKQw==
X-Gm-Message-State: AOJu0Yxy02A/OKvkyShsTlhG9KKzWh/vB2aNrmjw0H7J6BLoVFXhOsV5
 oimPNMiFEyBYiepp0jb/9aeE3UrGGnGuRBSV4g9QWFUmSec3wsZaudS3Vg==
X-Google-Smtp-Source: AGHT+IH48b09C/X84eezyKoxKNw1gbqmKWJpWtRxox8HCNLHE9Q2k6V1CGDKBIeuJGtROojXHGuAuQ==
X-Received: by 2002:a05:600c:46c6:b0:42c:e0da:f15c with SMTP id
 5b1f17b1804b1-42f85ab8695mr12577805e9.20.1728029903119; 
 Fri, 04 Oct 2024 01:18:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:632d:a06c:9bf1:b9fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4aa8dsm9456035e9.43.2024.10.04.01.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:18:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 10:18:19 +0200
Message-ID: <20241004081819.1236963-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/weston: bump to version 14.0.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Notes:
 - (14.0.0) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
 - (13.0.95 RC3) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043775.html
 - (13.0.94 RC2) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043772.html
 - (13.0.93 RC1) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043761.html
 - (13.0.92 Beta Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043758.html
 - (13.0.91 Alpha Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043705.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/weston/Config.in   | 1 +
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d55c456425..89bcaa4aa0 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBDISPLAY_INFO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
 	# Runtime dependency
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 62322ac639..2fdc6ec1f4 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html
-sha256  27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093  weston-13.0.3.tar.xz
-sha512  60e655b57cf418902ec6e4371883354165241d9a99a712aabe2165e11ac190dec22836fd885f5178def5416dc5f00e70042b022c96a8e0aa74827bbd4563f9cb  weston-13.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
+sha256  47fd0325b0b948e9b003a38fdf4eb3a8581f3fdc740b8932b35ae8793bf4e4a5  weston-14.0.0.tar.xz
+sha512  8bdeed91befd5cbb0bde0f1860ff7775c1835a5fa8c3bf26e99d2f0c16e81255fcf35bf338ae02d7826463d0efdf41ba3fe78e38e4c27787831dfa331acafc08  weston-14.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9292ba14b6..d879dcc965 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 13.0.3
+WESTON_VERSION = 14.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -13,7 +13,8 @@ WESTON_CPE_ID_VENDOR = wayland
 WESTON_INSTALL_STAGING = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng udev cairo libinput libdrm seatd
+	libxkbcommon pixman libpng udev cairo libinput libdisplay-info libdrm \
+	seatd
 
 WESTON_CONF_OPTS = \
 	-Ddoc=false \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
