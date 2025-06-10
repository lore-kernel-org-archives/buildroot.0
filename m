Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC1C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D058417D4;
	Tue, 10 Jun 2025 12:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP6qA_-t4PWf; Tue, 10 Jun 2025 12:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB9741BF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB9741BF0;
	Tue, 10 Jun 2025 12:29:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08199183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3585401FE
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJlmrY-uWqHy for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 12:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D751640139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D751640139
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D751640139
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5532a30ac45so4994427e87.0
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749558577; x=1750163377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdinZPqeSYhPCKockLHChmzVBZUYlOLCe5slzCSf2nw=;
 b=EoeuODGfBItWA9zpbki4g2s6ulh+1yIWYkOg+RBN6C5+vBYaqNVdYoI1p55blPtTut
 F0r6ydeHwmwTV1tVZqpqX7bO6tzHuZoV8PhFdGn7fQ5ttZPY6g7ypvI3XDOpd8R3zdSx
 nTLz3dBKc32fJdEf/aT7b9LQSPbBj2GQl57KCrk57gdo6nHxVLBMrQL3q9teolzb4oih
 FJ9OkSO2uuh/pzrNBRoEmO3QfipeJV56Z/I6HwWp9eX6VDV4gE7Y591VHIT4oJDBMk96
 EkTMDJ8zpe+tVF0zy9KIMeDlEoB9+c6NIEwg4odpF/uMFzOkhaW3PbqAY2xVoiqHMiKA
 q5Wg==
X-Gm-Message-State: AOJu0YzK1BZi6gHYSPYpI8lPWcFRafnka+0pXSKcxVXjSqWWl5NJk3sn
 j/d9uwzll9cX+BEmQaG9alit/jkKNxIao4+nWUYmmuvi3fXcgumpn//KFjIy4Q==
X-Gm-Gg: ASbGncv2M6hEDHq3hN1DnMm1j4BlDJUs65Y6BbkbH/IE1yGupeixcWKeBJl1ImccfM8
 o7oVOyWiXfIuk1LA2gCbFWRVYgkZ7/3B2DPchxyXAhZMmxBQoROpHb7iDGV72rfum4d5CCYT8Nm
 ZnnPGq9uLK2H9USQS0TWFehKrcVaAm+7G0QqX4TdtFPJntgeLIxc+CF6jJvSMYJLuz2zYx9DUn0
 +tyZwmsqWzY3trT/OPfyXOfbWnki1nVsm4St3fyRMlgcL1Uxvr3bsnAblPlE7QWo6v1NDe0vNXe
 WKSxvZdqkqQOD7A+ydLF/lOhjBiaQBwQhtBlq2dSGIOWS0EhF15kER9FUXP02wLLROiL0W2SpYM
 of5KoZWBIgucHA36+
X-Google-Smtp-Source: AGHT+IGXB+DKNAwAiYUNJboHMVY3vhOb2yaaNkMKMsZitC0SFM2Eqqnhm9UOefew5U7yQZvgXJz+GA==
X-Received: by 2002:a05:6512:1091:b0:552:21db:8f5b with SMTP id
 2adb3069b0e04-553931e6c7bmr967454e87.27.1749558576488; 
 Tue, 10 Jun 2025 05:29:36 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677224cbsm1514875e87.139.2025.06.10.05.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:29:35 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 14:29:19 +0200
Message-ID: <20250610122924.431830-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610122924.431830-1-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749558577; x=1750163377; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdinZPqeSYhPCKockLHChmzVBZUYlOLCe5slzCSf2nw=;
 b=feQ1TObZJW5FduZrc/pnoTVe9z8xgjExRIchCpGLuvwQlpDA+ou/4iNhndYGgQIzG3
 ejnzYS9K4An0hHhpZ2NV8yI3FeWNqGuh56iJrLMlTfJOtn78OF1Fu/I2WVxmxm8BVIMU
 F/bWGiv0rjo+pPP/mqhihLG8yD6kZzCdnlSVqFE+nUcXb6qT6Mzb83r0X+ncmzzzoMoM
 b1rVJ3739o9De7s1pgiNd677AhxWVbsuhnfLhDmREuhgoHqOu1sIc/+4JfYa2lnF5ikX
 xjrN2Zat1VrYli8FDHTAY/qoP6cFrxap3ehffVjdaRpsUnj4q5WgbrC5qaaEpjk+Jycv
 dpdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=feQ1TObZ
Subject: [Buildroot] [PATCH 5/6] package/qt6/qt6sensors: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6sensors/Config.in       |  6 +++++
 package/qt6/qt6sensors/qt6sensors.hash |  7 ++++++
 package/qt6/qt6sensors/qt6sensors.mk   | 32 ++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index c1ea543242..05f0540db0 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -58,6 +58,7 @@ source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
+source "package/qt6/qt6sensors/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6sensors/Config.in b/package/qt6/qt6sensors/Config.in
new file mode 100644
index 0000000000..db87e437b2
--- /dev/null
+++ b/package/qt6/qt6sensors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_QT6SENSORS
+	bool "qt6sensors"
+	help
+	  This package provides the Qt Sensors module:
+
+	  https://doc.qt.io/qt-6/qtsensors-index.html
diff --git a/package/qt6/qt6sensors/qt6sensors.hash b/package/qt6/qt6sensors/qt6sensors.hash
new file mode 100644
index 0000000000..ace6d8d191
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtsensors-everywhere-src-6.9.1.tar.xz.sha256
+sha256  f04b131acacfd42dfe056bd5861ff1e12e2ab57b3e20332becefa3644a409c6c  qtsensors-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6sensors/qt6sensors.mk b/package/qt6/qt6sensors/qt6sensors.mk
new file mode 100644
index 0000000000..c06b31c45e
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# qt6sensors
+#
+################################################################################
+
+QT6SENSORS_VERSION = $(QT6_VERSION)
+QT6SENSORS_SITE = $(QT6_SITE)
+QT6SENSORS_SOURCE = qtsensors-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SENSORS_VERSION).tar.xz
+QT6SENSORS_INSTALL_STAGING = YES
+QT6SENSORS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SENSORS_CMAKE_BACKEND = ninja
+QT6SENSORS_LICENSE = LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+
+QT6SENSORS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt
+
+QT6SENSORS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6SENSORS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SENSORS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
