Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF4BC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1BCB41E02;
	Sun,  1 Jun 2025 10:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nssEm-kCiVZ6; Sun,  1 Jun 2025 10:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9537441DDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9537441DDD;
	Sun,  1 Jun 2025 10:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D32222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EE4440441
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGCRh-YVdjPm for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D0094044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0094044B
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D0094044B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:47 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-553241d30b3so3896896e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774505; x=1749379305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=hu6x+szae85ZA4EyKVHw9X8zovCZSgjUAFxOi+8Eoo8H8PnSqA4QDxwDB9B1i8p+wG
 tnvgrr6DNPx+H4fDsZPwDCI77gZ/Iqhe3ufs1JsH3HdGOlOIvUpQe3kYYnu83rt7DGhi
 MQHAxCe5Ysc8QzjbKRwCmFSe/U2J0Q08LX7ECM+L6hGPlpA1k0bejwQ6yE7LAbq4UG78
 ctpzQDpiOZ0coDm8+SXhy410HvejPxYCYaAd43P12GikX+jh3zozTiNw3IMUMQ7Cghrr
 vEIEZgLzxkyY8uy5c1ENk3TvEv3cyGp8HgFSiHRq+dXASLpvrtnHVikfsNbMppryfkwN
 zZYA==
X-Gm-Message-State: AOJu0Yw0Td0f+NVHBCTey9iKYDE3fT0AIWyHGthGLV+VMd+l+qEdWbAf
 KRXHYp7fHFzhBzuak77XbdlLUXzeKTmyBHs4CbnfzoyQDfhBpOHa/5LwxEq5Sw==
X-Gm-Gg: ASbGncsR/yccosP7ob5oDvoeMbvYxy99MW61a/OiWHXf1SNazIIDtzF5wzMmRS7B7Ub
 KmLVab1vy9hF9M6oP+77boXhIEE/wf2L35h5z1uc6irspgiHCU7QWb33/IpLTn8Tbaj8OTcL8Kg
 NFGZeIHqSiApFdzow3JtXqNsKSUfjBKMBm5DeDfKQrk8MLTyFtRuwVHRiRuvRKAFCeEhol3oJWG
 gHLLqkdytMbbz+y6uGpgv/ZJ4ct9j4KJ2hDLkePEuuuAfqWnkmIne8KFnDc+ICD4m54V32GUQa9
 eqKnYiS/XPIcWe7fKqSU5QXwWBLkAnz0RNRysbBQVbbJ6/P1u2h5dDsa/YCInZqBiONrVxvIFgD
 KKhdfqIcbCA==
X-Google-Smtp-Source: AGHT+IHnI6lEdv8b7wJoY/MtczbmcrI16jXL6IXZc0dw9S8gge2DMnuO9qLN3VJerkmEBCnco6qbMg==
X-Received: by 2002:a05:6512:1041:b0:551:f0ce:80e3 with SMTP id
 2adb3069b0e04-55342f78da2mr1009145e87.25.1748774504894; 
 Sun, 01 Jun 2025 03:41:44 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:43 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Hitz <christian.hitz@bbv.ch>
Date: Sun,  1 Jun 2025 12:41:24 +0200
Message-ID: <20250601104133.3238551-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
References: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774505; x=1749379305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=ShRzJ9dk8YORNyyN8HYuZCTa/d/YWU+zVQ2g5qqNtNASR+h2S6+z9WJiJNesG1bZQn
 Rp9TjIg3Px/Nm7pwkPkL/lONJzaUb5GyHRdy4uW7xZs0KcT25RruRTWkLgWSER41psI3
 I3nYUb6mtkWm5688iiDuIB4f6IKXllqeLVMlIKI248JEM/aN28vKHfRhJ31JpABBJIGg
 PLHtonEZSeJp8sQfBPwAo9B/JGg/JMGYb8WijpHNvB5bcaNZDk5k2nr8HuZs+Igk5pcf
 uUWxY3nev2pPs+qudxrCfEbZr1PpJ+vsrpd28VrJoWckQ5kNDgroETbqWAPTQK6RuC+W
 AJ6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ShRzJ9dk
Subject: [Buildroot] [PATCH v4 2/6] package/qt6/qt6connectivity: new package
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

From: Christian Hitz <christian.hitz@bbv.ch>

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6connectivity/Config.in         | 17 ++++++++
 .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
 .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 package/qt6/qt6connectivity/Config.in
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..3597417ef7 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
+source "package/qt6/qt6connectivity/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
diff --git a/package/qt6/qt6connectivity/Config.in b/package/qt6/qt6connectivity/Config.in
new file mode 100644
index 0000000000..ba329d732e
--- /dev/null
+++ b/package/qt6/qt6connectivity/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT6CONNECTIVITY
+	bool "qt6connectivity"
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_DBUS
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Connectivity module provides support for Bluetooth/NFC
+	  peripherials.
+
+	  https://doc.qt.io/qt-6/qtbluetooth-index.html
+	  https://doc.qt.io/qt-6/qtnfc-index.html
+
+comment "qt6connectivity needs neard and/or bluez5_utils"
+	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ5_UTILS
diff --git a/package/qt6/qt6connectivity/qt6connectivity.hash b/package/qt6/qt6connectivity/qt6connectivity.hash
new file mode 100644
index 0000000000..3c1d9964a4
--- /dev/null
+++ b/package/qt6/qt6connectivity/qt6connectivity.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtconnectivity-everywhere-src-6.9.0.tar.xz.sha256
+sha256  ff402f8dacb2b9f9308afcea67118ae1645ce6466f2d41a8d5c12fd2fa168598  qtconnectivity-everywhere-src-6.9.0.tar.xz
+
+# Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6connectivity/qt6connectivity.mk b/package/qt6/qt6connectivity/qt6connectivity.mk
new file mode 100644
index 0000000000..4d77b2328b
--- /dev/null
+++ b/package/qt6/qt6connectivity/qt6connectivity.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# qt6connectivity
+#
+################################################################################
+
+QT6CONNECTIVITY_VERSION = $(QT6_VERSION)
+QT6CONNECTIVITY_SITE = $(QT6_SITE)
+QT6CONNECTIVITY_SOURCE = qtconnectivity-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CONNECTIVITY_VERSION).tar.xz
+QT6CONNECTIVITY_INSTALL_STAGING = YES
+QT6CONNECTIVITY_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6CONNECTIVITY_CMAKE_BACKEND = ninja
+
+QT6CONNECTIVITY_LICENSE = \
+	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	GPL-3.0 with Qt GPL exception 1.0 (sdpscanner), \
+	BSD-3-Clause (build system, examples), \
+	Apache-2.0 (examples), \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6CONNECTIVITY_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6CONNECTIVITY_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6CONNECTIVITY_DEPENDENCIES = \
+	qt6base
+
+QT6CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
