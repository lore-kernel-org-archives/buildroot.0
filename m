Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A155C02187
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 15:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC80F410E8;
	Sun, 19 Jan 2025 15:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsnLzpPYOz7w; Sun, 19 Jan 2025 15:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1E740AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1E740AB9;
	Sun, 19 Jan 2025 15:11:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E8DD2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E77556079E
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rk7VpnEKjJF for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 15:11:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59C8460792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C8460792
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59C8460792
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:11:26 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so3495979e87.2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 07:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737299484; x=1737904284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+sHuNXI/KLzgGOaC7oIB/wMuFPOiqtWn1Te0q6Z16s=;
 b=vjn9zXWWJI2Bnp8usKj/gtSi095ZNgeNpogGsjQnfJ4pYbcB6zAk0ugyN6O6pdDyta
 9YY4AQeGiJPx/5pgaVsutgcIfVss631mlFwYgRjtAPm0K8di3XtIakYBHbfqQL1wSK7H
 Fjwy84nKKS3xQi6m5pRz6rEw+sd50kBB6LijvLFSqBt9QyfALdtTOOQNm0DSHXhxzB7E
 J0pgsQ+uC0QO4di+Oso5YrcpwOd2czGkicDV6lTNc83MAVpxVPTo7hjUMw+ZPYVczQSh
 KGI0WVjtjxygrmxCveD3d8qIyucA/CK0iaGNDfdIa/LpM/4iTnuREFO8YGg2hzJGyl1a
 ZWUQ==
X-Gm-Message-State: AOJu0YwHoTY4FWLb4DHUxhlFmsjbYxOh1XXNY4QBnuPbJJ71ngqNs+yF
 eoA/cA3bpVdRteLmT/iJoKtYm+JHzs2WrHPPeiSlSboK2xu/aNcAyFG8zw==
X-Gm-Gg: ASbGncsMM5tCLVsj4mUkUAIcw4Df97Wt9RFCavScJunYLDaUrkFrYQJIfm5yk2HHlGc
 HjBmQJvJuPZyLNzZE8r2CYYtFOun3hCTnpfRGjUYcjSnvSL42psRmga29Yv0yJcXsp2n/T1PEXF
 YAHTqOm63lS2OiIyKuo7OaNsbSWiCKfxH0dRKutpDtbfhYGUwB6eJKredZMYHypd8RcrFFoAtki
 /KSshxewPIgi2eTT3eKPbdmGlt+HtNlI0G4za+gu5k7WQFFS5OSHzUZJfqhGaAsdz33/FxIvi0K
 GsT/Kp2OEp5LxHuNpCRVFmWl
X-Google-Smtp-Source: AGHT+IHByQ9ffT9WTiFOYJFkPGC1vW9YBroktNe1+V1wx21zyIn112n18ROtd1MLrlDMdzIEZU/Cwg==
X-Received: by 2002:a05:6512:691:b0:541:cdef:7ca3 with SMTP id
 2adb3069b0e04-5439c244ee7mr3442119e87.27.1737299483481; 
 Sun, 19 Jan 2025 07:11:23 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60c8asm1040297e87.112.2025.01.19.07.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2025 07:11:21 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 19 Jan 2025 16:10:36 +0100
Message-ID: <20250119151037.23295-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737299484; x=1737904284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+sHuNXI/KLzgGOaC7oIB/wMuFPOiqtWn1Te0q6Z16s=;
 b=GfehEMhUF3JFar4nZKyd93RDe+vz7LoIPtrgs4AKEjKY6+bCP6/d6P7wsyh1Ik8Gr0
 lV2ZTwaCRfoTkUIGvu+2FsJDJpu/VaO1YUlrYC5rY6sKPBW5I+GcwFpnb3TbAzfEbtZJ
 Ny8um3ZLZhyHLsyPvvj7Mx/RU6enMVfAiyqI/gmtd1GZUDXJsQS9P1fmRFLTBilux5Nc
 0HCIuR86Dhs4Z/QPYIIj3iNVMMGAGxHzAZgj/gmIiYb647Tc9OfLsU+IBvkBcR8ez3yj
 g1fAZCbz/3p11ZkiOVnxXNEXnDHdSBcpZAdq/JvMcvT1tL+jOo2an3Nxy6zH6+DRnZNy
 Icfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GfehEMhU
Subject: [Buildroot] [PATCH v5] package/qt6/qt6multimedia: new package
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
[Roy:
  - see [1] for original patch by baxiche su
  - fix commit message
  - fix warnings reported by check-package
  - bump version to 6.8.1
  - remove some irrelevant license files
  - list only overall license
  - set license files unconditionally
  - set dependencies after conf-opts
  - sort conf-opts
  - set BUILD_WITH_PCH=OFF
  - add option to enable examples
  - simplify help text
  - remove useless comment
  - gather all code related to each option
  - split lists over multiple lines
  - sort 'depends on' and 'select' lines
  - fix 'selects' typo
  - be consistent in using '.' at end of help text
  - remove the explicit v4l option
  - improve 'spatial audio module' help text
]
[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240920160500.18551-1-baxiche@gmail.com/
Co-authored-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v4 -> v5:
  - Roy: squash the commits  (suggested by Julien)

 DEVELOPERS                                   |   3 +
 package/qt6/Config.in                        |   1 +
 package/qt6/qt6multimedia/Config.in          | 113 ++++++++++++++++
 package/qt6/qt6multimedia/qt6multimedia.hash |  24 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 131 +++++++++++++++++++
 5 files changed, 272 insertions(+)
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
index 0000000000..0eddfa644e
--- /dev/null
+++ b/package/qt6/qt6multimedia/Config.in
@@ -0,0 +1,113 @@
+config BR2_PACKAGE_QT6MULTIMEDIA
+	bool "qt6multimedia"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6SHADERTOOLS
+	help
+	  This package provides Qt6 Multimedia:
+
+	  https://doc.qt.io/qt-6/qtmultimedia-index.html
+	  https://code.qt.io/cgit/qt/qtmultimedia.git
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
+	  This option selects Alsa as audio backend.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
+	bool "examples"
+	help
+	  This option enables the Qt6 Multimedia examples.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
+	bool "ffmpeg plugin"
+	# qt6-multimedia ffmpeg plugin needs
+	# qt6base-concurrent, PulseAudio and ffmpeg-swcale.
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_PULSEAUDIO
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
+	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	help
+	  This option enables ffmpeg media backend.
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
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GSTREAMER1
+	help
+	  This option enables gstreamer media backend.
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
+	  This option enables gstreamer-opengl support.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
+	bool "photography support"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  This option enables gstreamer-photography support.
+
+endif
+
+comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
+	depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+	bool "linux dma buffer support"
+	# qt6 configure script needs EGL to check
+	# for linux dma buffer support
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	help
+	  This option enables the linux dma buffer support.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	bool "pulseaudio support"
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  This option selects PulseAudio as audio backend.
+
+config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
+	bool "spatial audio module"
+	help
+	  This option enables the Qt6 Spatial Audio module.
+
+	  https://doc.qt.io/qt-6/qtspatialaudio-index.html
+
+endif
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
new file mode 100644
index 0000000000..cddafb56a8
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -0,0 +1,24 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
+sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
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
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
new file mode 100644
index 0000000000..efc6436e9b
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -0,0 +1,131 @@
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
+QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
+
+QT6MULTIMEDIA_LICENSE_FILES = \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSD-Source-Code.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/IJG.txt \
+	LICENSES/ISC.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/MIT.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/Zlib.txt \
+	src/3rdparty/eigen/COPYING.BSD \
+	src/3rdparty/eigen/COPYING.MPL2 \
+	src/3rdparty/eigen/COPYRIGHTS \
+	src/3rdparty/pffft/COPYRIGHTS \
+	src/3rdparty/pffft/LICENSE
+
+QT6MULTIMEDIA_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DFEATURE_gstreamer_gl=OFF
+
+QT6MULTIMEDIA_DEPENDENCIES = \
+	qt6base \
+	qt6shadertools
+
+# for multimedia quick module
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
+QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES),y)
+QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+QT6MULTIMEDIA_DEPENDENCIES += qt6svg
+else
+QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
+QT6MULTIMEDIA_CONF_OPTS += \
+	-DFEATURE_gstreamer=ON \
+	-DFEATURE_gstreamer_1_0=ON \
+	-DFEATURE_gstreamer_app=ON
+QT6MULTIMEDIA_DEPENDENCIES += \
+	gst1-plugins-base \
+	gstreamer1
+else
+QT6MULTIMEDIA_CONF_OPTS += \
+	-DFEATURE_gstreamer=OFF \
+	-DFEATURE_gstreamer_1_0=OFF \
+	-DFEATURE_gstreamer_app=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=ON
+QT6MULTIMEDIA_DEPENDENCIES += gst1-plugins-bad
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
+QT6MULTIMEDIA_DEPENDENCIES += \
+	libgbm \
+	libegl
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
+QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
+ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
+QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=OFF
+endif
+
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=ON
+QT6MULTIMEDIA_DEPENDENCIES += libva
+else
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
