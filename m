Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C5DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85E0820E4;
	Sun,  5 Nov 2023 18:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85E0820E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjBmrf8INBPC; Sun,  5 Nov 2023 18:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 157FD820C8;
	Sun,  5 Nov 2023 18:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157FD820C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9FB1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 740E540949
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740E540949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOv4xPgxok9P for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:16:11 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 603DC408EF
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 603DC408EF
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso3030046b3a.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699208170; x=1699812970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rVC2I5jZmqflZW2F18Kbn2Faz58wdhzmp+fGw+hI7dY=;
 b=wjXe0bJfOszQZUsMUqz6dm5292mVN11fU9e/zAO5J2vkZSz0klBtsemTjuMgTf0/gS
 SZ6tLjUg5Gk/klN9jPuf31xBjmsnnEVLd3wu2SEhQVhPb4g1AMuqpEXbSSOPRpJJHx4J
 TUe5ZY71ilBlHeaUa1HqlQ+Tdk6Is6SroIM5Os7Yl+9tg/nKFh/yycJDiPDxPttOUWMR
 Kwkmo4ZpnZu4rN7ekT4CuvEjK7FEySwDyVz2hWjkqvZyDruDQ+LfOsR3U+Aa4e/NDRSE
 dUQhrYmKvtWjKjvlHHP8osG1v9sUkKlLUeAL4JlzFxA2ZPSfa3rfU7ANS6kG95qEQTau
 hSNA==
X-Gm-Message-State: AOJu0YzbF3UDo6PKp4Dx66Sy+Aq8DdnOJGKjAT9JuiM6NuslcysWC/Lr
 0QP6RnJnxeBxt8p/reZXh86+iq3xsASrBxyyq43m+6+Wuko=
X-Google-Smtp-Source: AGHT+IHvhAe94Djc/C3o02EzBx1cHRVLane5PtZPYQZHz9+IxCtdRHcVFu7zNlHMWFBkqOOF1zLX3Q==
X-Received: by 2002:aa7:86cf:0:b0:691:27b:15b4 with SMTP id
 h15-20020aa786cf000000b00691027b15b4mr10313471pfo.5.1699208169754; 
 Sun, 05 Nov 2023 10:16:09 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a62cd03000000b00686b649cdd0sm4492523pfg.86.2023.11.05.10.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 10:16:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 11:16:05 -0700
Message-ID: <20231105181605.8687-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105181605.8687-1-adam.duskett@amarulasolutions.com>
References: <20231105181605.8687-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699208170; x=1699812970;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVC2I5jZmqflZW2F18Kbn2Faz58wdhzmp+fGw+hI7dY=;
 b=JYlp18gVv3t1DHQtPeP5EBlf85C2vehOSyWOkyEj3rxmeWHqe1hwKRR+iw2EsErnP0
 14NZeHVX+9kCx43zbqtp+8MbYIdyv/XOkJNL225LutH84SVdx7yNcNmVMdjVbkREkef9
 KQMRF+Q5TqRZYgUIw1GEFJ5w4x/22ubl6i7G0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JYlp18gV
Subject: [Buildroot] [PATCH v2 2/2] package/flutter-pi: add charset
 converter plugin option
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
