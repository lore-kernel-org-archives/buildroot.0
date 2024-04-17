Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B76C001CC
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DCA40827;
	Wed, 17 Apr 2024 08:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsWooRp96Mgh; Wed, 17 Apr 2024 08:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9708740865
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9708740865;
	Wed, 17 Apr 2024 08:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2E21BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 175DC8140A
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA2_C22_UadH for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0C9081395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C9081395
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0C9081395
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:32 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2da01cb187cso93823841fa.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341191; x=1713945991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SD4Y27BR98jM8Ypve99ivij494KVd8R7kcDp+kGE7n4=;
 b=sU8B9Z87Jtkwne4LSt/PK+quMY9h6gEY5pc5uW+rJ1ZdRiK9S0iW/FPmtu3+58b3c5
 AM9qNxDHy+Tbr9npl5QeYaYTpNda/L6Odmb/U5M0o1c2csWlkkQKTzdFxdn2i4AfU3tc
 6Bg5W3Ujo5sn0OISDiYd0aHt0L/4Lsmo1GFkSlq+LWj+0jwgzMvCqbC8qzQYvuuFdhPu
 tEw5QpnSiydm5nwSShlGJRNfN3eqmvL/N7G49wZ0zDyFA1WazSu0gPEYJtGB3+OyZpfc
 UsWVrI6r7mDOCC765fXFwJAhCd0N6ipV3G5mbZOwDqINz7lGz+904SalZIJ1CND7WcJs
 c8Fw==
X-Gm-Message-State: AOJu0YyGtQZqyKuTicJxHgYLP/lvG3rd2S6XbieRGNCnx5ctqRolalHl
 1voU8cZyP1u7mMOxg+Xzg+PPYlgMgjVQaPzHlyRoJjU7KNNVXOfSrLZsb83r
X-Google-Smtp-Source: AGHT+IHfJ+f1UPCL9LxAMfKyYZqtwyoM6qXWDGnrF1cuZXlFDqaJv7x4vV58mLBd/OYKs0w8mnEubg==
X-Received: by 2002:a2e:a718:0:b0:2d8:687d:b22 with SMTP id
 s24-20020a2ea718000000b002d8687d0b22mr11941714lje.20.1713341190732; 
 Wed, 17 Apr 2024 01:06:30 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:30 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:30 +0200
Message-ID: <20240417080538.3451923-9-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341191; x=1713945991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SD4Y27BR98jM8Ypve99ivij494KVd8R7kcDp+kGE7n4=;
 b=KwDUtQYTJn7wr2wNVmGQ5vlU3/QjorzKYN+JBUaMxXKbc9rcxsUoGZRbJ7GyfSN27n
 dwyEH2DHQ1I3hq89ZKnsLz/IOeENenPjJs69Ae5FeVYAaHIpgVBCkz19iUw8c0wXuBM9
 XGOc3RnOTBEnOsvxbWNhKbFLjrP2XFd+G5gFGmKowUOxHWZeYxe/kR5vM/6PrYSD0mTt
 wH5oPjJcI77bMbcOBJGGMO85BB90cHp2xB7GbwuoN5RAK4H+UlrMIP8fRQTZGJi0qnGE
 0dVxSdsGgAHWkUd382IbsldpT/b068hEef6aWX250UFJTlMResuu0PrJdUeFWbGY77xr
 5wZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KwDUtQYT
Subject: [Buildroot] [PATCH v2 09/11] package/qt6/qt6tools: new package
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
Changes v1 -> v2:
  - add required BR2_PACKAGE_HOST_QT6BASE_NETWORK config element to qt6base/Config.in

 package/qt6/Config.in              |  1 +
 package/qt6/qt6base/Config.in      |  3 +++
 package/qt6/qt6base/qt6base.mk     |  7 +++++-
 package/qt6/qt6tools/Config.in     | 11 +++++++++
 package/qt6/qt6tools/qt6tools.hash | 11 +++++++++
 package/qt6/qt6tools/qt6tools.mk   | 37 ++++++++++++++++++++++++++++++
 6 files changed, 69 insertions(+), 1 deletion(-)
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
 
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 5b598aa938..5cfee728f7 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
 
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
+
 config BR2_PACKAGE_QT6BASE
 	bool "qt6base"
 	select BR2_PACKAGE_DOUBLE_CONVERSION
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a7101ca043..7a289a42c3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -88,7 +88,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -103,6 +102,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
new file mode 100644
index 0000000000..fb7650a2d5
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6TOOLS
+	bool "qt6tools"
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
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
index 0000000000..6f2c962740
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qttools-everywhere-src-6.7.0.tar.xz.sha256
+sha256  c8da6b239e82fe1e23465cbf0936c0da5a334438d3fb433e19c503cbb1abee7b  qttools-everywhere-src-6.7.0.tar.xz
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
