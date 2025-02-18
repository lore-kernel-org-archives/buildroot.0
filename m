Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C8C021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 21:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDB660F79;
	Tue, 18 Feb 2025 21:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNm-6fyzlcyk; Tue, 18 Feb 2025 21:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAAAD61076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAAD61076;
	Tue, 18 Feb 2025 21:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E38E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B5140260
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqhPNqkOI8YY for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 21:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F5BB404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F5BB404B6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F5BB404B6
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3092643f4aaso2083861fa.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 13:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739915329; x=1740520129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjFD78XZ1CNcRqM4JnOMY7pTQp4aRoMNixELm5lTimo=;
 b=ZTRhD62UU6XlBEUYZiL82+Agk3sjVMWoUf6UQNV5s57H7YwFLjt0kmSYeHZTRCvIii
 caIogNELUUQ9TJCvYy8Tb1jqKguiJAbP7ec4kmRGJAiDiZueZYsOqHuofDm2ARiJ+OyJ
 xHVK9Oy17iBlTx0tAgMkjyyAb0CzC5qlNP+Hj82eiJFuWHCDdranevV4EhRgLb5jREAl
 gPYdVbVOZrbNes+Y5f+L8mBA6m2uH8ja90HOu7oC+wcOFJh+SJHpiIQK9BVcZzcCro5k
 rEDuHNA8I9pSBtZZCXKbSxyH+xgyRK1rtqr6sQfYdu8no8p2lnjwdR8WFtZn3zmgBjfu
 xLRQ==
X-Gm-Message-State: AOJu0YwZXkBNV02Mq0bkQZj8usZKv6z3hrp64knLzEXpSFZ6JGIi3ujY
 p9Lc9tcNChWpJuxXWPKtpHYRc8cpOhimuVmQF0U8/h0rg1TwlnkYJv8Ysw==
X-Gm-Gg: ASbGncuOxwZCS/OEYFZtMHBXkGl4KxBbOWiPY0VkQGJ4vmCcNfKvKVkR26m7beMVzuR
 4tcKNmIJmarl6HApD5MddTmC16eTJ3RDWwK5VPiYaTK4jQJuv+ZQEhkC0syb2vMJRDnpybcXjSi
 LLmPrAkic1EsCMUa0WsYYOMGh56b8n35y/dAsyUdTaPk5siiYCiCflzBRu1OSmobZrP9HT5arV+
 wf4thJ787ZV7g7yN3TBKcLatNG2kz0hg4hCsNykQy9LMlDOaudYqdRld8q3GJT928ERCD08qfSk
 AZyqSHqlZQiHxuHPzj3GVm7QxAKgzUGlspd53hp9exId0et5Cg==
X-Google-Smtp-Source: AGHT+IGU4uHawKip9q9lJdYYdDuS+VAf5WFRipgYWWiAlGaWfTdg7bbgAscBhHRu9OPp1b6QPoj3bQ==
X-Received: by 2002:a2e:924e:0:b0:30a:33d5:daef with SMTP id
 38308e7fff4ca-30a4416fd32mr5383791fa.13.1739915328869; 
 Tue, 18 Feb 2025 13:48:48 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2be45876sm9720011fa.68.2025.02.18.13.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 13:48:47 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Tue, 18 Feb 2025 22:48:28 +0100
Message-ID: <20250218214830.169568-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218214830.169568-1-roykollensvendsen@gmail.com>
References: <20250218214830.169568-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739915329; x=1740520129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjFD78XZ1CNcRqM4JnOMY7pTQp4aRoMNixELm5lTimo=;
 b=fP1fF5tBHPQLuIcHeM65AfOIdmpCsSUavv9P9IBhYQUX43XiKvR/agTOxeUkfX28cn
 t8k6tzZHtFGXnR6JBeP/52A797wEQh+31GPdETFcOA9wEV/4/u6nUrg8ZnsFcjYCIXd+
 5LfnN8RCgxh0PMVJwDZTmNk/UfncAb6fBlB6ZSM18DCx1fHvxevvTea8HR/khQzGbmWD
 Co8+QPoNtw3I/2dJO83MtIji5l/RXZW19u8GJ0y1bSjFi8Om5mcJfNQQtoPUlMuCzT3P
 h47hw+bJ8OiUs9NMfhgSpTyEUHskzLbTOu9d5olvXja60FjeVNRETwQ8UPtlQzbfjmPz
 vrbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fP1fF5tB
Subject: [Buildroot] [PATCH 3/3] package/qt6/qt6tools: build only host
 linguist tools
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

Strip down qt6tools to the bare minimum by:
- Removing the target package
- Disabling all features except for the linguist tools

This change addresses ongoing issues with qt6tools and focuses on its
primary intended use: providing linguist tools for translating Qt6
applications during the build process.

The linguist tools are essential for internationalization (i18n) of Qt6
applications and are now available as a host package for cross-compilation
purposes.

This modification should resolve stability issues while still maintaining
the core functionality required for Qt6 application translation.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in               |  1 -
 package/qt6/qt6tools/Config.in      | 13 -------
 package/qt6/qt6tools/Config.in.host | 16 ++------
 package/qt6/qt6tools/qt6tools.hash  |  6 ---
 package/qt6/qt6tools/qt6tools.mk    | 59 ++++++++++++-----------------
 5 files changed, 29 insertions(+), 66 deletions(-)
 delete mode 100644 package/qt6/qt6tools/Config.in

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 8ae1f05139..f1d002aa3c 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -60,7 +60,6 @@ source "package/qt6/qt6serialbus/Config.in"
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
index 7a6f8a5176..ef089bb9f4 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -1,18 +1,9 @@
 config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
-	# The Qt Qt Network module is required
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
+	  This package provides Qt6 Tools:
 
-	  Qt Tools provides tools facilitate the development
-	  and design of applications.
-
-	  https://github.com/qt/qttools
+	  https://code.qt.io/cgit/qt/qttools.git
 
 if BR2_PACKAGE_HOST_QT6TOOLS
 
@@ -20,6 +11,7 @@ config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	bool "host linguist tools"
 	help
 	  Translate Qt C++ and Qt Quick applications into local
-	  languages.
+	  languages. Includes tools like lupdate, lrelease, and
+	  lconvert for managing translation files.
 
 endif
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index a1dae628ac..fd2cf2ffd0 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -2,11 +2,5 @@
 sha256  326381b7d43f07913612f291abc298ae79bd95382e2233abce982cff2b53d2c0  qttools-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
-sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..0af707bd22 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -7,57 +7,48 @@
 QT6TOOLS_VERSION = $(QT6_VERSION)
 QT6TOOLS_SITE = $(QT6_SITE)
 QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
-QT6TOOLS_INSTALL_STAGING = YES
 QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
-
 QT6TOOLS_CMAKE_BACKEND = ninja
-
-QT6TOOLS_LICENSE = \
-	BSD-3-Clause (examples), \
-	BSD-3-Clause (corecon), \
-	BSL-1.0 (catch), \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0
+QT6TOOLS_LICENSE = GPL-3.0 with Qt-GPL-exception-1.0 (host linguist tools)
 
 QT6TOOLS_LICENSE_FILES = \
-	LICENSES/BSD-3-Clause.txt \
-	LICENSES/BSL-1.0.txt \
-	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
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
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.2
 HOST_QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_attributionsscanner=OFF \
+	-DFEATURE_clang=OFF \
+	-DFEATURE_clang-rtti=OFF \
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
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
-ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
-HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
-# When we have qt6declarative for the target, we need to build the
-# linguist tool with host-qt6declarative support so that it handles
-# QML/JS files
-ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_HOST_QT6DECLARATIVE),y)
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/lupdate/CMakeLists.txt?h=6.8.2#n61
 HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
 endif
+
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.2#n78
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/CMakeLists.txt?h=6.8.2#n26
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.2#n8
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
 else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif
 
-$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
