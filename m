Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F0DC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE5A60835;
	Fri, 17 Jan 2025 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QqgutKmKPXk; Fri, 17 Jan 2025 10:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78501607A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78501607A9;
	Fri, 17 Jan 2025 10:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4F3B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DDA607B3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlTPzqSkcOUP for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CF756078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF756078E
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CF756078E
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so1942131e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111244; x=1737716044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJfjXlIGN5BePPXK5j2V95dc79djGAnXl/3LhEThBCQ=;
 b=XYgFdKPKHCRU7Op+PeWg2bXtmehuSkJ1LVDc/5fh/OwfNp4G+PXIsiQbc5d23jT3nL
 0y0aF6f0pv2o4aiRS7YXil3vZRUJGyKtgYdWUUIdNIRqPGXW/i6V32nRb2/NiuHfl1sm
 4seurXvQtkB3gar2pqcDLYmLxhroIULX09XKnVmECuI+2cEwf/1jgPeEyedKxj6h7Ndy
 xWdTmkea0DWx1fM0b1A86dqUuoE7iF/SeXbrppJggylxt5hkZbtOsJv2cIKnnyNsY9DJ
 iA6xycPwDj+fBeO+H5pMgYsr4iu5Ciwc6Lq1ppesOV1w6ahXjjKdM7Wywmppm4mVLr9z
 0XDw==
X-Gm-Message-State: AOJu0YyuPn0OHvt0e6O0HXDL186d5wCVYS+A7Cv38AUT60CF5XsPp4mx
 S0IeXImo73qVuzZV+6rJ2bpllb0pzfpWsWcloIbuwaxZeq+4JeN0fYgFOA==
X-Gm-Gg: ASbGncs8pCHuy6hzr7XAWjprFcsgoTTocc2SqQfNUMNukipVRYjspJCCPW6ch7s5hRZ
 d25PkJ6K6liyPdNcziHhev6LW5Ya7Oau3m45abHMtXgG/tS6pMcdM0eKi7G/HpZ7ZZQEvnbKrkI
 oONtcEUljcJlBXR5RFBEO6Cu7ZDro1T1RloCdR7/+p+urtUghNt7vfPdZM/4V3PiMr120qVnPup
 W5kf/K57yoY6KTPntaEk621XfQuuOX5g8n+4xXvHJJ/g/a3wZfqaWsfLP7RlMoGm32dzwWuX+jf
 lqe4pi3BmUs=
X-Google-Smtp-Source: AGHT+IEwCt3+RC0pd0m6iSr/uexKE33+/Ie4Zn89ObVOKzKxzVY9joCStwdbqSTfSi17ivaMuX6Ybw==
X-Received: by 2002:ac2:4c83:0:b0:53e:38df:673d with SMTP id
 2adb3069b0e04-5439c287d42mr670574e87.43.1737111243815; 
 Fri, 17 Jan 2025 02:54:03 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:02 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:25 +0100
Message-ID: <20250117105354.618220-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111244; x=1737716044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJfjXlIGN5BePPXK5j2V95dc79djGAnXl/3LhEThBCQ=;
 b=Vb62rWrWBhVzo9JyqYDEkMfhwnjUL2Hjih9OKDz0w4dqIru9fMDc/FXQvQUl1WrQvP
 D8SQaMImrehECQHltDFR8G5zq7poyIMiuBMTJOcrhyOJrCRyxVq63rwOW9OUJ+yTTBLi
 SiuZR2P4UHSwxLo6NysRmSsSLaKjbBRk+CQfb3ZZaxFPRfS7nNastxM/NwKoHrHvvcJe
 g164gWtm+dMBt5Wl2UEZak1K8+PySORog1cQc4l9rfZDbSPb7BFBnU65T+unt9UP8U5W
 3qLy/2EzMQeM2pA8nHPAp2KF9T9B1n/ZAnX0pKuneWQ0SgZeSaX1R31k/mSYBuUg4Wpk
 xOeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vb62rWrW
Subject: [Buildroot] [PATCH 02/19] package/qt6/qt6multimedia: fix warnings
 reported by check-package
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
 package/qt6/qt6multimedia/Config.in        |  37 ++++---
 package/qt6/qt6multimedia/qt6multimedia.mk | 112 ++++++++++-----------
 2 files changed, 74 insertions(+), 75 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index 1aebef840d..ae84ec24a1 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -5,13 +5,12 @@ config BR2_PACKAGE_QT6MULTIMEDIA
 	select BR2_PACKAGE_QT6SHADERTOOLS
 
 	help
-    	  Qt Multimedia is an add-on module that provides 
-  	  a rich set of QML types and C++ classes to handle 
-  	  multimedia content. It contains an easy to use API 
-  	  for playing back audio and video files and rendering 
-  	  those on screen, as well as a comprehensive API for 
-  	  recording audio and video from the system's cameras 
-  	  and microphones.
+	  Qt Multimedia is an add-on module that provides  a rich set
+	  of QML types and C++ classes to handle multimedia content. It
+	  contains an easy to use API for playing back audio and video
+	  files and rendering those on screen, as well as a
+	  comprehensive API for recording audio and video from the
+	  system's cameras and microphones.
 
 	  https://doc.qt.io/qt-6/qtmultimedia-index.html
 
@@ -22,23 +21,23 @@ comment "alsa support requires disabling pulseaudio"
 
 config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 	bool "alsa support"
-	# qt6-multimedia audio backend requires selection 
+	# qt6-multimedia audio backend requires selection
 	# of either PulseAudio or ALSA.
 	depends on !BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	select BR2_PACKAGE_ALSA_LIB
-	help 
+	help
 	  This option select Alsa as audio backend.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	bool "ffmpeg plugin"
-	# qt6-multimedia ffmpeg plugin needs 
+	# qt6-multimedia ffmpeg plugin needs
 	# qt6base-concurrent, PulseAudio and ffmpeg-swcale.
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_PULSEAUDIO
-	help 
+	help
 	  This option enables ffmpeg media backend
 
 if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
@@ -52,18 +51,18 @@ config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
 	select BR2_PACKAGE_LIBVA
 	# ffmpeg-vaapi support needs qt6base-opengl
 	select BR2_PACKAGE_QT6BASE_OPENGL
-	help 
+	help
 	  This option enables the vaapi support.
 endif
 
 config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 	bool "gstreamer plugin"
-	# gstreamer 1.x and gst-plugins-base-app are required 
+	# gstreamer 1.x and gst-plugins-base-app are required
 	# for gstreamer support in qt6-multimedia
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
-	help 
+	help
 	  This option enables gstreamer media backend
 
 if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
@@ -92,26 +91,26 @@ comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
 config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	bool "linux dma buffer support"
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
-	# qt6 configure script needs EGL to check 
+	# qt6 configure script needs EGL to check
 	# for linux dma buffer support
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	help 
+	help
 	  This option enables the linux dma buffer support
 
 config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
 	bool "v4l support"
-	help 
+	help
 	  This option enables the video for linux support
 
 config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
 	select BR2_PACKAGE_PULSEAUDIO
-	help 
+	help
 	  This option select PulseAudio as audio backend.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
 	bool "spatial audio module"
-	help 
+	help
 	  This option enables the Qt6SpatialAudio library.
 
 endif
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index ec81abc1de..69f4520cec 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -12,41 +12,41 @@ QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 
 QT6MULTIMEDIA_LICENSE = \
-    BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
-    GFDL-1.3-no-invariants (docs), \
-    GPL-3.0 (tests), \
-    GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
-    LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+	BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6MULTIMEDIA_LICENSE_FILES = \
-    LICENSES/BSD-3-Clause.txt \
-    LICENSES/GFDL-1.3-no-invariants-only.txt \
-    LICENSES/GPL-2.0-only.txt \
-    LICENSES/GPL-3.0-only.txt \
-    LICENSES/LGPL-3.0-only.txt \
-    LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6MULTIMEDIA_DEPENDENCIES = \
-    qt6base \
-    qt6shadertools
+	qt6base \
+	qt6shadertools
 
 QT6MULTIMEDIA_CONF_OPTS = \
-    -DQT_HOST_PATH=$(HOST_DIR) \
-    -DQT_BUILD_EXAMPLES=OFF \
-    -DQT_BUILD_TESTS=OFF \
-    -DFEATURE_alsa=OFF \
-    -DFEATURE_ffmpeg=OFF \
-    -DFEATURE_gstreamer=OFF \
-    -DFEATURE_gstreamer_1_0=OFF \
-    -DFEATURE_gstreamer_app=OFF \
-    -DFEATURE_gstreamer_gl=OFF \
-    -DFEATURE_gstreamer_photography=OFF \
-    -DFEATURE_linux_dmabuf=OFF \
-    -DFEATURE_linux_v4l=OFF \
-    -DFEATURE_pulseaudio=OFF \
-    -DFEATURE_spatialaudio=OFF \
-    -DFEATURE_spatialaudio_quick3d=OFF \
-    -DFEATURE_vaapi=OFF
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_alsa=OFF \
+	-DFEATURE_ffmpeg=OFF \
+	-DFEATURE_gstreamer=OFF \
+	-DFEATURE_gstreamer_1_0=OFF \
+	-DFEATURE_gstreamer_app=OFF \
+	-DFEATURE_gstreamer_gl=OFF \
+	-DFEATURE_gstreamer_photography=OFF \
+	-DFEATURE_linux_dmabuf=OFF \
+	-DFEATURE_linux_v4l=OFF \
+	-DFEATURE_pulseaudio=OFF \
+	-DFEATURE_spatialaudio=OFF \
+	-DFEATURE_spatialaudio_quick3d=OFF \
+	-DFEATURE_vaapi=OFF
 
 # for multimedia quick module
 ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
@@ -62,27 +62,27 @@ ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 QT6MULTIMEDIA_LICENSE += , \
-    BSL-1.0 (ffmpeg-boost), \
-    IJG (ffmpeg-libjpeg), \
-    LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and MIT and MPL-2.0 (ffmpeg), \
-    Zlib (ffmpeg-zlib)
+	BSL-1.0 (ffmpeg-boost), \
+	IJG (ffmpeg-libjpeg), \
+	LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and MIT and MPL-2.0 (ffmpeg), \
+	Zlib (ffmpeg-zlib)
 QT6MULTIMEDIA_LICENSE_FILES += \
-    LICENSES/BSD-2-Clause.txt \
-    LICENSES/BSD-Source-Code.txt \
-    LICENSES/BSL-1.0.txt \
-    LICENSES/IJG.txt \
-    LICENSES/ISC.txt \
-    LICENSES/LGPL-2.1-or-later.txt \
-    LICENSES/MIT.txt \
-    LICENSES/MPL-2.0.txt \
-    LICENSES/Zlib.txt
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-Source-Code.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/IJG.txt \
+	LICENSES/ISC.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/Zlib.txt
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
 QT6MULTIMEDIA_CONF_OPTS += \
-    -DFEATURE_gstreamer=ON \
-    -DFEATURE_gstreamer_1_0=ON \
-    -DFEATURE_gstreamer_app=ON 
+	-DFEATURE_gstreamer=ON \
+	-DFEATURE_gstreamer_1_0=ON \
+	-DFEATURE_gstreamer_app=ON
 QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
@@ -109,18 +109,18 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
 QT6MULTIMEDIA_LICENSE += , \
-    Apache-2.0 (resonance-audio, eigen), \
-    LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
-    MPL-2.0 and BSD-3-Clause (eigen)
+	Apache-2.0 (resonance-audio, eigen), \
+	LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
+	MPL-2.0 and BSD-3-Clause (eigen)
 QT6MULTIMEDIA_LICENSE_FILES += \
-    LICENSES/MPL-2.0.txt \
-    src/3rdparty/eigen/COPYING.BSD \
-    src/3rdparty/eigen/COPYING.MPL2 \
-    src/3rdparty/eigen/COPYRIGHTS \
-    src/3rdparty/pffft/COPYRIGHTS \
-    src/3rdparty/pffft/LICENSE \
-    src/3rdparty/resonance-audio/COPYRIGHTS \
-    src/3rdparty/resonance-audio/LICENSE
+	LICENSES/MPL-2.0.txt \
+	src/3rdparty/eigen/COPYING.BSD \
+	src/3rdparty/eigen/COPYING.MPL2 \
+	src/3rdparty/eigen/COPYRIGHTS \
+	src/3rdparty/pffft/COPYRIGHTS \
+	src/3rdparty/pffft/LICENSE \
+	src/3rdparty/resonance-audio/COPYRIGHTS \
+	src/3rdparty/resonance-audio/LICENSE
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
