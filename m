Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19BCC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DBC2613B3;
	Tue, 18 Jun 2024 13:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmge2_C01TWy; Tue, 18 Jun 2024 13:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F24C6613C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F24C6613C0;
	Tue, 18 Jun 2024 13:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5A61BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8845240924
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMHARS6N979J for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 127CD40584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 127CD40584
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 127CD40584
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:20:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52c9034860dso6854008e87.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716824; x=1719321624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=er/G/K84GDHEdgFWBK1kPCJMhnPuNG45TPs+q4Er5ZI=;
 b=P5NrRq9DntWkSb3fpxZKel3efGyyQZR1v2Dz3cablVcnvTWcCdC4RY2q+qj6JAHR3k
 aN66AsGqLB9dqz4ea4lCaUwJHTui4X2AZAho2/2BKJGbnnJ8L2WDcm/BBBDAo7ELcbc/
 2xT+t1AH6Mho4LLCJrraa+0JHRbtwMy8PL/iQ7pZIUx23bjMSAlYcn6hFEUpdArfxIuW
 rJQXHcV8N6hInMMK79s/ljSduInKGed8+3y1tt+0dr4MZ/NJ+t9b+YvWRsqMR5wVLIZm
 e4hpLjDorBNWPZxhK9DqbVeck8SufcCtBlJqKY6Cqr1UIvW/kcJq4DfWzXC6BiEihDE+
 1Xlw==
X-Gm-Message-State: AOJu0Ywd9D/7LkQX3fzQ0Mndjn819xv0lZLYpCKerc4n75e9u08hqKam
 eXUDNzKIODh6Ybld1wZwWztBTYb182aIMd9gRTir/IxJksm4y7zMyb4RNg==
X-Google-Smtp-Source: AGHT+IH+De5IUQgnbMUDFWlmYPK/o/g0lix4XCI83jphgWiAXGBwQRxEw5imuVeh942YmZrn1MYYwQ==
X-Received: by 2002:a05:6512:2fb:b0:52b:c88e:cec1 with SMTP id
 2adb3069b0e04-52ca6e6e53emr9232795e87.33.1718716823856; 
 Tue, 18 Jun 2024 06:20:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:20:23 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:35 +0200
Message-ID: <20240618131902.2912459-14-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716824; x=1719321624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=er/G/K84GDHEdgFWBK1kPCJMhnPuNG45TPs+q4Er5ZI=;
 b=H8eYUYa2Bisfq46A3GycYp/BX2WrdMRi/sULcFmtMdjy0BB4oEM2S8/tq7rEQLTUOw
 O65NMpop0LchAwbhf8HePOhyEC8yJ6gJf04GV+x/6fvMxbL+ZId3smoMFYDAny/APNQs
 DHjBr6mMbkWNUBVdFUqq3Xe8kf3+LDtbqIe1Nlnqdp8TeKl1R8QHJxhEG2hJNe0ZC1Ft
 +srNt/16Enzi0E2l1O9+MaEjCNZq777ErMqTe8FRFX6tBFrpwa6Di6Zj74mUfhqglZ/4
 lF1TVijhk8suyCqagtxK2bmlMXA+IuWb98nNDlQP7vRXEFRawCO2hOE55nh5AVGWABCA
 SZxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H8eYUYa2
Subject: [Buildroot] [PATCH v7 14/14] package/qt6/qt6mqtt: new package
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
