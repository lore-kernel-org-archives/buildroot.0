Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C539C3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5255341620;
	Thu, 15 May 2025 10:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u2_e7Hnxvcd; Thu, 15 May 2025 10:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E760441605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E760441605;
	Thu, 15 May 2025 10:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF495153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94714415EA
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxrbt_CtbEOu for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77447415D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77447415D7
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77447415D7
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:37:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so857899e87.0
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305421; x=1747910221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ItJTPDDSgtJzUjihgqJFv2IsDyA31qXxuaWB5KL+Jw=;
 b=PVDiMDv7STLgQsrevkndxrBVW6o9pMD78jlRTowIIGtyT2FjASRXeM2XoWsd0pTELe
 2QpYw2c9VFSpRrIjwnVv9KzahGElYwgQRxZDz6Wqv/wMdebN3ZrnWZgu2O5t2yQOjIQX
 yyIBoVrYOdHzCmZEzrJfT3xZ3/5hM5jgYgeeZQ7yiFpWkw05ybpKQZkBFiy6IA6gFi6c
 iaQnihItDmHdqKiFZKPbC0fQlXMgBgUTNN/fELQwvsvwnng69XizjSja0WRr9KC+WVt1
 Wmff3z82vKInDNwHWpNHA4QuAH32ztYK/Rza8IhXX/zi05gu9lVRW+6LuXVBJJsNFAZh
 zDQQ==
X-Gm-Message-State: AOJu0Yw5LRPO34qPw+ex19p+8YTgSl/j0DgE50lr3a+gBzl6tlW7FgTA
 F+KdyX0Su4O5o5xnrwpqjF8O7kBX89pX502E86mCmhDKVM+S/6m/LGS3Eg==
X-Gm-Gg: ASbGncukUJYNuqgfcqOV3rXpjPHNPCEgncKDYl6bD5TvLGsdbddt8yZ8P/T3FWCsI6l
 72hkrKLx62gtYE82mYT4f9bk00Liy5qaqPIrvfmYQ+tYIdSlAit12lqAFb1v781KqrwQS43r4PO
 W3q1SjVkF1e6yvDd4q/XbT9mYP2Rb1X4QbAR499HmubJrsbGuC6NpVKIWylwrS7CeVIGbqNbHyQ
 T1eEz6xWZYx5/YGoRDUVm7XfGKYPo0Iu+vtCGKDT0N03TIBkL6zfwkesrDiF9E1VvsVoUxNtKMW
 bQANnsu8gzQyTtZtctCDD3/Tcar3ieMVcU97fe+z8F5rFOr9mMr/45RsBFVBxE7Y3NSBCBAVfif
 L+2ZEbw==
X-Google-Smtp-Source: AGHT+IGkgvbbK81Y313EI2eVjqJp0xxjkOZMgt+YfAVqhbNZIv8kHZkCAFFUm74EPaMXfOtFCy6v3A==
X-Received: by 2002:a05:6512:670b:b0:54f:c4da:2346 with SMTP id
 2adb3069b0e04-550d5fae32amr2053023e87.29.1747305420994; 
 Thu, 15 May 2025 03:37:00 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:37:00 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:26 +0200
Message-ID: <20250515103632.2631227-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305421; x=1747910221; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ItJTPDDSgtJzUjihgqJFv2IsDyA31qXxuaWB5KL+Jw=;
 b=AvQjAtYeOmes/ELVph8sEmqFcvOBv0Vx4ZMAynB2Fwkd9lKwJg67U7wNL3I005XoVj
 sNljhrFFYlfwqaA2bBFjsJEytB+OiyaU3YZPvzOWeePXGjYJiDataGIcbtM8jIBGj4jC
 7F0qusH2rcYpHWQF4Bwn/wowrK3P99iRvK9c9yqcH//EO3kT9j7HAbWWxLNSGLPNdQXZ
 yDC+H2hRaLSJvlQ0EWlAZZwHDck7tWK065EN/U/3I162BskoLaYspf++hqbIVUDoEUFU
 UZtbzdSSKywLvAW3dAAdG8Spk6aacJrTTVzI/3hLaosbDc9gmcVjNQhVQUJN/MC/LWZn
 z5nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AvQjAtYe
Subject: [Buildroot] [PATCH 10/10] package/qt6/qt6tools: re-add basic target
 package
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
 package/qt6/Config.in            |  1 +
 package/qt6/qt6tools/Config.in   | 20 ++++++++++++++++++++
 package/qt6/qt6tools/qt6tools.mk | 28 +++++++++++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/qt6tools/Config.in

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 08866a370d..4251b134d4 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -64,6 +64,7 @@ source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6speech/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
new file mode 100644
index 0000000000..d2bd9aea8e
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_QT6TOOLS
+	bool "qt6tools"
+	select BR2_PACKAGE_HOST_QT6TOOLS
+	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert
+	help
+	  This package provides Qt6 Tools:
+
+	  https://code.qt.io/cgit/qt/qttools.git
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_QT6TOOLS_UITOOLS
+	bool "uitools"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  Process Qt Widgets Designer forms at run-time to
+	  produce dynamically generated user interfaces.
+
+endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 6240fe7ee8..01ba1a2961 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -7,14 +7,39 @@
 QT6TOOLS_VERSION = $(QT6_VERSION)
 QT6TOOLS_SITE = $(QT6_SITE)
 QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
+QT6TOOLS_INSTALL_STAGING = YES
 QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6TOOLS_CMAKE_BACKEND = ninja
-QT6TOOLS_LICENSE = GPL-3.0 with Qt-GPL-exception-1.0 (host linguist tools)
+QT6TOOLS_LICENSE = GPL-3.0 with Qt-GPL-exception-1.0
 
 QT6TOOLS_LICENSE_FILES = \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0
+QT6TOOLS_CONF_OPTS = \
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
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6TOOLS_DEPENDENCIES = \
+	host-qt6tools \
+	qt6base
+
 # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DFEATURE_assistant=OFF \
@@ -51,4 +76,5 @@ else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
