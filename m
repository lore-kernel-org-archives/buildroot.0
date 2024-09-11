Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA181EE49A5
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8046281331;
	Wed, 11 Sep 2024 13:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4vqVlmN6OPr; Wed, 11 Sep 2024 13:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703DB81334
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703DB81334;
	Wed, 11 Sep 2024 13:20:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF15A1BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E2B34029F
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZSlGw5Wehww for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE08B400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE08B400FC
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE08B400FC
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 7D281164ED;
 Wed, 11 Sep 2024 15:20:33 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id YK5TsfO0g-uc; Wed, 11 Sep 2024 15:20:33 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 6DAAE164E6;
 Wed, 11 Sep 2024 15:20:29 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:20:19 +0200
Message-ID: <20240911132021.2318073-1-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1726060833; bh=nv
 oal2KCJ3qpiqRU1l+jV0jepAMsCwJXin78L6m87UI=; b=PzT0GsgcHdr2IClsMr
 dlG6bXdTwsbi/aLytntgQIEvJd86eBzcaBxbxiXbcFkzqyhrt/3rUZrUEjehfGRA
 AmfZ0d++mbqc2vwm36HZYKPxOrc2VfEHtHo+jgzWIdZdx9hWwARr7oiES7IUayYO
 gAORZAachtDZqoBHXmD/mUfxU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=PzT0Gsgc
Subject: [Buildroot] [PATCH 1/2] package/qt6/qt6tools: build linuguist tools
 without printsupport
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
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

This fixes a regression in qttools that would not build the qt linuguist
tools (lupdate, lrelease, etc.) when CUPS is not available.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 ...e-lconvert-lrelease-in-no-gui-builds.patch | 56 +++++++++++++++++++
 package/qt6/qt6tools/qt6tools.mk              |  5 ++
 2 files changed, 61 insertions(+)
 create mode 100644 package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch

diff --git a/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch b/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch
new file mode 100644
index 0000000000..fdce97cf48
--- /dev/null
+++ b/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch
@@ -0,0 +1,56 @@
+From 4be1823e4d459c89717e791ef27fd463ad04cb2b Mon Sep 17 00:00:00 2001
+From: Joerg Bornemann <joerg.bornemann@qt.io>
+Date: Tue, 11 Jun 2024 10:47:18 +0200
+Subject: [PATCH] CMake: Re-enable lupdate/lconvert/lrelease in no-gui builds
+
+This reverts 8dba0e48a0f7d3487b318a74f80f2d8e59c320f9 which disabled the
+'linguist' feature if the 'printsupport' feature wasn't available.
+However, the 'linguist' feature controls not only the Qt Linguist
+application but also the command line tools lupdate, lconvert, and
+lrelease. In no-gui builds, which also disable printsupport, the command
+line tools were unexpectedly missing.
+
+Fix the issue by extending the feature condition in
+src/linguist/CMakeLists.txt. As drive-by, fix the FEATURE_png condition
+that was still in QMake form from the initial conversion.
+
+Fixes: QTBUG-126189
+Task-number: QTBUG-125066
+Pick-to: 6.7 6.8
+Change-Id: I59ebb82fd5823165b307ffbc967d7fd89a071ede
+Reviewed-by:  Alexey Edelev <alexey.edelev@qt.io>
+Reviewed-by: Alexandru Croitor <alexandru.croitor@qt.io>
+
+Upstream: https://github.com/qt/qttools/commit/4be1823e4d459c89717e791ef27fd463ad04cb2b
+Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
+---
+ configure.cmake             | 1 -
+ src/linguist/CMakeLists.txt | 3 ++-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.cmake b/configure.cmake
+index 51a5196da6..e0facf0b90 100644
+--- a/configure.cmake
++++ b/configure.cmake
+@@ -74,7 +74,6 @@ qt_feature("kmap2qmap" PRIVATE
+ qt_feature("linguist" PRIVATE
+     LABEL "Qt Linguist"
+     PURPOSE "Qt Linguist can be used by translator to translate text in Qt applications."
+-    CONDITION TARGET Qt::PrintSupport
+ )
+ qt_feature("pixeltool" PRIVATE
+     LABEL "pixeltool"
+diff --git a/src/linguist/CMakeLists.txt b/src/linguist/CMakeLists.txt
+index ef28c0ff3a..ee11963039 100644
+--- a/src/linguist/CMakeLists.txt
++++ b/src/linguist/CMakeLists.txt
+@@ -14,7 +14,8 @@ add_subdirectory(lrelease)
+ add_subdirectory(lrelease-pro)
+ add_subdirectory(lupdate)
+ add_subdirectory(lupdate-pro)
+-if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton AND TARGET Qt::Widgets AND NOT no-png)
++if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton
++    AND QT_FEATURE_png AND QT_FEATURE_printsupport AND TARGET Qt::Widgets)
+     add_subdirectory(linguist)
+ endif()
+ 
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 09c986cfc6..ccb246f6a6 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -33,6 +33,11 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+HOST_QT6TOOLS_CONF_OPTS = \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_linguist=ON
+
 QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
