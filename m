Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D885C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 17:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2409581B23;
	Sat, 10 Aug 2024 17:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q32TrHB97sF5; Sat, 10 Aug 2024 17:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE25381819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE25381819;
	Sat, 10 Aug 2024 17:13:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EDBD1BF831
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AAA40144
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5W0eaq6BeF9 for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 17:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=baxiche@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1962440025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1962440025
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1962440025
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:13:43 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-710ec581999so406182b3a.2
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 10:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723310023; x=1723914823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A62E7AA2R2g2G9ny6JGkZB23AwfyYexYuFuFPyZr9LY=;
 b=QTtnUTtzVTkZY3AafAbk1qs26WfIFCrnMXZgokshdvQUxmPoPOiVMMU4n0jCD7cjBS
 nmskN2Iae2Qg5028lXUw+QqU90HZH55l4PGvyoY/KLUfoJeqfHgECAHYwECdnGXEaTX8
 Pv2301lTAa/JNkL2Mena2JE8bnO3MUuPBSCe8sIuXiWN03M5K6XUk4bJ0XUOd5zJSsy3
 jkYbsEiVq2966cHTp6gj0iQan5sjYDaOKHHIg7bFt/ulSPSTnw/zKRK1JnBwKdICKcjU
 kcOFu801RF9podoZkeGqM06pFQaTDDXvOdqeZpmA7mIwSNQKCQDkhsRfkntTcSG448mJ
 MkLA==
X-Gm-Message-State: AOJu0YxuBmkV4Gl1m/BiGXY7aW+ym7c2u5OG4I3Fm7FkhobhhVgSR1WM
 HWGwaS06wJvo9aaJj6B67hWqe1MvL7OAEr+oD5OzC5VHFbhS8cA7CJGUDjem
X-Google-Smtp-Source: AGHT+IEp6ztwDWKJzkRucxh+TGmeV9WPR//8cBA5NZjUQHDQNRl5zyaaMzeXViEzZ3M+HsHo7YDB6g==
X-Received: by 2002:a05:6a20:9f9b:b0:1c4:87b2:e07d with SMTP id
 adf61e73a8af0-1c89ff243a9mr7041635637.16.1723310022813; 
 Sat, 10 Aug 2024 10:13:42 -0700 (PDT)
Received: from localhost.localdomain ([150.116.45.17])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c3dbe3cd6bsm1543223a12.56.2024.08.10.10.13.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Aug 2024 10:13:42 -0700 (PDT)
From: baxiche@gmail.com
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 01:13:35 +0800
Message-ID: <20240810171335.19227-1-baxiche@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723310023; x=1723914823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A62E7AA2R2g2G9ny6JGkZB23AwfyYexYuFuFPyZr9LY=;
 b=cpdA6WTY06ZmEKkM8RPh5pXz0gv0tsPQqMTrUmyYaSpV9suJvk/Z+HwMWhDAi6NTX4
 onqS+DDEPZQe+UCWHfgQBVYRV7NvRMS6tBl+7bkiNQGGu93E5/8R1RJBbaPBKK797TOS
 K/Uutj5D399JxgYg3zqmMtsL1IiIludW/tXu1s3X6hgKFqd88j4QReI7nAlNesvrXtsz
 bdIahzexCU7jcuXPMT25y6qy1il9fH2JwWUj/GVhAmVQPo88GwH+37GekN/Pt52lz2OV
 Sjs7gzMPH5BXdjG3q1LtgTFvY3hsSs6d3S3nskM3MlDLzF9GOR/clroMn1m6evsD7n2M
 Cehw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cpdA6WTY
Subject: [Buildroot] [PATCH 1/1] package/qt6: add qt6 multimedia
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
Cc: baxiche su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: baxiche su <baxiche@gmail.com>

Signed-off-by: baxiche su <baxiche@gmail.com>
---
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6multimedia/Config.in          | 15 +++++
 package/qt6/qt6multimedia/qt6multimedia.hash | 13 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk   | 71 ++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 package/qt6/qt6multimedia/Config.in
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
 create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 29c1c25c7f..5b55e67b26 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -57,5 +57,6 @@ source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
+source "package/qt6/qt6multimedia/Config.in"
 
 endif
diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
new file mode 100644
index 0000000000..3d0bf4c70b
--- /dev/null
+++ b/package/qt6/qt6multimedia/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT6MULTIMEDIA
+	bool "qt6multimedia"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
+	select BR2_PACKAGE_QT6SHADERTOOLS
+
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6multimedia module.
+
+	  https://doc.qt.io/qt-6/qtmultimedia-index.html
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
new file mode 100644
index 0000000000..04a8c0cb7d
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
\ No newline at end of file
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
new file mode 100644
index 0000000000..a7e9bd22a0
--- /dev/null
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -0,0 +1,71 @@
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
+	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
+	LGPL-2.1+, \
+	BSD-3-Clause (docs), \
+	GFDL-1.3 no invariants (docs), \
+	BSD-3-Clause (examples), \
+	BSL-1.0, \
+	MPL-2.0 \
+	MIT
+
+QT6MULTIMEDIA_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/MIT.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/IJG.txt \
+	LICENSES/ISC.txt \
+	LICENSES/zlib.txt \
+
+QT6MULTIMEDIA_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6MULTIMEDIA_DEPENDENCIES = \
+	qt6base \
+	qt6shadertools
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_PULSEAUDIO),yy)
+QT6MULTIMEDIA_CONF_OPTS += -DFFMPEG_DIR=$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION) -DQT_DEPLOY_FFMPEG=ON
+QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
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
+$(eval $(cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
