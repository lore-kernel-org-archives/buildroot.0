Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AC9CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC52560EA2;
	Sat, 30 May 2026 15:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jbuZ732v_J5; Sat, 30 May 2026 15:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBB460ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156698;
	bh=vxSO6RyocnkCt2W+qkkThDpHBoo5oaGtgVlRIV0srhY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEfxvOKXQXe/nOyqPAJl6ZIzaRoEwoPhWUqWMe9Zg9EkpYsegn90PG5ixfS2rjXUM
	 YCTAXYFlAD6zngLgf6NQFF2ucL1lTEnSzJcTfQClZ+Wu882iCO5evMIn+EdZXChpgp
	 P6qdyLbvZXwD1Pjg4WkFj4EpgpiB8Hme9gOOg+5C3LxLxnpRBJM3R6moIPGzu5Tk/Q
	 +eO6SYSfNhcsPt2kf/xMaVhXIsgYsAqmS4ik9eG1mSxKDwWKB3dnKTAd/6qUUzjftM
	 395TYWF6RJUk9wHO5ApYs2jG0EoKzjus4KmG8zKQgKHTzRvz+Dkb/sRqW7HE9XFi2L
	 6LEoFpi5VKpJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBB460ECF;
	Sat, 30 May 2026 15:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E86B612F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E599C42F13
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shv9TecIAYyJ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85A1442F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A1442F06
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85A1442F06
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFEEDA4C3498;
 Sat, 30 May 2026 17:58:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTM3r-000000001Js-0dHC;
 Sat, 30 May 2026 15:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 17:57:17 +0200
Message-ID: <20260530155718.657095-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530155718.657095-1-bernd@kuhls.net>
References: <20260530155718.657095-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780156681;
 bh=CT73+6Y/G/AfnF6bZnJKYfSkZbTlhLhQkCblhrj4U68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NnOUvCfYQD8xWNtLlTA/i/Ew8JTm6wCJO9rTBVfO4xjX5Oxs5ctof6jtl0SdV9B+J
 GkjGRSWHyuTwf1gPNEnEYAEDPxpZx+MxlXGR8C0NctTBoNlWutJosPdeIuT75z/T/P
 Nu5/nJQbgxkBt4oUOidIVfMZVV1IFdCGK20DtvzAc1xBQoQ+Dml+LuQHvkDP4Mvns6
 IWQQxp46qs1V8GojfCLEGFVPGiFrgulxN5oeujLYA5RseonJfSq6Nkqy7XQ48VR3WM
 wWX5yft5yDq70Yzo7J/2nhDlcjt/IAn4v++7r52yj5OI9e8dPk9efP1Ko5z37at4w6
 qsahtlD9TjMjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NnOUvCfY
Subject: [Buildroot] [PATCH v2 4/5] package/qt6/qt6positioning: new package
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
A qt6-based Gitlab pipeline partially passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563735290

The broken defconfigs are build errors in qt6base and unrelated to
Stellarium.

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
index 877aa56d96..c148da9946 100644
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
