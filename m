Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9872C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 14:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A66B3842F3;
	Sat, 28 Jun 2025 14:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9JHaslaU1ML; Sat, 28 Jun 2025 14:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E0E8842FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0E8842FA;
	Sat, 28 Jun 2025 14:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2BA2154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4B7E403A7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z50LxIjhDfbX for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 14:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8C6040342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C6040342
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8C6040342
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-553e5df44f8so574355e87.3
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 07:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751119570; x=1751724370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiPqzWt8cd1G1cpM26zt65WidWkkjzNzAqCd3IFSYDs=;
 b=LXGM0A32rjRdwyMGCHDwrplG9iQB9n0c1A98ba8YRszIZUrUbjK72MVbE1nGRT7YIW
 37UhX3S9FRD7HMVc2wmuOR8q8WfIl97qEyKF6MulP2SRh+GQhU9WcarV6vnYrus991PP
 LJL7h6ZSUVD8wsrHNxylVBHDT5Fz1m8Xg1AqrgbaK3WFx2fUSzJtQHZK+hLCrdev18B2
 uBilld3Qnj8meePEiXJZNx/LGajsjm1HSwPXF8gbh0fhqJPG2eR56j4DH1EYxrMCiAYQ
 vWvJxHFpwjn0CWseTUMMao1MyZQp1pyl78vMmucyloQQRPVBQo9EGamquekHMf9Kjsmi
 9hnA==
X-Gm-Message-State: AOJu0YwyRKXHRlHYB/GwtRHa0MqELOCrG/pWY3an/0LCxGVvr4Pt+v3V
 Z4OJPkEB3cISlDXl17IFieWbyS7TPTpNky6wBG9nvxdy0bQu9Fc3RSirtvEzyw==
X-Gm-Gg: ASbGncvgV/dsmG6hVAuSeKtNqNPBDoe3umnb6KHek5vv8RQIPhudYGbFd1jUNWAGxN7
 5x4TUlJi/qOK73WEdmtuyCdMRIuCamTJu38NwB5Wmptx0ho+Tv7WnHcR/v4OKjaeXQ2QtPuVvK4
 XwMzIM7WVYLBAw+odqKoZixDmhqGUdOJkxbyA8s278JLpJaIRYgRLp/jBNeJb2865tIeoLXUCw0
 vwE6DgLXANbb7i893l6ZYST3FjblHZY4eNbjK3HEakN4KYZVe+hHpVeSO4SR7tE6FKB2XDTo91V
 kT3+e3ZMSvaMkqoe8oVSQtnKELL25OOFOKapaVMjIBNZ9ERlBF13bzRJssZC8dlwPoHi0jyKLuE
 oCGsebEH4ikJC9r4h6ECk
X-Google-Smtp-Source: AGHT+IHm3d+OAhHAqNKfB6a6rmdSivjcQbUO3KCIIObMnQC4JQAoaudsDzTJkF/BHgs5ZBLH2Nq8kA==
X-Received: by 2002:a05:6512:23a3:b0:553:2e99:c20 with SMTP id
 2adb3069b0e04-5550b88d5f4mr2157908e87.34.1751119569302; 
 Sat, 28 Jun 2025 07:06:09 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2b8d6dsm814507e87.109.2025.06.28.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 07:06:08 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 16:05:48 +0200
Message-ID: <20250628140550.4030996-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
References: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751119570; x=1751724370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiPqzWt8cd1G1cpM26zt65WidWkkjzNzAqCd3IFSYDs=;
 b=BQqnPsz1q9Twv4ALUX6o9LWC8r+s4dOk/xG8DugC75UqrrEfvaGy8InPB9JplIYhc9
 4zEDcFPdKc4+GFrE83QApP24qWXkAFZ7dHLvtGkIDOV+lgwi7YszuQP3IMAhug6o89gt
 YfUwc9A37o5gphsOUZuUS4D4JtfzTm0boKqsL/zrWnT4MNn9r9Z2sJoN3Ut8HITc+M9I
 20H0d2owsRXt9q2VI6/mh4gjyNh0WjIsysNMtXj32qpsuDMhLf1EzFbXWF2d92vDMB7G
 nGVWU5OloieAOR7C9z4jsFBPfAycQlyDfRZeGVK4+K48E5D9wIMWMT35PfGAmwQGkzL/
 lRPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BQqnPsz1
Subject: [Buildroot] [RFC 2/2] package/qt6/qt6webengine: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |   1 +
 ...ld-in-buildroot-caused-by-duplicated.patch |  25 ++
 package/qt6/qt6webengine/Config.in            |  79 ++++
 package/qt6/qt6webengine/qt6webengine.hash    |  15 +
 package/qt6/qt6webengine/qt6webengine.mk      | 417 ++++++++++++++++++
 5 files changed, 537 insertions(+)
 create mode 100644 package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-duplicated.patch
 create mode 100644 package/qt6/qt6webengine/Config.in
 create mode 100644 package/qt6/qt6webengine/qt6webengine.hash
 create mode 100644 package/qt6/qt6webengine/qt6webengine.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 7a998b922d..99c7b026b8 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -68,6 +68,7 @@ source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6webchannel/Config.in"
+source "package/qt6/qt6webengine/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-duplicated.patch b/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-duplicated.patch
new file mode 100644
index 0000000000..a3e44720eb
--- /dev/null
+++ b/package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-duplicated.patch
@@ -0,0 +1,25 @@
+From a827b84caf49d19f0c21669e5a0bf8fbcba5a5a1 Mon Sep 17 00:00:00 2001
+From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+Date: Tue, 24 Jun 2025 00:08:34 +0200
+Subject: [PATCH] fix chromium build in buildroot caused by duplicated path
+
+---
+ cmake/QtToolchainHelpers.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/QtToolchainHelpers.cmake b/cmake/QtToolchainHelpers.cmake
+index eaa3a4339..5b7a3f166 100644
+--- a/cmake/QtToolchainHelpers.cmake
++++ b/cmake/QtToolchainHelpers.cmake
+@@ -563,7 +563,7 @@ macro(append_toolchain_setup)
+             list(APPEND gnArgArg host_cpu="${cpu}")
+         endif()
+         if(CMAKE_SYSROOT)
+-            list(APPEND gnArgArg target_sysroot="${CMAKE_SYSROOT}")
++#            list(APPEND gnArgArg target_sysroot="${CMAKE_SYSROOT}")
+         endif()
+     elseif(MACOS)
+         get_gn_arch(cpu ${arch})
+-- 
+2.49.0
+
diff --git a/package/qt6/qt6webengine/Config.in b/package/qt6/qt6webengine/Config.in
new file mode 100644
index 0000000000..9cb7e39508
--- /dev/null
+++ b/package/qt6/qt6webengine/Config.in
@@ -0,0 +1,79 @@
+config BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
+	bool
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n309
+	# May be extended to other arm variants later
+	default y if BR2_aarch64 || BR2_x86_64 || (BR2_arm && BR2_ARM_CPU_ARMV7A)
+	depends on BR2_HOSTARCH = "x86_64"
+
+comment "qt6webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 10"
+	depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_HOST_GCC_AT_LEAST_10
+
+comment "qt6webengine needs an OpenGL and EGL-capable backend"
+	depends on BR2_PACKAGE_Q6WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS || !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_QT6WEBENGINE
+	bool "qt6webengine"
+	depends on BR2_PACKAGE_QT6WEBENGINE_ARCH_SUPPORTS
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n377
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n501
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n14
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n263
+	depends on BR2_HOST_GCC_AT_LEAST_10 # C++20
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_UDEV
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n279
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6DECLARATIVE
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n270
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n9
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/.cmake.conf?h=6.9.1#n3
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
+	#https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n324
+	select BR2_PACKAGE_HOST_NODEJS
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n347
+	select BR2_PACKAGE_HOST_PYTHON_HTML5LIB
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n439
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXKBFILE if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT6BASE_XCB
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This package provides Qt6 WebEngine:
+
+	  https://doc.qt.io/qt-6/qtwebengine-index.html
+	  https://code.qt.io/cgit/qt/qtwebengine.git/
+
+if BR2_PACKAGE_QT6WEBENGINE
+
+config BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS
+	bool "proprietary codecs"
+	help
+	  Enables the use of proprietary codecs such as h.264/h.265 and
+	  MP3.
+
+config BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER
+	bool "spellchecker"
+	help
+	  Provides a spellchecker.
+
+config BR2_PACKAGE_QT6WEBENGINE_WEBRTC
+	bool "webrtc"
+	# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n138
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_QT6BASE_XCB
+	help
+	  Provides WebRTC support.
+
+endif
diff --git a/package/qt6/qt6webengine/qt6webengine.hash b/package/qt6/qt6webengine/qt6webengine.hash
new file mode 100644
index 0000000000..c439848257
--- /dev/null
+++ b/package/qt6/qt6webengine/qt6webengine.hash
@@ -0,0 +1,15 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwebengine-everywhere-src-6.9.1.tar.xz.sha256
+sha256  787dfde22b348f6d620f2207ed7e32ad0a5389373182614272de28ff3f91c26c  qtwebengine-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  0d816b54ffd9a6cf3bb78f2241c4e45f099b92d36d76c6944c184daa90f65a62  LICENSES/LGPL-2.0-or-later.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  4f740497cf8ad0e564de90d3416a06c3d6b1d69d6883fe539925e3353d68a466  LICENSES/LicenseRef-Tango-Icons-Public-Domain.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6webengine/qt6webengine.mk b/package/qt6/qt6webengine/qt6webengine.mk
new file mode 100644
index 0000000000..982bdce873
--- /dev/null
+++ b/package/qt6/qt6webengine/qt6webengine.mk
@@ -0,0 +1,417 @@
+################################################################################
+#
+# qt6webengine
+#
+################################################################################
+
+QT6WEBENGINE_VERSION = $(QT6_VERSION)
+QT6WEBENGINE_SITE = $(QT6_SITE)
+QT6WEBENGINE_SOURCE = qtwebengine-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBENGINE_VERSION).tar.xz
+QT6WEBENGINE_INSTALL_STAGING = YES
+QT6WEBENGINE_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6WEBENGINE_CMAKE_BACKEND = ninja
+
+QT6WEBENGINE_LICENSE = \
+	Apache-2.0 \
+	BSD-3-Clause \
+	GPL-3.0 with Qt-GPL-exception-1.0 \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 \
+	MIT
+
+QT6WEBENGINE_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.0-or-later.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-Tango-Icons-Public-Domain.txt \
+	LICENSES/MIT.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6WEBENGINE_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DFEATURE_qtwebengine_build=ON \
+	-DFEATURE_qtpdf_build=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DQT_SHOW_EXTRA_IDE_SOURCES=OFF
+
+# Host tools
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n37
+QT6WEBENGINE_DEPENDENCIES = host-ninja
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n48
+QT6WEBENGINE_DEPENDENCIES += host-nodejs
+
+#https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n38
+QT6WEBENGINE_DEPENDENCIES += host-qt6webengine # gn host tool
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n347
+QT6WEBENGINE_DEPENDENCIES += host-python-html5lib
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n352
+QT6WEBENGINE_DEPENDENCIES += host-gperf
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n358
+QT6WEBENGINE_DEPENDENCIES += host-bison
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n364
+QT6WEBENGINE_DEPENDENCIES += host-flex
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n370
+QT6WEBENGINE_DEPENDENCIES += host-pkgconf
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n279
+QT6WEBENGINE_DEPENDENCIES += \
+	host-qt6declarative \
+	qt6base \
+	qt6declarative
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n414
+QT6WEBENGINE_DEPENDENCIES += \
+	host-libnss \
+	libnss
+
+QT6WEBENGINE_DEPENDENCIES += host-fontconfig
+
+## Core
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n55
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_embedded_build=ON
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n61
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_alsa=ON
+QT6WEBENGINE_DEPENDENCIES += alsa-lib
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_alsa=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n72
+ifeq ($(BR2_PACKAGE_QT6POSITIONING),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_geolocation=ON
+QT6WEBENGINE_DEPENDENCIES += qt6positioning
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_geolocation=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n76
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_pulseaudio=ON
+QT6WEBENGINE_DEPENDENCIES += pulseaudio
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_pulseaudio=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n81
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_gbm=ON
+QT6WEBENGINE_DEPENDENCIES += libgbm
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_gbm=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n87
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_printing_and_pdf=ON
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_printing_and_pdf=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n93
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_pepper_plugins=ON
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_pepper_plugins=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n98
+ifeq ($(BR2_PACKAGE_QT6WEBCHANNEL),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webchannel=ON
+QT6WEBENGINE_DEPENDENCIES += qt6webchannel
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webchannel=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n104
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_PROPRIETARY_CODECS),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_proprietary_codecs=ON
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_proprietary_codecs=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n117
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_SPELLCHECKER),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_spellchecker=ON
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_spellchecker=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n134
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_WEBRTC),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webrtc=ON
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n140
+ifeq ($(BR2_PACKAGE_GLIB2),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webrtc_pipewire=ON
+QT6WEBENGINE_DEPENDENCIES += libglib2 # gio
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webrtc_pipewire=OFF
+endif
+ifeq ($(BR2_PACKAGE_QT6WEBENGINE_HAS_X11_SUPPORT),y)
+QT6WEBENGINE_DEPENDENCIES += xlib_libXdamage
+endif
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_webrtc=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n161
+ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_vulkan=ON
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_vulkan=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/core/api/configure.cmake?h=6.9.1#n168
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_vaapi=OFF
+else ifeq ($(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_LIBVA),yy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_vaapi=ON
+QT6WEBENGINE_DEPENDENCIES += libgbm libva
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_vaapi=OFF
+endif
+
+## Optional system libraries
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n598
+ifeq ($(BR2_PACKAGE_RE2),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_re2=ON
+QT6WEBENGINE_DEPENDENCIES += re2
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_re2=OFF
+endif
+
+# DEBUG THIS:
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n603
+#ifeq ($(BR2_PACKAGE_ICU),y)
+#QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_icu=ON
+#QT6WEBENGINE_DEPENDENCIES += icu
+#else
+#QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_icu=OFF
+#endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n608
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n79
+ifeq ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),yyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libwebp=ON
+QT6WEBENGINE_DEPENDENCIES += host-webp webp
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libwebp=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n612
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libopenjpeg2=ON
+QT6WEBENGINE_DEPENDENCIES += openjpeg
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libopenjpeg2=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n616
+ifeq ($(BR2_PACKAGE_OPUS),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_opus=ON
+QT6WEBENGINE_DEPENDENCIES += opus
+# host perl is needed for optimization of opus:
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n810
+QT6WEBENGINE_DEPENDENCIES += host-perl
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_opus=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n620
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_OPUS)$(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_MUX)$(BR2_PACKAGE_WEBP_DEMUX),yyyyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_ffmpeg=ON
+QT6WEBENGINE_DEPENDENCIES += ffmpeg
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_ffmpeg=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n625
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libvpx=ON
+QT6WEBENGINE_DEPENDENCIES += libvpx
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libvpx=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n630
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_snappy=ON
+QT6WEBENGINE_DEPENDENCIES += snappy
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_snappy=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n634
+ifeq ($(BR2_PACKAGE_GLIB2),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_glib=ON
+QT6WEBENGINE_DEPENDENCIES += libglib2
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_glib=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n638
+ifeq ($(BR2_PACKAGE_HAS_ZLIB),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_zlib=ON
+QT6WEBENGINE_DEPENDENCIES += zlib
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_zlib=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n648
+ifeq ($(BR2_PACKAGE_MINIZIP),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_minizip=ON
+QT6WEBENGINE_DEPENDENCIES += minizip
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_minizip=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n652
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libevent=ON
+QT6WEBENGINE_DEPENDENCIES += libevent
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libevent=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n656
+ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libxml=ON
+QT6WEBENGINE_DEPENDENCIES += libxml2 libxslt
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libxml=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n660
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_lcms2=ON
+QT6WEBENGINE_DEPENDENCIES += lcms2
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_lcms2=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n664
+ifeq ($(BR2_PACKAGE_LIBPNG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_PNG),yyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libpng=ON
+QT6WEBENGINE_DEPENDENCIES += libpng
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libpng=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n668
+ifeq ($(BR2_PACKAGE_TIFF)$(BR2_PACKAGE_QT6BASE_GUI),yy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libtiff=ON
+QT6WEBENGINE_DEPENDENCIES += tiff
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libtiff=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n679
+ifeq ($(BR2_PACKAGE_HAS_JPEG)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_JPEG),yyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libjpeg=ON
+QT6WEBENGINE_DEPENDENCIES += jpeg
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libjpeg=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n690
+ifeq ($(BR2_PACKAGE_HARFBUZZ)$(BR2_PACKAGE_QT6BASE_GUI)$(BR2_PACKAGE_QT6BASE_HARFBUZZ),yyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_harfbuzz=ON
+QT6WEBENGINE_DEPENDENCIES += harfbuzz
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_harfbuzz=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n701
+ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_PACKAGE_QT6BASE_GUI),yyy)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_freetype=ON
+QT6WEBENGINE_DEPENDENCIES += freetype
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_freetype=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n712
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libpci=ON
+QT6WEBENGINE_DEPENDENCIES += pciutils # libpci
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libpci=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n717
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libudev=ON
+QT6WEBENGINE_DEPENDENCIES += udev
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_system_libudev=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n722
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_ozone_x11=ON
+# https://doc.qt.io/qt-6/qtwebengine-platform-notes.html#linux
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/configure.cmake?h=6.9.1#n439
+QT6WEBENGINE_DEPENDENCIES += \
+	libdrm \
+	libxcb \
+	libxkbcommon \
+	xlib_libX11 \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXi \
+	xlib_libxkbfile \
+	xlib_libXrandr \
+	xlib_libxshmfence \
+	xlib_libXtst \
+	xorgproto
+else
+QT6WEBENGINE_CONF_OPTS += -DFEATURE_webengine_ozone_x11=OFF
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=6.9.1#n35
+ifeq ($(BR2_PACKAGE_QT6SVG),y)
+QT6WEBENGINE_DEPENDENCIES += qt6svg
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=6.9.1#n35
+ifeq ($(BR2_PACKAGE_QT6TOOLS),y)
+QT6WEBENGINE_DEPENDENCIES += qt6tools
+endif
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=6.9.1#n35
+ifeq ($(BR2_PACKAGE_QT6WEBSOCKETS),y)
+QT6WEBENGINE_DEPENDENCIES += qt6websockets
+endif
+
+# Host tool 'gn' is required:
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/CMakeLists.txt?h=6.9.1#n120
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/CMakeLists.txt?h=6.9.1#n22
+HOST_QT6WEBENGINE_CONF_OPTS = \
+	-DBUILD_ONLY_GN=ON \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_SHOW_EXTRA_IDE_SOURCES=OFF
+
+# https://code.qt.io/cgit/qt/qtwebengine.git/tree/src/gn/CMakeLists.txt?h=6.9.1#n29
+HOST_QT6WEBENGINE_DEPENDENCIES = \
+	host-python3 \
+	host-ninja
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
