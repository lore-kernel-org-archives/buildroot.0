Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09DAC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 275B660A67;
	Sun,  1 Jun 2025 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjwPshtOFraw; Sun,  1 Jun 2025 13:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0D560ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0D560ADA;
	Sun,  1 Jun 2025 13:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B10D127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CB5940455
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkYzkbQFmjLb for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C9BA40444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C9BA40444
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C9BA40444
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54998f865b8so3377980e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 06:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748784515; x=1749389315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4N8581tz2/G4Fq8OqtEavn4540LTPTAC1ar51XTKso=;
 b=vW9EQRT1ReXRsspmEv8pQC7j/p83HzNU99jxGDYQFU/IpZ/B9fZBnso0bNWiiqjyNJ
 hoSUWnftiRgg/+AzovGnLt5sI4ijqds4X76YgTt7jF8jV/jMaDXvOvF5rah+WcjG/tXy
 JyBDk3eCaZ2Hu2gS2RDAQrTPNmaResurKgNLo1wDyJOJdtzU8Ns7XfrRi98N+dCKYqKi
 eSUYopupYpt8CUuHpIEEjXa0CMiOetHhpMlJpztPhWp2eOK/iov08wLXDWU2n1ljts77
 qUZAjq8bgeqkvigWZ4gj+BgAXxljvjX5BVe3xSFlSt4RNcJc6o8My/DSbguBtJVFgTVj
 NyaQ==
X-Gm-Message-State: AOJu0YxK759IBz99+UhIRCTaPkgj5hvmo9JzaFoJfKo5v8ZloaHllg7h
 eVBH1q4zQbyNdHgkicMDEBq/RgZ4TzJVlUemmr0wOfJV39f7dHUmuPcTfTHsuw==
X-Gm-Gg: ASbGnctiz1/i7aCIl48JsXewHSgTI7MJyBiCYsG9kFCm0qW7QA+lit4T1L/5aFjQPVr
 mNbAFS9/WvwbY5tGrPlBPrQuoDZeF8CvhCjclUCtqlUwgy1DbWSXHTQiiiijPA/nMMaWb7+T3ay
 Pwrn9H7Uv5EjYOWEt253XsYKdnmDJ3SPRO9+tihRxCteLkDYLdquB42wO8gybAfx/cfWIwdE1cX
 6vimhgv7x0KWXXJmAJvOPfUhOzIrYiPy6MVK16l0LD3WDoVYS6d8F8CITGAGAjvmbw0NYfXP1If
 76nxWe0WGHRdcP8aw+XWgnD6CenBHj+0NZski6lVg2kqAAWWN8A6wFFPGRewfUk/+KHKgzExMX8
 /GAc=
X-Google-Smtp-Source: AGHT+IEbmrqmDs2wrn9QrxrS6fLC8Q12ZjM2V9tqmVLyS4W6vyPsKg3QHPX8Yd63ctYZArZthh0Fmg==
X-Received: by 2002:a05:6512:220b:b0:553:377a:dac with SMTP id
 2adb3069b0e04-5533b8e1108mr2719348e87.9.1748784514984; 
 Sun, 01 Jun 2025 06:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d38fsm1275178e87.42.2025.06.01.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 06:28:34 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 15:27:31 +0200
Message-ID: <20250601132736.3582117-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
References: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748784515; x=1749389315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4N8581tz2/G4Fq8OqtEavn4540LTPTAC1ar51XTKso=;
 b=PqrwEspla8r71FPnlpGLtdnjrufocHrh1QP6ilPUTOsqUW/onWUSkdJ11ws770WVKL
 d1Zy0PKGSGU/xBz1mtQJ2BVL6I/LbtYTvwGvl/DMtldY5a0c6tD/8T9KR0yog+ZjOUHD
 gkuD1ytMDDvQIvWPde3g2BCRn5jbqe+nNuqDORifk44NbramsqRALJI7pIp7JwoWPjpJ
 cNO4kjcR4/X5lXqzkpe2oVUZXPTcSCpXhYcFR7oj7pzPuaTmT1C4jW/Gj5WayYO1t6cx
 tPkkNFnItJfMI7adUzA7gqydEgrPgOhDeojHw5y0z0AomV6jhyUqnEFYMBXJ9AXr5csv
 F/qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PqrwEspl
Subject: [Buildroot] [PATCH v3 1/3] package/qt6/qt6tools: fix build failures
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

Remove target package to fix linguist, designer and assistant build
failures:

Fixes:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Fixes:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:1027 (qt_generate_prl_file)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Fixes:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).
Call Stack (most recent call first):
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT6BASE_SQL=y
BR2_PACKAGE_QT6BASE_SQLITE=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in               |  1 -
 package/qt6/qt6tools/Config.in      | 13 -------------
 package/qt6/qt6tools/Config.in.host |  3 ---
 package/qt6/qt6tools/qt6tools.mk    | 15 ---------------
 4 files changed, 32 deletions(-)
 delete mode 100644 package/qt6/qt6tools/Config.in

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..5c18c6a3fd 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -59,7 +59,6 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
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
index 7a6f8a5176..404ebfa923 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
 	# The Qt Qt Network module is required
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..f5cfbaec9a 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -27,20 +27,6 @@ QT6TOOLS_LICENSE_FILES = \
 	LICENSES/LGPL-3.0-only.txt \
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
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
@@ -59,5 +45,4 @@ else
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
