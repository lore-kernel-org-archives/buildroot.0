Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24399C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4FC60EEE;
	Tue, 18 Jun 2024 13:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zc9zLHq6_0m; Tue, 18 Jun 2024 13:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118366124D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118366124D;
	Tue, 18 Jun 2024 13:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28B441BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14BD840924
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg0xCP8B_Hzy for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E5D640584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E5D640584
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E5D640584
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:20:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52bbf73f334so5196126e87.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716815; x=1719321615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JN+rYNnr2wgaqJR4yI4hbL/1glxpKWqsJ1wScv/G1yQ=;
 b=cR+qz5GzIp11r2YorWa59tyP95LC+/E+3be/ywBWTm/73kpOVoOrukbffDKjCZG3jZ
 jZBkDalrldCwb1AWW7/7+3RE575Z8AcBF8XCbqPSxoF7r41lzBLimqZ+DELEbK58XvRs
 YC741jbXRA+etUYWbeSgWhYpU34pOoczQrFeu75OzPc50kYdv0qumbvjcomgR2LL2fPh
 OMkBxtVVABQlqi7JHeO0LbbohcD8Azu40T4bDfWokTLIQnoYlGq/nMkQNv6zl19LMQWD
 i2n+Cq2pKRwBCIQ8vkEiodOlaanb+Ps55jxy7FzkdQ3fTyiL+kGdJ596tzAkwfAkq48o
 lNfQ==
X-Gm-Message-State: AOJu0Yxt9mVEgNE23LqggJBiWe+XqoIGB0JGFMQ0tKIwCNJrakslPb+6
 DjSAGW8scMFqDfGTiQ9W2FImXTRMO4EOzzZn6aEelaziQMyIzPxUAQc9Cw==
X-Google-Smtp-Source: AGHT+IG/1Cw+LrkWbL+63/hr3A+8naQ5nQJCDkM3UJYkFIpcN0j/FQHd3mJO07P9p71RzpKBa+0htg==
X-Received: by 2002:a05:6512:60c:b0:52c:785f:ae23 with SMTP id
 2adb3069b0e04-52ca6e65959mr7111950e87.24.1718716815088; 
 Tue, 18 Jun 2024 06:20:15 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:20:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:32 +0200
Message-ID: <20240618131902.2912459-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716815; x=1719321615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JN+rYNnr2wgaqJR4yI4hbL/1glxpKWqsJ1wScv/G1yQ=;
 b=F7agdUyYTeYr5+jXI15ONi3uXGAE416poFnjzaLSZnDODVCKHTfaCX26M2LQwQbRXF
 3BJY9Z5PwX1fwip5/hkYdUxosEZhXpKp+shEp1PjqxfkH0tqS5YUn99S6PNbclJTIdMy
 CoHZ4VzcVBQDQi5Uv3YlG2rAPE8e1lX/xNWRRrsRiQJTNPwOAgHBec4D37Jk+rFqiclz
 6JjX0pazu54sUZa9C1mJxEnmW4XpoOe1l+tqdjJTZU9zXVSNaONJTmAFoZmkYi3ZR+/P
 sQrX6N+L6N5A1/KYfEz4HvTHFKaCXeyKeOq8ehRMChtHZqvs3QIj5fzlkVuC6KEWwy7Y
 VufA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F7agdUyY
Subject: [Buildroot] [PATCH v7 11/14] package/qt6/qt6wayland: new package
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

Add host-qt6wayland as dependency to build the qtwaylandscanner host
tool:

  Failed to find the host tool "Qt6::qtwaylandscanner".  It is part of the
  Qt6WaylandScannerTools package, but the package could not be found.  Make
  sure you have built and installed the host WaylandScanner module, which
  will ensure the creation of the Qt6WaylandScannerTools package.

Select the qt6base and host-qt6base Gui modules to avoid skipping the
build:

  Skipping the build as the condition "TARGET Qt::Gui" is not met.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v6 -> v7:
  - Add libxkbcommon to dependencies when compositor is selected
  - Only depend on qt6declarative if available
  - Don't build client and server for host
  - Select the gui module to avoid skipping build

 package/qt6/Config.in                  |  1 +
 package/qt6/qt6wayland/Config.in       | 27 +++++++++++++
 package/qt6/qt6wayland/qt6wayland.hash | 11 +++++
 package/qt6/qt6wayland/qt6wayland.mk   | 56 ++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 package/qt6/qt6wayland/Config.in
 create mode 100644 package/qt6/qt6wayland/qt6wayland.hash
 create mode 100644 package/qt6/qt6wayland/qt6wayland.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 16f792cff3..69ce0b3f6a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6wayland/Config.in b/package/qt6/qt6wayland/Config.in
new file mode 100644
index 0000000000..11179a4416
--- /dev/null
+++ b/package/qt6/qt6wayland/Config.in
@@ -0,0 +1,27 @@
+comment "qt6wayland needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+config BR2_PACKAGE_QT6WAYLAND
+	bool "qt6wayland"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6wayland module.
+
+	  https://doc.qt.io/qt-6/qtwayland-index.html
+
+if BR2_PACKAGE_QT6WAYLAND
+
+config BR2_PACKAGE_QT6WAYLAND_COMPOSITOR
+	bool "Enable compositor (experimental)"
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
new file mode 100644
index 0000000000..b0760f661e
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtwayland-everywhere-src-6.7.1.tar.xz.sha256
+sha256  7ef176a8e701c90edd8e591dad36f83c30d623ef94439ff62cafcffd46a83d20  qtwayland-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
new file mode 100644
index 0000000000..62fa966577
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# qt6wayland
+#
+################################################################################
+
+QT6WAYLAND_VERSION = $(QT6_VERSION)
+QT6WAYLAND_SITE = $(QT6_SITE)
+QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
+QT6WAYLAND_INSTALL_STAGING = YES
+
+QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WAYLAND_CMAKE_BACKEND = ninja
+
+QT6WAYLAND_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WAYLAND_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_wayland_client=ON
+
+QT6WAYLAND_DEPENDENCIES = \
+	qt6base \
+	wayland \
+	host-qt6wayland
+
+HOST_QT6WAYLAND_CONF_OPTS = \
+	-DFEATURE_wayland_client=OFF \
+	-DFEATURE_wayland_server=OFF
+
+HOST_QT6WAYLAND_DEPENDENCIES = host-qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6WAYLAND_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
+QT6WAYLAND_DEPENDENCIES += libxkbcommon
+else
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
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
