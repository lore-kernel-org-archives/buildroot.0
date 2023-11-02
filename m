Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74859C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BFB8523C;
	Thu,  2 Nov 2023 18:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30BFB8523C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQazeds8Rtr7; Thu,  2 Nov 2023 18:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BFAE820C8;
	Thu,  2 Nov 2023 18:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BFAE820C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 609831BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46C114F2C5
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C114F2C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tju28189Tcvq for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:54:22 +0000 (UTC)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 408A04F22F
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408A04F22F
Received: by mail-pj1-x1041.google.com with SMTP id
 98e67ed59e1d1-2809fb0027cso1165733a91.2
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951261; x=1699556061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rVC2I5jZmqflZW2F18Kbn2Faz58wdhzmp+fGw+hI7dY=;
 b=FhsHI8RS97boGjQqyi4MHuTH00gHeYWiI+rNp0Im77GmWMQA6xVLlkbdmjtS7mCxru
 43kG+6MFMMgaoSacQAtaJUHZQYVWy43nBHZwJYLW1vVTJCz1nImmPr2sJTNXJhKSt7j1
 KXSG4mUK9zYzIHJTJwAPAATjEdnvNmFcf86UKDJaRcv7NX3wM8P9hQsgvJMiw7WvJfQO
 VbrvNh4Dg6Xr7eyZuxWBliXimWDQxGfEbug0/n2mfNEnQcCIHiXNuCl53Jk1aK3hvl1X
 aBot7RuQQhyzDTiEZoUux3DeRrWEOMqQ/LZNP5AtaUrXApwWpN8LwfNHy1y7hRG/yUTX
 cYeA==
X-Gm-Message-State: AOJu0Yzk5YrHu+l1Zc1/UplG0+cBfvN2YQAxMCNP6fu52PawMRnFw/mu
 Osin2yj4LBeUGsJbW9gi+SfebkHQyKzTkaXjubl9ncThxDI=
X-Google-Smtp-Source: AGHT+IHp/wtXbe7qGsdeugzO6qTP6PGFuSsMvWh9e3clXZO59zYlKI+WbWpi+729c/4/Y+WV/+UOQw==
X-Received: by 2002:a17:90a:1a51:b0:27d:306d:71c9 with SMTP id
 17-20020a17090a1a5100b0027d306d71c9mr14214085pjl.49.1698951261196; 
 Thu, 02 Nov 2023 11:54:21 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 ge17-20020a17090b0e1100b0027cf8869ee7sm210962pjb.0.2023.11.02.11.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:54:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:54:11 -0600
Message-ID: <20231102185411.51382-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698951261; x=1699556061;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVC2I5jZmqflZW2F18Kbn2Faz58wdhzmp+fGw+hI7dY=;
 b=cPFM5lfRgqaksJPXBx9qZSIfYC/oF/H7h4CjxLdGdBN4m0K1bdyOF10uU0fsdZT69c
 hbR/OZK/cdHHNoSpptoJc9HSOWBPcfjFWbvS/O2pymZ9I1VtpQ/KIoX1nkwTSXCOqvFg
 w47wkdlJ/FezHKxCcL7UTM8gDF584Ua+EdQXs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cPFM5lfR
Subject: [Buildroot] [PATCH 5/5] package/flutter-pi: add charset converter
 plugin option
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/Config.in     | 7 +++++++
 package/flutter-pi/flutter-pi.mk | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index ecebfad89b..45b6b4faef 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -23,6 +23,13 @@ if BR2_PACKAGE_FLUTTER_PI
 
 comment "plugins"
 
+config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
+	bool "charset converter"
+	help
+	  Adds platform-side implementation of charset_converter plugin.
+
+	  See: https://pub.dev/packages/charset_converter
+
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	bool "gstreamer audio player"
 	depends on BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 491c074e13..8bf25da008 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -27,7 +27,6 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
-	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
 	-DTRY_ENABLE_OPENGL=OFF \
@@ -43,6 +42,12 @@ else
 FLUTTER_PI_CONF_OPTS += -DLTO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN),y)
+FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN),y)
 FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
 FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=ON
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
