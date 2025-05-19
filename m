Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CCC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 484AB80F67;
	Mon, 19 May 2025 21:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxmSfXXFEegq; Mon, 19 May 2025 21:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4745D80F32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4745D80F32;
	Mon, 19 May 2025 21:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C7AD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358D64192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-xkc4inKyvt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0881D400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0881D400EC
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0881D400EC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55168f56120so3691211e87.2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688779; x=1748293579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+nmGvIGIVcEjd9kmZisIC/SaMax2cHE0HLry+nIgW8=;
 b=E/jgo2B7a6/gevjD0z7pRj7wp8UdEZaklDKTiWVOr43yfuFdG2KIY98Kdx2snsiIpG
 6K75ycUgewVxgHHM2k0CTG9lfC3kNqj2L1XZbGbUQmz/t4Whiw1BdP4druKogbnKIqeA
 p+W8JTaub1b4czZw+ZHUeOxFvs+UDSpQB0thYXBIQKN365ZhZmMK/begaHVfz4ghyhgQ
 lrjQwC/pz7WDekVyTGt5TGrdmcw+khrQdegxBXNPfn0e351X/cz8o7SgXiKBjRKd6iri
 yxzL29onOMZ3hfSjcu0V74tLhcmoFajJhbvJr2m+rgAy9VcBF02h7icgSXXH0PAn/G/8
 WpWg==
X-Gm-Message-State: AOJu0YyW+kTalO8mrkPHw7y728UqCJAv09s4FD01t6t980viv4Y3jNh2
 dET4+L5k+BLeAx0U1dpupzDSSBSjuU9yjkyIzg+tA0HpTWGmmiTSQk0Mk/EgwA==
X-Gm-Gg: ASbGncsE3y36cpKICqkVggy8zWCcxvta9sHuuADw5NFBNoAak4AQPVGBIfi9YXpqADb
 w2xgAQusyXIdwJvLt+UrQ/XLlnDlsdoOEhLrEgBOgjZwh8hPC9icuuMWs2oKSkfH2KpqysyE+Y8
 Qh+yMcxfwpH0XqBKqoBzWNXfkiGd57y+0Y1UpcDOyxwbaT7dsBEHhduv/dOZO2Nn5FFqm6WqYhq
 WBJsISn3JsreJgjd2uOJo/i282ojDNhSdOhZu8tP7UB7d1OzosaGViXZEiXNyYOHY1I425OP/fO
 f0GjZipDM13MOiboaIEaVQoeuE/ZRGqsXqBXmwRxpmu5GoBSC17hEkFGmZQnpf67zgu+IVvxuHM
 SzlHfPQ==
X-Google-Smtp-Source: AGHT+IHsh1KuKzSzg1x5CH/qyuiZ/pIrJErgsXkMRPBzRLzfoZyakVVfZzx0VznEttTmD+cRHxLFwg==
X-Received: by 2002:a05:6512:628e:b0:549:8f24:b617 with SMTP id
 2adb3069b0e04-550e7198372mr4838377e87.4.1747688778431; 
 Mon, 19 May 2025 14:06:18 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:17 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:42 +0200
Message-ID: <20250519210553.265725-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688779; x=1748293579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+nmGvIGIVcEjd9kmZisIC/SaMax2cHE0HLry+nIgW8=;
 b=VBofVeYa8/PK8Co1TWofosJS/TUAuDhpUuhCTNL9d1Pu3xaD9MANJtltGbiesHQ5H7
 7YuPWmygsRtYlX6StF+vKDZJ0NgCdYltXBdQDpzN4wkt7ynfDOhZMZrkIhgTktOqnDdC
 5EytXoIKfCC0LOvLLc90TjPyOELtXxoAaj7IWMwImrbXaPhHOR5C2SeGlv+/dXKVVeNq
 bOYUBwoWz47cgtTmtKppi1LNDKUmNJb4RZ8KLpY67LkIb5Ndw7f0ZO6pMUR7pcxnmZ94
 eRN5BBuAIOoWX/wV1Y3Bd6/197aCvO5V4wakJfwHUQCWTA3zAD5qefwkeeVrRsai5iAo
 vwrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VBofVeYa
Subject: [Buildroot] [PATCH v2 08/11] package/qt6/qt6tools: fix assistant
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
CMake Error at <...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:784 (message):
Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
Qt6ToolsTools package, but the package did not contain the tool.  Make sure
that the host module Tools was built with all features enabled (no
explicitly disabled tools).
Call Stack (most recent call first):
<...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
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
 package/qt6/qt6tools/Config.in      | 18 ++++++++++++++++++
 package/qt6/qt6tools/Config.in.host | 16 +++++++++++++---
 package/qt6/qt6tools/qt6tools.mk    | 12 ++++++++++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 1828e5f043..954f432c41 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -11,3 +11,21 @@ config BR2_PACKAGE_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_QT6TOOLS_ASSISTANT
+	bool "assistant"
+	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.9.0#n4
+	select BR2_PACKAGE_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.9.0#n4
+	select BR2_PACKAGE_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	help
+	  Viewer for Qt help files (.qch), providing searchable and
+	  navigable documentation for Qt and custom projects.
+
+endif
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..6517d3f1ef 100644
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
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.9.0#n4
+	select BR2_PACKAGE_HOST_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.9.0#n4
+	select BR2_PACKAGE_HOST_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+	help
+	  Viewer for Qt help files (.qch), providing searchable and
+	  navigable documentation for Qt and custom projects.
+
 config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	bool "host linguist tools"
 	help
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..f583d24735 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,12 +41,24 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_ASSISTANT),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
+endif
+
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
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
