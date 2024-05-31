Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB61C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D56342476;
	Fri, 31 May 2024 15:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YHH_Hcf0Twc; Fri, 31 May 2024 15:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F21F42478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F21F42478;
	Fri, 31 May 2024 15:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 982071D541F
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8513461147
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3-PMSRviwAm for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A7E160605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7E160605
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A7E160605
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b78ef397bso2170220e87.0
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168434; x=1717773234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGwNZAOq6qev653cfnWefBFenf5PiXRTz1wncq4HAp4=;
 b=ZdYhz2cG8tIu9YQYZFxk8do6QrUfZIjHErw8U3YDPvOlRVkrtxuA3r2oZaxFsWaOvD
 grHgL5BMBEUMtBzo/bDvwtCNPTcQ/7fD8+QRtFVIgkTMwTHfxUmJ993g9lsXGuY+gLh2
 229vwNS/0OEnGNT4qR1jfKv2Tq4ukHeZUsmKG3q6b2CatVbRtlT1UIMOqCH9TSVCMZWM
 cfSqH9mgG02IjwgLQpK6TX7+2ifSyllxjTvjBJsxzGoX2k5ZJAPYBTiX8BCBR/VeVrma
 KruskGGgC/t4THobHmSJ8RauusJzes/g3QnRk7BdAdRhbSDrMQtJOLqBM645HZM0J/wP
 dh7g==
X-Gm-Message-State: AOJu0Yzxa8OS4zzHQu+HVrBRnkelXr/URVSTo6vvcgWsGHUVWgs1L395
 CNE4AbGHGAY9E8JJJbkE5hIExqTil7Mtu9dR2q6Vi8o9/eLQFYoeSsZDpAOT
X-Google-Smtp-Source: AGHT+IE7ZBlVwzATwxwBC0n57ik3tXGvQggiOSArv/XJNY2DO8Ln46HjSuYYljNFNzsx7QCnNhPfwg==
X-Received: by 2002:a19:ee0c:0:b0:523:a935:df29 with SMTP id
 2adb3069b0e04-52b887405a9mr803151e87.7.1717168433973; 
 Fri, 31 May 2024 08:13:53 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:53 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:14 +0200
Message-ID: <20240531151325.2443323-13-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168434; x=1717773234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGwNZAOq6qev653cfnWefBFenf5PiXRTz1wncq4HAp4=;
 b=FBUBYUQIcxppl6tX4Nmpi6ynbfODXehuKnMMu0TEw+kkm+qX8Zdx657Vtc+IKD/zD3
 WeMPJGjkD4PXJ2SA9QeIBnX0CgMneqTwFat1sYIOxlCfHui3o8130zkFB2B00+bCJ0/5
 MB3IXBKGRik2ld79Bnmcn8UsIeZhGE7NbpVNHrkWjFzVTeOYuS9oOoym/9RdBLbJ9iuM
 UYoIdcrwputCGKjHBZDYCIgRC/DDMPGroCzmgiZbrSPEZGiEU4DRFFYW3Qozn9Kpq057
 Ll8PfkXx86u9wRr0R5MfNhGkOTfoEtuqSCYGqjz3E81KTMdQf37PWfgvtzF3Vn0EPmz7
 058Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FBUBYUQI
Subject: [Buildroot] [PATCH v5 13/14] package/qt6/qt6virtualkeyboard: new
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
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v4 -> v5:
  - Bump to v6.7.1

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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
