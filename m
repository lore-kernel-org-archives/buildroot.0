Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCEDC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 18:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9815E60A47;
	Sun, 19 Mar 2023 18:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9815E60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApX7TVXc4D0y; Sun, 19 Mar 2023 18:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A586560B0B;
	Sun, 19 Mar 2023 18:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A586560B0B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9B701BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0AB040391
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 18:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0AB040391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BE8R-3et1BI for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 18:11:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E520402CE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E520402CE
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 18:11:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id iw17so808912wmb.0
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 11:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679249470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcweiVvcpetevVIshfQHtp46/TpjaowKEt67w5l0DEc=;
 b=iHp7IMLvu7HuRDim4cORc/QVcPuYg90mPdTE7gK9XLoDumg9n+iIHUF4HZCSay1Fg4
 8OziuJ0TYbia3zsLnqp3wqYxgJrnSDP6o5CD+vG7iCQad5def20uthw2pa1beAV0HRBE
 1EE/fjgP7Z/OWuT6IoWBMWDxtJWVNUwng6/xVZWzfvHzloBHxYqlkBqWod+AMGmKtjaH
 Vsie/T6qEszWy/6ZsqBcONoBZkEaiyi7yLlWkrOgXetWG+0WoUrTCJxLMI38TFD8KGgY
 pMAHui44uwyWxD5g6gjQDI5Qz7Ql53/ADhHgyAnwRwHArOkN1RjGVn+kxuIQmpt2xKPv
 1SQA==
X-Gm-Message-State: AO0yUKV+rlhisZKrnQXGPvfJgx9IawOI70U+vDQe0CjFbkFWsl2hbSFr
 6YuwdyQbo+LWNRLW1NgcH2X/M+D1oHA=
X-Google-Smtp-Source: AK7set8Ii4w2IyakF+2Aazn/qNmnZx4qadwFs9LnZ5scbyADp02atmX6wp2889t5xdozGaG9zNZP/w==
X-Received: by 2002:a05:600c:524a:b0:3ed:3e72:3580 with SMTP id
 fc10-20020a05600c524a00b003ed3e723580mr12549672wmb.26.1679249470257; 
 Sun, 19 Mar 2023 11:11:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b003ed3034698esm8458294wml.9.2023.03.19.11.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 11:11:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 19:11:00 +0100
Message-Id: <20230319181100.23180-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230319181100.23180-1-fontaine.fabrice@gmail.com>
References: <20230319181100.23180-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679249470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcweiVvcpetevVIshfQHtp46/TpjaowKEt67w5l0DEc=;
 b=O2o61Cj+zpD8wWJMnBiGXlA1vn86gVraZc5g4eY0yUboR2Co3pHojrqTJ5m6ckUqSC
 dkN5z0XQq4qPfdAP4RPmTk2EZLaxXr5FtoNh87HhO3di+ZPghmoaomKw0oq0fTCr3uOV
 q158HyXljCf5zeiyG+jevZXFGb644pAQgW8zhSFOEAGxhmB86usyGDb0YErGugvWqkzQ
 7dBCsBrrmlqhhKnLd5ioNbtxsGl7zwj3+j4KQV8qtVjlnSAnWg/zNrPeLK/43x1rqoqf
 Q3RLjz798xlk9CrZcgOCxrBBWCudzV0xLYkBUC2YUUOqBFi1yC+v931kd2LkyYyJuji+
 ov0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O2o61Cj+
Subject: [Buildroot] [PATCH 2/2] package/mpv: fix x11 build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xlib_libXpresent is needed with x11 to avoid the following build failure
raised since bump to version 0.35.1 in commit
61ba55e9cce6884295e47fdf33554e6877bd0747 and
https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115:

Checking for X11                                                          : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >= 1.0.0 xpresent >= 1.0.0 xrandr >= 1.2.0' not found)
You manually enabled the feature 'x11', but the autodetection check failed.

Fixes:
 - http://autobuild.buildroot.org/results/1aace6210ba966bb4979d935c08507b2a34e0460

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in | 1 +
 package/mpv/mpv.mk    | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 8efb353c33..5c32f593fe 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXPRESENT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index e368b25736..cf37091186 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -205,7 +205,13 @@ endif
 # xlib_libXrandr, xlib_libXScrnSaver.
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MPV_CONF_OPTS += --enable-x11
-MPV_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXinerama xlib_libXrandr xlib_libXScrnSaver
+MPV_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXinerama \
+	xlib_libXpresent \
+	xlib_libXrandr \
+	xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 MPV_CONF_OPTS += --enable-xv
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
