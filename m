Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE01C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4932740879;
	Fri, 17 Jan 2025 10:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id To4EyQ0mvUnF; Fri, 17 Jan 2025 10:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8808240833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8808240833;
	Fri, 17 Jan 2025 10:54:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47776B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C3FB4013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyE96LLPtY4n for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06FB240283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06FB240283
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06FB240283
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso2186265e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111241; x=1737716041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bx0w/uH63FQjwNUXhGz0JjZbKa3oVnnUOfYFXgpPkBU=;
 b=aVasUyXsyVBmJfqG6D9iwRKGL6tyr3pID6AxY7iCvR7yM7IgS4pvjMJjaaAVuXhXjT
 nUWZbr3Sv8xhY12n6ej2CdGiUbYIVFQHfHRh6kE5FwnlJhp0wf1pjw98o3BPAHub5Ozv
 5igkfbcMT0+KuSszXuHon0KslEkDc8G8pn4sqXLZmmlmPu4PbM4j4KBJGYObXRuwbu0e
 qcOsvuSBVTS+kl7Bsv6Hq5SGr3DAXsSPiz7v0K5LSF9KoJBkHG11KUQz1Gank6xcg5K7
 ubTRIqSMA8Oz7vePoUFQXjryz9ug8Ehub1ptcOGwD1L9AuIPCQ6eXXrMYEIsQBuKCMQu
 5fwg==
X-Gm-Message-State: AOJu0YwLCAYRtUYPXNUbWOdPb3mwPqySpCbHRhbaF9h/d5zOzoqTLI7n
 SX/a9D0yFs5Gz4NfQGOttbJvBFCyW5TaT6Mg6MCgMrLy/E2sCh6Uqdb6Kg==
X-Gm-Gg: ASbGnctJb9iH0/OP5SPglRIgFV5c/ffVrndY73l1t1E09o87eY5Q4ubIPZqpzSdx1lC
 +0fNR4bEJKBTgEZZczfeXzK1rg6LEyjemM2OuPxll+jyk69qz9aJh6WUyV282YDJ0Y8s0xtDStG
 8HpcmY8Uc164cgPH7rv1zDBeHtqJgWXvZAEDi2ItvemF7sfImoD+yuHE1Yv2WmM9Xdhb3qKKfGt
 lz69nQ/f0UbZnNGbFYALSTy6LEX/bLqXtG5Drf4jN2gT8LFUXBv2ERcvQnsz5PmW53a+5M8CCnc
 9E88eLAka40=
X-Google-Smtp-Source: AGHT+IFf6MRPuxaptADpFJfnMX/ZAi3Mwm2VnynbYcOD0yxOHVrkgY9RE3qlB5v4q6yv/3Aj93E3gg==
X-Received: by 2002:ac2:4aca:0:b0:542:6f2a:946a with SMTP id
 2adb3069b0e04-5439c21f309mr437083e87.6.1737111240405; 
 Fri, 17 Jan 2025 02:54:00 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:53:58 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:24 +0100
Message-ID: <20250117105354.618220-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111241; x=1737716041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bx0w/uH63FQjwNUXhGz0JjZbKa3oVnnUOfYFXgpPkBU=;
 b=nsVENPYT2B16v+lx2AtfBQkE83vZH6pq0rMhBF2+u1QgbS2o4cXqLsZ8NTKe1rXSR/
 18ROeDqqvYUyt8n6rANiYHTO9rSTbAUNY1gPdaRujiT0ysVII9dJWS63URMhkf5fNcw5
 XxGPHpthZ8M63qK8tE9iYXcxZhGKpzhDROf1S1kL4sYvbE+Syyo8HMKdNoORkFqI3EvO
 UGyvmpZhqrrtiuomCxIWJAlTeve8Bs3My1q9XfjSEGmEoIy3a70QxCzliFXIwJyY4gig
 ovo9Hqd4hGtP1utqtkQ0LTucq4iAy58FeDP5KDqemLiYqfqNnlrUqaDPNtJnWknERdDF
 CtSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nsVENPYT
Subject: [Buildroot] [PATCH 01/19] package/qt6/qt6multimedia: new package
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

From: baxiche su <baxiche@gmail.com>

Signed-off-by: baxiche su <baxiche@gmail.com>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 DEVELOPERS                                   |   3 +
 package/qt6/Config.in                        |   1 +
 package/qt6/qt6multimedia/Config.in          | 117 ++++++++++++++++
 package/qt6/qt6multimedia/qt6multimedia.hash |  26 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 137 +++++++++++++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 package/qt6/qt6multimedia/Config.in
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d8ae8289b..a047fdfc19 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -329,6 +329,9 @@ F:	package/tcpdump/
 F:	package/ti-uim/
 F:	package/uhubctl/
 
+N:	Baxiche Su <baxiche@gmail.com>
+F:	package/qt6/qt6multimedia
+
 N:	Ben Boeckel <mathstuf@gmail.com>
 F:	package/taskd/
 
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 80c417809d..10594691cf 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -50,6 +50,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
+source "package/qt6/qt6multimedia/Config.in"
 source "package/qt6/qt6opcua/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
new file mode 100644
index 0000000000..1aebef840d
--- /dev/null
+++ b/package/qt6/qt6multimedia/Config.in
@@ -0,0 +1,117 @@
+config BR2_PACKAGE_QT6MULTIMEDIA
+	bool "qt6multimedia"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6SHADERTOOLS
+
+	help
+    	  Qt Multimedia is an add-on module that provides 
+  	  a rich set of QML types and C++ classes to handle 
+  	  multimedia content. It contains an easy to use API 
+  	  for playing back audio and video files and rendering 
+  	  those on screen, as well as a comprehensive API for 
+  	  recording audio and video from the system's cameras 
+  	  and microphones.
+
+	  https://doc.qt.io/qt-6/qtmultimedia-index.html
+
+if BR2_PACKAGE_QT6MULTIMEDIA
+
+comment "alsa support requires disabling pulseaudio"
+	depends on BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+
+config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
+	bool "alsa support"
+	# qt6-multimedia audio backend requires selection 
+	# of either PulseAudio or ALSA.
+	depends on !BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	select BR2_PACKAGE_ALSA_LIB
+	help 
+	  This option select Alsa as audio backend.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
+	bool "ffmpeg plugin"
+	# qt6-multimedia ffmpeg plugin needs 
+	# qt6base-concurrent, PulseAudio and ffmpeg-swcale.
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
+	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_PULSEAUDIO
+	help 
+	  This option enables ffmpeg media backend
+
+if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
+
+comment "VAAPI support needs Linux DMA buffer feature"
+	depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+
+config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
+	bool "vaapi support"
+	depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+	select BR2_PACKAGE_LIBVA
+	# ffmpeg-vaapi support needs qt6base-opengl
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	help 
+	  This option enables the vaapi support.
+endif
+
+config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
+	bool "gstreamer plugin"
+	# gstreamer 1.x and gst-plugins-base-app are required 
+	# for gstreamer support in qt6-multimedia
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help 
+	  This option enables gstreamer media backend
+
+if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
+
+comment "GStreamer OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL
+	bool "opengl support"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	help
+	  This option enables gstreamer-opengl support
+
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
+	bool "photography support"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  This option enables gstreamer-photography support
+
+endif
+
+comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
+	depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+	bool "linux dma buffer support"
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	# qt6 configure script needs EGL to check 
+	# for linux dma buffer support
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	help 
+	  This option enables the linux dma buffer support
+
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
+	bool "v4l support"
+	help 
+	  This option enables the video for linux support
+
+config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	bool "pulseaudio support"
+	select BR2_PACKAGE_PULSEAUDIO
+	help 
+	  This option select PulseAudio as audio backend.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
+	bool "spatial audio module"
+	help 
+	  This option enables the Qt6SpatialAudio library.
+
+endif
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
new file mode 100644
index 0000000000..b63aedc1d9
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -0,0 +1,26 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
+sha256  8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3  qtmultimedia-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files
+sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0  LICENSES/BSD-Source-Code.txt
+sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a  LICENSES/IJG.txt
+sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d  LICENSES/Zlib.txt
+sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e  src/3rdparty/eigen/COPYING.BSD
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/eigen/COPYING.MPL2
+sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
+sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934  src/3rdparty/pffft/COPYRIGHTS
+sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/pffft/LICENSE
+sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac  src/3rdparty/resonance-audio/COPYRIGHTS
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/resonance-audio/LICENSE
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
new file mode 100644
index 0000000000..ec81abc1de
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -0,0 +1,137 @@
+################################################################################
+#
+# qt6multimedia
+#
+################################################################################
+
+QT6MULTIMEDIA_VERSION = $(QT6_VERSION)
+QT6MULTIMEDIA_SITE = $(QT6_SITE)
+QT6MULTIMEDIA_SOURCE = qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA_VERSION).tar.xz
+QT6MULTIMEDIA_INSTALL_STAGING = YES
+QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6MULTIMEDIA_CMAKE_BACKEND = ninja
+
+QT6MULTIMEDIA_LICENSE = \
+    BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
+    GFDL-1.3-no-invariants (docs), \
+    GPL-3.0 (tests), \
+    GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
+    LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+
+QT6MULTIMEDIA_LICENSE_FILES = \
+    LICENSES/BSD-3-Clause.txt \
+    LICENSES/GFDL-1.3-no-invariants-only.txt \
+    LICENSES/GPL-2.0-only.txt \
+    LICENSES/GPL-3.0-only.txt \
+    LICENSES/LGPL-3.0-only.txt \
+    LICENSES/Qt-GPL-exception-1.0.txt \
+
+QT6MULTIMEDIA_DEPENDENCIES = \
+    qt6base \
+    qt6shadertools
+
+QT6MULTIMEDIA_CONF_OPTS = \
+    -DQT_HOST_PATH=$(HOST_DIR) \
+    -DQT_BUILD_EXAMPLES=OFF \
+    -DQT_BUILD_TESTS=OFF \
+    -DFEATURE_alsa=OFF \
+    -DFEATURE_ffmpeg=OFF \
+    -DFEATURE_gstreamer=OFF \
+    -DFEATURE_gstreamer_1_0=OFF \
+    -DFEATURE_gstreamer_app=OFF \
+    -DFEATURE_gstreamer_gl=OFF \
+    -DFEATURE_gstreamer_photography=OFF \
+    -DFEATURE_linux_dmabuf=OFF \
+    -DFEATURE_linux_v4l=OFF \
+    -DFEATURE_pulseaudio=OFF \
+    -DFEATURE_spatialaudio=OFF \
+    -DFEATURE_spatialaudio_quick3d=OFF \
+    -DFEATURE_vaapi=OFF
+
+# for multimedia quick module
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
+QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+QT6MULTIMEDIA_LICENSE += , \
+    BSL-1.0 (ffmpeg-boost), \
+    IJG (ffmpeg-libjpeg), \
+    LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and MIT and MPL-2.0 (ffmpeg), \
+    Zlib (ffmpeg-zlib)
+QT6MULTIMEDIA_LICENSE_FILES += \
+    LICENSES/BSD-2-Clause.txt \
+    LICENSES/BSD-Source-Code.txt \
+    LICENSES/BSL-1.0.txt \
+    LICENSES/IJG.txt \
+    LICENSES/ISC.txt \
+    LICENSES/LGPL-2.1-or-later.txt \
+    LICENSES/MIT.txt \
+    LICENSES/MPL-2.0.txt \
+    LICENSES/Zlib.txt
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
+QT6MULTIMEDIA_CONF_OPTS += \
+    -DFEATURE_gstreamer=ON \
+    -DFEATURE_gstreamer_1_0=ON \
+    -DFEATURE_gstreamer_app=ON 
+QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=ON
+QT6MULTIMEDIA_DEPENDENCIES += gst1-plugins-bad
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
+QT6MULTIMEDIA_DEPENDENCIES += libgbm libegl
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=ON
+QT6MULTIMEDIA_DEPENDENCIES += linux
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
+QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
+QT6MULTIMEDIA_LICENSE += , \
+    Apache-2.0 (resonance-audio, eigen), \
+    LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
+    MPL-2.0 and BSD-3-Clause (eigen)
+QT6MULTIMEDIA_LICENSE_FILES += \
+    LICENSES/MPL-2.0.txt \
+    src/3rdparty/eigen/COPYING.BSD \
+    src/3rdparty/eigen/COPYING.MPL2 \
+    src/3rdparty/eigen/COPYRIGHTS \
+    src/3rdparty/pffft/COPYRIGHTS \
+    src/3rdparty/pffft/LICENSE \
+    src/3rdparty/resonance-audio/COPYRIGHTS \
+    src/3rdparty/resonance-audio/LICENSE
+
+# for spatialaudio quick3d module
+ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
+QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=ON
+QT6MULTIMEDIA_DEPENDENCIES += libva
+endif
+
+$(eval $(cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
