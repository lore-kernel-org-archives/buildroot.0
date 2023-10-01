Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97EE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2836E8169B;
	Sun,  1 Oct 2023 16:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2836E8169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxPnmlnTJjkZ; Sun,  1 Oct 2023 16:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739CA81FCB;
	Sun,  1 Oct 2023 16:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739CA81FCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7390E1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D8A960D7B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D8A960D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_PrzENsIv2j for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:52:28 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5968560BD6
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5968560BD6
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d080eso17913455e9.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696179146; x=1696783946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fFIL8mec9j6mS9TYRZ8G384VL8cVz3iBg5eZy75dIhc=;
 b=XlbSzOHMIIyPzuvjrAXqFLud9z+SoNrYlPWRw8vV5HVUCkqvWIfa9Ch54kmzaeVAsm
 cXvv6B78ae7wd0ns+U+q8EDJRJVXszqAmGyeXQSCVBbFagZxu58HVXSYVO/tnrAxxMXq
 JhnZfMeAbQ8jnF/hwwsMRSOFzxmCj6c4WOGf6nuC+bsoeNOO6WOr0HsQwFaAGtbTvED/
 nfSAgVPOaP+b0G/HdtS2e4sLqlQTQjGF0y9kuhPeVa1nv4Ytbwq56NnarMuwoMTEiSY0
 /EUpVKZNpMf+u4YeSpambKce5CQAYXdxYV786RpkB6raoLY9Cuzf78r9W17k8uFF5YzV
 n3rA==
X-Gm-Message-State: AOJu0Yw4pf/vOQxreqvkYD47uIN+RTGDai1BolaqHW/550zgiK9TVySc
 WlgjXnZLsxsAzUD/iio5uN01ipFHxfz1rW3D
X-Google-Smtp-Source: AGHT+IE5uAlSL3wbnbjrbEuHD/RKQ1u2YgZsofvHYoBEwl78oygpNyu8jNScFwVL+XcA1UsVSRLx1g==
X-Received: by 2002:a05:600c:364f:b0:406:3977:eccd with SMTP id
 y15-20020a05600c364f00b004063977eccdmr8313223wmq.33.1696179145715; 
 Sun, 01 Oct 2023 09:52:25 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 n20-20020a1c7214000000b003fee567235bsm5599068wmc.1.2023.10.01.09.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 09:52:25 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 18:52:11 +0200
Message-ID: <20231001165218.1960930-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231001165218.1960930-1-thomas.devoogdt@barco.com>
References: <20231001165218.1960930-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696179146; x=1696783946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFIL8mec9j6mS9TYRZ8G384VL8cVz3iBg5eZy75dIhc=;
 b=TB8jvdoN5hqYj+kozlp3phtYPgePopJ4e+9bzEMEjRrJ8h8zI0JxhvogiAhj/2mFAY
 Zy3pSEzwD8wamSBifQtoqQV5QTaf1UgmcrCTv0SwJkur/XfIotbTpXojptYcWrXjjZK4
 uRZTQSVp3mSfPu8n7dWo0bRSa2mt+8K/A0izXMWRNcbtxYmo5Zxj/AlTv66eBV9WCNOB
 n7ySx8BzQyBXgSr3v1y4PlxDlj+oRRR2WsYBGs5qw9IyBAwbAgGYU7rFwfbTd20+FbCT
 kNgFT6UjdyBUjcH137DFGrLpcZ91TKc0VyfsVae2mZNXNFsOAl3h2UvwRQU7Mlq1Rqoi
 Jqyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TB8jvdoN
Subject: [Buildroot] [PATCH v4 2/3] package/webkitgtk: select wpebackend-fdo
 if wayland target is enabled
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400

egl is mandatory if ENABLE_WAYLAND_TARGET
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473

So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: n/a
v3,4: no change (added from another patch serie)
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 927792b1e4..cb10784133 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WOFF2
+	select BR2_PACKAGE_WPEBACKEND_FDO if BR2_PACKAGE_LIBGTK3_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 88bdfae27b..9c68fe73cf 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -115,7 +115,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LI
 WEBKITGTK_DEPENDENCIES += libegl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
+ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO),y)
 WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
 WEBKITGTK_DEPENDENCIES += wpebackend-fdo
 else
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
