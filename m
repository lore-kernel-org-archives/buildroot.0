Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E90C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC32416F9;
	Mon, 13 May 2024 22:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXRdz6foc9SV; Mon, 13 May 2024 22:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B4C416E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75B4C416E8;
	Mon, 13 May 2024 22:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 053BB1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E561940546
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cZlbQ-LDI-u for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 661E44053C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661E44053C
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 661E44053C
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:04:17 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e564cad1f1so39389261fa.0
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637855; x=1716242655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYFA+bjHuzBXW0DpUk6nrcBsJu624+RAfEvvcRr2QJs=;
 b=kcY17K6TAW/RsL70oI7wKjiH4KED9mmNGGgvs3MNSYfesgVNJy1HAjqtxhTC2ojd7O
 833EA9isK74601rfwlvSXUgmVJXouy9UOAV/vpv4Sh5aHAItnDYmxOrME4aP+7WkDZnA
 vVY6lpzbEyG6ZdyZl+zUBIE21Gm83cRURTDBm9evqC/1thhoI5BidzdFw8IVUXwbnDB7
 OgK9sSyvCCHfhn8AmWW7i1y0DUWFymw74mb+NMWRRx1k/7PYPikgd8mp5p8/0sFUzlCo
 Y5INOHshqY7G3yWX0TId86Vxsazt1lK27NadnFR2dj7FvsKV6GXGE5H0r83gIwzRxUWv
 JFhQ==
X-Gm-Message-State: AOJu0YxtAEBkA0Py9FGlFS5KalAXqSXaoggQzQuSbplPOEPZneisNddT
 XKiTDJaK75c1mr0ZxkSPA5PouwApbW3YLVZ1Rb7fl4LOSwLEQ8p1rTYvvtwl
X-Google-Smtp-Source: AGHT+IEtYesFUsSAUswpj12Qs7+qzgF/U63Y1MtOI7i6EZI9gYX8CC/UUhhNluZDNtBLyD9v+c63iA==
X-Received: by 2002:a05:651c:19a6:b0:2d9:f00c:d2d5 with SMTP id
 38308e7fff4ca-2e52039e2d3mr75023841fa.46.1715637855047; 
 Mon, 13 May 2024 15:04:15 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:04:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:18 +0200
Message-ID: <20240513220328.1085629-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637855; x=1716242655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYFA+bjHuzBXW0DpUk6nrcBsJu624+RAfEvvcRr2QJs=;
 b=H3Yscyag9zf7Z4dBk6Oyqcf6hRy1O/mCDlY9bWnIdOhJ6jWRLfE1d+TOdLxQyC15+n
 Jzt0eN5M3lU03H3CLhSlcaIsx75dD90ICZvnqAHUjFMpv4OXFZCzILBgL1cDL6zU8YHi
 fCJZIqXMMKwwTmvRfZgRy0HJ2UoNDBxcDmX3T08oKrlBr0eyigJU1dEEGb9P5mphJN/U
 vsbnxEu+FCeSe+tjynmwtYEWZ5+NEbD0DaUfyob5iOWwARZN45GBpuccJmDjxUsfUThR
 ovjipgJ+fzcPLNEu5AMR4w8FXNPHlkhKAgYuXcqfrhMJrVhAesQRJB8/cyD82bdjacuA
 9dhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H3Yscyag
Subject: [Buildroot] [PATCH v4 13/14] package/qt6/qt6virtualkeyboard: new
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6virtualkeyboard/Config.in      |  9 ++++
 .../qt6virtualkeyboard.hash                   | 12 +++++
 .../qt6virtualkeyboard/qt6virtualkeyboard.mk  | 49 +++++++++++++++++++
 4 files changed, 71 insertions(+)
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
index 0000000000..59e9dc3595
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6VIRTUALKEYBOARD
+	bool "qt6virtualkeyboard"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6virtualkeyboard module.
+
+	  https://doc.qt.io/qt-6/qtvirtualkeyboard-index.html
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
new file mode 100644
index 0000000000..dc9a0f23ab
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -0,0 +1,12 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtvirtualkeyboard-everywhere-src-6.7.0.tar.xz.sha256
+sha256  d61bb2a18b1b06f64c956b2bde740c90a4bb46c47a99b31462e6e8d278a0cb6a  qtvirtualkeyboard-everywhere-src-6.7.0.tar.xz
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
index 0000000000..e49643149e
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
@@ -0,0 +1,49 @@
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
+HOST_QT6VIRTUALKEYBOARD_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6VIRTUALKEYBOARD_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	qt6svg \
+	host-qt6declarative
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
