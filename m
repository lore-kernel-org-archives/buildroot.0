Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83CDC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF3A80F14;
	Mon, 19 May 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-7wwUS3JiXF; Mon, 19 May 2025 21:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEBB80F4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEBB80F4C;
	Mon, 19 May 2025 21:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41472D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26B824192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LDs9Jbul_SS for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3D68400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D68400EC
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D68400EC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:15 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-32840b91488so27818371fa.0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688774; x=1748293574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=KG7j2fqq1sscof4BqJXh4N2MgCAc6idrE+6kH6KwcvHQrkuRpn2/SENdD+hfU2Lu7k
 EnlBPHAZWyfmfdnhsRF93dpgVpOMhjaE35HvcShfuOr0a2T5AN2RkL+rhJRzeZC3xWo5
 Jqa4MICR9huMpB/4oDvDnQVt5bN95h4s4ZlRvwVYsSfpNzsevpAO0OkWskBhELUWGBef
 AfiDycwAsHPiSuUYfuM0fP0bIyllRWMXSBBgAsWPwhEckacVgWiTSA+QHfR4OMA2HZEt
 UwQS6BJEAZ/+79ty8lDAuL9tXRFnZAXYEgwOtrGjl98IugORAB8DLoosdCxYYijSu1As
 jJfA==
X-Gm-Message-State: AOJu0YzPY2QjYOhiR2MmHY6PYzRpJ8LXxMr1Qy5qiNUfg+0AwqxfVfIS
 N6aRGDRg0wtIqQlSkzVHo7GrjUzt7CJ10zmZciS2o6rrRyrhIz7yl4jTiWqngw==
X-Gm-Gg: ASbGnctkwVv1t0JRQywgiY3r9YvL6zU6Jyxv1MO6r3xBqjScOTwcPlgk3Day9Y0ZuiR
 rWnibihd/4NcLWHNZCTcuwb3xJ4chdDvD4bHx/PcVAGb63yHQynukHjVP4n9kCFwe0GwoAMfdHn
 uBvsMXejHimwMTGdRr4gTfVFILzCNqx5ZGEhySAHPzxYv4UeGrq6TUykmEx2NcjarKQoQDEniNN
 G/VFl3cqi7AqQ9XwtwSlwsd0SerhaaMoQyup6gVhdVGw3H2qufPDGg0mTrvSZIF9TKHCphTuEwK
 Ca/1Jp0+bhFhwGwbx3tAFCfUfw/EvBDc3PXToG5kRWanq2y43sRuJjatQVhA3FuVp8NOi9c4bUI
 WXWgnXQ==
X-Google-Smtp-Source: AGHT+IEGqOUrp/MncSddD8dLbQDRaHTK6vWfC1nu9udsHYAScCIiSWU9RjG7ExZrl1D9jqs3HFEsTQ==
X-Received: by 2002:a05:651c:19a4:b0:30b:aabf:fa8 with SMTP id
 38308e7fff4ca-328077c39f7mr66025181fa.28.1747688773243; 
 Mon, 19 May 2025 14:06:13 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:12 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:39 +0200
Message-ID: <20250519210553.265725-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688774; x=1748293574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=epOufxP6GjwK09jVZ1xDYu9IiPPQHYMQS9REGHpZbdbrYimja7NsF3dp3aQAvJAz52
 6ZpGC0seyL+7zKixCzNYvGYQLgYqzIyMh7avdGGLAfDvHa8MrAB+y+/k8uHJcaEgQsva
 ujRkaXsJmAEEHaplGd2uqIZGNoN2zLHWwNMHVV/Md3lrcrmDhIRlMiJXS47oUoH76OwR
 Tfl7egj6sbNYb8y7hNhfGA5K72cndWbuHioUVfGwiMzdSurfN282axBVryhJq9gSquOd
 js6HuSIRzWJaaNcWL5sahzFk38xK114dqpygMNHXNTGutFFWti3rFJVas2tdn34lQe/r
 yqaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=epOufxP6
Subject: [Buildroot] [PATCH v2 05/11] package/qt6/qt6sensors: new package
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
index 0000000000..53af41c58d
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtsensors-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a46137c1f4a768d00397a2f83de7018318b0ca35d39c848da62d1783b368e467  qtsensors-everywhere-src-6.9.0.tar.xz
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
