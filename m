Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE4AC25B79
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1519B416ED;
	Mon, 13 May 2024 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8WUx1iR5Kim; Mon, 13 May 2024 22:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39ACC416E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39ACC416E6;
	Mon, 13 May 2024 22:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8001BF395
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5AA41694
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVdgOfzK7BhJ for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28DDE416BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28DDE416BD
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28DDE416BD
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:04:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e4b90b03a9so55423461fa.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637857; x=1716242657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qx8BaWQW+AsXtvWJthWE7QJLAj/t1cBdBTRJ0Pw4cjM=;
 b=hcHxyUtXJWkIK+Z6jNY6EQVksBI1739RXqlNoP7/i4EUiDBcTA96kb+MxGhiwtki+8
 0Xbdqdp2XcMyLhJdMN32d7Bk8tphud534AZ8WXaR75MoZ06pWRFIStMvLEuDPEWn0oVM
 8BSFMXfItt6rLMFeKB/6izkhG7syAaVT2/lLywV2SeOez9IpPb43NzdLtDv5XlG3Y2L7
 mUjrRnv9/9CbGV+qCQ+gsM2gN9ZrRFowupZlgZfqEb+GJcs423W7skjFJ9YQh7VKREyS
 uVPNzEOAGHwuvmKykXYmEOave7/HbXGaMWaP8tNF9qsvIFshkZ0VO/cp0zDOVDzGFk1D
 mf+A==
X-Gm-Message-State: AOJu0Yy/canN5lMX3PAfKc01Ngus5scnStIQ4WtZUWmesfjyR+GlYsmE
 dbsha8S6epB7L4pK02CA2iKr1SydGf+5/+bkeawq8LNJPgiqkBw74luxqq3W
X-Google-Smtp-Source: AGHT+IEx+4djzIL911fnRzpv5fF6uMp7g6Cmd0R2ROcq2kZWM35vNu4SwGdi2PIFHKcOdnKXC2Dm3Q==
X-Received: by 2002:a2e:2205:0:b0:2df:9c94:150e with SMTP id
 38308e7fff4ca-2e51ff5e6a3mr68682821fa.25.1715637856845; 
 Mon, 13 May 2024 15:04:16 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:04:16 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:19 +0200
Message-ID: <20240513220328.1085629-14-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637857; x=1716242657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qx8BaWQW+AsXtvWJthWE7QJLAj/t1cBdBTRJ0Pw4cjM=;
 b=g7Rlht4icG7F+DJ/cFkU0vNwPA7u9E+NNksAtavtg3LA9WBTTLnY7DLBgBHG6C+Nam
 4AQ+EbPgDpSllCRfjTePVggw5xRc701OAhVXH15ckN/imQ+XStPfS0PWvUu2XlPX5p7f
 veGQoZekG0pm3l1lAGA74RxvjRbrH68BEZQiSkralVSqv8XPYPMmnUFw5H94uDWqZVjI
 zwSVW50UCmECMp3a4YDEr6dhYFooSt2RmQ14ykiZY9zsDiM5BoV/vUardidx820W6B+E
 w5ssk61hbbZUCWkevY2R6q55DB5AJRZqen1kVoWLE+9VClopLYnzOfY5IVVKCdi3PhwV
 N6rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g7Rlht4i
Subject: [Buildroot] [PATCH v4 14/14] package/qt6/qt6mqtt: new package
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
 package/qt6/Config.in            |  1 +
 package/qt6/qt6.mk               |  2 ++
 package/qt6/qt6mqtt/Config.in    | 10 +++++++++
 package/qt6/qt6mqtt/qt6mqtt.hash |  8 ++++++++
 package/qt6/qt6mqtt/qt6mqtt.mk   | 35 ++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/qt6/qt6mqtt/Config.in
 create mode 100644 package/qt6/qt6mqtt/qt6mqtt.hash
 create mode 100644 package/qt6/qt6mqtt/qt6mqtt.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 9dbc4b804a..e84806d5e4 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
+source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index b87cb6748d..42984f89ee 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -9,4 +9,6 @@ QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
+QT6_GIT = git://code.qt.io
+
 include $(sort $(wildcard package/qt6/*/*.mk))
diff --git a/package/qt6/qt6mqtt/Config.in b/package/qt6/qt6mqtt/Config.in
new file mode 100644
index 0000000000..2cda7e53c0
--- /dev/null
+++ b/package/qt6/qt6mqtt/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6MQTT
+	bool "qt6mqtt"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6mqtt module.
+
+	  https://doc.qt.io/qt-6/qtmqtt-index.html
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
new file mode 100644
index 0000000000..0fad4fe06f
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -0,0 +1,8 @@
+sha256  94024e3dd6c77feddfbd35520cc1f474d669aad7402f087827221890e07a64d5  qt6mqtt-6.7.0-git4.tar.gz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
new file mode 100644
index 0000000000..0405311065
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# qt6mqtt
+#
+################################################################################
+
+QT6MQTT_VERSION = $(QT6_VERSION)
+QT6MQTT_SITE = $(QT6_GIT)/qt/qtmqtt.git
+
+QT6MQTT_INSTALL_STAGING = YES
+
+QT6MQTT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6MQTT_CMAKE_BACKEND = ninja
+
+QT6MQTT_LICENSE = \
+	BSD-3-Clause, GPL-3.0-only, \
+	GFDL-1.3-invariants-only (docs)
+
+QT6MQTT_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6MQTT_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6MQTT_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
