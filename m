Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D150CF6AB6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 10:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CCE7408CE;
	Thu,  8 Jan 2026 10:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEgR0PcUKP-X; Thu,  8 Jan 2026 10:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFF8408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767867061;
	bh=EX6cxwP0Qc4q/+LAfCMo8Y8M1c5tWXfc0/UCFfp1N60=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=du28TmOILPTetAAE8wvNwyKCuV7y+XbGi0LQ+uiK0quKYIOPuLUlmg9tb4VJCWDIe
	 8doywB24Y7AVUVmXyqJyC5ttlcDAjfMXBBC5MGWFXIvBsBhniHJHPQ0aHpuKA3/kj/
	 TMRkg5JTPLRa9fwYOqIf1iSbetDEKLUrNhD+hOviAWPVxs9iwp/9fW0Vlyuq76rnrT
	 qjpR8skIJZ4ymKK77B75sEK0BUk8wMvu+a6E3BSfens2Q1LdcHDCzinshcTPW1xEc4
	 RpvAZ6NlS80fmMTqS/0RdcUmE69iBCXxMFqHMM++xrXnqEobxXKVaMo7lBBwDRVo+b
	 mSF1TgCsWeOyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFF8408DA;
	Thu,  8 Jan 2026 10:11:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62309436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EBFD80BA0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGkEodpDmonm for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 10:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F01680B2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F01680B2E
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F01680B2E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 12C1C1667E;
 Thu, 08 Jan 2026 11:10:48 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id EJ9m1eM3us6m; Thu,  8 Jan 2026 11:10:47 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id DC26F162DD;
 Thu, 08 Jan 2026 11:10:46 +0100 (CET)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  8 Jan 2026 11:10:33 +0100
Message-ID: <20260108101034.280787-1-christian@klarinett.li>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1767867047; bh=Ey
 muIC+btNlzd45HAmyGGsBUfPRZAthMXsdbmTnY4xg=; b=J8fbWeQY6oDo298xx0
 Yu7dROJiwx2VhG4fJdM/PncNyP0Btu6eNgj6+VZBde8gZkp4v9V/PPs+dbcKLdFs
 YDzNCOklODE5RkoHS4F54q/c62gwLgjA4uM0wni7bMbn4jbRj212ycr5vgl4IH6Z
 4PFPNElJwkLW83vXOMrzEPc2c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=J8fbWeQY
Subject: [Buildroot] [PATCH v2] package/qt6/qt6connectivity: new package
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Integration with neard is implemented with D-Bus therefore the dependency
is runtime-only.

There are multiple back-ends for Bluetooth (BlueZ, Andriod, WinRT, Dummy).
BlueZ must be available at compile time for BlueZ-back-end to be compiled.
Otherwise, only the Dummy back-end is included.
Communication with BlueZ is implemented on D-Bus communication.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

---
Changes v1 -> v2:
  - expanded commit log
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
index 0000000000..adeef32e17
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
+	  peripherals.
+
+	  https://doc.qt.io/qt-6/qtbluetooth-index.html
+	  https://doc.qt.io/qt-6/qtnfc-index.html
+
+comment "qt6connectivity needs neard and/or bluez5_utils"
+	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ5_UTILS
diff --git a/package/qt6/qt6connectivity/qt6connectivity.hash b/package/qt6/qt6connectivity/qt6connectivity.hash
new file mode 100644
index 0000000000..7a5e68360a
--- /dev/null
+++ b/package/qt6/qt6connectivity/qt6connectivity.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtconnectivity-everywhere-src-6.9.1.tar.xz.sha256
+sha256  4988e50112104d5ad85e5b3cef66036ca445f18c22cf375d3dac9dcca95e0a17  qtconnectivity-everywhere-src-6.9.1.tar.xz
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
