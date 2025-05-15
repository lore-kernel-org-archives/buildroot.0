Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED75CC2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF14415F5;
	Thu, 15 May 2025 10:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt4yYzpBxXQ4; Thu, 15 May 2025 10:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F8340526
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F8340526;
	Thu, 15 May 2025 10:37:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0451B153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE1D561143
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlVcK6JcVCpA for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AAEA6114F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAEA6114F
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AAEA6114F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54fcd7186dfso858792e87.0
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305419; x=1747910219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMHc3ooDjEWMHxgL9ADrJ6IlkMy9dEY7hsBYoocIY6Q=;
 b=F9XLRkAMh6fdHr0sLEJd/6CIBC8rNX9nlCDNfo+hWm7rVE+MuBGsoxbFTpgAkn04dE
 1SGtRGqd9v+WKAzfSgwiGqT0mC2flweXVHaJG50YnaBG8P1EHdcCDe90vyURP2i+LhJM
 bSx2XzNKX1h1q7/B25h3Q0dLCnqYV2nSIxcdlMNbd6t6tuvJxTpg6xLeZLFvRFjwD2ll
 tIp5YnJI8OV04CK62v0bl9cXQNj9uWe1fcWBXaupgXInOl8m13+Dn9FJur+VnPssTxS7
 bpBiFeXN1Vl4HO+4OnC5ognPNPqhgyMNQ2JUKFgTmwW691XPGJ+XlAjRyHWlI3EMv/1/
 tEuQ==
X-Gm-Message-State: AOJu0YzoiDBt/DUS5DYR/3baOMMGOIM4Zt8FQb/YOge9Z3a2RY3d1n7b
 aznX5VwFC7WvQjedbj2wwpRvtW7Zy4oIQrlwPHQt1Ki5/NXy9sydcr3RHQ==
X-Gm-Gg: ASbGnctKq78fwp9n4FIUPeyxaVaxcpYrFu5EEtCgOWPzHOkyhg7HwuM22vbTLX9hf8U
 4lZ0Koz1T+k/p2+LYhgS4Yz7NUJ/nknwHHRoclApJ73OuyPZkX5pCzu6tsakXJI3xgYpbbrDk1n
 Ly8Jux3w53AvtiauKqnfcB1P3+4YfO3z3Ocjm+zP26TLGX5ZgcVsSoTkjtQXAPnGQ6doA6MLghW
 +4Z+jk+mU8lk55m9itRMHu35P5y636/0vwPfSkSV2ETmNlEEFMd8o1y6pngnMc5qJcDlz/8nMaM
 jsbjm/7WWTBUhbWX+lUggiTGFeh1UwVI7sfrCth5pHVgUug6TjbG4CDj7NEKIOvF8HQFbEa7cMf
 kQMEAPA==
X-Google-Smtp-Source: AGHT+IFp6MjZWyjT6E0x3dkXvnELgzXJu7hVJvtMqcK5bVVv0jRifZkqI1qr7Ogx6FmwDV9j6HlQ3A==
X-Received: by 2002:a05:6512:6613:b0:54f:c0eb:c8 with SMTP id
 2adb3069b0e04-550d5fc7a6dmr1865252e87.26.1747305419274; 
 Thu, 15 May 2025 03:36:59 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:36:58 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:25 +0200
Message-ID: <20250515103632.2631227-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305419; x=1747910219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMHc3ooDjEWMHxgL9ADrJ6IlkMy9dEY7hsBYoocIY6Q=;
 b=FCCljGllgPgrR4Ov/nr15JhBujHnia6Q2vx7PsYydDhXS3z5cqSCk0Ly03ekzDENQd
 /S3ckPtPpnmcNBDQH8jC0ornJDj7qHBzV3eGaLc15OxMxDj7CaEtFVs7K9UJpXsFo9jW
 j3CbquGt8kylHPbItnzujz3IjGLYZkVq+8csnOL1Do5Rf+JbDZeQ3wPGYrve3P56ZbM8
 EvmToLQfCiycI6JOTlnfQgLeLXxEsjljfRkEMFakyigF4hTk0ma2SIyk7Ofaxt5ry+AB
 OJsW8blabqrY81QKZ+WOr8Q2c5HMdXPvUWeM12FYEq36Xt1ltHB3Umfq8U1pTVVXapDk
 jhfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FCCljGll
Subject: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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

Strip down qt6tools to the bare minimum by:
- Removing the target package
- Disabling all features except for the linguist tools

This change addresses ongoing issues with qt6tools and focuses on its
primary intended use: providing linguist tools for translating Qt6
applications during the build process.

The linguist tools are essential for internationalization (i18n) of Qt6
applications and are now available as a host package for cross-compilation
purposes.

This modification should resolve stability issues while still maintaining
the core functionality required for Qt6 application translation.

update host package

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in               |  1 -
 package/qt6/qt6tools/Config.in      | 13 -------
 package/qt6/qt6tools/Config.in.host | 16 ++------
 package/qt6/qt6tools/qt6tools.hash  |  6 ---
 package/qt6/qt6tools/qt6tools.mk    | 59 ++++++++++++-----------------
 5 files changed, 29 insertions(+), 66 deletions(-)
 delete mode 100644 package/qt6/qt6tools/Config.in

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4251b134d4..08866a370d 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -64,7 +64,6 @@ source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6speech/Config.in"
 source "package/qt6/qt6svg/Config.in"
-source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
deleted file mode 100644
index 1828e5f043..0000000000
--- a/package/qt6/qt6tools/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_QT6TOOLS
-	bool "qt6tools"
-	# The Qt Network module is required
-	select BR2_PACKAGE_QT6BASE_NETWORK
-	select BR2_PACKAGE_HOST_QT6TOOLS
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  Qt Tools provides tools facilitate the development
-	  and design of applications.
-
-	  https://github.com/qt/qttools
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..ef089bb9f4 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -1,18 +1,9 @@
 config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
-	# The Qt Qt Network module is required
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
+	  This package provides Qt6 Tools:
 
-	  Qt Tools provides tools facilitate the development
-	  and design of applications.
-
-	  https://github.com/qt/qttools
+	  https://code.qt.io/cgit/qt/qttools.git
 
 if BR2_PACKAGE_HOST_QT6TOOLS
 
@@ -20,6 +11,7 @@ config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	bool "host linguist tools"
 	help
 	  Translate Qt C++ and Qt Quick applications into local
-	  languages.
+	  languages. Includes tools like lupdate, lrelease, and
+	  lconvert for managing translation files.
 
 endif
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index e18512faf9..44574390c3 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -2,11 +2,5 @@
 sha256  fa645589cc3f939022401a926825972a44277dead8ec8607d9f2662e6529c9a4  qttools-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
-sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..6240fe7ee8 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -7,57 +7,48 @@
 QT6TOOLS_VERSION = $(QT6_VERSION)
 QT6TOOLS_SITE = $(QT6_SITE)
 QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
-QT6TOOLS_INSTALL_STAGING = YES
 QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
-
 QT6TOOLS_CMAKE_BACKEND = ninja
-
-QT6TOOLS_LICENSE = \
-	BSD-3-Clause (examples), \
-	BSD-3-Clause (corecon), \
-	BSL-1.0 (catch), \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0
+QT6TOOLS_LICENSE = GPL-3.0 with Qt-GPL-exception-1.0 (host linguist tools)
 
 QT6TOOLS_LICENSE_FILES = \
-	LICENSES/BSD-3-Clause.txt \
-	LICENSES/BSL-1.0.txt \
-	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
-QT6TOOLS_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF \
-	-DQT_BUILD_EXAMPLES=OFF \
-	-DQT_BUILD_TESTS=OFF
-
-QT6TOOLS_DEPENDENCIES = \
-	qt6base \
-	host-qt6tools
-
-ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
-QT6TOOLS_DEPENDENCIES += qt6declarative
-endif
-
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0
 HOST_QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_attributionsscanner=OFF \
+	-DFEATURE_clang=OFF \
+	-DFEATURE_clang_rtti=OFF \
+	-DFEATURE_clangcpp=OFF \
+	-DFEATURE_designer=OFF \
+	-DFEATURE_distancefieldgenerator=OFF \
+	-DFEATURE_kmap2qmap=OFF \
+	-DFEATURE_pixeltool=OFF \
+	-DFEATURE_qdbus=OFF \
+	-DFEATURE_qdoc=OFF \
+	-DFEATURE_qev=OFF \
+	-DFEATURE_qtattributionsscanner=OFF \
+	-DFEATURE_qtdiag=OFF \
+	-DFEATURE_qtplugininfo=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
-ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
-HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
-# When we have qt6declarative for the target, we need to build the
-# linguist tool with host-qt6declarative support so that it handles
-# QML/JS files
-ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_HOST_QT6DECLARATIVE),y)
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/lupdate/CMakeLists.txt?h=6.9.0#n61
 HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
 endif
+
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n63
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/CMakeLists.txt?h=6.9.0#n26
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.9.0#n8
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
 else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif
 
-$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
