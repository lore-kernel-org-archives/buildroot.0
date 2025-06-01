Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC9AC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3835341DE7;
	Sun,  1 Jun 2025 10:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKNA8rr_Ew_S; Sun,  1 Jun 2025 10:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9037A41E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9037A41E1A;
	Sun,  1 Jun 2025 10:41:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD68222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9104044E
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAUtdh4Vvg80 for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8D214043F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D214043F
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8D214043F
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-551ed563740so4551430e87.2
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774511; x=1749379311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=UdhmVWfsE/QA1ISzIoq6VyZsSyF8nyZSgV3E+VnPRNtzDqGdYR9MXgVPoH5M54ZUDV
 MAtXtrQ4I0SVV7YUFE1dLpgpyOIeZf+BzGpNTZCqFpM74oq0ihP7s3AoEa2TG3es3pdO
 KMC6RilZJWNwDe/JkV+5xExGMTo0vz9zLEblj0UrDllyJ3zxoKEC+mNV38NiQDEZVdHz
 bFw4Kt5J1AOo3CH3GELSOfusiEDej9QJ3T2BpZsc9PJWTk+RR4Ajmq2FTNtYwjaKXTx4
 ytS9vbet2QrVwyILkZ+UZpMP6oXLpONjYmwQLgwmiqpmUByJIxNy1j3gzHGeqyDFKFNZ
 6eDg==
X-Gm-Message-State: AOJu0YwXMNIK5tVY8h8862PYBGTjGom2QwoRxxx6uFM3k5lnseJaE+bz
 IIPsobgq5jte6W7YKlHQENVTwhEKIimds2J0s5PxPg3hum2iOFWAStfD5pQ/fw==
X-Gm-Gg: ASbGncu8vZJppnQ/I5iOg71dycnrmay1DGDFDN3QzJ+aSUjprIjhMm3q9Hf1dFTQCj3
 y7xej8eDzhUQA9hBJKb+4OZBT/1dgPU/QHvkBBwg6027pAZ+E0JiC1H67s265J480l9U8aTg0Xm
 V+W+c4+oyXm7u2eH7R0WW4wlt11T6yCDBogFnrDwRChlDh/xw3XJF9aQhXySUV2qgtFrYlRHDJI
 KY6Mdzm9lcbOrzPoANul05vgRb75tseZX2mzt4kHDDRM91o8EyzXZ2Jc/T6hSlmv+V7A04wH/qX
 qm2TEISYXNlZzapaFw5o1Li8OF+UN04F60pKKtI5McJysbop16dd9OTpuniaUVDUJCpafw+ZXW1
 gX5UiI/++xWwRbLOvoO66
X-Google-Smtp-Source: AGHT+IHacDEE/lf/R3GP1t9uUAS7anigiKVVT/HVGsGKJNuvDQnfH69HSUFHvoYXo5pw0OkwPib0ew==
X-Received: by 2002:a05:6512:234c:b0:553:2f27:e976 with SMTP id
 2adb3069b0e04-5533b8e59a9mr2988414e87.8.1748774510514; 
 Sun, 01 Jun 2025 03:41:50 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:49 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:41:27 +0200
Message-ID: <20250601104133.3238551-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
References: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774511; x=1749379311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=kXyyO5xMUTKM3LEayAbItdBIrTbO8co4/nPHqdwWRZisQW1Fd6jb+Bb7NwBiAOtRq2
 DxqZSG7No48lCNvZ7R7jRPeZIwgTt260pnGEqk5R7zFeDcPzwc3juzkQpEjPybnkMXO7
 WlEfXjQOp3XspeLyeL40ogaMjQ5bo0OUeIz3OIT2trzpJ/9eDJB9McvF3XQ0Yk+QNtmb
 QyxX9hMxWEpj7i4jDhQaDbEDc/jhAd62EcbC+gJVWazGLx71LezPZl/BowhnimcnNbVP
 5Ghct4uEBT7qJoewT/mtuZI0VkIYTWBDrZP9NW5O8NyaaKpgG4rVkjCc+Arcb0eP6nDq
 jsWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kXyyO5xM
Subject: [Buildroot] [PATCH v4 5/6] package/qt6/qt6sensors: new package
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
