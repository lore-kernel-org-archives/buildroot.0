Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C04C04FF9
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2EE40803;
	Wed, 17 Apr 2024 08:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhb8dl7OuT0G; Wed, 17 Apr 2024 08:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7E840885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7E840885;
	Wed, 17 Apr 2024 08:07:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A39D01BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90D2540AF7
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxekbfXeBCj0 for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7376B4015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7376B4015A
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7376B4015A
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-518bad5f598so4175412e87.2
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341194; x=1713945994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6e+mUpovFhxtJrdt+VDqbfKsiusLT/LZ92fH5CpilZU=;
 b=m0+zYb+Wp2MA0faYNfldDqmyCVMyos4n037TmzfLXnfw/NTRkrfWbnlMDxxjPJy4xr
 4ZZPbphyvhBmFuozI7xeFE+H4YP9ewI6MdtvsHmZDlXkZG/C7exebrHftEyObaxyV56z
 6nGGJIhrz7lanyVz0GORnO4rfPzdD1Vhsj1V2Etg5/BK19HB56Op6t59LV/IAuz/pZgY
 +aT3/lzlEMB5eJsM4Smwe/Zt8zeb12BGWkRWXyGJOOTJGqKup1STUj6smpj/sKTorRNM
 DBXOqbKlR9cvitd+CVJ+BGPREGsjtfNbeX01dC/ZqRBlWwpFxgZBTjlQaQveaN8QFIIA
 TKDw==
X-Gm-Message-State: AOJu0YxtbhUDFdxsq1BOr9AUu8wRvfEy6vmdjwx7kXTbR0rNWzSpldEt
 g94qCHRKVefLzkyTHT/MXhbuMJu1IzUeWSyQ5iZoP+KKydRXE1CsVGsVOhob
X-Google-Smtp-Source: AGHT+IFbsnXIVw7v675k8+ryb5DF1CsB6PN17L4UnHc0lR+djAh9Ry8bVxqBz6VPbcrq0DEBmNq5LQ==
X-Received: by 2002:a2e:b753:0:b0:2d8:d972:67e0 with SMTP id
 k19-20020a2eb753000000b002d8d97267e0mr9203476ljo.10.1713341193762; 
 Wed, 17 Apr 2024 01:06:33 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:33 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:32 +0200
Message-ID: <20240417080538.3451923-11-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341194; x=1713945994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6e+mUpovFhxtJrdt+VDqbfKsiusLT/LZ92fH5CpilZU=;
 b=jZgBMlNLhRCNC9jueee45aFm/JMnk3EvL7qoTJ433Dryfkty3sbny2bzOb+jlkLwZQ
 8h6Lc4fzPQE6hd/TWaJRZLLAMR4lyoxd4GE+qWyHqVisH/Bk5+hd3wdQP8NrrWbYbaXj
 LnHgXyhSqBj9LCCXNanZuO7QZTaWI3/SOMn4z/B/L3VI0g8V5Y8Vp3zqSMEJGKasyoin
 artLh0CikReQee3FfsdDg3IYGOff4Ld5n9Nth1TBAm7h2ryVVFHyhq/A6l6/5BZ0kZ7K
 eODZQBiJogi6H06CHHMdqa3nosk4VyA4IPIfvNfSxCX6v6Bam2A/riORDmTUXju5hpUy
 hHiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZgBMlNL
Subject: [Buildroot] [PATCH v2 11/11] package/qt6/qt6mqtt: new package
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
 package/qt6/qt6mqtt/Config.in    |  9 ++++++++
 package/qt6/qt6mqtt/qt6mqtt.hash |  8 ++++++++
 package/qt6/qt6mqtt/qt6mqtt.mk   | 35 ++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
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
index 0000000000..b9b8269773
--- /dev/null
+++ b/package/qt6/qt6mqtt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6MQTT
+	bool "qt6mqtt"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6mqtt module.
+
+	  https://doc.qt.io/qt-6/qtmqtt-index.html
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
new file mode 100644
index 0000000000..4d2f18884f
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -0,0 +1,8 @@
+sha256  c07243179e09874720361ae4f5a3e7f90244363eb98f177b9413c9f13b159e63  qt6mqtt-6.7.0-br1.tar.gz
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
