Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C4BC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96464149A;
	Tue, 18 Jun 2024 21:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kokJaHRI-_r; Tue, 18 Jun 2024 21:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E0942AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E0942AF0;
	Tue, 18 Jun 2024 21:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2B861BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DA7A6081E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UR_EI78QC6S8 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48C13605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C13605EF
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48C13605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:17 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so61495341fa.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746035; x=1719350835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3iJKK2TExRFUh1IO803epYFlmHl62Lt6s7MlG4dXBQ=;
 b=naosWtQQN87BCpGDt/qxJ5KgdIiUuqiCqsOXlL6GKdGcRlHHCkr9iNJmxYI5nkAUi4
 A67QNxv9KpgBZN/3qI+ziq21WpepY0iUs/2N7vk91moAgfnUv1bc4l8XMScMSaqPnygk
 huhBQuWIKUZUfoejefO2MMsl0bIS4QCZGhL+ug6bnH+wb/+dQWnfpV7ojcwFsEYQ6jvV
 pLcIs8cJO66ZGyFag4ySJ2gUuMiL/jyyUaCsdCyTq3lOyjR60dqczDNZ3x+wJe7BhvN9
 8NVRxB6bKrc7FY/w372MSIw+d6qtLQwCYtiwvq6drb12KUpczy0IHtvmRlsYxs1NxR4D
 lHrw==
X-Gm-Message-State: AOJu0YxV3IBBlBLMi/L/6+tl/0/3sfQz7oiKXVhQm2xGvQV4ewCK1YNb
 HVQtpZPn4MTjNYc0eLSIgHMUW/XqcYfoMcCh25h+Da1pR6bLpS3Ao/9PUw==
X-Google-Smtp-Source: AGHT+IGdWFSPOjDvkcBpjIBW3k0fpx7/38wGAYh2I9SnG3pZBsEA2GynKE8jZhNuVeTp7cNEMkenXQ==
X-Received: by 2002:a2e:2e0c:0:b0:2ec:1d05:1c05 with SMTP id
 38308e7fff4ca-2ec3cfe1740mr5436411fa.48.1718746034836; 
 Tue, 18 Jun 2024 14:27:14 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:29 +0200
Message-ID: <20240618212646.4154474-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746035; x=1719350835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3iJKK2TExRFUh1IO803epYFlmHl62Lt6s7MlG4dXBQ=;
 b=NO5tRgSNF7jVLnYHPiMi1b5VZc34Y+J4CsA78/Wv+wr9hOn5jzbGULJ7H5Ylr/tXcT
 rIsN5XztJ8bZvdGEXd6yUt1H/G98de26eXKDHC42s3TovT8yqhsWB2ibHtqvIrq2lkFH
 RLs84hbEeHoSADyZRkUJFhmwkl7f+vHYxo2nJSbkz1wAFs/7QU1qZadC1ZL9GkuWC023
 xNeaRCAbZwIxt0JbhQSsuKH6LC01h37M/RCC67h8cfgo0Oke8AtSvmyy06mpKaFQ3EBU
 Jd+KJ5i3i0/zFteHb64PNG8+0ygUI91D7EVGt3WMoedqXddJ4mFY8o1PhQckLVjbRAcW
 Bruw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NO5tRgSN
Subject: [Buildroot] [PATCH v8 06/14] package/qt6/qt6shadertools: new package
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

The Qt6::Gui module is needed when building the 'Qt Shader Baker'
(qsb) host tool.

Qsb is needed for converting the Qt6 Vulkan GLSL source code to
platform specific shader languages which is then later copied to
target.

For more details take a look at:

https://doc.qt.io/qt-6/qtshadertools-overview.html

and

https://doc.qt.io/qt-6/qshaderbaker.html

We need host-qt6base with Gui support when building host-qt6shadertools,
otherwise the build is skipped and no qsb host tool is generated:

  Skipping the build as the condition "TARGET Qt::Gui" is not met.

qt6shadertools fail to build if qsb is not available:

  Failed to find the host tool "Qt6::qsb".  It is part of the
  Qt6ShaderToolsTools package, but the package could not be found.  Make sure
  you have built and installed the host ShaderTools module, which will ensure
  the creation of the Qt6ShaderToolsTools package.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6shadertools/Config.in          | 13 +++++++
 .../qt6/qt6shadertools/qt6shadertools.hash    | 10 +++++
 package/qt6/qt6shadertools/qt6shadertools.mk  | 39 +++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/qt6/qt6shadertools/Config.in
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 276a0217ab..b7e95a6885 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
new file mode 100644
index 0000000000..1b47dc6132
--- /dev/null
+++ b/package/qt6/qt6shadertools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT6SHADERTOOLS
+	bool "qt6shadertools"
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt Shader Tools module builds on the SPIR-V Open
+	  Source Ecosystem as described at the Khronos SPIR-V web
+	  site.
+
+	  https://doc.qt.io/qt-6/qtshadertools-index.html
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
new file mode 100644
index 0000000000..8e80d64851
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256
+sha256  e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aad22a1f17910c2  qtshadertools-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
new file mode 100644
index 0000000000..108f409380
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt6shadertools
+#
+################################################################################
+
+QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
+QT6SHADERTOOLS_SITE = $(QT6_SITE)
+QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
+QT6SHADERTOOLS_INSTALL_STAGING = YES
+QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SHADERTOOLS_CMAKE_BACKEND = ninja
+
+QT6SHADERTOOLS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6SHADERTOOLS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SHADERTOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base \
+	host-qt6shadertools
+
+HOST_QT6SHADERTOOLS_DEPENDENCIES = \
+	host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
