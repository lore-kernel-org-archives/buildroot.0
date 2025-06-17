Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B9AC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 21:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB38461049;
	Tue, 17 Jun 2025 21:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwZt9-FWaHG3; Tue, 17 Jun 2025 21:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBD761040
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEBD761040;
	Tue, 17 Jun 2025 21:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2B2151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5026069E
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnVAE-wOyxnT for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 21:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6E1361040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E1361040
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E1361040
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C05A5A4C082C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 23:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50008)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRdS8-000000002BX-0ukj
 for buildroot@buildroot.org; Tue, 17 Jun 2025 21:02:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 23:02:44 +0200
Message-Id: <20250617210244.1146420-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750194164;
 bh=BdLK0DsstJTG3K/g1uZRXSI8TnzJU7uj3PtkaT4x7es=;
 h=From:To:Subject:Date:From;
 b=scSkdAceD8w5ovJMhVB0XvkERc00tSWjYa2oyJy0UbWa2PA78rG8/aNPDtjioFQxC
 KN5ujW4/p6JrcWDUiDD+4f6832XdmNJ8jkrDmpBimAduhL1h464shdzIMwILszyf1q
 DKdzYGGkaepvWYyDPMvI7CwocVxGzl29ZZLGtWhT5eP5sf/mfx58sYI9Qv0nrH90S0
 NsplDnDq+DggQXF/n5Mk+NcHhaOAzp44dy9oLpaZLWS7/PTPZT1Umv6edS0oRjbKRE
 Am0+1AuS6oo94qK5vSdrACu4F7UNQ3icpUx0hTvC3GqrOTRf0Q5j5gkPdL7o6XY1TC
 CpvMJ5MOFUJ7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=scSkdAce
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: bump version
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

Add fix to build with cmake 4.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mjpg-streamer/0002-cmake4.patch  | 34 ++++++++++++++++++++++++
 package/mjpg-streamer/mjpg-streamer.hash |  2 +-
 package/mjpg-streamer/mjpg-streamer.mk   |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/mjpg-streamer/0002-cmake4.patch

diff --git a/package/mjpg-streamer/0002-cmake4.patch b/package/mjpg-streamer/0002-cmake4.patch
new file mode 100644
index 0000000000..ed7211ab81
--- /dev/null
+++ b/package/mjpg-streamer/0002-cmake4.patch
@@ -0,0 +1,34 @@
+From 0dd9cf8b23fa183a403794e15617237662104d1d Mon Sep 17 00:00:00 2001
+From: Stephen L Arnold <nerdboy@gentoo.org>
+Date: Mon, 29 Nov 2021 18:13:34 -0800
+Subject: [PATCH] fix: update cmake build, fix install, add simple test and
+ versioning
+
+Signed-off-by: Stephen L Arnold <nerdboy@gentoo.org>
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/333
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd:
+ ported cmake version bump from upstream PR to fix build with cmake 4.x]
+---
+ mjpg-streamer-experimental/CMakeLists.txt     | 102 +++++++++++++-----
+ mjpg-streamer-experimental/Makefile           |  15 +--
+ .../cmake/FindGphoto2.cmake                   |  20 ++--
+ .../cmake/mjpg_streamer_utils.cmake           |  22 ++--
+ mjpg-streamer-experimental/mjpg_streamer.c    |   4 -
+ mjpg-streamer-experimental/mjpg_streamer.h    |   9 +-
+ .../plugins/input_ptp2/CMakeLists.txt         |   6 +-
+ .../plugins/output_http/CMakeLists.txt        |   2 +-
+ 8 files changed, 117 insertions(+), 63 deletions(-)
+
+diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
+index cf26620e..e6e67bc7 100644
+--- a/mjpg-streamer-experimental/CMakeLists.txt
++++ b/mjpg-streamer-experimental/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.3)
++cmake_minimum_required(VERSION 3.10.0)
+ set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
+ 
+ project("mjpg-streamer" C)
diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 164c9b2181..9b06bfebc2 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
+sha256  eb4de7fed9f8b15ee6d8ca2b0417aff2854cd018582b7090e28eb0aaa19bc808  mjpg-streamer-310b29f4a94c46652b20c4b7b6e5cf24e532af39.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 46f3f50104..364dfac27d 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = 5a6e0a2db163e6ae9461552b59079870d0959340
+MJPG_STREAMER_VERSION = 310b29f4a94c46652b20c4b7b6e5cf24e532af39
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
