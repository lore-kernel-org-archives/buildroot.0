Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D24D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 347A940543;
	Wed, 17 Dec 2025 22:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxBiXAzVQFc2; Wed, 17 Dec 2025 22:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E76B40475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766010353;
	bh=S9F9aatIujHCHTYy3fogauD5VQ0tEQEPNggID2fHaTA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=H0HkvKZA+TiqsGJnKBWnvuuAu7HjHoRgFVHc41Ld/lMDf+eHsVEDMUud6ShRXRe5c
	 Y1z9n6gUBUNL9WOxv0ojV2cCZAxRbTaX6rxJqH09n/p++jRBP+n/mVFFnCWUlVGgfI
	 kv3qGEdwbl/xFcOwhO2FGZ5w907UxEt5Zaz/02S/pVVSeVF53DH9yEL+H6TSYQCW8d
	 l7xWEEHysEL/MVBIJ9b7hFAeu51+w88/XOurzVzosghAz8O//kGkL/1cbn23ObwTjX
	 7VLJpRqhww1+SR18xC2urPgZmkXREW+FmLsucOhimzxAWvsxmy/uP2yHnJ52XwZSwY
	 PXUuTbBvAdkfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E76B40475;
	Wed, 17 Dec 2025 22:25:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E965037A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAD540617
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lU2gMZPX8F-I for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7DDB40608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7DDB40608
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7DDB40608
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 764CF1A229A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3F1C96072F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9B8B102F0ADF; Wed, 17 Dec 2025 23:25:42 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Dec 2025 23:25:36 +0100
Message-ID: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766010343; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=e428r2Hjmvw3EBXi1fv5DAbeC5s3TtI+psf30dO4tOk=;
 b=vPUxWh1HQlnnBP+f+AsEXZcn1G8l0SKPCHEqHyl4C1ZKHVAMoLNcg98umdfqwdcim8YpGX
 5u2DjgXEIjFLpw30uPu5JbfTn4oBxviUodI4Y383Qb8PYNRC7SxZE2QVpBG/s8tX3eFb9g
 alUXTxWRsQfr4UpdctMJ7OyC2vwyDeUCYlC1u+3F0IsMq3PxTuHZTIbNCHLi6Whd2BsMTk
 TK6u2S4OZggrMLbgAMalbA17BFz2ZtVbOtSZf5m6m3sGfrfQkbsbw9gf+SShlfNgcgrnd6
 lomn7UA1c1LyHdi3psKxlnvg3KMW1TB5jtP/GKjgC1sqrFc83Romi3q45kRVxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vPUxWh1H
Subject: [Buildroot] [PATCH 1/3] package/cppcms: add patch to fix build with
 CMake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  https://autobuild.buildroot.net/results/5f0a3a525866519ee12acb9997d217b4a8b870fe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....txt-make-it-compatible-with-CMake-4.patch | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch

diff --git a/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
new file mode 100644
index 0000000000..6080fb1e1b
--- /dev/null
+++ b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
@@ -0,0 +1,107 @@
+From fb3943378d84a6ced1182502eb839d6fc6e51914 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 15:31:38 +0100
+Subject: [PATCH] CMakeLists.txt: make it compatible with CMake 4
+
+The build with CMake >= 4 currently fails with:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+we simply need to specify that the minimum version is 3.5 to fix the
+build.
+
+Upstream: https://github.com/artyom-beilis/cppcms/pull/106
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt                                          | 2 +-
+ booster/CMakeLists.txt                                  | 2 +-
+ contrib/server_side/sessions/CMakeLists.txt             | 2 +-
+ contrib/server_side/sessions/berkeley_db/CMakeLists.txt | 2 +-
+ contrib/server_side/sessions/cppdb/CMakeLists.txt       | 2 +-
+ contrib/server_side/sessions/sqlite3/CMakeLists.txt     | 2 +-
+ examples/message_board/CMakeLists.txt                   | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a9c601b..826e87f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_LEGACY_CYGWIN_WIN32 0)
+ 
+ 
+diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
+index 6ec1ffa..8f63254 100644
+--- a/booster/CMakeLists.txt
++++ b/booster/CMakeLists.txt
+@@ -6,7 +6,7 @@
+ #  http://www.boost.org/LICENSE_1_0.txt)
+ #
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(booster)
+ include(CheckFunctionExists)
+ include(CheckCXXSourceCompiles)
+diff --git a/contrib/server_side/sessions/CMakeLists.txt b/contrib/server_side/sessions/CMakeLists.txt
+index 0909fa6..e7ae01f 100644
+--- a/contrib/server_side/sessions/CMakeLists.txt
++++ b/contrib/server_side/sessions/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ add_subdirectory(sqlite3)
+ add_subdirectory(cppdb)
+diff --git a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
+index 6bbac69..534bce2 100644
+--- a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
++++ b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+diff --git a/contrib/server_side/sessions/cppdb/CMakeLists.txt b/contrib/server_side/sessions/cppdb/CMakeLists.txt
+index 9781be9..792ec39 100644
+--- a/contrib/server_side/sessions/cppdb/CMakeLists.txt
++++ b/contrib/server_side/sessions/cppdb/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+diff --git a/contrib/server_side/sessions/sqlite3/CMakeLists.txt b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
+index 4c236e3..82808f4 100644
+--- a/contrib/server_side/sessions/sqlite3/CMakeLists.txt
++++ b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+ endif()
+diff --git a/examples/message_board/CMakeLists.txt b/examples/message_board/CMakeLists.txt
+index 0e5c555..96a56c2 100644
+--- a/examples/message_board/CMakeLists.txt
++++ b/examples/message_board/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(cppcms)
+ 
+ include_directories(${CMAKE_SOURCE_DIR})
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
