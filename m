Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D89CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 18:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D90940799;
	Fri,  1 May 2026 18:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYSVCltr7O8p; Fri,  1 May 2026 18:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C73240D32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777660506;
	bh=unfYxFkUFLc0ZI10bY3H7lA+RNm2iJabUhF3YWHCxDA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9eW8oyy8GCl+DFhkVPTo2fEsI5WDTNphveiddiHqSehSm/M9Xu6yOSRbk3oEeFPg
	 pPPU6NSU5HrFT/MdQkuhtbnG6BKeyHzGvm5835iPJtz1kVCXgXRcj8HaoTTTUkV40f
	 C6hHnSDRZXQskFUw3IUi3tjHhuDSMsOSU8JVJvtZ5eaermK8i/DGDmkgqnbaFRC5bs
	 wPRNf+g8WuMt27Du2ehCTlb9v7WddWqhgJB0lo1eB85334lqtwy5RCX2/DWD5N/qbl
	 ru7x7uGo8+VKLzOI59acybk8q9YJnOs9iVFf//6PexdwL/NB4gQZD1GJL0pxyIX+1s
	 ZDZBYinqE+A5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C73240D32;
	Fri,  1 May 2026 18:35:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15F51204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0842940D32
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cK42v7jC5p_p for <buildroot@buildroot.org>;
 Fri,  1 May 2026 18:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81C8040D15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C8040D15
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81C8040D15
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55C7CA4C0258;
 Fri,  1 May 2026 20:35:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIsgv-000000000Qz-3axX;
 Fri, 01 May 2026 18:34:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 May 2026 20:34:20 +0200
Message-ID: <20260501183421.2459291-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501183421.2459291-1-bernd@kuhls.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777660501;
 bh=Ik2Q5J946ZhNBvzSwol3SqJLAJH8DJc6/3wJhFDTaPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SFu0denM57/Oh7kALDOb0Dn7wk0dYDxKi/7ossCvS5pUop2a5wf82yCEzH6dsvKyD
 rNtAfXfmwj/vCeG/uBjnwxI8OmUsiwZlTG/zO4Ixq1bqmn81y2g2MZ3w1rSPdo70fq
 qO2MDugsfBvF1GF+RZn0IWAKPgWSUbcY1XbByKG1mBrLQa6qO2VQiVOKBXmF6SZ9wT
 K2iH2/AlfCVC49YXGSGFlS0XqhCjcS8dXnRVVlNWXg9nBuAiVvty86xoQaqbx9LyTX
 FX8fAeWPbhwp+jZnOwgUG9D8BxlFfDYaCsNFKd0YVyAZehSFxH3R4+tS1icbCW8auO
 FXN1AcXjbZh6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SFu0denM
Subject: [Buildroot] [PATCH 4/5] package/qt6/qt6positioning: new package
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
 DEVELOPERS                                    |  1 +
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6positioning/Config.in          |  8 +++++
 .../qt6/qt6positioning/qt6positioning.hash    |  7 +++++
 package/qt6/qt6positioning/qt6positioning.mk  | 31 +++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1270365ef0..739fc7c56f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -514,6 +514,7 @@ F:	package/python-pyicu/
 F:	package/python-pylru/
 F:	package/python-requests-oauthlib/
 F:	package/python-slob/
+F:	package/qt6/qt6positioning/
 F:	package/rrdtool/
 F:	package/rsync/
 F:	package/rtmpdump/
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
index 0000000000..4e610c7e94
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,7 @@
+# From https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtpositioning-everywhere-src-6.9.1.tar.xz.sha256
+sha256  7062734b4989248ca3f0e3e4aebb9aa2e7ed2d6bf19e779e520c6ef69706ff26  qtpositioning-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.mk b/package/qt6/qt6positioning/qt6positioning.mk
new file mode 100644
index 0000000000..8ddd047f98
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
+QT6POSITIONING_CMAKE_BACKEND = ninja
+
+QT6POSITIONING_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
+
+QT6POSITIONING_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt
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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
