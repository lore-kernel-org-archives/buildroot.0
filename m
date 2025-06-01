Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A0C5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1956160681;
	Sun,  1 Jun 2025 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT_AIwW8Q7U1; Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B3F160AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3F160AB2;
	Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A161F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E485381B6D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvnka0b347Vj for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8C9B814BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8C9B814BD
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8C9B814BD
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so4940211e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772804; x=1749377604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBdNkTdHYDXSit2XZMJcF5dCNGkug804UtV+t2cdn3k=;
 b=dgXzE9+GOe2lLHULnWPUV3h2zLFs/ldj6+ErZfvXjXNZx27kkiU+9gWFUKoMGbfhlF
 2MZmcBQYxhMAQOcM9jzYQ0ivABp/bMqMzlAxtbsMGIy2rwCMb8P8ZIBRPju5KGnyP+md
 /Z3Y+LclqsuzS/iKmrNEghGbTWdShpD8QVlknzGCA1hve1g8Has4RxrIZKXRzBsVbawM
 blydyEvAHY6Rwj1Jl/DR3MdjiPfMvg9xwhR9+sLaXVUmPtLjxjK/1G2c2iM99m+GVCQa
 KYTRDhx+Coz/XIxdYboHOkSXLn0BgsX0kByZF2zHeJiNgPUxDPGocd2cdK4BNevdsZk7
 /Vrg==
X-Gm-Message-State: AOJu0YzitrncU2BcqSDrBsKPt5lbxvTYPDmRlBMUlRTdKX4jmSdeA/ep
 ZX+XK4zUtZt5FJOzI9CGI+pBoVf+j03Tauo94oo5Bj6nJsOu6U0UJ2bUSDYt3w==
X-Gm-Gg: ASbGncvXV3lU1G2IQB+f58qd+B889yqscZPpSh6BSUTRSiB9dsYptxwijoHcx7ZDdOC
 ZMrNMxYTNFkzQtavFjqEUOUglcHzvs/OAa+lyWy5ynRKR1Bh4PYi4xT2ux0xA88qp3tuCJLPUbT
 M9ByJCZI0SPvhKCP02NlZqT+B4Xn0bf+N63jWLXSSqLzUvmM0jY+BHMJymNo+GBHKJAxxYxHwCC
 4Woyih9gC2V7Lz0NfPnUciz+9HIwhOBGvAPrvO75ZMHEm1Ts5WmB3ISQFTSabzBc3dYjpSlOK+T
 Ws0G97Xs6sy2JypTX1kGhMOdhZTtkXvp+3+b9VaYqes32yF8NgM+AhQWpVSygETgKNQYCgomE3D
 rToMWO9Jh0w==
X-Google-Smtp-Source: AGHT+IEZCRNz0KJN4WVpwEKVL3JnHbhWzwQKeOXQeWq45XkxgdBXMh29m4T2s66JxUWApqEzL4Ne/g==
X-Received: by 2002:a05:6512:12d1:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-55343190dc3mr1101953e87.46.1748772803425; 
 Sun, 01 Jun 2025 03:13:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:58 +0200
Message-ID: <20250601101305.3198541-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772804; x=1749377604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBdNkTdHYDXSit2XZMJcF5dCNGkug804UtV+t2cdn3k=;
 b=mbw5MQCa/rMH5I/3vnP52SyH3erus/wnaX0bcmQCUsXaVkhsNPuid9oBS89xFJkIih
 By4lcede5YeU5k/ONTP6KH2dXvPZRi4q2GkOxL2Ra+YcrR9WjUvQCX9apoE6M9NrjWOn
 VaX4wdH0tS0fGaCq6E430SxuM+R7Aubi8bcKKRXvqlDRbJEGA0975ACDDPPNzXM3bKn9
 8MEKiG0xTsQ7K8kD5md1kRo3/apW8MCKK4CJ7uQjlBbh0Y8GqZyrhCdEsJUvYjxDsKwT
 2SxArYkOUe7ZRTKlYbzh/83mgCuGpVvIS7Q1isHUqUPc3OkYFocQkaJWO4ICWja+jcyW
 F/Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mbw5MQCa
Subject: [Buildroot] [PATCH v2 4/6] package/qt6/qt6tools: fix assistant
 build failure
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
 package/qt6/qt6tools/Config.in      | 14 ++++++++++++++
 package/qt6/qt6tools/Config.in.host | 16 +++++++++++++---
 package/qt6/qt6tools/qt6tools.mk    | 12 ++++++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 5828715aa6..f03ddf29a5 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -14,6 +14,20 @@ config BR2_PACKAGE_QT6TOOLS
 
 if BR2_PACKAGE_QT6TOOLS
 
+config BR2_PACKAGE_QT6TOOLS_ASSISTANT
+	bool "assistant"
+	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
+	select BR2_PACKAGE_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
+	select BR2_PACKAGE_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	help
+	  Viewer for Qt help files (.qch), providing searchable and
+	  navigable documentation for Qt and custom projects.
+
 config BR2_PACKAGE_QT6TOOLS_DESIGNER
 	bool "designer"
 	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.8.1#n41
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..0ea214168d 100644
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
@@ -16,6 +13,19 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 
 if BR2_PACKAGE_HOST_QT6TOOLS
 
+config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
+	bool "host assistant"
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
+	select BR2_PACKAGE_HOST_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
+	select BR2_PACKAGE_HOST_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+	help
+	  Viewer for Qt help files (.qch), providing searchable and
+	  navigable documentation for Qt and custom projects.
+
 config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	bool "host linguist tools"
 	help
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index f5f2dc64b0..2e3268558e 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_ASSISTANT),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6TOOLS_DESIGNER),y)
 QT6TOOLS_CONF_OPTS += -DFEATURE_designer=ON
 else
@@ -59,6 +65,12 @@ HOST_QT6TOOLS_CONF_OPTS = \
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT),y)
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=ON
+else
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
 # When we have qt6declarative for the target, we need to build the
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
