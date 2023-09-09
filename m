Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E7EEEB585
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5756582259;
	Sat,  9 Sep 2023 10:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5756582259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHBh9I_yEd4u; Sat,  9 Sep 2023 10:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89FF82219;
	Sat,  9 Sep 2023 10:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A89FF82219
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3C121BF84C
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 10:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C2AE41F34
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 10:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2AE41F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w29w41q4IJb0 for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 10:00:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DEA941F32
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 10:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DEA941F32
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-401da71b7faso33165885e9.2
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 03:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694253615; x=1694858415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6hC+ugshRJbPL8hJhx53lztj9V806y6EaRPeaKRol0=;
 b=vg/IHlx0jRzz3UshHaiwvJta+FyAGpeMfl+X5kKfaE3HInMxu+LgwxZNvodZsI0yfz
 rQkLMX3ymtotfAnwoKGvoqz8SNnqRJw3WsgzCPeGdPl6iVwZmEsiAHGRpCpJmm5NwRJv
 jRhs8ND2wKqIwBTkEshsJAx8Df78xVF9NlSjAE0yoMFrL6lyvkxZe4Ezoituj8rD6OQA
 13LrxQOUll2LbVHSio4Q9zT0uo+MOLfZYrph26wUZ8w8xjwhytcLxEHVOB9tt7672E6l
 4oya2QuwTCnKTaokiwftPPb//HADqC/eK7Vv5lCKY7MccLMK8pVofM1Nxs801DYEANTE
 IZYA==
X-Gm-Message-State: AOJu0YxcOIcPMF0JpCRUdvWUa3f1JRMDakpc3Vf6TNJXJPxaOaMcwMz1
 5pUX9LB0dRr+6r8gJmrjIf43cUtMlq88EA==
X-Google-Smtp-Source: AGHT+IGugu5Ck76X++E8xtv1PkcrD50BlR4g+tEpPqUB8u1iHvBEZ2PGbrXM5ZGDTuKiKTjvJI0Mhg==
X-Received: by 2002:a7b:c847:0:b0:3fe:e85b:425d with SMTP id
 c7-20020a7bc847000000b003fee85b425dmr4263503wml.9.1694253614679; 
 Sat, 09 Sep 2023 03:00:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:433f:f693:47d3:1b18])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a7bc847000000b003fe2bea77ccsm4204633wml.5.2023.09.09.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 03:00:14 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 12:00:10 +0200
Message-Id: <20230909100010.9386-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/webkitgtk: select wpebackend-fdo if
 wayland target is enabled
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
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400

egl is mandatory if ENABLE_WAYLAND_TARGET
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473

So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 748e529208..ccea3eb053 100644
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
index 39dcaddcd8..083d62c787 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -129,7 +129,7 @@ ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
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
