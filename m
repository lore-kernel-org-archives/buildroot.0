Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5F2C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D928820CD;
	Sun, 12 May 2024 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiU2NaK-bxNc; Sun, 12 May 2024 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6968B8218E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6968B8218E;
	Sun, 12 May 2024 20:19:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE8611BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C5238211A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkcBPOAIgBPv for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A955181F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A955181F8C
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A955181F8C
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e1d6166521so39387101fa.1
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545155; x=1716149955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sB9wnuwuny3PYtziZmHnKeBlK5n1ajfAvP7hBvpAqWs=;
 b=sVgBKTSQHuPhbOP9Y0fOqyqVAJrwr5jB0FDOwJzfwM1Oe4FiGoXNCzsxj7BNjazltA
 Cy8jYOf3IOdmh2yL5QTHc+HZZiXNhQyfvDUkBZ0D+vccMQp+z8yZH8pkRNif+KkmeQ6B
 ppczmVj1jKOQurgYs/buRBqMn/3dfnjo1UMPskKkSkcm/J3XDa78yN8edXtmJsjFHz4m
 93y7JCrOSYzbaICy4/Djf1Q1JGXdF3XMp+DH+qFdUNEdRArsq9gTA9wRpZXmuc8Qo8S9
 d8S7EqNkxnJtFMNP3ByesTdmAokowhxJ9Cp5sho8ZmIpm/allB32qocIvPQkn3GSQrPv
 K5dg==
X-Gm-Message-State: AOJu0YzzIiXSAgSgALW7kFmy/gnGCU2rDuErOVIpeGRFhQHmuRGkdMqn
 YlBXUIptoXnHQ4M65C+bOzd8B0pqm477pjIXVZUtgaSYgpyyNk6wC1yKmGUG
X-Google-Smtp-Source: AGHT+IHxKTgD1pdqFqrMEnHB1zuJaXsK3fdhuOYciqtT68RrexGdVtg++XaQyEJJLEgaeNNwcnGE2A==
X-Received: by 2002:a2e:6101:0:b0:2e1:c97b:6f25 with SMTP id
 38308e7fff4ca-2e51a84e229mr25636001fa.1.1715545155302; 
 Sun, 12 May 2024 13:19:15 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:53 +0200
Message-ID: <20240512114617.2564569-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545155; x=1716149955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sB9wnuwuny3PYtziZmHnKeBlK5n1ajfAvP7hBvpAqWs=;
 b=Y/M6Vh+Gi2FlQytmgIINhGXF4xe3RiXLlR3M5RgSovpZ7dfrQ8uTHd3jGFbAGobiDN
 ZcLYoQKiG3oGFPtz/8ZEU7vLrdT1K/AcnMVXjTxVkUvCqBR6PMVBF2RUW23u9jUHaro2
 KD9EE9JX7SjT0NQrWyMHNrQ+5BUwOJvcKTnwFa7hBdLdJFOaybKsfrhqhCOI+hBZogXu
 eQfk5MLs0HDAG/CM4esmrwpBl0wyJw+Mum7SModk/2ldZrDZs/lmECxc/npQSnR+HAw1
 S0Dn+/nxMFm5cBRSX1EwNOzxV441k9x8Ol63sIaHbnPJ7h7xr+DBIvTqSOMTtXlor0tL
 G08A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y/M6Vh+G
Subject: [Buildroot] [PATCH v3 06/14] package/qt6/qt6languageserver: new
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6languageserver/Config.in       |  9 +++++
 .../qt6languageserver/qt6languageserver.hash  | 11 ++++++
 .../qt6languageserver/qt6languageserver.mk    | 34 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6languageserver/Config.in
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.hash
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b7e95a6885..81682af476 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6languageserver/Config.in b/package/qt6/qt6languageserver/Config.in
new file mode 100644
index 0000000000..8a54ae1911
--- /dev/null
+++ b/package/qt6/qt6languageserver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6LANGUAGESERVER
+	bool "qt6languageserver"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6languageserver module.
+
+	  https://doc.qt.io/qt-6/qtlanguageserver-index.html
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
new file mode 100644
index 0000000000..2d40426c6f
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtlanguageserver-everywhere-src-6.7.0.tar.xz.sha256
+sha256  a99ecb342abdf7b7ac24804c89830a7991de95f9402f45a1e337ae851f76c9fc  qtlanguageserver-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
new file mode 100644
index 0000000000..6f96feb275
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# qt6languageserver
+#
+################################################################################
+
+QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
+QT6LANGUAGESERVER_SITE = $(QT6_SITE)
+QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
+QT6LANGUAGESERVER_INSTALL_STAGING = YES
+QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
+
+QT6LANGUAGESERVER_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6LANGUAGESERVER_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6LANGUAGESERVER_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
