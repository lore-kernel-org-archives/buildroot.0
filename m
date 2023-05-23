Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEBC77B75
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B55822C8;
	Tue, 23 May 2023 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3B55822C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SR0y-4Qn64-t; Tue, 23 May 2023 15:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F9D8230B;
	Tue, 23 May 2023 15:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F9D8230B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 924901BF373
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B19660BF1
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 15:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B19660BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ey28aCAGcNgS for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 15:18:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8988F60BD5
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8988F60BD5
 for <buildroot@buildroot.org>; Tue, 23 May 2023 15:18:17 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout11.t-online.de (Postfix) with SMTP id 6D9CF2653F;
 Tue, 23 May 2023 17:18:14 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1Tm9-0Kf8rJ0; Tue, 23 May 2023 17:18:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47134)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1Tm8-0006Og-37;
 Tue, 23 May 2023 17:18:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 17:18:12 +0200
Message-Id: <20230523151812.417820-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684855093-4E7F1F7B-132C34D1/0/0 CLEAN NORMAL
X-TOI-MSGID: ed1d1d2a-47b7-4562-a159-e6eb5016eaa4
Subject: [Buildroot] [PATCH 1/1] package/znc: fix build with swig 4.1.x
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
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 260924e239627cbe1379cfc752939245d53a06e0
"package/swig: bump to version 4.1.1"
broke the build of znc.

Fixes:
http://autobuild.buildroot.net/results/14c/14c44e94b6b588aa033f24202aa8437882cf8792/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...rt-SWIG-4.1.0-drop-support-for-4.0.1.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch

diff --git a/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch b/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
new file mode 100644
index 0000000000..cb0988e631
--- /dev/null
+++ b/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
@@ -0,0 +1,53 @@
+From fecdd9895894b3afe903021b0843a422eb4d3308 Mon Sep 17 00:00:00 2001
+From: Alexey Sokolov <alexey+znc@asokolov.org>
+Date: Sat, 5 Nov 2022 12:54:40 +0000
+Subject: [PATCH] Add support SWIG 4.1.0, drop support for < 4.0.1
+
+https://bugs.gentoo.org/878587
+
+Upstream: https://github.com/znc/znc/commit/fecdd9895894b3afe903021b0843a422eb4d3308
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                   | 2 +-
+ modules/modperl/CMakeLists.txt   | 1 -
+ modules/modpython/CMakeLists.txt | 1 -
+ 3 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9d43578e0e..efab0ee1ee 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -173,7 +173,7 @@ if(WANT_PYTHON AND NOT EXISTS
+ 	endif()
+ endif()
+ if(search_swig)
+-	find_package(SWIG 3.0.0)
++	find_package(SWIG 4.0.1)
+ 	if(NOT SWIG_FOUND)
+ 		message(FATAL_ERROR
+ 			"Can't find SWIG, therefore Perl and Python aren't supported. "
+diff --git a/modules/modperl/CMakeLists.txt b/modules/modperl/CMakeLists.txt
+index e18fe47644..a87f74e478 100644
+--- a/modules/modperl/CMakeLists.txt
++++ b/modules/modperl/CMakeLists.txt
+@@ -53,7 +53,6 @@ if(SWIG_FOUND)
+ 		"-I${PROJECT_SOURCE_DIR}/include"
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/include"
+-		-DZNC_EXPORT_LIB_EXPORT
+ 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
+ 		-o "${CMAKE_CURRENT_BINARY_DIR}/modperl_biglib.cpp"
+ 		"${CMAKE_CURRENT_SOURCE_DIR}/modperl.i"
+diff --git a/modules/modpython/CMakeLists.txt b/modules/modpython/CMakeLists.txt
+index edbeb41ed5..36a2e649f0 100644
+--- a/modules/modpython/CMakeLists.txt
++++ b/modules/modpython/CMakeLists.txt
+@@ -50,7 +50,6 @@ if(SWIG_FOUND)
+ 		"-I${PROJECT_BINARY_DIR}/include"
+ 		"-I${PROJECT_SOURCE_DIR}/include"
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
+-		-DZNC_EXPORT_LIB_EXPORT
+ 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
+ 		-o "${CMAKE_CURRENT_BINARY_DIR}/modpython_biglib.cpp"
+ 		"${CMAKE_CURRENT_SOURCE_DIR}/modpython.i"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
