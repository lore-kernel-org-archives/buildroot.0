Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B65C02191
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3556110F;
	Sat, 14 Sep 2024 11:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Px3DacmHePP9; Sat, 14 Sep 2024 11:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9091F607CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9091F607CD;
	Sat, 14 Sep 2024 11:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7071BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A404140130
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsErQQ_6VuXr for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84CB2402E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84CB2402E8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 727D48284F; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:20:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 138d83721b101e621fc6143ebb94954ac833a9e4
X-Git-Newrev: 7b9e0ec57c660554ef6c46c0cfdfdd5a6db24e27
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.727D48284F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: allow building
 linguist tools without printsupport
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b9e0ec57c660554ef6c46c0cfdfdd5a6db24e27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a regression in qttools that would not build the qt linuguist
tools (lupdate, lrelease, etc.) when CUPS is not available.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...update-lconvert-lrelease-in-no-gui-builds.patch | 56 ++++++++++++++++++++++
 package/qt6/qt6tools/Config.in.host                |  1 -
 2 files changed, 56 insertions(+), 1 deletion(-)

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
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 110ecbee9b..7a6f8a5176 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -18,7 +18,6 @@ if BR2_PACKAGE_HOST_QT6TOOLS
 
 config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	bool "host linguist tools"
-	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
 	help
 	  Translate Qt C++ and Qt Quick applications into local
 	  languages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
