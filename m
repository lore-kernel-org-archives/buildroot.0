Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B770C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484106FB7E;
	Fri, 17 Jan 2025 10:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNHQMn1AJZIF; Fri, 17 Jan 2025 10:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50CFD6FB5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CFD6FB5C;
	Fri, 17 Jan 2025 10:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE5D094B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF4146FB7B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBn-rz_xFUpf for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A65406FB64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65406FB64
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A65406FB64
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:10 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5401c52000dso2089810e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111008; x=1737715808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbhhcmORpjpH6dJZz5aHt98zpoePRN1x0LzKt8wHhK4=;
 b=Mnoa7Es0+fBTByRfF6iXrmQ2ttg/ZTxW9k8V4EbZ05dWiL9BE7Khsf9XsFzWgOZRC2
 25XVLxIPSz1HOUX2kGWgL8H+PCfkDh+mZ0Saxso9saXxAX0nVjf3JIdq8vZC6wQIhcT0
 8S2m1wJ2qIvSbaOjybIl7Agpz2EA2ufudSLAPIruZDNFAV0Ko/3VX7rwJAN836i1xdaH
 yrJ1vcZJCVuWKm9L1SIJLhUNz9SVUCYeNggwyFOHVIv9Y+Dcc/q+z1CwBW9o3CBzCwqv
 LfSHczHBOmABblBmMabDcOMciU0N7uZWhYyibblF+0T/XlKFeW7ZSNhL6wCYmso1cDkk
 W9Aw==
X-Gm-Message-State: AOJu0YwAich1avY5OMT2J8wKw4nCy06E1N+37iNxi4L/yUTylMJdcj8b
 Kuwktzg+OCfqef5GYB3M0Q0WL/JpVVRrpUcVTacFzl70Jy8H4EstXcRaxg==
X-Gm-Gg: ASbGncuzRJ/xOwzZ6Hna3XpJBltJBp0WzbG7qkTaqlgTTrVrkBy20KP1X2JRKJq/ILl
 7YJfaLa2SO9CH/lQONi+c2hXFadFoIJQ3MSISCm4JsxtXvzRuGXKTpLzk7/MqLbX92LEdelanDW
 2bzfENYmWmopMLrc7Gig9EWAJRAxRsQoid1m7ZzSWvx4WhHA4tOQgRnGvkTsRsDQT0JlZsOyr4+
 KkiUQQoYMQBDpZEdekPRLmrzAJKS8ovFMjMGx35x3v+7c+5RUrRo9R1fdxYCAZsOTYjeI0tlc+U
 7rJaM8QdZ1g=
X-Google-Smtp-Source: AGHT+IFFZvcuYnh5iXnl3gdUkT1ceP/cQLr4JPwklLfmSTiBiK/pGQcvh2IEje/EhgNMwpOxpbuNuw==
X-Received: by 2002:a05:6512:24d:b0:53e:39c2:f026 with SMTP id
 2adb3069b0e04-5439c229109mr518482e87.14.1737111008305; 
 Fri, 17 Jan 2025 02:50:08 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:06 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:53 +0100
Message-ID: <20250117104911.613221-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111008; x=1737715808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbhhcmORpjpH6dJZz5aHt98zpoePRN1x0LzKt8wHhK4=;
 b=nSvlVsFqn4koU9kmkvbS/ZA1kP3aOUFpvYDb16LUHLvE919tkR3HPZixyacZDY9CtK
 E+PBrrorrPcS3X0VmcfxpGJGGbeGnXq51vFtNDqkuSzkXgQgdF5dJkQGAEeHuU8qcR5U
 TS06Kc2WJnamUk0OAlOv9jzVHb0DUBzE8NfkYth62OJ2IQwTVHLogr8ad+kCtR2KTF/p
 acSmNnY2dyOAqnhr9ify0we+ZAubkMaRF3AxByqa/tzl9jEAl847pnE/oIvAJb6EkP66
 FKbEMCXCQVmKczct4dviWgCXvLan8Rf6hyF53BiRXhZTzQ1o1LHoqOQImwsZe/b94S27
 U7sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nSvlVsFq
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
