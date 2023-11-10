Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42990C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC501423E3;
	Fri, 10 Nov 2023 16:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC501423E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHVnBEmKFfZn; Fri, 10 Nov 2023 16:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF5AA423EB;
	Fri, 10 Nov 2023 16:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5AA423EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F34611BF97F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4AA60F80
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA4AA60F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4nXwvNbQe1U for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 16:46:26 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDE2360BE3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 16:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE2360BE3
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so29719171fa.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 08:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699634783; x=1700239583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18dRltC+n886RLRYyuRke9uITqCnVXdTgwyNCQUz7lQ=;
 b=nbcHVgXP3HydFiP+JSJgNExM3znijwBWj8uPsHB/qxigU3vJfkRzW9t2RaM9NYV5l4
 YYsIP31sI3kew9SgqRHFbvPTrWdgu+SvP8zg9PwoKFoQSHbEOSNjKQ0cIfE7EvSUtf5z
 ZwfeUTcM+QCbAqpNfvc0Lo3CR19fW7BTweSxdLeGSHSo/sg0d3688s7djnJfRJioenND
 cQntuy18yfFJkczm+4k+5VMIicbCl1K+4lcth8KSqCAQzQ3PLxrxu492L2XRzlDTiUVY
 hFupKKcICc0qiWPQO/Y4gpE9BhvoLgXCZqO3kPLIJvKvHzKQZQINVLuaHkLL4AC1nJR7
 E3/w==
X-Gm-Message-State: AOJu0YxWroJZ98BkwW8GoigHwXe7g16oMsfpcdB6t6N22ko6yeZnJSac
 R+3yZqnpNvt18sQ+NZqCLn/DsVjWVYbjKQ2G
X-Google-Smtp-Source: AGHT+IGgvrFB0QD5tpZt5D7//dlICvzGrnVjgEVwnqdsN7l9Ma7p8wQpRHt5O34ZeCsa1HX3r9P7hw==
X-Received: by 2002:a2e:3c05:0:b0:2c5:b3c4:7b17 with SMTP id
 j5-20020a2e3c05000000b002c5b3c47b17mr7354054lja.38.1699634782894; 
 Fri, 10 Nov 2023 08:46:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:afce:9bf:b5dc:c3a0])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b004065daba6casm5712828wmb.46.2023.11.10.08.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:46:22 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 17:46:16 +0100
Message-Id: <20231110164617.569602-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110164617.569602-1-thomas@devoogdt.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/3] package/webkitgtk: select wpebackend-fdo
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
v3,4,5: no change (added from another patch serie)
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
