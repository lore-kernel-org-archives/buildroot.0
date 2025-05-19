Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A4C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F03760F8D;
	Mon, 19 May 2025 21:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyDAfK0-TMfn; Mon, 19 May 2025 21:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BD860F71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BD860F71;
	Mon, 19 May 2025 21:06:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D19F193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2157F40DE2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvmqXADe2qtq for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2F1D40DA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F1D40DA4
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2F1D40DA4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:10 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so56031041fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688768; x=1748293568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=FyLRk1ZAtd2xpU33B9TOFsuxwp4t7waR9THfmkBn+tFLx2zP2B1HH2XbbNMAKFe01g
 oaaZ2Qg2hUd2lFM6vZ/W8bbyW4TMKUdqU3qJ4p7g/plP91giumG6shtB+cwiv8XGr4VC
 AHJ/pu7vH/IegH13vYWq9lA5br5rE7qzuEzoYS+Lr0YuJiTvbjcCnZ/1hhuxy1YgTvRm
 +c35BSBl457loHFDAqtu3VvIbKJAkkQY1xLatQYaILu6uOiMv5+PU4dkY4GBrq3L63SN
 gL80/gTZbHZqPCR1A+CypzSZkX5ODDuLa74pjPHdcBHS2WHPY80uxsCBNWxa+VIP3qHC
 /Y9Q==
X-Gm-Message-State: AOJu0Ywp8FWHLl8mP7fcPJe68youvWwPAlTtJV/ufJ4HXZZNzFG9QfI0
 lbreN87Hxoe6rUHrYJGriS54H/ZdGN5JyAhgcEsPu7npYTDqPdbxNN/Jt7xKHA==
X-Gm-Gg: ASbGncvPhj+7sM2EdamvJMi/ZMWREprSKp3icnnmcpZc3xQ/SMKKhjH2MFcGKvzBqZZ
 AwmWrq+oIioKj3RGbyzv9JCt1TTKRN0YGDR59/nkyrjIhEBoVnAhxRfSLqZwZ44BbMA9FY97+JH
 /JI+pQoh4Q0onoKD/ntlAYNZ06n+kN8KUTxC4w67FTd1RBSuatCGnyFZQkYueS/HZWjgN9MoHWW
 QoFHfqqkgCn77GX74p5RPMic6TibgUfmEiWILqNq5bBpjK+fbk5uVCyMeWSMlpgNcgfvECiKb5B
 lEUimCKvVeIVt/3BXrnYwskqJ9irgb7jIT1thvWzlN7yPMQVLrpL4mrLQKcJ1qlESpgXk8XqSbB
 +M4uLBg==
X-Google-Smtp-Source: AGHT+IHn4EeyId5d/fEI05H4hWaoxNQkVzzdxnX/S0USQdiLhUicoMvnBrP1Ckmfj+aQO7jZXpIv1w==
X-Received: by 2002:a05:651c:31cf:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-328097806dbmr44870911fa.32.1747688767997; 
 Mon, 19 May 2025 14:06:07 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:07 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:36 +0200
Message-ID: <20250519210553.265725-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688768; x=1748293568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=muCSs7KsWiKbdQFFPuHi9caTLVQnjty2/0litd8cD4KMwS/bRX8vzWyYlrLLT6kimk
 17ngtkmgqNOA2IlDzwf1mdz29SRvulo0PvMDDHl0IJJOKuOxLb3I4Vop4rCTKUkwlhCR
 FAXzHmoeQWgG/8ps/nr8cR+iiw2mm6AyCXt9IYQgEzOlcsZh9VFxlr/wna55iFVEs05e
 Hax5RY/1ZiQ2YO9vzA3Quc6Uoh2jiNgNnjYKDn8zjw1kEiQ9R3Ibn9N8lbOVNte9g7dY
 p7VUXB+UZFaks5ZJazSv+Kj/1XedzZmJnnUJbDScvEruRWHbHqO2mekBClJeYmC18g1g
 L5MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=muCSs7Ks
Subject: [Buildroot] [PATCH v2 02/11] package/qt6/qt6connectivity: new
 package
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
 Jesse Van Gavere <jesseevg@gmail.com>, Christian Hitz <christian.hitz@bbv.ch>
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
