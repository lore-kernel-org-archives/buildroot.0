Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A85C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 14:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A2260A54;
	Sat, 19 Jul 2025 14:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuDQn9J4ZfG5; Sat, 19 Jul 2025 14:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBA160A81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBA160A81;
	Sat, 19 Jul 2025 14:34:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BCF0DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9FB60A81
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbEQLnrH9SLl for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 14:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56E3D60A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E3D60A54
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56E3D60A54
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:34:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aec5a714ae9so344031366b.3
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 07:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752935659; x=1753540459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=crYuDCP6tu05vxpdPH17xcGN5KehLityHvrglNouKIk=;
 b=iN22/LWtBWwzu4uyYHfE1gvtmU/nchi4vPuhIviDP/fPRdrooUOKY08SNqtj2rVXwx
 BnyJbNLKC1obWvvgI68VENNzisaq46frQSt5FiPQMqc0ymejhMgB00DgITRCqB9Mn3ax
 I5VgEmRlSJHdlOtmunCleoNFE1qQx4x5O2EjUrOYKfZcKx9tZHO2HEtMAQa+vGv/wOfo
 iLr/abKbJpenLx9K04Iakxz5kuafuEEJv5ANmvtxWKUAHH6RepeeBoKR92KDHipKEl3g
 00RqPZYJGphwltuMNhIogUq0AEBZHJwMGtp1izXGAbos7Wy0lIUs1hLUPQwysaOcFD6m
 fyDg==
X-Gm-Message-State: AOJu0YxXn9NJD3MuRzJWLIftpLfr8oX/BQumZCbq3SlOzjk7ySEj3wuz
 xmnSF+QMFWNvZDjQ1HEaJYfszF46qOyD/Qqw0eKlSgDCGB467MDanNB1q0yaKQ7/
X-Gm-Gg: ASbGncvszCbU0c3qnYZZWbk6CScevupJDmFTsPWhmX+pMp6emzsvSameqoHfICwGYaJ
 XfXjwv4YQW0//IfWzTXaVsKgGXw0hu7FFCPGPoexv5HSoC2HRPql1/1UVqtQApOXdFKX4ii+xyD
 uoAlIdGvjB19mH2YUBo2RGopXo5PxX3tA77zAZlk4WKEnWXQraA2lDr+uIqCgs0aUanl+EqLcav
 ywZYqTg1mQ/7/ntlLAYxO5uzrSURs63XM2hgcno4pTK28Ol82RTmtOFWxyEnM3EVbj2N6JunDcu
 L+CfdOuZq9WcjKhDEvH5pdRReno6sjAiklqThuUzXZsc52ffzLakdbB/UDIGczoyBvONozxkggQ
 gsJ/3FrQUm8SAANuLfXPVbWJ3aS5PUlmt3zNe6oBmXLrj2xi3n/CyUtMwLtzHcKl2UwoLjKyDN6
 yQltY9dwgrtvBrjttSYC8=
X-Google-Smtp-Source: AGHT+IEDC+XIm4QKsT1BAGwhXyZoZw5tQ8TCmxZ8Zxv4CeT4SpshbDGZPQP0yCYQAhrZG2JW2qwAIQ==
X-Received: by 2002:a17:907:da3:b0:ae0:c976:cc84 with SMTP id
 a640c23a62f3a-ae9c9988bb3mr1458230766b.24.1752935658845; 
 Sat, 19 Jul 2025 07:34:18 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d1973ff600a1ab5b988c9d795d.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:a1ab:5b98:8c9d:795d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79e16esm317630966b.15.2025.07.19.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 07:34:18 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Jul 2025 16:34:17 +0200
Message-ID: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752935659; x=1753540459; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=crYuDCP6tu05vxpdPH17xcGN5KehLityHvrglNouKIk=;
 b=PH/6W2GAysHZRv4b0K7AtuNV8ByITKQH4PR1JhWVeg3AuIHfZwmA7el9dNzmksKDmk
 dCooGO6ty733hvepgx5BtcYTC91ahkJf3aBEFr3Ix1zirK4uqIHvG3njbEDyZl5PYMNq
 JlvAHa8wasbOrurvDf5eVA/UVdsflz89jVi6jQp0QEOwhZKmbotuulvPURUmKHNn1vac
 mZVKu0DbsIduHww+KJy5dfZkTvNVck9Vc3k/bTs7/rsgkQ2KYrcwr/RGc3+bJkp/h1tY
 bc1HvZt4OOQXFiWFlMp1pBu+Sh7fA19DuVbgrzdeSThekbQIQbJO9hvnH8ZuuzjeL00q
 r+zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PH/6W2GA
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6positioning: New package
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

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6positioning/Config.in          |  9 ++++++
 .../qt6/qt6positioning/qt6positioning.hash    | 11 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 31 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..d0105db28d 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -52,6 +52,7 @@ source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6positioning/Config.in
new file mode 100644
index 0000000000..d3caa044e5
--- /dev/null
+++ b/package/qt6/qt6positioning/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6POSITIONING
+	bool "qt6positioning"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6positioning module.
+
+	  https://doc.qt.io/qt-6/qtpositioning-index.html
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
new file mode 100644
index 0000000000..1a8f1282cc
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256
+sha256  e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f5267df78d  qtpositioning-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.mk b/package/qt6/qt6positioning/qt6positioning.mk
new file mode 100644
index 0000000000..82483e0ef0
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# qt6positioning
+#
+################################################################################
+
+QT6POSITIONING_VERSION = $(QT6_VERSION)
+QT6POSITIONING_SITE = $(QT6_SITE)
+QT6POSITIONING_SOURCE = qtpositioning-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6POSITIONING_VERSION).tar.xz
+QT6POSITIONING_INSTALL_STAGING = YES
+QT6POSITIONING_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6POSITIONING_CMAKE_BACKEND = ninja
+
+QT6POSITIONING_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6POSITIONING_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6POSITIONING_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
