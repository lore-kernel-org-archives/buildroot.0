Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D2C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C6840859;
	Wed, 17 Apr 2024 08:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7ygYhEe7YbG; Wed, 17 Apr 2024 08:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267DF40831
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267DF40831;
	Wed, 17 Apr 2024 08:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5731BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2575B407F0
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfs9LZvaqXLY for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56F3B405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F3B405E6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F3B405E6
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:28 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso59571421fa.1
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341186; x=1713945986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFhIwqXko8Hk0RaF7rrN1VEg7jfNysCDZyG0MhWyyXo=;
 b=Jq20XeH0AKnKAdRX1o3EO6V0myPX4pEG0/ajbKOTVKOl0XnTk6c4ncJhTHHDkAtcwI
 RF9xogheKO51XMr3uEvqWiH3l8hweVNmLwvTUWmlajIUPA07JHPKv42OgBU9F9je3i1W
 E6lPXIlg38wJ8Mb4qk9E7De+Y6ucUdjHrExPx9rLCvShlu0ORU9SKCsvX156LmyccO4H
 A610Mr7KpwLbTH2mIMcv0vVVlNJexhlcE0lMS2uFiZ4deWxmOGU0eXvPezjPqJnlnmnm
 UsiQJtsw3OGnsHPgfN1l8Wyn+1OWX1hbjhNCIc+d9Jw5ZOu5ximyhJrdjIM8ATd8y2+O
 WeNg==
X-Gm-Message-State: AOJu0Yxrs/XJgolHCBMoa4xNdiVH6GJh/JiTaCXUPbAfPzHeuQWQYFOj
 OhpSLhdZun14TY0WfpW0i5GJh1ObWLOTvPaP0SEfR6i6t31Er7nWooMjx9Yp
X-Google-Smtp-Source: AGHT+IFn/Mjb2vAhAF0p5MFv8+bYG4RapcnNS7X9qofBOnm7J5YsCzPAyPBDJqiRaV/o/GLE2pVFNw==
X-Received: by 2002:a05:651c:2049:b0:2d8:60e6:f482 with SMTP id
 t9-20020a05651c204900b002d860e6f482mr9298362ljo.30.1713341185826; 
 Wed, 17 Apr 2024 01:06:25 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:25 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:27 +0200
Message-ID: <20240417080538.3451923-6-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341186; x=1713945986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFhIwqXko8Hk0RaF7rrN1VEg7jfNysCDZyG0MhWyyXo=;
 b=Gn6QYHHI/ZFJuedoYgs+mIeMlf9M+FdwuD8CH6wb2eRFe3oaDXYOFSp/xg1Agzx5jc
 HW2qSe2JxeJGQ5G8+Oiowe0UG/yyLRpheiFtC4lYcvjDRjX+kCP2mOv1/qvghPRiQcqa
 X07TqrEr9t2SF+rYrhI4HPcVZROT654qtOgydk4QbzDMVsZYhs2EA/IXL8VjGqK4okGC
 FSd2UZDsTdtnbC849MJNH8jjyuhSofjYLS2Kqle7NVslBl0i7JHHUfyJpvKefd5hJVAa
 Ph9SO8PpCXqSRU0xJPkGvfd3TDEcfglYtBmXjb26NL3giX4/5CwDc6iuu4DF7HetTUF8
 yCiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gn6QYHHI
Subject: [Buildroot] [PATCH v2 06/11] package/qt6/qt6declarative: new package
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
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6declarative/Config.in          | 22 ++++++++
 .../qt6/qt6declarative/qt6declarative.hash    | 11 ++++
 package/qt6/qt6declarative/qt6declarative.mk  | 56 +++++++++++++++++++
 4 files changed, 90 insertions(+)
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
diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
new file mode 100644
index 0000000000..5c089668e4
--- /dev/null
+++ b/package/qt6/qt6declarative/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QT6DECLARATIVE
+	bool "qt6declarative"
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
