Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C819EC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95FD74242E;
	Fri, 31 May 2024 15:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSxFDA23AznT; Fri, 31 May 2024 15:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C7464244D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C7464244D;
	Fri, 31 May 2024 15:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06B2C1D5423
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83B561147
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBdgTnInSibY for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9280C60605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9280C60605
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9280C60605
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b7e693b8aso1772886e87.1
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168429; x=1717773229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXAQkgukH467+7czZ3GfAOd66O4B9Wqwi/D+p9wPg3k=;
 b=qNuJMcYRA1TMEspJiO5V2Sk3A4WjiR+1mKsXjNbeqYl33XWJdHP+JEVEJe7bRwNRBQ
 N714YR3+63gQlWV5k7nTkd65JsXnk4Qxtvneo981orVI2Lt+vroLQLFByRYIVO/s8Lr0
 eE9/n+Q2Dvjg3N17aTXsubfxW+6CZIel1e2aGmkwM6cVEYZFL0WTUKRYWjTe7aR/X2HE
 LLEpuGqE0VQsoqGm4v5lLsodX6+eIWyyxWLfXlHB4+Ud2gIp0g+bd1bTRQBPap8cTAdU
 hVHBfeLWapDck9EFX1EQU895jXhwKMBYxlcPQu1zCnIM32PsmTfWSHGOozti01EgQ8nk
 P7lA==
X-Gm-Message-State: AOJu0YwO6Rkqg+4KP7SPgyyk9MWoS8rKsV2EJVdLRcDUyiREmfMbx1GT
 EeQ0qu6OBOP644jPbCz807hJSAWytLCrVLx72HVolUYShF8bstiKqzfIx3Oi
X-Google-Smtp-Source: AGHT+IGNiLt5iuaHTqp8txgKRYUTwFimfoxvSktJLMBOMXaz0pXBxjL/0dAMe3/Pn5bn50l3a+hjOQ==
X-Received: by 2002:a05:6512:3caa:b0:52b:7db7:e601 with SMTP id
 2adb3069b0e04-52b7e10acedmr1864789e87.18.1717168429225; 
 Fri, 31 May 2024 08:13:49 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:11 +0200
Message-ID: <20240531151325.2443323-10-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168429; x=1717773229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YXAQkgukH467+7czZ3GfAOd66O4B9Wqwi/D+p9wPg3k=;
 b=Vt4/kfcHCqoVAnp6Yr4TZhp0lLRGJhuRW3SvizK/3afTyQXaXZCBZNjm2jM4u3Y2Ie
 bkquFPU/1HIc7K0s5G66Xl9Uuie8JFMqfJSBUvu5s2NPqfOl6Pju+GN1f8LC8JO3EW+p
 URpnJ2JrWbZBEoH/UHhamPUeIZpr3yq3ChAOhaGknyMx2oxJMgJW3nPcNAK7BUwbfzR1
 6/3nOgMcFFlWu/UwqwdTGaLxQ9MJB/OWVWy5aADlRp26B310XatW97FYMLPU6MDMZqY8
 m4Wh7AD1U7OyUv4A4c7tGXFZxRvQQOD/2dTGlAzmKFDqQapUirW+8CAP9jLnFz7dZbxT
 cKJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vt4/kfcH
Subject: [Buildroot] [PATCH v5 10/14] package/qt6/qt6websockets: new package
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
Changes v4 -> v5:
  - Bump to v6.7.1

 package/qt6/Config.in                        |  1 +
 package/qt6/qt6websockets/Config.in          |  9 ++++
 package/qt6/qt6websockets/qt6websockets.hash | 11 +++++
 package/qt6/qt6websockets/qt6websockets.mk   | 46 ++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 package/qt6/qt6websockets/Config.in
 create mode 100644 package/qt6/qt6websockets/qt6websockets.hash
 create mode 100644 package/qt6/qt6websockets/qt6websockets.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 625134d281..16f792cff3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,5 +51,6 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6websockets/Config.in b/package/qt6/qt6websockets/Config.in
new file mode 100644
index 0000000000..a201483922
--- /dev/null
+++ b/package/qt6/qt6websockets/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6WEBSOCKETS
+	bool "qt6websockets"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6websockets module.
+
+	  https://doc.qt.io/qt-6/qtwebsockets-index.html
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
new file mode 100644
index 0000000000..4fa6bdb79f
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtwebsockets-everywhere-src-6.7.1.tar.xz.sha256
+sha256  fe16a6e4d2b819c72a56f671c5c697bae4c7f9fee4df2a4473b14caf7602feeb  qtwebsockets-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
new file mode 100644
index 0000000000..cc17085d10
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# qt6websockets
+#
+################################################################################
+
+QT6WEBSOCKETS_VERSION = $(QT6_VERSION)
+QT6WEBSOCKETS_SITE = $(QT6_SITE)
+QT6WEBSOCKETS_SOURCE = qtwebsockets-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBSOCKETS_VERSION).tar.xz
+QT6WEBSOCKETS_INSTALL_STAGING = YES
+
+QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WEBSOCKETS_CMAKE_BACKEND = ninja
+
+QT6WEBSOCKETS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WEBSOCKETS_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	host-qt6declarative
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
