Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F2C71130
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 12:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9CB41987;
	Tue, 10 Jun 2025 12:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFXG-jDK_dPp; Tue, 10 Jun 2025 12:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DB541B7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DB541B7F;
	Tue, 10 Jun 2025 12:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3CE31F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58A0417C6
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp0JocQqSvIb for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 12:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9402340BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9402340BE0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9402340BE0
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5533302b49bso5583085e87.2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749558573; x=1750163373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHnIGzxDIjuWMGpjvrScii+5sT3ve1VWNtuRXPoh3u0=;
 b=rKc+XBR7+0WNXCAfRPgvSJGQpVjc8CivL+DMzNem30OXr0t/px35Kf+NgmhIwmvfCY
 B38WgZv85gMvOWv74Pw9cRFWJ+00BqsnMHtmdYgbYZ3MtZ9ModUB+86shUOdkBqr2CwP
 6C0iKiV7Z9ruEhrGuc/9x4ud6KRBEpA0n23SleWPz6tos+4ZPnyn7lq3Hs6OGwCbm6Oh
 YxUepL6kspT+ow1dhXinS52mUSW1KtJf/luzrFuwp5RxueeCCrcS1yzqQ7HDaKiZA+9k
 YZB6pEf3DReOv0uQtl6nJG42C46WGhPPKv7OSFg1XoRYq0AK2moyfDoMxFjx++lPpUM2
 boiQ==
X-Gm-Message-State: AOJu0Yznn6IXGcvuDzBX2vVV1jjX89Vd22d2KgmKVfv4gq3mGHLC8jbV
 QJ/FALR77rndXzA/KZdc72BwZ3n23OoeZKVA5WoLCYDX4t4dOMNLhIAsQHzWeQ==
X-Gm-Gg: ASbGncujmKixWeReIvawtbUy0fazeCSsnQgZlwi7U4zO2dWe+rhku4eIOKLJnfQcMfM
 PQ/eqZKDhopuOvlva6tqi240U9V9aLMTDfS1TAsyH8dl+LmeTgF3R/XMpxyAJpmoUPFSKIdC12j
 Lfxc0yuPyudHA1xMOY4hbyp/UxgRnxoDWXeMsgTj+1hyd6oxo3qt8ZvpLAghp3XvYH6i9E8RQyJ
 L1BOhAtm1oXYhPkALpnFyBeAWCumfxejmWoOGkixSMn1OpbIPLk94lORl1aGF7BIGvR+4fo3gVJ
 zjRVTqco0XdRu0eXEVGV5lMjcpB6aDxZju4RZu9IEKHvRPm5tGV/y3E4zqB+HB22f7ClzXRdkBf
 jP+h3j+jPNnn2EuEp
X-Google-Smtp-Source: AGHT+IGMb2j0NapShAczWPwszMlq4OnqkmDplwfcXuwpR0w81/aNCHHwhljpPE6HKlxbmfYqN4NhSQ==
X-Received: by 2002:a05:6512:4026:b0:553:663c:584e with SMTP id
 2adb3069b0e04-55366c413f3mr4302049e87.47.1749558573186; 
 Tue, 10 Jun 2025 05:29:33 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677224cbsm1514875e87.139.2025.06.10.05.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:29:32 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 14:29:17 +0200
Message-ID: <20250610122924.431830-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610122924.431830-1-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749558573; x=1750163373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHnIGzxDIjuWMGpjvrScii+5sT3ve1VWNtuRXPoh3u0=;
 b=edm2tr9wLBk+k9nIHCVV5RyMmVHUwax5+TTaljH6nkJN6wyefJafheMExFLH2HCfx0
 MnW6I3pOzShYriEmya/5/CxGnTikt1tol6ApIn9+CbLOuqw47POWPyxUicuTHoSo1PUj
 EBFgxQYOguXy/GPoNyb3iHrPMpuucY87cNbnjBu/KRqN/qiTnmSY9H5ydM4pQEVR6rGp
 nCoL1An9lM9pM26oNGRpWD/goR+UR8QXIklK4wcDypQ3ZP0ozIl0liOOEECs59VhHhQZ
 n7S7iRLV4XiYIVnuCQBEqyrlkqR/OXjJT5lild9SJPp47tEJ1C3/TfLf524V4LUMhaYf
 fajw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=edm2tr9w
Subject: [Buildroot] [PATCH 3/6] package/qt6/qt6positioning: new package
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
 Jesse Van Gavere <jesseevg@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Needed for GPS support in Stellarium.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6positioning/Config.in          |  8 ++++
 .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 3597417ef7..6b7152d902 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -53,6 +53,7 @@ source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6positioning/Config.in
new file mode 100644
index 0000000000..a083dcffb3
--- /dev/null
+++ b/package/qt6/qt6positioning/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6POSITIONING
+	bool "qt6positioning"
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  This package provides Qt6 Positioning:
+
+	  https://doc.qt.io/qt-6/qtpositioning-index.html
+	  https://code.qt.io/cgit/qt/qtpositioning.git
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
new file mode 100644
index 0000000000..9be86cbb54
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,16 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtpositioning-everywhere-src-6.9.1.tar.xz.sha256
+sha256  7062734b4989248ca3f0e3e4aebb9aa2e7ed2d6bf19e779e520c6ef69706ff26  qtpositioning-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  ed0df7c746c39b27f297cc1bf5e8cdfa5b53c7056572092a77db02278435a689  LICENSES/OFL-1.1.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.mk b/package/qt6/qt6positioning/qt6positioning.mk
new file mode 100644
index 0000000000..718abbd941
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.mk
@@ -0,0 +1,47 @@
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
+QT6POSITIONING_CMAKE_BACKEND = ninja
+
+QT6POSITIONING_LICENSE = \
+	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	BSL-1.0, \
+	CC0-1.0, \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 with Qt-GPL-exception-1.0, \
+	OFL-1.1 (TitilliumWeb), \
+	BSD-3-Clause (examples + buildsystem)
+
+QT6POSITIONING_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt \
+	LICENSES/MIT.txt \
+	LICENSES/OFL-1.1.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6POSITIONING_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE)$(BR2_PACKAGE_QT6DECLARATIVE_QUICK),yy)
+QT6POSITIONING_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
+QT6POSITIONING_DEPENDENCIES += qt6serialport
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
