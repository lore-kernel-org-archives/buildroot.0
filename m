Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DF9C54799
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3695C81BA8;
	Tue, 20 May 2025 11:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PN83poY4FJ0j; Tue, 20 May 2025 11:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8763281902
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8763281902;
	Tue, 20 May 2025 11:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D006D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4316106A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOVNW8FtCHdA for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A50026105D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50026105D
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A50026105D
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-31062172698so54758941fa.0
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740838; x=1748345638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+nmGvIGIVcEjd9kmZisIC/SaMax2cHE0HLry+nIgW8=;
 b=Q1+TkUhqddLCdvrcQ1b1J39DUSWLsf8dkomCWVYLGeC4s7YZ0lVp1CQon23/eYWkTL
 Bha0KJHB8JqOXCElcpnuCVJJiH3zuJ0Adt1eUNqjCW00e+9klP82hcr99nQ1PhMEKKZK
 s1wjfd96Uri3PfQMeDVDqA3XC69Kpe1/ButaeJsUDvJI4OltCDyhb78UNw4R98YkMM3i
 uNi1QppKvEzFSEmB+pXG0gz2CHGsnExaSJUHP4jYXD2ivpesLjC3R2hyDUMlUGTsfIzO
 N+kzYE2kOQNSnlJYWlchOut/fybfBPpF6VJnsz6qyP1Qy8001SSS76dsOfmYeNN0NC1Y
 hkdw==
X-Gm-Message-State: AOJu0Ywf5GjV/TGsMn0BCJf0cvGrxfizCpxaaF7ekpOfF/XKcM+gw0CC
 kLAbrMrVPXSJI7lkS7QhKuHn9vAAd9CxtbVK02Rt5P9petx87y75ojVWhU7/Eg==
X-Gm-Gg: ASbGncsjqAPLMt5n6/XbDJ3cSXNUbM/e/OJbxJkerTjrOMvb6es7iXlfqYQHpCJJTP4
 rAsJzfQMb3wxb4Z+HUNIkUp94akufbwG2Au6W1hXO/sWCq8BhGXnd14R0AO8GN3k7qpeUAP+/D1
 PxGgk2W9O3PEnuVlSAnQtsrnlv7fb0pt33GlqASsj+6eOqYzaYROzNt3JxqqXmQTVwCPKg6E+i2
 ytOM83UOk2mIIW2ufac9a9kWDVautbtS+zAZNRP4/MYQitwoJqlt78mM5RxDx7r8NM78CuBMG1L
 Q5lyd1ph3E01lSORGZnvnH5CZSdQO1ELDQFJhcMUtYmxsZxBcj/+e5cqTE012G70cVzdBq8uHnp
 ijmRCHQ==
X-Google-Smtp-Source: AGHT+IH0kBDqlRTjm5wexTm9xCEE6vy0qJTUJdc0kcPFPqnoy/yk4a9koMHAQcgRGEoIushRa0DIEQ==
X-Received: by 2002:a05:651c:4183:b0:308:eabd:2996 with SMTP id
 38308e7fff4ca-328076e6e4bmr38969191fa.5.1747740838136; 
 Tue, 20 May 2025 04:33:58 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:57 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:27 +0200
Message-ID: <20250520113339.2525537-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740838; x=1748345638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+nmGvIGIVcEjd9kmZisIC/SaMax2cHE0HLry+nIgW8=;
 b=MGsbiUh6obthIEQ0gMI9zvOUBUlrrf3/rR9zEQhEmKXFnjadPaHAg7vAvLMuGWsIQV
 e5jJmc3mXOLVPkZWhucF6Dw9bsPuLg2pWz1r5fDxKMQjA0mG0anUBTNIjfO+1brShfLI
 Sy3gAn11B6Dp4SU5+bAnDxNCPtG9Y7TsbiQVBill5h2ubEWA9bcbpkoqZQRw8/FTH9tY
 EMX2iG1XX+2FLDb8UwLfM6QxRPAFNoxGoP380gFl+snTMsTvYjC2Yg5V3/IJJWzLvUZG
 WLDzH8luinWOUbE9ThAgdsa6Mcrq5J6zO11Y4F6ZGWq6tNrfgSMBbN/w9+IVJeGGKO/L
 Q83Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MGsbiUh6
Subject: [Buildroot] [PATCH v3 08/12] package/qt6/qt6tools: fix assistant
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
