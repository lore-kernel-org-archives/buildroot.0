Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120F3C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33F18188D;
	Tue, 20 May 2025 11:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTy3qhV_93fY; Tue, 20 May 2025 11:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F8E81854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F8E81854;
	Tue, 20 May 2025 11:33:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D215193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EE640A6A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73ujDItLR5Lk for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 002E140A62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002E140A62
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 002E140A62
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:49 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3106217268dso51571441fa.1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740828; x=1748345628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=YSePL1YmmrkRwsCqnUvTFoGUMRfVo9WnzYjG5qIspK9fuLwkd9mfQG+rutbaWcMY6V
 RYRXPlHRI0INiyW2tOrcZl3TzG7OVr+ezZOCw/5SGhl3Hl0O6x2cDzZ0ZdEuhnnyM9uw
 wspzHpboER0QboRB7D+47TzANLu7rgVx3aNrgw+y3ZNhnC0xHTdTGKoZd6VRtlfO5a7c
 6UAs4OH344HKVC5FwcIkYUBL/N6CpUxWWKr+UM0kOsw+FBu7CE55CCUO/kmqTn0waywt
 z/DNvUG2d+SCOW4umyNQd/7e7NzSlQ6xWYprmWY42TXtwmBRMLbqW6AejBkUJdeDuuWQ
 +4kw==
X-Gm-Message-State: AOJu0YxAZ25FJXeGV5ediswbiOEWovKidQjPn48wMNNwKkdOsSvdVgGE
 OSkdkuIB0FRekyR7vrR/E3lnGKu7iQpvpTiKYjf5FteAARTE7Km/Zh9zEdXwSw==
X-Gm-Gg: ASbGncscQIKffdYYB1OwPLcqrLe70jFrJCUpqb8SpKQoSVXEAEEFP7iO4U7V8np26wM
 UQrJs0G3IP4kO79B0frSpRTI6JclDlimIEYEhNSzlVCxI5xMRxs/Kjt+6K+WutZ9t0iUCDM4QeB
 jYg5HPAzJgHSPkDVBCeOXBk2CXcTA/gkIcm607VFvbWv+l0ay7QQJztAEEiG4HKKRTvXohY/Am8
 umOWBhIos65fqyUj8QPrhjtdDD8rkRw8w6whhKe6xWQn97hcn0EoIv2UxxCrdFhTDDzfLEeE/Sf
 awH88lBGR0YNvwmPh4sqFRZ+WZoqe1Yk52gcVpr6FxWFFosZxm1wQ/b5XBe0CF3ZgjygKrvSKlH
 foXADPNpOfmVzKvfd
X-Google-Smtp-Source: AGHT+IET3e88lzlO9MpnczZNUCYhzMO3yJDZOPnG8gCroXwZbkbzmNVYd3Ub8GDS+OTggYUIUGgC4w==
X-Received: by 2002:a05:651c:1555:b0:326:c36a:bd76 with SMTP id
 38308e7fff4ca-328077b44ecmr58625161fa.37.1747740827488; 
 Tue, 20 May 2025 04:33:47 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:46 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:21 +0200
Message-ID: <20250520113339.2525537-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740828; x=1748345628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BER8G/zRKkoB5SZVNBU1lGgvhOgBUWdcgSb+YrjpbsI=;
 b=iL8T/HdNL2HYKA2pw4OyB31ThiIm6r3PfRxg/FKzU4Yq3d8+YOrENymMttn0OBev50
 MCdVpy9fzIqaeUezx0k3lO/fP8qcE/M/jb3tdVCLykiePxzlZMywTGSgzg0U+3iOO0qB
 8OQlWk4TLTtf2aV+KnRWT+q9sOON60XWmTTzngPSu6OU3GKZRZLbepivTGiNt7ZxezhB
 LKL0jBVILL8NMAnXIAbf46zUzM9TqDaCvgu5xOGrmmtzEoAP6vESr9Oxj+DgqIdGgn1S
 ui6dU9Ld46lqNf3zXHAgIkUwm8xlkFsT7a3aoGv4nD26QQBkdyqLJc7HZySMmN3NJ3NB
 HDjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iL8T/HdN
Subject: [Buildroot] [PATCH v3 02/12] package/qt6/qt6connectivity: new
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
