Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F89C678DA
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 12:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB3D41D96;
	Tue, 10 Jun 2025 12:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-f1SduvkGU5; Tue, 10 Jun 2025 12:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C9B41DE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C9B41DE6;
	Tue, 10 Jun 2025 12:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83AE9183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75FBA83267
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ2se7Sk0t7P for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 12:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63EF58203C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EF58203C
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63EF58203C
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-551efd86048so5470861e87.3
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749558579; x=1750163379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JaC2+wWRjas2xKuhTg4envjBcBfrecROOCcID9zLR9Q=;
 b=D+6PeJDjEsjtbkAy03wORd1xJRinD/P2EkVRWp5XJwud7eVVdK21lD4mIFEFfY1bY5
 vyDtRF7D5C7ZveENer3DIIWtmI3iP9v9i/ORYJMCo75NYtkomBgpuXWL1+sE2HiXdYf9
 6mLCg/YDUJ677jckVCUJw/3KE9qUx9aDDYEUtgzC76tqJiTiJiIQSoMiF5/TpD+kTEYP
 nyzHb+2jN6trtRPURETfPPqin/Km6yPkAQ/peEXjwIXTHJzRzIdabV9+o9If2EVM+oxe
 FNEo1H2NQcbWnk0UA/LKZDgI8XvfwOeVuPFm7z7n9HyHMdCuBK/9+LCvGgft0NohFQhc
 rIbw==
X-Gm-Message-State: AOJu0YzK3rlOTDkZp30390vA5YidjeyBC7zUdA9neejrfJ7bi7yt81aO
 BAOwFFp3T3nbEvpUFZ/r3A8Y1zI3jSEHZZWrM2Lgqho1Mjy3tNVpCU0WrMr1Fg==
X-Gm-Gg: ASbGncvQ5/w65cbzDKnYCT8258cYwIYJTFTk1a4Yb6PmCgKieHfmG+iXgXpnshCSi3O
 0Iz2U3WOCTx2WZ6V42DLw9UPliiq7HNW4ziXKGX4tz/p27JWuCe5pCFDkPWaZzMSEJ8Vpq2yHuC
 JqKTeggAX6dc6Qze2lkGShekk6CBg2K+ryVUY/s471nE16LvWkUWTFGWEMHoqgAZv/wX3fmZsLY
 HQw7enU0oW9aDY0CEYvnbsdPaIHjCbZI8f1WZBuet5kTAiVmbPOwUTmJePBth78RQLwJtwvisen
 PlLSxT702HDgIdhFqvLOoXHSCGhFipCuBevqRELDjGVv0azsODVNiGlxEe/0377xKkMZ8V3mdP4
 1P0+AKg8nHvYSYF8X
X-Google-Smtp-Source: AGHT+IGP9tBLZGJguBL1Fo6Q3DjotgJJJAKeJVEqvVzQXYDHUsDLFN5eQ7MKuazViFO48P4aeVZeCg==
X-Received: by 2002:a05:6512:3e20:b0:553:351c:2f54 with SMTP id
 2adb3069b0e04-55366bf84femr4113948e87.28.1749558578988; 
 Tue, 10 Jun 2025 05:29:38 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677224cbsm1514875e87.139.2025.06.10.05.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:29:38 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 14:29:20 +0200
Message-ID: <20250610122924.431830-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610122924.431830-1-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749558579; x=1750163379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JaC2+wWRjas2xKuhTg4envjBcBfrecROOCcID9zLR9Q=;
 b=hpKD90hK2yc+BotMLEBiMXZLJRaXjXdJVLtKeEdpLAgBZWQ+z0dBFkArmO82AEMFEq
 ysBf/zQ3eECdYMMZf9aqkUw6COgMbGJuC82PNetSdKQPntWXkehvt6UWNvr84nJf4mFR
 ydSLW1tnxey+XLOV6D2clxfvrHkxer69GxFq1GSzy6i0mJFRCwmYI+7A1dic0YPAjI+T
 3bGrUHn+D8am35asrWyEYjZ/TlE/gUZF4gx+jRPxt5ynnQtjHr8tjv9GZ+h/UMQeDXH9
 U2K4JNhee+6zKLwYLYkss3yoWjb9SCy9fAySz9xj4zGcmoaZMYBV0eCXxAlqhvFD0kpN
 XbWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hpKD90hK
Subject: [Buildroot] [PATCH 6/6] package/qt6/qt6speech: new package
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                |  1 +
 package/qt6/qt6speech/Config.in      |  8 ++++++
 package/qt6/qt6speech/qt6speech.hash | 10 ++++++++
 package/qt6/qt6speech/qt6speech.mk   | 37 ++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/qt6/qt6speech/Config.in
 create mode 100644 package/qt6/qt6speech/qt6speech.hash
 create mode 100644 package/qt6/qt6speech/qt6speech.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 05f0540db0..4251b134d4 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -62,6 +62,7 @@ source "package/qt6/qt6sensors/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
+source "package/qt6/qt6speech/Config.in"
 source "package/qt6/qt6svg/Config.in"
 source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
diff --git a/package/qt6/qt6speech/Config.in b/package/qt6/qt6speech/Config.in
new file mode 100644
index 0000000000..3bcadd799e
--- /dev/null
+++ b/package/qt6/qt6speech/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6SPEECH
+	bool "qt6speech"
+	select BR2_PACKAGE_QT6MULTIMEDIA
+	help
+	  This package provides the Qt TextToSpeech module:
+
+	  https://code.qt.io/cgit/qt/qtspeech.git
+	  https://doc.qt.io/qt-6/qttexttospeech-index.html
diff --git a/package/qt6/qt6speech/qt6speech.hash b/package/qt6/qt6speech/qt6speech.hash
new file mode 100644
index 0000000000..c7cd71b306
--- /dev/null
+++ b/package/qt6/qt6speech/qt6speech.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtspeech-everywhere-src-6.9.1.tar.xz.sha256
+sha256  6807f59fcae2ef8f1f64210cfbfc8bcee1a40ed2d21eaee6673aba36bb7c1428  qtspeech-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
diff --git a/package/qt6/qt6speech/qt6speech.mk b/package/qt6/qt6speech/qt6speech.mk
new file mode 100644
index 0000000000..5df2ce8155
--- /dev/null
+++ b/package/qt6/qt6speech/qt6speech.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt6speech
+#
+################################################################################
+
+QT6SPEECH_VERSION = $(QT6_VERSION)
+QT6SPEECH_SITE = $(QT6_SITE)
+QT6SPEECH_SOURCE = qtspeech-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SPEECH_VERSION).tar.xz
+QT6SPEECH_INSTALL_STAGING = YES
+QT6SPEECH_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SPEECH_CMAKE_BACKEND = ninja
+QT6SPEECH_LICENSE = LGPL-3.0 or GPL-2.0
+
+QT6SPEECH_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt
+
+QT6SPEECH_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6SPEECH_DEPENDENCIES = \
+	qt6base \
+	qt6multimedia
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SPEECH_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
