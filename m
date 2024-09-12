Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85E6EEB565
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D53608CB;
	Thu, 12 Sep 2024 09:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYcGURz7h2Sz; Thu, 12 Sep 2024 09:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A7C60796
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A7C60796;
	Thu, 12 Sep 2024 09:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 330691BF2C0
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 09:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 211C7400AC
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 09:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF5dXAZsr6JX for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 09:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE41B40021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE41B40021
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE41B40021
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 09:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id CB1BE164E2;
 Thu, 12 Sep 2024 11:03:10 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id laV_ehhTpxoD; Thu, 12 Sep 2024 11:03:10 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 823C516466;
 Thu, 12 Sep 2024 11:03:05 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 12 Sep 2024 11:02:46 +0200
Message-ID: <20240912090246.618903-1-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911140214.2479977-1-christian@klarinett.li>
References: <20240911140214.2479977-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1726131790; bh=mQ/eZuGmGnOdxaXRDaDQ2vM/CttBILYoKjdLr
 goWsuM=; b=FLw6EmgN41YDo22ZOeYrIDqjZRP5nNfxGFmMcOjLHuu29OhJUl13z
 uL6c1duwcqGuY8JIthrDsHwPoafTDx5MHx6brguTEC8NJJ6FxUHRbqaEYNhYMZt4
 os6nt6FjXgBXNd0k3Zh03Il/TGETHnJaLgGCBZ8cCz/XZp/IPNU28s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=FLw6EmgN
Subject: [Buildroot] [PATCH v3] package/qt6/qt6scxml: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Cross-compiling requires the host variant of the same package.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Changes v2 -> v3:
  - mention StateMaching and Scxml modules in help text
  - fix typo in QT6SCXML_SOURCE
  - add host-qt6declarative dependency to host package
  - add BSD-3-Clause for buildsystem, examples and QML files
Changes v1 -> v2:
  - make dependency on qt6declarative optional
---
 package/qt6/Config.in              |  1 +
 package/qt6/qt6scxml/Config.in     | 14 +++++++++
 package/qt6/qt6scxml/qt6scxml.hash | 11 +++++++
 package/qt6/qt6scxml/qt6scxml.mk   | 48 ++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 package/qt6/qt6scxml/Config.in
 create mode 100644 package/qt6/qt6scxml/qt6scxml.hash
 create mode 100644 package/qt6/qt6scxml/qt6scxml.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 29c1c25c7f..4cbb60322c 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -49,6 +49,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6scxml/Config.in b/package/qt6/qt6scxml/Config.in
new file mode 100644
index 0000000000..ff738bdc17
--- /dev/null
+++ b/package/qt6/qt6scxml/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT6SCXML
+	bool "qt6scxml"
+	help
+	  This repository contains two relates state machine modules:
+
+	  * Qt6::StateMachine: The State Machine framework provides
+	    classes for creating and executing state graphs.
+
+	  https://doc.qt.io/qt-6/qtstatemachine-index.html
+
+	  * Qt6::Scxml: The Qt SCXML module provides functionality to
+	    create state machines from SCXML files.
+
+	  https://doc.qt.io/qt-6/qtscxml-index.html
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
new file mode 100644
index 0000000000..6c39be214a
--- /dev/null
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256
+sha256  20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f  qtscxml-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.mk b/package/qt6/qt6scxml/qt6scxml.mk
new file mode 100644
index 0000000000..85ff17e42f
--- /dev/null
+++ b/package/qt6/qt6scxml/qt6scxml.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# qt6scxml
+#
+################################################################################
+
+QT6SCXML_VERSION = $(QT6_VERSION)
+QT6SCXML_SITE = $(QT6_SITE)
+QT6SCXML_SOURCE = qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SCXML_VERSION).tar.xz
+QT6SCXML_INSTALL_STAGING = YES
+QT6SCXML_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SCXML_CMAKE_BACKEND = ninja
+
+QT6SCXML_LICENSE = \
+	BSD-3-Clause (buildsystem, examples, QML), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GPL-3.0 (tests)
+
+QT6SCXML_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6SCXML_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SCXML_DEPENDENCIES = \
+	host-qt6scxml \
+	qt6base
+
+HOST_QT6SCXML_DEPENDENCIES = \
+	host-qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SCXML_DEPENDENCIES += qt6declarative
+HOST_QT6SCXML_DEPENDENCIES += host-qt6declarative
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
