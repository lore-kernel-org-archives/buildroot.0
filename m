Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963BAC2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2552842B48;
	Tue, 18 Jun 2024 21:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeF_FIUAkYyQ; Tue, 18 Jun 2024 21:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D7B42B3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D7B42B3D;
	Tue, 18 Jun 2024 21:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8481BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78E776089B
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAriZEPg8D1Z for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 072F6605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072F6605EF
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 072F6605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so76785321fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746040; x=1719350840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qv1NX+ouQr0Je5GgLzq1UrhU7s4r/elDqt2ANIwOOU=;
 b=AWztT9WzpazJ48IeyV2rEuFA1fJ5/Ueai1Do/xLg3wrdB7nhUf75iTDDmMlx4B7Urm
 AnZfUOZ3zyW1HMWv5XziMv5aqRwfUjr4R7N9Tyj7ou69Bxuqm1JM6nC3eJn2eElwyB3m
 i+b68TuqxdM6AE6sMA40v1VCnzUXslEmn9CXuGxrNOK1w9JgojPCtb2uxLNY464HIp/N
 dv6dSVWPfBGJvNrt/1Nby7i7BwwdXpQYpqdzy/xlQSv8G3lXS8RH39BlLrlSNzVdt44v
 PS9Cja3zSYyLEhde3vWUTL/zjXo2t9NVMwiNTIWQIXfbE/mkO3wYsIrZwopVKcVeeBvG
 Z37g==
X-Gm-Message-State: AOJu0Yz2ZUUKhaWx2B4nMdSZQYBtJvwRdQR57tXZy+NIO8OPgt9fKH3p
 KzC+rxoEWWKcuHNimu1gujJFko77bXrNoUQj2JqP4Ss7sdw+2iHU4EDzqQ==
X-Google-Smtp-Source: AGHT+IE6eheCyz6EmP2v/iLOmZFQ1ivTdHWV2U/NSnn7pdoRucay6cVcYt1OvJn0+Ak1NwPBHho+Gg==
X-Received: by 2002:a2e:2416:0:b0:2ea:e56c:f898 with SMTP id
 38308e7fff4ca-2ec3cfd666fmr6343091fa.33.1718746039650; 
 Tue, 18 Jun 2024 14:27:19 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:19 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:32 +0200
Message-ID: <20240618212646.4154474-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746040; x=1719350840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qv1NX+ouQr0Je5GgLzq1UrhU7s4r/elDqt2ANIwOOU=;
 b=h3G0azw0PzNYTAMsJ9mQ4WnYtViRtQ9/rFW8+GGKbnkMtLGac3XvApOJrmvRuBNsbN
 3PG4udWTuVXGjiQ6ynZzBxIndGqPE+i+6Dl2jh/z1BnZkPOtCT2Xe2RHzQGt4UgTNFbj
 laNJBrBm6dB4UzBIsciLaSGvFVoCBcPfILbOVdQ+AVOMGeqM16GwOr3x0vbc2BvMmiSd
 Ar1LUPOeUYubI7G59Rh5Ds0eiB4AxZ/qmYX64hb2u1m0XZ7iHwG8ek9ONkZTKrImlZ5d
 73fyLCX+HaUfLgJM2/+h6PSrWt1zEGye8Qa+LJCynVOmI4NtwZCoOO+UnoHZYOI7rLMN
 zhTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h3G0azw0
Subject: [Buildroot] [PATCH v8 09/14] package/qt6/qt6declarative: new package
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

Add host-qt6svg to dependencies when qt6svg is available to build the
required svgtoqml host tool:

  Failed to find the host tool "Qt6::svgtoqml".  It is part of the
  Qt6QuickTools package, but the package could not be found.  Make sure you
  have built and installed the host Quick module, which will ensure the
  creation of the Qt6QuickTools package.

Select the host-qt6base Testlib module to build the qmltestrunner host
tool when the qt6base Testlib module is enabled:

  Failed to find the host tool "Qt6::qmltestrunner".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).

Select the host-qt6base Network module to build the qmlprofiler host
tool when the qt6base Network module is enabled:

  Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).

Add patch to avoid checking for FEATURE_ssl when FEATURE_network
is not available. FEATURE_ssl is defined by the Qt Network module. So
we will get the following build failure if the patch is not applied and
FEATURE_network=ON:

  Attempting to evaluate feature ssl but its definition is missing.  Either
  the feature does not exist or a dependency to the module that defines it is
  missing

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v7 -> v8:
  - Simplify commit message
  - Add section about missing qmlprofiler host tool to commit message
  - Fix build caused by missing qmlprofiler host tool

 package/qt6/Config.in                         |  1 +
 ...1-Fix-build-with--no-feature-network.patch | 28 +++++++++
 package/qt6/qt6declarative/Config.in          | 22 +++++++
 .../qt6/qt6declarative/qt6declarative.hash    | 11 ++++
 package/qt6/qt6declarative/qt6declarative.mk  | 61 +++++++++++++++++++
 5 files changed, 123 insertions(+)
 create mode 100644 package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
 create mode 100644 package/qt6/qt6declarative/Config.in
 create mode 100644 package/qt6/qt6declarative/qt6declarative.hash
 create mode 100644 package/qt6/qt6declarative/qt6declarative.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 81682af476..625134d281 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
new file mode 100644
index 0000000000..bef5794229
--- /dev/null
+++ b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
@@ -0,0 +1,28 @@
+From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 2001
+From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
+Date: Tue, 21 Nov 2023 23:58:43 +0900
+Subject: Fix build with -no-feature-network
+
+Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
+Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
+Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=8377691a0998fd84e6fc8349a5db450bf2d79164
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+---
+ src/qml/configure.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
+index 2d0434643a..d1ff90bd54 100644
+--- a/src/qml/configure.cmake
++++ b/src/qml/configure.cmake
+@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
+     SECTION "QML"
+     LABEL "QML SSL support"
+     PURPOSE "Provides ssl support in QML."
+-    CONDITION QT_FEATURE_ssl
++    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
+ )
+ 
+ # On arm and arm64 we need a specialization of cacheFlush() for each OS to be
+-- 
+cgit v1.2.3
diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
new file mode 100644
index 0000000000..0a977ed808
--- /dev/null
+++ b/package/qt6/qt6declarative/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QT6DECLARATIVE
+	bool "qt6declarative"
+	# Enable host test module to ensure that qmltestrunner is built
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6declarative module.
+
+	  https://doc.qt.io/qt-6/qtdeclarative-index.html
+
+if BR2_PACKAGE_QT6DECLARATIVE
+
+config BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	bool "quick module"
+	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT6SHADERTOOLS
+
+endif
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
new file mode 100644
index 0000000000..480e3805ca
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtdeclarative-everywhere-src-6.7.1.tar.xz.sha256
+sha256  81135c96ed2f599385b8a68c57f4f438dad193c62f946f5b200a321558fd9f1c  qtdeclarative-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
new file mode 100644
index 0000000000..e3af0e80ef
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt6declaratve
+#
+################################################################################
+
+QT6DECLARATIVE_VERSION = $(QT6_VERSION)
+QT6DECLARATIVE_SITE = $(QT6_SITE)
+QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
+QT6DECLARATIVE_INSTALL_STAGING = YES
+
+QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6DECLARATIVE_CMAKE_BACKEND = ninja
+
+QT6DECLARATIVE_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6DECLARATIVE_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6DECLARATIVE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6DECLARATIVE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6base
+
+QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6declarative \
+	qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
+HOST_QT6DECLARATIVE_DEPENDENCIES += \
+	host-qt6shadertools
+QT6DECLARATIVE_DEPENDENCIES += \
+	host-qt6base \
+	qt6shadertools
+
+# We need host-qt6svg, when qt6svg is available to build the required
+# svgtoqml host tool
+ifeq ($(BR2_PACKAGE_QT6SVG),y)
+HOST_QT6DECLARATIVE_DEPENDENCIES += host-qt6svg
+endif
+
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
