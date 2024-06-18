Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61954C2BB85
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 323D660B93;
	Tue, 18 Jun 2024 13:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkdRAvhRIC95; Tue, 18 Jun 2024 13:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82746613A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82746613A4;
	Tue, 18 Jun 2024 13:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9320D1BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F7EA40924
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6vyBeNA-UDg for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0AEC40584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0AEC40584
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0AEC40584
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:20:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52cc671f170so614855e87.1
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716818; x=1719321618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGFKLv0D76/hg0dQ48WeBWbLM/+nlgJmA9Y7yQ8UqaA=;
 b=MbcBqh6AQWDDDckaw7PjOrouZlML7s/+sGhkZqgTaZqOEMDqkoNey1LHml2jOBVq0g
 O0qVpytQ13MtbBHw/xEwWbT39zSZkkEjTxJylA2m4fA6Hx0hPnGMEFzHWT9G3TBd7ODp
 I+nSUtqfJvK/RYFiNmjOOPPJVZotQmm3TKeZyz7jT5ycB1ciWGN8xzGc/6onMbqwT2X8
 lxquoG66R+HFZc8b0k7P5HZoMB36JfePj4/ezVWQYfrjE3yP0WaXIMORfUtl7MzpdzlQ
 GJ74a8+00n2xaLt/nR54qGKbGRMHNkKHyrdjV9uabe50xk0sFpPc28fnV1pozoNX9yZr
 Nx1g==
X-Gm-Message-State: AOJu0Yw779jvYU7D+GgipDcz0q66PLBq3ILAiwb2Rw3WOD3VKgCC/+A7
 /xFHPSXHJawVMJMtq/Pl2iZVR21l8yZ2I6xBdQgaQaoW0DmgRtwNNB41wA==
X-Google-Smtp-Source: AGHT+IHkEqsVrS8c3Z8d4EKv1MOi5kZjHYK1zDoAdk8OqbRnC/PCxfGKutZfPO9O+Y+LO/438LJYMw==
X-Received: by 2002:a05:6512:3985:b0:52c:8978:af11 with SMTP id
 2adb3069b0e04-52cc47cb740mr957809e87.4.1718716817698; 
 Tue, 18 Jun 2024 06:20:17 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:20:17 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:33 +0200
Message-ID: <20240618131902.2912459-12-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716818; x=1719321618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGFKLv0D76/hg0dQ48WeBWbLM/+nlgJmA9Y7yQ8UqaA=;
 b=K0mxn/h3fGQen18+AOHDg3Rivymgny+Npwn35ugvLHpsPtHJYx5XXkEELX9SXxEvQ0
 ltBy9gVUxrayq2U+ss/H8W4Glggp54GWXYU0Cl6KVMxV8at5LjlN7H9l3HDsFiqjaRjT
 TqHgi8+InwWjLOSmi04s4WC9b+MG7uIZewSFkLnvoDg2VREiFfVPLSofVybrXBZLumX/
 /idYBbG+zx3TgwsG2mb48tTUxoTQQSF4xgcWnlR35U1OMn74EMivW7Oe9VkPWjB0CizN
 V+hi3PvJrW3SC8+gdMVELbplkSSTgVnvZry1mxKxOfIIFSMKgPtjW1IsCwVHw6AxhGFZ
 fz2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K0mxn/h3
Subject: [Buildroot] [PATCH v7 12/14] package/qt6/qt6tools: new package
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

The Network module is explicitly required by qt6tools:

  Failed to find required Qt component "Network".

We need host-qt6base with Sql support for host-qt6tools to build the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator
is not available:

  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v6 -> v7:
  - Only select host qt6base SQL support when needed
  - qt5declarative is optional, so only add it to dependenceies when available

 package/qt6/Config.in              |  1 +
 package/qt6/qt6tools/Config.in     | 13 ++++++++++
 package/qt6/qt6tools/qt6tools.hash | 11 ++++++++
 package/qt6/qt6tools/qt6tools.mk   | 40 ++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/qt6/qt6tools/Config.in
 create mode 100644 package/qt6/qt6tools/qt6tools.hash
 create mode 100644 package/qt6/qt6tools/qt6tools.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 69ce0b3f6a..48366f5fd1 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
new file mode 100644
index 0000000000..2e0484af2e
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT6TOOLS
+	bool "qt6tools"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Tools provides tools facilitate the development
+	  and design of applications.
+
+	  https://doc.qt.io/qt-6/qtmodules.html#qt-tools
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
new file mode 100644
index 0000000000..bc034a5e16
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qttools-everywhere-src-6.7.1.tar.xz.sha256
+sha256  0953cddf6248f3959279a10904892e8a98eb3e463d729a174b6fc47febd99824  qttools-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
new file mode 100644
index 0000000000..2dd6670dff
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt6tools
+#
+################################################################################
+
+QT6TOOLS_VERSION = $(QT6_VERSION)
+QT6TOOLS_SITE = $(QT6_SITE)
+QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
+QT6TOOLS_INSTALL_STAGING = YES
+QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6TOOLS_CMAKE_BACKEND = ninja
+
+QT6TOOLS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6TOOLS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6TOOLS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6TOOLS_DEPENDENCIES = \
+	qt6base \
+	host-qt6tools
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6TOOLS_DEPENDENCIES += qt6declarative
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
