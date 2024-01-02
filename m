Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FFDC47074
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23F1D40A8F;
	Wed,  3 Jan 2024 00:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F1D40A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMQxiRbkXzWT; Wed,  3 Jan 2024 00:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D753440AA4;
	Wed,  3 Jan 2024 00:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D753440AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4FC01BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7F728124C
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F728124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EodLZu3YEeSh for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:12 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8A7C8124F
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A7C8124F
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3e6c86868so76515085ad.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240012; x=1704844812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3h7RGCpT0W0cVfaOExOJ5fSm91nTOkQFkIvguk5psxQ=;
 b=Y/xmHIXn1Bi5cfLiAaNVRzSYOWctkUhW+/YgTKoQumYXM5QB1AA/GX4xSun/pD1vYm
 CW/3FkCBWuHdxQqGB8PPq3qYC/sBeKIf48m+wR2VJR8RD4dQVHT/gEkzPrvFO4tHHg8Z
 d8z5YtD39e4xE+kPI9WrPcsg0DO43RBpng8Rk6CgPhkWTpsTe8hC+QZd6oi3/doCrMwr
 ZviOdEQWiQbBXF7HO7OIQMftUfPgnqPC1SI326sp5llNelJCxnGiGVMaYWv5oG7ndLmY
 9jO3/jE1gEUU9fT4cAx/W0DFwKFkIEpTwei9kLPoLhs4215AiuNWJZcyz1mSq+VOz8p3
 lkpg==
X-Gm-Message-State: AOJu0Yx3PbWJj/rhk1JZIacvs7kQ+iqhliuDC0QTLmY911Pd+oGRfO/3
 BBJxdW7nk+9/4zqxrJtmBHgpbZKHh634007lE+6h+SG47DE=
X-Google-Smtp-Source: AGHT+IFs7yVNP7c/vf9yg3KOyFct8yMVp/0mu3BadpRowAnPzuS1srdlvvo7Ba2ntjTgPPOenOAbjQ==
X-Received: by 2002:a17:902:b706:b0:1d4:79b6:101a with SMTP id
 d6-20020a170902b70600b001d479b6101amr10882865pls.41.1704240011747; 
 Tue, 02 Jan 2024 16:00:11 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:11 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:28 -0700
Message-ID: <20240102235957.3072102-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240012; x=1704844812;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3h7RGCpT0W0cVfaOExOJ5fSm91nTOkQFkIvguk5psxQ=;
 b=lrLBeagFIb5cGvDQVg0GfXouow6UN1uvDlcKUi9ZIr2GEKOaQQo6saecV9/kS1ngHC
 fTCmTQFfy6j+WVE966DJrTFZ9OkwIqUre8TmuL3QHF90sRbcj2hYlelre0adUKeAPddE
 FBMj2G5PvUrsrCBKTxW8E484ptQbTcMClwY2A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lrLBeagF
Subject: [Buildroot] [PATCH v3 06/11] package/flutter-pi: add the charset
 converter plugin as a menuconfig option
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

Commit 6a28738 introduces the charset_converter, which is a platform-side
implementation of the charset_converter plugin found here:
https://pub.dev/packages/charset_converter

The charset_converter plugin does the following:
```
Encode and decode charsets using platform built-in converter.
This plugin saves app package size as you don't need external charset maps or
whole libraries like iconv. This package doesn't even contain any Dart
dependencies. However, this comes with the dependency on the platform.
```

  - Remove -DBUILD_CHARSET_CONVERTER_PLUGIN=OFF as the default in
    FLUTTER_PI_CONF_OPTS.

  - Add a new Menuconfig option BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
    with a brief description about the new plugin and a link to the plugin that
    provides a full explination.

  - Add logic around the BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN option
    to enable or disable the plugin if selected or not.

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
index 4ec89bdfad..ab640d704a 100644
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
