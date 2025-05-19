Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BBC54795
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2BD840E08;
	Mon, 19 May 2025 21:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsbzBsWFqbAS; Mon, 19 May 2025 21:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2ACC40DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ACC40DEC;
	Mon, 19 May 2025 21:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DBB4D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73DCB80EC2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki8vdixepNxB for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5182F80F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5182F80F29
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5182F80F29
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:12 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-328114b262aso30290331fa.3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688770; x=1748293570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYOiowDtPW8eBrd6wrgIvLvh4J4oI54jpVl6Nw+WYqU=;
 b=Qvq3TB0igHNBBscgNoE6BKHLIJsDtNnk3KIhpF5PNQMIw8PEly3UoQInABnYUoeIAV
 wYs0TyJf7aAObkOJca/ASzQN6dcVHMJ1VF6YjG2awz3u10OmSKHWyc1IMrprsaUdNvR/
 emGO8j9EQulK1qqq2syZosL4Qc8UzrChmIGvvXlJEJH/31QfK1Yf5+2lCvjD1EgruhFD
 mftUoADp2Kp1hoLzlxBJCziFheUiKFKQ3A/zit+ug7uUjbcLBcCX3pgDUmkO5T6ktQtc
 eLa9R1DFfrP+Xf5BSg9Y9ew+GWWSfuoDoOj9RkxnxAUMLNST9P37Ker6rve9UCh+aLam
 nFFQ==
X-Gm-Message-State: AOJu0YweQOYqUhBoheM0LE5WBoNFFBboOaHtwYV5zXAs8KCpHUZPVwYW
 BkJO8XKOIq/MyZoCfkd4mwVf0TDhggwB9AAF7bJIb/vbFwAd5b/phmpjvChPLA==
X-Gm-Gg: ASbGncs4GHD20zufyDVnfQMrvlDlGqEkzy61i6TB7/oT21jkh/0o0+pFW1hM+GU9tc7
 7s0JaWzt82v4JfKPXc0HrKmjboXWP38DX9NJm85xEarg3R4msRXjkLdM22WpTa19hLLga18Zsrh
 lsdfXyHphGkyjRxWKknTFLzyOi0+TRzwV98EpSvhdYjBR+UpS/DtXWozvc3IXnV536piypPUhZi
 xZUeYibpsum24zEbjE+RIUBaDnONdOxXd2GqC/GSuB/tGf1NDOyTB2exwc7Th5W6ZxMRljSsvj5
 zQaEsQRdk3nz9b7I5GtShyFXezQOZa4ErCae5nGr66T1h7DAh2KnrjFEK/CBIagmj5Da/BuHFhj
 j+JgoBNEIMyKjRxDa
X-Google-Smtp-Source: AGHT+IH1Ne2RLpzYseVUQjKuThOU8uBXaFyLtsjokGFB1GU5cvt3B4ljL1q6/iTS6lD0pKKZ/pnqnw==
X-Received: by 2002:a2e:8a9c:0:b0:30c:160b:c766 with SMTP id
 38308e7fff4ca-328076fd29cmr37151471fa.14.1747688769710; 
 Mon, 19 May 2025 14:06:09 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:09 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:37 +0200
Message-ID: <20250519210553.265725-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688770; x=1748293570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYOiowDtPW8eBrd6wrgIvLvh4J4oI54jpVl6Nw+WYqU=;
 b=JckEbVaR+T84Jc+Ae7lCbPCEfmiohG005iVQfPS4553DWZz0VALJc8ChqMxNp2URvk
 dtb6vMsgd/Z0ITsHYgu6ZGR9wKGc9xv7ixD5NAM9G7ce2ubeZY2bb91b1W9d/PtX83RR
 yBqpSFCgXNoXb73dL2ZNRkl744kxczRSpLaJ5mygFdERUDBQuGF5TffI/pEW4OjQ/S7m
 CRd3Z/bed3xM+A1ZVK2LjddHqson3v4C3gtwv4ccWr33+7juZmjChtWq30V58V7ooYn/
 RpJbje8xAcjkZ98vXeRYB80tYrvhuX+WubdfbkQBWb7Ll7QcueTYTwhIwtDm3XsTys8W
 ErsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JckEbVaR
Subject: [Buildroot] [PATCH v2 03/11] package/qt6/qt6positioning: new package
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
index 0000000000..1e6b65829e
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,16 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtpositioning-everywhere-src-6.9.0.tar.xz.sha256
+sha256  c00b4c01d92bf99c5562910aab59f80146b976cdb1dcb7bd2f27833624605ed1  qtpositioning-everywhere-src-6.9.0.tar.xz
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
