Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EACEC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6933541691;
	Mon,  3 Jun 2024 11:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mkf0XHYL1uVX; Mon,  3 Jun 2024 11:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B56441793
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B56441793;
	Mon,  3 Jun 2024 11:53:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9723F1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110B5406AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz8Kg-gWKfN2 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C01A407F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C01A407F1
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C01A407F1
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52b840cfecdso4031925e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415565; x=1718020365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaaxMFhvh96fRDuHPuOg2LjVcDIlz9KJxDuOy5+Nsmg=;
 b=BBdZujG8EMnMo3kKB+YGu2uhMB4AV1l0qHCGJFkm9prcK0Y2/VgUaoK5Tu4PQfu4Tn
 oJVPXK1Mv5NpC/rq9FHHVRe3mh4zvv1p07oMz9VW4x478T6V8xYLcWbUremSbIRCUVS5
 iCYRxMItxY02up1wlTeGMHWdcTQjliCFNfJd6wpBJdvE3lcyoqv7IHAOtfM3PP6qXSa9
 WbDEfJEOPq1hl9J2mcuf+c4t0cFajaOGTtcXzhVPIQRMsYDKSNZVk+Yq7QeUxophV1WG
 4aRj1xCyWUvaduBO7iFbaC0QVktAo94y29TOluLF6q0Th+A6U+/i69OamxTxZYtmem7C
 WUww==
X-Gm-Message-State: AOJu0Yz9GCvtJd4J1wFsz2Hik74w5O7QDi3CVYVYyfq7GzXO+54ZhtjD
 maDJZrDFzzqd8gEblWn4YhgFuJLwxlsf7dtz8va+GIQ8PA920h8RTpHLt9EJ
X-Google-Smtp-Source: AGHT+IEx1WmIq88/Bs5wRtjg+hBBpVXCKbwEt/297X86a1tDqgqwOWWwOjHZwM2QZNVUiZvSh5qtnQ==
X-Received: by 2002:a05:6512:143:b0:51d:3b87:70a4 with SMTP id
 2adb3069b0e04-52b895a5707mr5475700e87.36.1717415565464; 
 Mon, 03 Jun 2024 04:52:45 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:44 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:55 +0200
Message-ID: <20240603115206.3583474-12-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415565; x=1718020365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaaxMFhvh96fRDuHPuOg2LjVcDIlz9KJxDuOy5+Nsmg=;
 b=d+XmVYmhDAVhxB7d/Ja3XlCiMXTVB1MI/airMJD0H9QjptEhrUK0vfC+E3nAA013AR
 3WWBIDlOxb3EutTS+jmXQwWvqHFGNRXvRncwtIxD1UQPxIJ2BVVNuWNQtq5fQ9uB9UBe
 3/zmDwU3jT3dMuS5UUTXvNdKkTeEVnL5Aea3TQe2fo2DZRk/5Lr54eI/8+3Ffhwb7YoE
 fXzaRbAft6qu75ouXVt2SMRzWwcVsjB21MRVmVOMDm9rWMQstFwQ1wqLkZ4WH8WhXM63
 TSo5+RGKGS8J8dnO27Locr8UH3QV9LtrByVXPU8An8Viek2s/K1OodjibvStSGsv4qEv
 2Y1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d+XmVYmh
Subject: [Buildroot] [PATCH v6 12/14] package/qt6/qt6tools: new package
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

The Network module is explicitly required by qt6tools:

  Failed to find required Qt component "Network".

We need host qt6base with Sql support for host-qt6tools to generate the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
available:

  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v5 -> v6:
  - Add explanation to commit message  (suggested by Yann)

 package/qt6/Config.in              |  1 +
 package/qt6/qt6tools/Config.in     | 13 +++++++++++
 package/qt6/qt6tools/qt6tools.hash | 11 +++++++++
 package/qt6/qt6tools/qt6tools.mk   | 37 ++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
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
index 0000000000..6e5298de35
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT6TOOLS
+	bool "qt6tools"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	select BR2_PACKAGE_HOST_QT6BASE_SQL
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
index 0000000000..8779e8c00f
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -0,0 +1,37 @@
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
+	qt6declarative \
+	host-qt6tools
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
