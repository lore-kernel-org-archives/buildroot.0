Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4854FC2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB0060701;
	Thu, 15 May 2025 10:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Q0IG8OQ3sgF; Thu, 15 May 2025 10:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75F76115B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75F76115B;
	Thu, 15 May 2025 10:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4991813D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39A0361143
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P4Ck4PmphRa for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 150956114F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 150956114F
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 150956114F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54fcd7186dfso858763e87.0
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305418; x=1747910218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgJWGGO/G/VT/ZverkCm5cyAjBrnnrNKHWZiXM0M5ls=;
 b=GAx2i3XhXALhViu4jeq6ePGH+WADyzPHk3PFqwfZOjIR2zJK+kxHQPd6b+dJ4FaXh8
 aB3eQm5sAUSqj7dHPpWqFkXKwnUNv/XyBtU5gyaSXWwI6HZqWtfXWFdyNND6kYN3Sz76
 KRKTX3Jwzds8bKxs8QH99VBdmWC7iFNoXjVED8VK3ewzMU94PTXQruL5TT4sZ+NpYOsY
 0AAumBws6Brn9d3IvXO3b7jJ6eWk+wbXZ2N/RG/56oqVcQzKLc8659GRLjLauzs/UCFp
 mGuhUQm3ctQ362zWHekNCDOzL51XnLKSCwgcE+hWXXZiJELjaGAVxkqzjWCr7nt+bdM+
 oMfg==
X-Gm-Message-State: AOJu0YxYIRy4wqs6OyGfOJZfKVe2V1TEAlAAUOey3FxiLFiY3f9CIJiC
 WTl/zTmCPSUyri53UV1aBoLQ7G1xaYlHfvfI84t2ADFk0OygiKsaaK/PYQ==
X-Gm-Gg: ASbGncvmCnB2pMw4wzKQ/nXlsEVY/PFr8RfnOrsI1rKIZ18E1CPKO0l49cRHYDj1srs
 j4n+3DXMV3DJedJwVFcQW1NA/VmmZr++IR7GydsAsbdiTtIbNu7/ASgxcHSma8gqZSSMt8piYuo
 g+AB1p+lwDOu5SFlBgTyCWRLUIHCg33SSRiWTcqa69zvG+yjWWLf/M5w3dMPojmvDsIGAwerzxt
 8g1eLdbGQ/Ie12mHJIP6ZOMImEnuxvwQwqHs2owkqpt3lmiwLuA9LYlwv4zsHgLSQ7+DoLsZxrM
 79u0tkUtRUKkKMIFgcJDkej4EPDH1YCl02wFL+PPIErWLmT7TCDklp23ICbcuIuxtnin7Qu5Nv9
 XhIUBQg==
X-Google-Smtp-Source: AGHT+IECrc5UA8JVHgaHer305XU/Rv3hZn6pdo+ZOteZEhkTGdBqFU+io9dBS001ecaBHXJQHHf9lg==
X-Received: by 2002:a05:6512:33d4:b0:54f:c512:89d9 with SMTP id
 2adb3069b0e04-550d61ec225mr2684742e87.55.1747305417528; 
 Thu, 15 May 2025 03:36:57 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:36:56 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:24 +0200
Message-ID: <20250515103632.2631227-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305418; x=1747910218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgJWGGO/G/VT/ZverkCm5cyAjBrnnrNKHWZiXM0M5ls=;
 b=BjX3kJoQXDBtgsiu/nfoSlSNWxfNWGsnOUgrUqplo3p8owsCPbfo16MqkUuWEYjiYY
 8zySpmj4D33bFR5JoqHrSBtEpozWwRXZ1hcVS/kffJVQ4Vhr1LhAC9qiSwT2KTGrFG2S
 EnVI9ha8/iFBVMmhxMAT9aqY9Mf6QckbOaTlXqIentwevInVI1i4I35NdKY8DkBsylFV
 bVamY6MaFnH0AJ2vQaTvvOkaBV2VVk5V7ui24+mAqSbSpKTqgkpooWf941vkE8GCFCh6
 ydwSpTGMLB7tDcCqNcR5qCBAkiYhd/TIOFmYHIdq0nBcdgcrBqjOsU9KtuP6ZascT8AM
 s/dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BjX3kJoQ
Subject: [Buildroot] [PATCH 08/10] package/qt6/qt6multimedia: fix ffmpeg
 plugin build for x11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
[14/216] Building CXX object src/plugins/multimedia/ffmpeg/CMakeFiles/FFmpegMediaPluginImplPrivate.dir/qx11surfacecapture.cpp.o
FAILED: src/plugins/multimedia/ffmpeg/CMakeFiles/FFmpegMediaPluginImplPrivate.dir/qx11surfacecapture.cpp.o
...
23 | #include <X11/extensions/Xrandr.h>
...

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in        | 3 +++
 package/qt6/qt6multimedia/qt6multimedia.mk | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index ae555f98ea..2a9c4f3ca4 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -38,6 +38,9 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	# libxrandr is needen for ffmpeg plugin to build with X11 support:
+	# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.9.0#n182
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  This option enables ffmpeg media backend.
 
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 48497ef0ed..53ccc70389 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -58,6 +58,11 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+# libxrandr is needen for ffmpeg plugin to build with X11 support:
+# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.9.0#n182
+ifeq ($(BR2_PACKAGE_XORG7),y)
+QT6MULTIMEDIA_DEPENDENCIES += xlib_libXrandr
+endif
 else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=OFF
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
