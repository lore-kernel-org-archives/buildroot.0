Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB8C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B24040880;
	Wed, 17 Apr 2024 08:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6BHaM9D2Snm; Wed, 17 Apr 2024 08:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9556440858
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9556440858;
	Wed, 17 Apr 2024 08:06:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3FE31BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0D7A40AF7
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iV4-nq8qiJEs for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7755C4117C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7755C4117C
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7755C4117C
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso64632821fa.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341192; x=1713945992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJGaFe73q7NxYYs0Hi98n3G0tieGUw87uyKGivS4/YU=;
 b=u3y1jCmq7/KqbMWyUWT23NNV47RXL+wWwFb8IGo+CEIFXRuD4pK5wFZQZyDAIejlbA
 WVc1I4HoAEB/iOVys92JLWkWBjmbjgTWGRtsKvVf57lsvXBOz5/dmOntjzZ3hCXVlBtK
 HJ5rKC7JXSe9HTziNyk6PKzsJ06N+Xmh7t3w3d7eCZVmhC7fjjsmOCCjFLIib432mWh0
 3i6gZIiPsn0cjNg4V8Fx5uIvb0BS8qVGnsy5+H9B3NvNwKvENhhDMo/GHk6JLZRakfkc
 H2NY3r7DqONZN8F/Jvq5hkAQnZDA6XwELS1CcjOzosQtDbRjZKgE+B7ztvpZDmNN6EiD
 DWQw==
X-Gm-Message-State: AOJu0YyH7PRX62vPsliyVDjiqCVEo0er5F9URAg4BP9A8WhAHdDfNPKw
 L7IIGYDzxOkFZNLcS2eZPSa+VkEmCcTfD0zakqDPaGeBWi3M1nOFpW7/WTxw
X-Google-Smtp-Source: AGHT+IE3w1lEoszDXNjzxLRKIZCturhHQCrkK2aM34+sL6Zmvya/A1NudPl1GCtamnoksNLkMrDmKg==
X-Received: by 2002:a05:651c:54f:b0:2da:a3ff:5254 with SMTP id
 q15-20020a05651c054f00b002daa3ff5254mr6129678ljp.1.1713341192235; 
 Wed, 17 Apr 2024 01:06:32 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:31 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:31 +0200
Message-ID: <20240417080538.3451923-10-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341192; x=1713945992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJGaFe73q7NxYYs0Hi98n3G0tieGUw87uyKGivS4/YU=;
 b=OGwuzKpID2HR7R779oyuZq6+c9d6FPhDdQlW0sk8z+DpuEVrLFUutRIDCjW6OX50/o
 mAa0hR+cBbgUATYPB8gbJUj0ZP3hMlZdMNWL3QhQbcpVX5KJJ7Mqq2aNamREGq8ueUJd
 jciuTXGk0O+s8QR0UXmU7XUhaaF7xCPvHTr7jT35LLO/n3+qCMaE87eqWvdK1fz3W06C
 U9Bh/NsO5Zrm4GwCwCMOY0/4ELX/Z6mWkgV+h0r1LxPCnw3MEqbPpEDWP+i0IhamiLb5
 MbZlnuw6XrASE92JXfdoKLOFqFpWjjClU5+8ACFFhuEa6kKBZbbcdZp7cNQVGL/sZk3Q
 4/6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OGwuzKpI
Subject: [Buildroot] [PATCH v2 10/11] package/qt6/qt6virtualkeyboard: new
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
