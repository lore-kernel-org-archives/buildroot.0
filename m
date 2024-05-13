Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F8FC25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A43A4416D3;
	Mon, 13 May 2024 22:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_5woVDyH09h; Mon, 13 May 2024 22:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09FC8416CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09FC8416CF;
	Mon, 13 May 2024 22:04:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 866321BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7249B81370
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTUrxS7ZZAL6 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE84681310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE84681310
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE84681310
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:04:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e6792ea67fso18861481fa.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637847; x=1716242647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jBzLofZooZ1JZVlsOJygoWY3ZaUituddSiHa8Gv7j8=;
 b=DqzS4bw4TDGo+tEiwy5fyMTQ+ieB3E4Yl/6OXvyCq4mbBN4jumqCtmVdPrBEu3M++e
 mASM6G0t7Dw/5fq5QBEtI3jfeDAeixff4SISJOZ6fBv9fsCdw2GIFeyzJz1pqEwgswwO
 Bm/bJhdnkVsqfaLY76VRZBAGDTFWtxfbRqON8KpAM4biJMuy0dAfVWIielC81s86XFYK
 AqZXIr38A8ZN+5cnbV7kkHtvCqZAeqOZwXC/hi4K9nV5m+oe8ikLHIf+4QhIqP+rwYV2
 sBm9Oq2nQabYiXa0zNCKm8nsJfAsy8KzyU24fPAAAw4kg1pdAkBgmS8tze+r78L7dn+i
 i/PA==
X-Gm-Message-State: AOJu0YxfC58DmS4IkyiTuS69rLdldXQRzUg7j0qSunJDP8mPNwZpXn50
 ctEgg0m9zIFu4ZgExVHRofBzFXx0WKW20B+JYpZMNMrgQZAelco66bjdIvSZ
X-Google-Smtp-Source: AGHT+IFSepM7UYgoVSajQyM0N2EQ8PIOeLbljLj1T9uF4TUeZIVAFmcWV416VRGC6Sol0aY0fE0orA==
X-Received: by 2002:a2e:b889:0:b0:2db:381a:bf6e with SMTP id
 38308e7fff4ca-2e51ff5d117mr79526281fa.16.1715637846663; 
 Mon, 13 May 2024 15:04:06 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:04:06 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:14 +0200
Message-ID: <20240513220328.1085629-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637847; x=1716242647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jBzLofZooZ1JZVlsOJygoWY3ZaUituddSiHa8Gv7j8=;
 b=gP9HN9yJpDzZzkn+p3o+oqxswGT1Hti2mJWZDjIxn3tC2a5744YdxRUK6YqBwSqQI3
 fcNYB0Nkr1v6qUTx+RCaDUrT1BF5UVdtUQQJji0Qm2ceip1q86tGc3o49/srkJT6UkbN
 IF5QXTgTYQieWpcrBQA+j2MX+0f9UUeSMc4PYgiay+T4BueKSl/JZd+8mt4XOqaglQj6
 1iw7KV34kyoRxNNaMgdjIId+MXo3AprLKBBWlSZ7tQv2s2WeeCFAfXfHOAzaEk/pa9dX
 Oi5Vw4ex9XLXc+FM7GrGwY/Ow/t/IbiBqpuX2lMuRlFffxs+uAHNeH+bQ4Mn4ASZOUf2
 VOqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gP9HN9yJ
Subject: [Buildroot] [PATCH v4 09/14] package/qt6/qt6declarative: new package
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

We add the patch to avoid checking for FEATURE_ssl when FEATURE_network
is not available. FEATURE_ssl is defined by the Qt Network module. So
we will get the following build failure if the patch is not applied and
FEATURE_network=ON:

CMake Error at qt6base-6.7.0/cmake/QtFeature.cmake:376 (message):
  Attempting to evaluate feature ssl but its definition is missing.  Either
  the feature does not exist or a dependency to the module that defines it is
  missing
Call Stack (most recent call first):
  qt6base-6.7.0/cmake/QtFeature.cmake:141 (qt_evaluate_feature)
  qt6base-6.7.0/cmake/QtFeature.cmake:180 (qt_internal_evaluate_config_expression)
  qt6base-6.7.0/cmake/QtFeature.cmake:396 (qt_evaluate_config_expression)
  qt6base-6.7.0/cmake/QtFeature.cmake:711 (qt_evaluate_feature)
  qt6base-6.7.0/cmake/QtFeature.cmake:680 (qt_feature_module_end)
  src/qml/CMakeLists.txt:13 (qt_feature_evaluate_features)

To avoid the following build error, we also make sure the host qt6base is
built with Testlib enabled:

CMake Error at buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:684 (message):
  Failed to find the host tool "Qt6::qmltestrunner".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).
Call Stack (most recent call first):
  buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:72 (qt_internal_find_tool)
  tools/qmltestrunner/CMakeLists.txt:11 (qt_internal_add_tool)

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v3 -> v4:
  - Fix build failure when Testlib enabled for target. (suggested by Jesse)
  - Squash the 'Fix build with -no-feature-network'-patch into this commit,
    since no earlier version of the qt6declarative package exist.
 
 package/qt6/Config.in                         |  1 +
 ...1-Fix-build-with--no-feature-network.patch | 28 ++++++++++
 package/qt6/qt6declarative/Config.in          | 24 ++++++++
 .../qt6/qt6declarative/qt6declarative.hash    | 11 ++++
 package/qt6/qt6declarative/qt6declarative.mk  | 56 +++++++++++++++++++
 5 files changed, 120 insertions(+)
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
index 0000000000..1daa645413
--- /dev/null
+++ b/package/qt6/qt6declarative/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_QT6DECLARATIVE
+	bool "qt6declarative"
+	# Enable host test module to ensure that qmltestrunner is built
+	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST
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
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6LANGUAGESERVER
+	select BR2_PACKAGE_QT6SHADERTOOLS
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_HOST_QT6SVG
+	select BR2_PACKAGE_HOST_QT6DECLARATIVE
+
+endif
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
new file mode 100644
index 0000000000..ae9925509b
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtdeclarative-everywhere-src-6.7.0.tar.xz.sha256
+sha256  5a0c39579a74d7cca581162c866ed0887287d4f8d5abff7ab9492d4a58fa9e2c  qtdeclarative-everywhere-src-6.7.0.tar.xz
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
index 0000000000..2348ff2dae
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -0,0 +1,56 @@
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
+	-DQT_FEATURE_qml_profiler=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6DECLARATIVE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_FEATURE_ssl=OFF
+
+QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6base \
+	host-qt6svg \
+	host-qt6shadertools \
+	host-qt6declarative \
+	qt6base \
+	qt6shadertools \
+	qt6languageserver \
+	qt6svg
+
+HOST_QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6base \
+	host-qt6svg \
+	host-qt6shadertools
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
