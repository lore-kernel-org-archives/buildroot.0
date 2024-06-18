Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41DCC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A3A42B4D;
	Tue, 18 Jun 2024 21:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqT1Avs8WxF1; Tue, 18 Jun 2024 21:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF7842B8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF7842B8E;
	Tue, 18 Jun 2024 21:28:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE511BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56A336081E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-KN6P6QiyZT for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24B22605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B22605EF
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24B22605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:30 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e72224c395so59936241fa.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746048; x=1719350848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5cgyifnHCfZQEyOIm5fhCdTD40KUz3lGOgMYDi/UgE=;
 b=KzIm48gMBx6+bXHizBXj67Oz4lhTAh1pPOm5CzsLHE6q8BLnRZ7snS7Qnv1dAa8cTa
 wAqJv+FnDmk6gH3eDIGM3976OLi6hCfBzCcbeMAF313myGmUlzzjV5uahra/a4lBjD8u
 +QW5IHjQ7En5g/0ay3izIq0n+7FbZ6oX5/OMGAzYzlOFL3x15I4Avi/ttV22RN3BnnKc
 xd6PTh884tNZbcd4YQryT8G9MJy13tSZXHt54BrR8kpSpcVnLXFVC8gbISzIiJ9d8kOP
 4O6rlGf5uC2SMMxv/BIL44T9j86sKle9Vr5qCqJ8HbosIY2ouQ5rKixhP3fNa92VzB5h
 C9Wg==
X-Gm-Message-State: AOJu0Yy+yfMtRB5qPbrxAtJ4r80S6ao4Z7xp2o6njQOxjUkCiGRg7WgN
 U8Mnhyx26+m3lwfua4Bly89BQImWPr9DgF0eHwt58JR7rq/BnlnsyLqnMg==
X-Google-Smtp-Source: AGHT+IHlJSN9dgAq04jXUtedb7TaXJW5mavtbyyswPtIxk7HJQMYKbAqOex64HcXbbVi4yt/1/8qKQ==
X-Received: by 2002:a2e:9e97:0:b0:2ec:2d78:1d8f with SMTP id
 38308e7fff4ca-2ec3ceb9b64mr6620241fa.22.1718746047936; 
 Tue, 18 Jun 2024 14:27:27 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:27 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:36 +0200
Message-ID: <20240618212646.4154474-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746048; x=1719350848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5cgyifnHCfZQEyOIm5fhCdTD40KUz3lGOgMYDi/UgE=;
 b=cdTu11lDEMN0enmVouPiz9MM2o5n2llxQyuukPB+EZvjoQv8YXiMepAK2EmCL4kL7Q
 atj7jgAMVHrfCinexGhOU2c+vXVZqe++FJbGueldxjtdDsnqXAnyFuhgUhIaiNq20lUA
 5CDbNcGpQGtRV8JhWKAyhl6qCWn0wJbJ2Xg2peYt4ZkML7DBv1dLMnUnHRVA/KKcUUiq
 A4djTyjJSNsQI994FoN0PvBiSLFbsBZM0Bo7oGPnHWVVOvrnFNHhaS9bzG6gNVG1ifm5
 Y3pw50xFg3196mf+IeGOMagNOevK1sQr7PQom+MJcKGYBhJdgOtTVBFHP/cdDZOG15Pe
 6oXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cdTu11lD
Subject: [Buildroot] [PATCH v8 13/14] package/qt6/qt6virtualkeyboard: new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6virtualkeyboard/Config.in      | 11 +++++
 .../qt6virtualkeyboard.hash                   | 12 ++++++
 .../qt6virtualkeyboard/qt6virtualkeyboard.mk  | 41 +++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/qt6/qt6virtualkeyboard/Config.in
 create mode 100644 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
 create mode 100644 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 48366f5fd1..9dbc4b804a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -52,6 +52,7 @@ source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 source "package/qt6/qt6tools/Config.in"
+source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
diff --git a/package/qt6/qt6virtualkeyboard/Config.in b/package/qt6/qt6virtualkeyboard/Config.in
new file mode 100644
index 0000000000..c183e14001
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6VIRTUALKEYBOARD
+	bool "qt6virtualkeyboard"
+	select BR2_PACKAGE_QT6DECLERATIVE
+	select BR2_PACKAGE_QT6SVG
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6virtualkeyboard module.
+
+	  https://doc.qt.io/qt-6/qtvirtualkeyboard-index.html
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
new file mode 100644
index 0000000000..3f7f067de5
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -0,0 +1,12 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtvirtualkeyboard-everywhere-src-6.7.1.tar.xz.sha256
+sha256  7b6cd83d1b7f622f909b38bd429536b9d0829621f2d111b3a2f90d8bcdcba85d  qtvirtualkeyboard-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
+sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256  9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6  src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
new file mode 100644
index 0000000000..e65e955808
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qt6virtualkeyboard
+#
+################################################################################
+
+QT6VIRTUALKEYBOARD_VERSION = $(QT6_VERSION)
+QT6VIRTUALKEYBOARD_SITE = $(QT6_SITE)
+QT6VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6VIRTUALKEYBOARD_VERSION).tar.xz
+QT6VIRTUALKEYBOARD_INSTALL_STAGING = YES
+
+QT6VIRTUALKEYBOARD_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6VIRTUALKEYBOARD_CMAKE_BACKEND = ninja
+
+QT6VIRTUALKEYBOARD_LICENSE = \
+	GPL-3.0-only, GFDL-1.3 no invariants (docs), \
+	BSD-3-Clause
+
+QT6VIRTUALKEYBOARD_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/plugins/openwnn/3rdparty/openwnn/NOTICE \
+	src/plugins/pinyin/3rdparty/pinyin/NOTICE \
+	src/plugins/tcime/3rdparty/tcime/COPYING
+
+QT6VIRTUALKEYBOARD_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6VIRTUALKEYBOARD_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	qt6svg
+
+$(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
