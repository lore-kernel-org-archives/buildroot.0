Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34119C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 07:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE07605AE;
	Mon, 16 Sep 2024 07:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zv9yMt1_06Mv; Mon, 16 Sep 2024 07:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1CA6088B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C1CA6088B;
	Mon, 16 Sep 2024 07:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0A561BF5DD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 07:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD6E7406A1
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 07:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q37PX84aQ4mY for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 07:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=baxiche@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB0240698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB0240698
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB0240698
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 07:30:58 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso1951731b3a.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726471858; x=1727076658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1zHsaBZAuYgzIeRpVlgntGao4SXNB0VZHATQCoto3Zw=;
 b=k9TNYF46I0NYpsbN5FWITr9H1Qh7bgKb/QqK079eaIzECG0HkTMt6YD1DuxFSCrlvX
 nF3xN4GahP3kLwJRPzWFLVD6a86MmEBhVTQ19HZiMuibhLctp4jICytLRF25VeK0aSsu
 DNnkurY4pQi2TMu438jY1Hw6yi9ceOYLweluW8PvxqC7gNXGCwzYBUmV4oN70uWG7aa+
 oiCFiAnKIwNhxFHjKV3W0/miyEodkvCmGOxxqzKA5+RLfbQlEaPgx4Nnc8ZTz0vgYAXR
 DWK6TxHUWN9DloBe/WtT+Eny/IKW1GL/c7AoF/SIe+l0oYf9H7dgyUGrA8A6D3bz0r5K
 SNsg==
X-Gm-Message-State: AOJu0YxSKjU/DbiBM8erMR/HUr4guTcWpvlo6vXJppP37MCFY5hyHJEk
 yW0oPe5VVz2C0LroSbHfzdX20YGZqV0uI8o2Mb5XrTSmgamrOW/ljV2yd2tM
X-Google-Smtp-Source: AGHT+IGyEtjepaN/wetuGsSQ4LsWAsKAKA724kozZsytcoc1RCLoSzPnrA2oqzHlPhw3YWY3dB2OZw==
X-Received: by 2002:a05:6a00:3d0d:b0:718:dc17:3b83 with SMTP id
 d2e1a72fcca58-71936a84fd7mr17495421b3a.16.1726471857548; 
 Mon, 16 Sep 2024 00:30:57 -0700 (PDT)
Received: from localhost.localdomain (1-171-142-208.dynamic-ip.hinet.net.
 [1.171.142.208]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944a98c31sm3327778b3a.16.2024.09.16.00.30.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 16 Sep 2024 00:30:57 -0700 (PDT)
From: baxiche su <baxiche@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 15:29:59 +0800
Message-ID: <20240916072959.31094-1-baxiche@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726471858; x=1727076658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1zHsaBZAuYgzIeRpVlgntGao4SXNB0VZHATQCoto3Zw=;
 b=JrFbIvLlSM8KT/JadwxdBkEXp05UMtbcJaVUwno6YIrscPbs4u7S+KG6+VDIQRK2Qi
 noQP39ulXvADJhMZ5Q//7ZOFPFO+F/cjxDKtmsMAsAbanuXV9AYgWKMqNeRnbop38+Rq
 CSm27DqM+dsovhdA81w4Cih7WxUStgd6IhKzgIEH1MQ36XpHqKP7O3aT0DlK3pFI95Rq
 y5OXSjDguNmQRFW6AOTQfTaRVnH32bToslnR0nzgHOMFRlvsq1SWfR+IzJXVBeRnJdY5
 sYCt6Se/IcpuSTvej+3K1VnMjyzTKrbKtxpbOtleKJSqL0hoIFV9VT2sTPxG2AdyTs/V
 DK7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JrFbIvLl
Subject: [Buildroot] [PATCH v2 1/1] package/qt6: add qt6 multimedia
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
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: baxiche su <baxiche@gmail.com>
---
 DEVELOPERS                                   |  3 +
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6multimedia/Config.in          | 17 +++++
 package/qt6/qt6multimedia/qt6multimedia.hash | 13 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 80 ++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/qt6/qt6multimedia/Config.in
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 929e9f895f..56209f9970 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,6 +343,9 @@ F:	package/tcpdump/
 F:	package/ti-uim/
 F:	package/uhubctl/
 
+N:	Baxiche Su <baxiche@gmail.com>
+F:	package/qt6/qt6multimedia
+
 N:	Ben Boeckel <mathstuf@gmail.com>
 F:	package/taskd/
 
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4cbb60322c..debf4f4733 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
+source "package/qt6/qt6multimedia/Config.in"
 source "package/qt6/qt6opcua/Config.in"
 source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
new file mode 100644
index 0000000000..77ff3d28ae
--- /dev/null
+++ b/package/qt6/qt6multimedia/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT6MULTIMEDIA
+	bool "qt6multimedia"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
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
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
new file mode 100644
index 0000000000..855699fa2d
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -0,0 +1,13 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
+sha256  8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3  qtmultimedia-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
new file mode 100644
index 0000000000..ed405fe7d0
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -0,0 +1,80 @@
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
+
+QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6MULTIMEDIA_CMAKE_BACKEND = ninja
+
+QT6MULTIMEDIA_LICENSE = \
+	BSD-3-Clause (docs, examples), \
+	BSL-1.0, \
+	GFDL-1.3 no invariants (docs), \
+	LGPL-2.1+, \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
+	MIT \
+	MPL-2.0
+
+QT6MULTIMEDIA_LICENSE_FILES = \
+    LICENSES/BSD-2-Clause.txt \
+    LICENSES/BSD-3-Clause.txt \
+    LICENSES/BSD-Source-Code.txt \
+    LICENSES/BSL-1.0.txt \
+    LICENSES/GFDL-1.3-no-invariants-only.txt \
+    LICENSES/GPL-2.0-only.txt \
+    LICENSES/GPL-3.0-only.txt \
+    LICENSES/IJG.txt \
+    LICENSES/ISC.txt \
+    LICENSES/LGPL-2.1-or-later.txt \
+    LICENSES/LGPL-3.0-only.txt \
+    LICENSES/LicenseRef-Qt-Commercial.txt \
+    LICENSES/MIT.txt \
+    LICENSES/MPL-2.0.txt \
+    LICENSES/Qt-GPL-exception-1.0.txt \
+    LICENSES/Zlib.txt
+
+QT6MULTIMEDIA_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+	-DQT_HOST_PATH=$(HOST_DIR) \
+
+QT6MULTIMEDIA_DEPENDENCIES = \
+	qt6base \
+	qt6shadertools
+
+# Qt6 multimedia can build without the following packages.
+# The configuration process automatically detects the 
+# libraries if present
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
+QT6MULTIMEDIA_DEPENDENCIES += gstreamer1
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+QT6MULTIMEDIA_DEPENDENCIES += libva
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
