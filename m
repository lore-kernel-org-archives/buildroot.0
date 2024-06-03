Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE6C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75947414B4;
	Mon,  3 Jun 2024 11:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGxs_EV8a9Ze; Mon,  3 Jun 2024 11:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B00041597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B00041597;
	Mon,  3 Jun 2024 11:53:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F35C1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 643A941492
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk8GJDFlH3LI for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ADE641369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ADE641369
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ADE641369
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:51 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52b919d214cso1651810e87.2
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415569; x=1718020369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UxGyZxlrMO1fDkjO0vYZTp+tpIvRcKgDSplFUfGPqw=;
 b=XYwLqm4gDsn6SuYEt3Z9M7sf0SWjQUMgoivUFW1ei6V0ptps3RN8+BhmL6xQf2iO52
 nVRpB2iur2/E5aJiZu5+SboG9968uDJIGubC9Xtv0WkBo1vEMgcrZXhn858NJN7nyFOe
 X6W2w9QxVUuex8Ov1zT0gDlBuvVDzY9YG6NzZr4Cc5gg3kdHYGj7SEmtXZA0h80nMXLh
 xLvKNKI1+pt5qLeXCRnfFCZdXAjIonK2jLJGNw7nCkx6odxjypKsZThi0kAgXz3ZJUId
 wSmOKK0MrOWWO0g1oABM6S0j6PNSjiXJkwPPlIXgTALC5qPlf9hWKkmf4dAVu9XxP1xy
 uC8g==
X-Gm-Message-State: AOJu0YyqmiLXjF7/q8wpghrCY2SFApTr61trVCJVo0uW0NY/D4N5mdrK
 vJB+lE5acAsyKIiXykZ0QFtKeY1vG2BWBcf0/fMnb1nlEOuPUL5yuFpYUInW
X-Google-Smtp-Source: AGHT+IEN6GqvtmexRO7zp8kXnjZEtsPldUgo5W97FAy5B9szUvrHLUmFeFVURP7oibyQycD06q+ARg==
X-Received: by 2002:a05:6512:1152:b0:52b:9c8a:7355 with SMTP id
 2adb3069b0e04-52b9c8a74dbmr1336686e87.52.1717415568937; 
 Mon, 03 Jun 2024 04:52:48 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:57 +0200
Message-ID: <20240603115206.3583474-14-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415569; x=1718020369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UxGyZxlrMO1fDkjO0vYZTp+tpIvRcKgDSplFUfGPqw=;
 b=VGNZOiMkyQlxLrBoRD75CMR1Wi/JVMtyZQcWD6KWpcFl+d2Bcq3TNdmDAw1Hjr5s2B
 rEi6nodKbhxiW6I4qubEps6iSFwRmhHhSLctjLgTG9qdXTIeFixp4DhraCx1bDeP2cUX
 BN/elvC1xkEvqYCMuM7Gc16QHxhg/LJ6izmeAIIc4syQFW7fCQPBnIE4f4BGsYnEhwyV
 JL/+jArD7EJLTAiNwUBV9+vQOf5hUCGUzQSkceiIsGuRdYvRUQ6HDHcFJYTb1Lm1x5YP
 c0ijsMLVz3UCLXLzsaTUcDLWFp5lzdNwON0NidfPwv0nHZ+cWmkCkMJofq5ymzKpYj7m
 7XLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VGNZOiMk
Subject: [Buildroot] [PATCH v6 14/14] package/qt6/qt6mqtt: new package
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
index ee426884f9..5431629ede 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -9,4 +9,6 @@ QT6_VERSION = $(QT6_VERSION_MAJOR).1
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
index 0000000000..658bddaa75
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -0,0 +1,8 @@
+sha256  f1c3b739296832befe24309130ead4ef4167f4cc2029a9c258821f92e7733fb4  qt6mqtt-6.7.1-git4.tar.gz
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
