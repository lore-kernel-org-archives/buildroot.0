Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2219CC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F546107D;
	Tue, 18 Feb 2025 21:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdI7EYxqPg3K; Tue, 18 Feb 2025 21:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F1D61038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F1D61038;
	Tue, 18 Feb 2025 21:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D390C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4884E404D7
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAiKRNzHCWNZ for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 21:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7C6F404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C6F404B6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C6F404B6
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:48:47 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30613802a59so63097261fa.0
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 13:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739915326; x=1740520126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqdxGiDx+ByheU4pGUr+JmITH5LvV4zySh/4P9LYPyU=;
 b=MKNXD5QwFjfN5KgTtLixemp6hgBqrMHgNSmfuUTxvkqKEZ2fsOZFOGDUQ8e1tZGpWc
 JBY/q0L/pNlQY6f2poyUUzbIGB3dhK2KjA7xdEdU6NDGpR2ni+6rQKDM1PPF+5erR1e5
 VXsLZXUjb0tVse0HHBSYSUwyyffHaVUUeevVqKvqw8SFjyL+Ke4R+IlNJxhVByXzqN3c
 knKnfoRoylASFwScm8hoko8UHH9o3d3ZBMdr99xt/qkWLazZa7gjraIWtQULHvnuNd1+
 a1e5HAC/2EC3CPjLgGVfW6jPzZPUi4Xslj20g4GdZBUQP+osq/Cpd7AoR46fJsXxD7Yd
 av8Q==
X-Gm-Message-State: AOJu0YxjrAXL+OiA+l/Ao+/XaGp6i45Jq3ftoXj4DiLZvQNenUZ5kNH4
 kEUaf2L4k0EDhr68FgnIzqhcQnkpRQPLJCAW8NDjg5PO3H7DwbiYXT2lcA==
X-Gm-Gg: ASbGncugegSLCgHIyk4PV9D1stP1Gc60ta6dShUPwoRyNNuXkR4rPjev/JumurD9NAK
 qvgU4Xyi86LWDYVYvZEnrkLTKiDxD13Dfr8YFvpPmR8yVQ7EVk/SKBBrLrvqTFnqvDnWeOOqgMP
 cpd7UYaxjVCVXkIp3aZW12I52x818EXEtfVY7L3jUvKur9eEXbIjVa2fNWWAiUreBq2WxIwAcQ/
 sdT5AhX2DZQXDXA/FlOpCNQiKu4U+FBEGUXD2SpzZV+ZbvamJ7cwf/e+eiec60rpoXIP0aJ66K3
 K9/76aQfmE6iRHdP3OvFE5i8mfcaHbongW/1nhXQffS8tNxSTg==
X-Google-Smtp-Source: AGHT+IG9TxGkjfEeo1WhhwmCc39VFy8EqkzU7KvTlCtlLTAfVQeOn8EMeDdXldTpoJIR21fRQysOpQ==
X-Received: by 2002:a2e:9255:0:b0:300:3307:389d with SMTP id
 38308e7fff4ca-30a44ed105fmr3393771fa.19.1739915325374; 
 Tue, 18 Feb 2025 13:48:45 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2be45876sm9720011fa.68.2025.02.18.13.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 13:48:44 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Tue, 18 Feb 2025 22:48:27 +0100
Message-ID: <20250218214830.169568-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218214830.169568-1-roykollensvendsen@gmail.com>
References: <20250218214830.169568-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739915326; x=1740520126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqdxGiDx+ByheU4pGUr+JmITH5LvV4zySh/4P9LYPyU=;
 b=aoaGqnOVbtMiTOLzodDhugiPKtVm9Oxv3dlCNlmTQTjmypKIZCzB1gphMmsvPQmRg7
 x577HSN6CBicJUvs+0zRVyuf8tiXn54Holw5xrlv7gD9z1UgUWxT1iy2cjAuIPpDCvsn
 JqIJsYmmCyLBaYc8e5GKxChtpoVl0TRaMIYNTvTxaQY883ChKkfG6K5UIhdXrO3kP/xy
 7pHdsjkW/86DwUMy7vVlw4loEbvi0YgAtlH+obf3Br4JwMEaVc1YlRVgaHZ6S2TqF7Xo
 sWf9mvG5ZLHLdVG+R5MTZ5KQTX0Ov3/ivKAm4lUQDcaBLERQu1q5OzQt9ZlZ8os9maOc
 pIog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aoaGqnOV
Subject: [Buildroot] [PATCH 2/3] package/qt6/qt6sensors: new package
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
index 10594691cf..8ae1f05139 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -55,6 +55,7 @@ source "package/qt6/qt6opcua/Config.in"
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
index 0000000000..368f290a5a
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtsensors-everywhere-src-6.8.2.tar.xz.sha256
+sha256  8a817c9b001ad0abdbf15064826ca6a8ee6b66fef8f04b4343ac9f7b2ddbf4ca  qtsensors-everywhere-src-6.8.2.tar.xz
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
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
