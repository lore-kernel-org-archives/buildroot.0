Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B7EE49A6
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAD981349;
	Wed, 11 Sep 2024 13:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1757xGgDRSd; Wed, 11 Sep 2024 13:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07AEC8134F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07AEC8134F;
	Wed, 11 Sep 2024 13:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87B811BF954
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74FDE81332
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AJTEvMCwE2n for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E52881331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E52881331
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E52881331
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 89BB116466;
 Wed, 11 Sep 2024 15:15:15 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id 7Uo9E9DsBLA6; Wed, 11 Sep 2024 15:15:15 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id C117A164DB;
 Wed, 11 Sep 2024 15:15:10 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:15:03 +0200
Message-ID: <20240911131503.2305836-1-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1726060515; bh=8S
 bx7LXahwyqAYju8ls0gguKU730jUdzjF7Xs7qQwP4=; b=L9abDE+9oHR87tyIJK
 mbBZs5fNdy0DaIbULzagAy7G/66hHImS5w6lCwiwKoNMv5S+W5kcE7QlTWMmI1a+
 sUjqhMGN3hoFGRdwAGssn3e8IfHAt1Qgw6u2bPlPZp8HzOIKC/TXoFvl+shnicLY
 IrjGUUnQ3t6hbsXtCsqjGvutw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=L9abDE+9
Subject: [Buildroot] [PATCH] package/qt6/qt6scxml: new package
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
 package/qt6/Config.in              |  1 +
 package/qt6/qt6scxml/Config.in     | 11 ++++++++
 package/qt6/qt6scxml/qt6scxml.hash | 11 ++++++++
 package/qt6/qt6scxml/qt6scxml.mk   | 40 ++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
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
index 0000000000..23561f61bc
--- /dev/null
+++ b/package/qt6/qt6scxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SCXML
+	bool "qt6scxml"
+	select BR2_PACKAGE_QT6DECLARATIVE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt SCXML module provides functionality to create state
+	  machines from SCXML files.
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
index 0000000000..a455b01257
--- /dev/null
+++ b/package/qt6/qt6scxml/qt6scxml.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt6scxml
+#
+################################################################################
+
+QT6SCXML_VERSION = $(QT6_VERSION)
+QT6SCXML_SITE = $(QT6_SITE)
+QT6SCXML_SOURCE = qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CONNECTIVITY_VERSION).tar.xz
+QT6SCXML_INSTALL_STAGING = YES
+QT6SCXML_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SCXML_CMAKE_BACKEND = ninja
+
+QT6SCXML_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception(tools), \
+	GFDL-1.3 (docs)
+
+QT6SCXML_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
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
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
