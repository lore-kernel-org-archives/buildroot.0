Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B3FC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 18:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF12811FF;
	Sun, 23 Feb 2025 18:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r83XPxxA9ast; Sun, 23 Feb 2025 18:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B027381208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B027381208;
	Sun, 23 Feb 2025 18:37:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 132B9943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C2340530
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG9D4vlV6807 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 18:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79ABF404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79ABF404EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79ABF404EF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b302.dip0.t-ipconnect.de [84.161.179.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BF8EA4C512A;
 Sun, 23 Feb 2025 19:37:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58840)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tmGqx-0000000050f-2MwX;
 Sun, 23 Feb 2025 18:37:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 19:37:22 +0100
Message-Id: <20250223183723.1517477-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250223183723.1517477-1-bernd@kuhls.net>
References: <20250223183723.1517477-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740335844;
 bh=xV0AHOmNpdmkX5bieCnbUMUPbSIvcgcxC+FNQpiTGWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AVTkzYBsOEr9AYAIHA7iyPQd/hkBevFSsRsV+mMm2GwyQl+dDgS8QKvTkM3Miw5DG
 +jQ63NAi8MGWhydx8McOBS9vOdUDwe1iX6g1l8k+1zz3R9iHdNihm5ajAUNhiTTsDJ
 JuNMHdDxouZGuQfEnI78jdSTOfX+4aGDJdsdUgmPMFXA0o/tVvj/edk5dmSTPlt7Gs
 eIB3iGK3EW1Ft5enSnm1w4q9pL9Efqi14qvNqz8s75vq7XYs0pOp7EmfZ4xT3OoLeU
 t01zEefbGghl5m4PJMWJAbzSEhy0utHnMPeIXF3WpxeFZrxJKlzUD+VfqWF53CtD1T
 PghWTR1YqMiHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=AVTkzYBs
Subject: [Buildroot] [PATCH 2/3] package/qt6/qt6positioning: new package
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

Needed for GPS support in Stellarium.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index 0000000000..65c58c484c
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,16 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtpositioning-everywhere-src-6.8.1.tar.xz.sha256
+sha256  e310e7232591d4beb1785bfff8ff3e77430bdf5e9a17f56694b732f5267df78d  qtpositioning-everywhere-src-6.8.1.tar.xz
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
index 0000000000..7fe0e74c5b
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
+	GPL-3.0 WITH Qt-GPL-exception-1.0, \
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
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
