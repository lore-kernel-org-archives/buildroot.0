Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE7BC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8182C8188B;
	Tue, 20 May 2025 11:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8SBUAhKdl-o; Tue, 20 May 2025 11:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE05B81A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE05B81A99;
	Tue, 20 May 2025 11:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E4BD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F1861055
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAVY55CcKD7q for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FDFB6105E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDFB6105E
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FDFB6105E
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:02 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54c0fa6d455so6944073e87.1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740840; x=1748345640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFtN6jNUwAKiDw5ksrJMzd9dLmQXeRPyMCW+kcO+Igw=;
 b=GIekig083WoZ6qpxdLM647oy6HCjb4NdpHBLAyRWj+kcf1GFBsi+LAFpJaczf5YKCR
 fnLWsgaXdBkbB2h9HpmBqWRVh3/ikzYTFGQ7klUnTVCw7zXl8XDr/xs1EA8g0wk4y4Fq
 QhIRAAByqyijsHoLLuuu21zFn0ZXxKYyF4wGrkRdcFOsiqqFuDlog1Qqb4R0TNH+qNGN
 Rv+5QeAlE9grFeta9Y93cjAVnPnZnDAMRxCr0RAa47b7syZq7spBDV1S9jL4G7eW0xoD
 sSHcuFgAC5bGPtbzEoYaVPFoSpWUH5xHuOPpkeYfcJMaHq+P6NeDNJIojXtD/UKWsOYp
 lvHg==
X-Gm-Message-State: AOJu0Yz+RoMKWA9P9RgNoB+c3dP9q8PEHWyIUaH/nUXco1r3Q9iDG6bo
 3FI4OzLQxfR0WkzVcMGTPCCPBE8+a4TEqEkP/XE56maksv1BwJh6Tl6UBEo9PA==
X-Gm-Gg: ASbGnctsdUGXkhF72LtFGDgNwcU59ita1hOCM8wzKSBlbMSroo1WRaCRd0YGEo1/CEl
 E9jOLDv6QxcRqXYAjDUd4nbKymmqqB4ro+QRtIgg9E2c425qDaSIxBQJ4qyawTaWYSy7PV35jIf
 BbKcO6O7gQsw21547OY+MvVcwzRZXAX76fgmNVDumQ/UTu8g/bsPSImO238qxmanU2BKk9CAg/x
 Ruj6TMzUrC1JO/wV1kmplNnnLQRZC6wgkCX6rJlz/eSXr4biyqFq4BvmfIlsJyRuDf05UtIHssH
 BJipeh1Ld5ASA+P2e+Qqy3a23KNWR25B9bYnCc6Kracd8Zt7y0t+gvaAI4E91Gr++trLKO8533r
 YWM/7/A==
X-Google-Smtp-Source: AGHT+IH2KtRg9cqH0+5rGP/8ZkIqNg9IAYAESSwYv+PcBz3rxJc6tL4xhO1CnJh55YGtopJfZ/Ky5Q==
X-Received: by 2002:a2e:b8d2:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-328077cc6eemr64925821fa.32.1747740840156; 
 Tue, 20 May 2025 04:34:00 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:59 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:28 +0200
Message-ID: <20250520113339.2525537-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740840; x=1748345640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFtN6jNUwAKiDw5ksrJMzd9dLmQXeRPyMCW+kcO+Igw=;
 b=VrfKGgPsOLIhlqOZo9SXojIOFar0BEmrkiDuQXevsy4m9H26/x0vejJdziwTQzYKKz
 PAgvSiE6MQytwH9G3T9OxotlV71w6GtT4VQWc8kXdsA/u+iTzrLQ2BxvM0ZvrYNzqmyt
 Bug6rM4DWvXogAItfs3E4DS6nIIRSWdeMSeTrR9p51lbUsFUCdM+ok4dc+Sgf8ehXobq
 hymvipDz5nAu0sJYLkFuo8XhUx2iWSoh1B+Fqdby8KGF29S487WqxYsgPo0QQI1t9xCq
 VHvbWQxKiB9OBcLypRzLKd+dLeRaPHylhchcBoMmDfPk0l17mVQ41nakOyDo6jjLeRZt
 AOow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VrfKGgPs
Subject: [Buildroot] [PATCH v3 09/12] package/qt6/qt6tools: fix designer
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
CMake Error at <...>/output/build/qt6base-6.9.0/cmake/QtPublicWalkLibsHelpers.cmake:271 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.9.0/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.9.0/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/output/build/qt6base-6.9.0/cmake/QtModuleHelpers.cmake:1149 (qt_generate_prl_file)
  <...>/output/build/qt6base-6.9.0/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 954f432c41..e86011e7f1 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -28,4 +28,15 @@ config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	  Viewer for Qt help files (.qch), providing searchable and
 	  navigable documentation for Qt and custom projects.
 
+config BR2_PACKAGE_QT6TOOLS_DESIGNER
+	bool "designer"
+	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.9.0#n41
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_XML # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.9.0#n182
+	help
+	  Graphical tool for designing and building Qt user interfaces
+	  with a drag-and-drop editor.
+
 endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index f583d24735..c38630f5a7 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -47,6 +47,12 @@ else
 QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_DESIGNER),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
+endif
+
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
