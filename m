Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5BDC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B64541DE3;
	Sun,  1 Jun 2025 08:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqLrKQ3lv6qo; Sun,  1 Jun 2025 08:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163B141DDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163B141DDC;
	Sun,  1 Jun 2025 08:46:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC701127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE2D60709
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOM9liwT8nbU for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE37E606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE37E606F6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE37E606F6
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-551efd86048so4088001e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767590; x=1749372390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBdNkTdHYDXSit2XZMJcF5dCNGkug804UtV+t2cdn3k=;
 b=GZHGqotuN8Jhb+j4zi+5iN4cl7t7EhLj5DgG7F6An1WcvYxZYDTwTqLqx4nJmP/qV+
 MBFuUk2JauX05Lts9zU5XnYEv4wN7PkzBZj4ri58UlrVPbKG3u+/gXDuOJNYUEctjLJN
 mF/SGSRVSLAzbIEJpYeROQp/1zVT4uKRZ2Nm3IjYr9M1dbSJfNq9J4eGkUye6m/yJKYs
 YwSgrGChEZT11A3VRstaFtGiyCBP4Y3uBFADnAlcQIp/TVAJVFOYymhziYsWKWSIwDYj
 4jC39F7W0j6sGG7nhUZPhlwUJhY/svIfiZB4euQS2czejyiRkL8iN2fiqCMCIGM0WaAg
 sgFQ==
X-Gm-Message-State: AOJu0YyiAXBGSCJxD/PpGp8EWMmkBfgB65Z0x1xVua9xGYaC3vtO8kt+
 XwUbvF8ijfRpO3iXn+7pgpGyG4NEMiJ0+OUNYpbeNtnSKgtDrNfBtkD7jImxWg==
X-Gm-Gg: ASbGnctbcVjbrW87qPOpfwqNEnV4Q7MmZo7B6J5lcjUiaGWPbP0VBjnSoRIbS3Q5Xhx
 MeM8tpoeL1MRfxRR4MGxEm1Npt0NpHHmPfgaakCGujB/5C92mA/Kb/pYFjkoypsVpGIaa6AnxN1
 9nO9cMd+i+X4zNynxNaIMMYN69bP1stEhaVaqioDO+rgWq/6lEH+Pi6NQ0znQEGUs+VKHBF/yUc
 CP794y9Bh7Tm9qtk5FUi4djx3f26RBExhiANZqh1cUO1V58l+fe2GxegdbDnv8sI8iqpQrcO7gN
 vHleOLkqdXFmS+8EhJ1Tlj5Ean4CXhmJk0mhKV7c0b6hYww9eZ50qtsGGRWIDA47vN0FuvhAB3h
 PyO7Q4dGv4w==
X-Google-Smtp-Source: AGHT+IHMlUJdGuTXBc/H/NHvVKWnhQLybf9ktNsntx5gPjGIDLJW1nTEYePppsGk9CTWBx+ZTwA7AA==
X-Received: by 2002:a05:6512:3b90:b0:553:3770:c91d with SMTP id
 2adb3069b0e04-5533d160fdcmr2845029e87.4.1748767590310; 
 Sun, 01 Jun 2025 01:46:30 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:28 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:11 +0200
Message-ID: <20250601084616.3104736-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767590; x=1749372390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBdNkTdHYDXSit2XZMJcF5dCNGkug804UtV+t2cdn3k=;
 b=K3z0DqSj9e6bt9M65O7jZlP2shDckg5dgFf4kHgtuah+2aD942gXUH8XM1v6xB1Yyl
 CB7yoCiVMLmu0eJNZkRKWO41xPNE+4EqaR3D+8yC67ayPz5e8eSDeqeEZCP1dafeIWlo
 ci6sv6uW1xHFJMP0vWblqcertw/DA20Oycw38on9D5khgV0NJIfTg8qH0XRv+YaQExWv
 PqJFQez7HyF0EiP2Z4qIasSbSIWy6yzo0ey1akefeaL+QU8lZIt0BiGHpOp28uiJX1wr
 vIjzyUHlunS9ZNMlS/uqbtH9HrKL57tLnrAwFeZ5cGUIjO9DTvgXt2KXt0Lh9CgOpAhe
 vnbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K3z0DqSj
Subject: [Buildroot] [PATCH 4/5] package/qt6/qt6tools: fix assistant build
 failure
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
