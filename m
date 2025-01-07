Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C2EE77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 12:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE3E40302;
	Tue,  7 Jan 2025 12:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJlCAewo_mE7; Tue,  7 Jan 2025 12:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EACE3402DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACE3402DB;
	Tue,  7 Jan 2025 12:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0889C7AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 12:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A20402B1
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 12:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBSdsdRxPmrv for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 12:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A08E240284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08E240284
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A08E240284
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 12:22:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-540215984f0so15983563e87.1
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 04:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736252547; x=1736857347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=81gVKixDYDjKlg/yGARR2nyOHRpP4kyvFpZy3+JwA80=;
 b=mT3LO2+6iPoDBZ4qttmdYf9eyY7N7Dl0yF9FgaHQ7aQWU/97n8fqtCVN1hgBUbVVrH
 gwWCEQo/G4VauAeg9jIHcP4dLfKiCBpb8c6h8e/vIrrgn2I9tZcO9vz7Ux3h697/Wdxm
 Arl+nDDhCqh1/hn2wz4PZ1dZ7I0eRnY/N0v1oi10bzmOOfYzjFn8FU7+3BPgA8Gdu8Ww
 zAkTkqY8EXSSm3t7yMmMj4Q/r9ZOGCPIxq/kMpYnExBqeeCnDMI6dKuQgKiIbuwIdKr4
 kjwTBoZGIOTfcFvXPooR1bg1q5C/pIQ7CFskSaIeVl7lKiEjdOesxH0JZf+AkfvFfnzc
 OrTQ==
X-Gm-Message-State: AOJu0YyyQhwQxEchYtAsWkiFSZV5K1BbiqBYIvxdwGy3QGV6X1d3KiiQ
 +4Zet+KTXzVSzt9Hn7jJoU7dyBDhXWLoRTCqDnaS7NLHP7ZhIF4KGl6CRw==
X-Gm-Gg: ASbGncumSvzCf9RU1w+ocKAJwZBy1j2Eke1N9wsI9IqQxQbYC3E2RalAOL2BLYrYUHg
 3WjqWlAn21ejPu/RfUm9HIbrphSPWTKWIT27ddgwHQTJzcEGi01obo4LaJ5YlPyKS4A68Vzy6K8
 PW665XVfdqGfN6H1v04XIUgWjo04sbdTV0yaQEd/orDMGyEOOqbUwg9BftNHbf+97IDtQh0ZzVm
 wF+AGwlK7/DHw/xckb/L4jx4Twq6W9CZYo6a6AUx3RUiroxuJjotUG/Z/6tq83rY3yKPLA7ncU1
 a7rGHdiPN0w=
X-Google-Smtp-Source: AGHT+IFnOtsAMZXJsN95NcI9D5bxjbHKeiCpdaGhRDLo0b+aYp8WWU1bVdWwoaB+oFIAb+TZooawsw==
X-Received: by 2002:a05:6512:1055:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-54229548e22mr17582744e87.29.1736252547116; 
 Tue, 07 Jan 2025 04:22:27 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm5270291e87.247.2025.01.07.04.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 04:22:25 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  7 Jan 2025 13:22:18 +0100
Message-ID: <20250107122219.871984-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736252547; x=1736857347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=81gVKixDYDjKlg/yGARR2nyOHRpP4kyvFpZy3+JwA80=;
 b=jg3xzL+DiXPHiXfyL4gwn1Yu+QYT+U0avOKKbv6rvR3qOcrOfNM+3ksI9P1xUz5ZOv
 qep4jXtVK8+efrfC8nW+EsSBNstEKhg9JLX9GusMd1f3Sfqix8USJ1ejYDwdad31h4Pz
 JlysPW2hdzpkOzSPFjH1okg8rxpmEzmVatZ58A60PUNyjDMbsIN4xAnIR6uMG6Xz7Rm9
 qU5bAZFiuGrZ6ug3PFZ2Y3FL+Kp/yXYViRufkWQyDbM+MzHHk4mYrFuWDqUaahDYHMiI
 nTjhckvUTK8Z22irDFRG3ALC3T9Q4NZ4GB8aTVDHWcl3E3bPVa2DMsEhpRJi75aDfmVQ
 XaiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jg3xzL+D
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6sensors: new package
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
index 80c417809d..f14e305f90 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -54,6 +54,7 @@ source "package/qt6/qt6opcua/Config.in"
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
index 0000000000..a5089e585d
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsensors-everywhere-src-6.8.1.tar.xz.sha256
+sha256  41f49b614850d40c647b80e70ef6be759e8fc90ac6cce3ab6f82a357201d9750  qtsensors-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6sensors/qt6sensors.mk b/package/qt6/qt6sensors/qt6sensors.mk
new file mode 100644
index 0000000000..371f5946b4
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
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SENSORS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SENSORS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
