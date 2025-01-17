Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C51C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 057BC6FB9E;
	Fri, 17 Jan 2025 10:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JioHAykuidFZ; Fri, 17 Jan 2025 10:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8576FB9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8576FB9C;
	Fri, 17 Jan 2025 10:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4CF94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4949B6FB72
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITaf148_fK42 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8526E6FB4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8526E6FB4D
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8526E6FB4D
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:36 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2270744e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111274; x=1737716074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbhhcmORpjpH6dJZz5aHt98zpoePRN1x0LzKt8wHhK4=;
 b=S/zXIqtdA7yY9TQ16lx92MdQI3OMXKOi33sXkp7hoqRZIgqEGViYy1NgaLEEFYp90j
 9kNBX0ME1efttcdKfxSCiEgH2fwsTwl1DtGWcYc+5NpgVB+u5GCs7EFtDv+MWMljOdRJ
 A5Vc3ai2OsAfQ3RbpuJDjX0XmMRWpolU07+7JwMLtV2LFVBNbRGs0JcoQB558UkgPJHo
 qnldFMa0jag3Jw11snFqjhdv2zrstCy/rQjR9f37RqWW5sfcwLh3nC8zvavLXPBluDia
 4tuth3QbJx5m2KPQYaQn2DhGV93fR4YkSWNy0Pu03+66Vu7bh+Vy6hj4Z3jLITAAoI/f
 y4vw==
X-Gm-Message-State: AOJu0Yy/s2I8FPMzxU3vAhvJLKMhHMs7iSPOaGds7AsqPKO+UymDKXks
 IqzjOobGB5Ts0P3pT8n1gMtCXvC4A2BWhcl2DoFEdgfA5u3E7w9CPYcQbQ==
X-Gm-Gg: ASbGncvWzHWu+gqNvLodMAmhEzsW5ve2OQFGA3SqeAmlSIKi7XHagvjRYzOAp4i5QgQ
 KEyBEf870k/176p6ZoqWUZK9pDFypYv9C4jECPUpw3UlHloQHVz5Wu7nikoK2Sw9c0TATsT7CYt
 eIaWidDdRC/cbhENfguHP9snhGMvhSk12neDr5RYAok+E0XFJG7Sdp0jG1ywCVIrUjmvuy9JefH
 kOCgU3h6VC1mrrXFpes3LMTjxgten9N0+IL7bjq9mXVJbWvZpelLyPtewsnNDQi3ie6+P8Ixc8y
 3CTlUJkHrls=
X-Google-Smtp-Source: AGHT+IGqKTrBX4PUn8PbnaQLaOf7MpnCjKb9CgnyNo99N0N+aWcyvBihi4GD596aDzpOAi7iM1WoAg==
X-Received: by 2002:a05:6512:12ca:b0:540:3571:fea8 with SMTP id
 2adb3069b0e04-5439c245d40mr599749e87.12.1737111274150; 
 Fri, 17 Jan 2025 02:54:34 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:33 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:36 +0100
Message-ID: <20250117105354.618220-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111274; x=1737716074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbhhcmORpjpH6dJZz5aHt98zpoePRN1x0LzKt8wHhK4=;
 b=aJPGxYrS5VDfUftxgmXHUr4fvhzutTO37HnSosBIgcpa6tNdgeAhy18YVDsq7Z1Tr9
 +XaoOIpg2J1kCE92Jqu6Qx5DvhVDQkj0PZt4HhcsaOeEgHWGm4BHU463D6418b1UNhCp
 KyUoqo5SgMoOJ1k7y+l86DplS9cvp0UbDc0CqF574bWH4gRO2H+qOaVRcc7qK2QIlIHP
 LLFLmnDC6f6RCWn+7zHT3o4C6OBv/75b2tDjyCDdmmGsuu02QqJmaGx6jWHqhVOQH/GZ
 hpJBTBTyPYbeAvAdp/B9pt9TR5vwmWqgcchSEGFK1APqEEcGMvVeAb3jjB1JY3ODLgQ2
 DtAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aJPGxYrS
Subject: [Buildroot] [PATCH 13/19] package/qt6/qt6multimedia: gather all
 code related to each option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 39 ++++++++++++++--------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index fa30475ad4..032eadefa5 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -38,19 +38,7 @@ QT6MULTIMEDIA_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_TESTS=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DFEATURE_alsa=OFF \
-	-DFEATURE_ffmpeg=OFF \
-	-DFEATURE_gstreamer=OFF \
-	-DFEATURE_gstreamer_1_0=OFF \
-	-DFEATURE_gstreamer_app=OFF \
-	-DFEATURE_gstreamer_gl=OFF \
-	-DFEATURE_gstreamer_photography=OFF \
-	-DFEATURE_linux_dmabuf=OFF \
-	-DFEATURE_linux_v4l=OFF \
-	-DFEATURE_pulseaudio=OFF \
-	-DFEATURE_spatialaudio=OFF \
-	-DFEATURE_spatialaudio_quick3d=OFF \
-	-DFEATURE_vaapi=OFF
+	-DFEATURE_gstreamer_gl=OFF
 
 QT6MULTIMEDIA_DEPENDENCIES = \
 	qt6base \
@@ -64,6 +52,8 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
 QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES),y)
@@ -76,6 +66,8 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
@@ -84,40 +76,59 @@ QT6MULTIMEDIA_CONF_OPTS += \
 	-DFEATURE_gstreamer_1_0=ON \
 	-DFEATURE_gstreamer_app=ON
 QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+QT6MULTIMEDIA_CONF_OPTS += \
+	-DFEATURE_gstreamer=OFF \
+	-DFEATURE_gstreamer_1_0=OFF \
+	-DFEATURE_gstreamer_app=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=ON
 QT6MULTIMEDIA_DEPENDENCIES += gst1-plugins-bad
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
 QT6MULTIMEDIA_DEPENDENCIES += libgbm libegl
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=ON
 QT6MULTIMEDIA_DEPENDENCIES += linux
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
 QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
-
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
 QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=OFF
 endif
+
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=ON
 QT6MULTIMEDIA_DEPENDENCIES += libva
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
