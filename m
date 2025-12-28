Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FBDE8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A491440467;
	Sun, 28 Dec 2025 21:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83lmlJuVZAtx; Sun, 28 Dec 2025 21:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B202440376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956265;
	bh=rOfQLfVdx1Erzqcory7HK62KXHQNticVkh38+gKhuEI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=j+eW4tZc3bnfVtqaWCamSGq6RXdTlGHk5eCGFXL7MU0PH2AXVC5WL86SWcFXA2Ism
	 1csHqZ5DCKpj8gTUalNu+b0jruozUU5VjnSpjBx0PLqkluvvnqcnDfVldg09I+lrLY
	 yoI791qP6wJK5y5+zguBJNejUgCIrdupOmOfzYWHmfPRBrdxRzs9zCrVGKPTQ9wXCl
	 rhxrICOcKmhUt023sWgbK7nwgBvl4zZXlDhVxmpFxOSwYXLs8vKyflBmR56johhezf
	 +JYDWyyJg6uXScCWNabUb0HAXCpcLftKe1sKsLqEnhMBWpHJ+NalY7ANmj/hk5CMdT
	 HXNaVu+0kl78w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B202440376;
	Sun, 28 Dec 2025 21:11:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36706D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1380240376
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qntgnH5m-3gE for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1527640342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1527640342
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1527640342
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A712BC1D70C;
 Sun, 28 Dec 2025 21:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F39660725;
 Sun, 28 Dec 2025 21:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2443F11978CCC; Sun, 28 Dec 2025 22:10:57 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 22:10:39 +0100
Message-ID: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956257; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2WXwhvU4uys8b/iafRGaFy1UHi4tfl6TVYZCs0rNTvA=;
 b=O2DCybXndXFW5qcfkkHD6SDuF6FhTK6w9xFdZJl8P0YL7Ndd01M0WMFvw6RMis0pNyMCaN
 7h4+PlOmfihWHdl1M0hMP/9gzwp34SizxYajHTsawkrt6dGYuup6KGtHkBLSRfBHaCn+6o
 5bkuEMSiLld4AhENVxkA46dx8Uck8FHS39cd/GQ7szR+VhZEqYi4IFzGGjlAlztxIWjS6x
 5k1ubO0ydpRG7+966gzIOFouOOQ8BdX60xYVFNKrknfhZkzdGRY1DkOZYYo4RKeBf90gE+
 QxPFGj6iYFvhFPLk5FwGNVe2D2JMf4pgoNZrRBrsnjklVleWEnp17PSp4YMN+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=O2DCybXn
Subject: [Buildroot] [PATCH 1/5] package/qt5/qt5webkit: add patch to fix
 CMake >= 4 compatibility
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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pdate-CMake-minimum-required-version.patch | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch

diff --git a/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
new file mode 100644
index 0000000000..97115125ee
--- /dev/null
+++ b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
@@ -0,0 +1,92 @@
+From b3e016db4ad62bd3386736ce380e4b1c4601a08c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 14:44:34 +0100
+Subject: [PATCH] CMakeLists.txt: update CMake minimum required version
+
+Building with CMake >= 4.x requires the cmake_minimum_required()
+version to be at least 3.5, so let's update to that to fix:
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
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: dead, repository is obsolete
+---
+ CMakeLists.txt                           | 2 +-
+ Source/JavaScriptCore/CMakeLists.txt     | 2 +-
+ Source/WTF/CMakeLists.txt                | 2 +-
+ Source/WebCore/CMakeLists.txt            | 2 +-
+ Source/WebKit/CMakeLists.txt             | 2 +-
+ tests/webkitwidgets/cmake/CMakeLists.txt | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 31a2ea1fd544..a870b490c7fb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ project(WebKit)
+ 
+ # This should be removed once we require CMake 3.3.
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index afd76ca1a184..07fb5ad450dc 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(JavaScriptCore_INCLUDE_DIRECTORIES
+diff --git a/Source/WTF/CMakeLists.txt b/Source/WTF/CMakeLists.txt
+index 1d41f303acde..efc52e5280e4 100644
+--- a/Source/WTF/CMakeLists.txt
++++ b/Source/WTF/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ add_subdirectory(wtf)
+diff --git a/Source/WebCore/CMakeLists.txt b/Source/WebCore/CMakeLists.txt
+index 3b3a9ed4bd24..c69cf8eae586 100644
+--- a/Source/WebCore/CMakeLists.txt
++++ b/Source/WebCore/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(WebCore_INCLUDE_DIRECTORIES
+diff --git a/Source/WebKit/CMakeLists.txt b/Source/WebKit/CMakeLists.txt
+index c845856da6f6..b900d088ded5 100644
+--- a/Source/WebKit/CMakeLists.txt
++++ b/Source/WebKit/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(WebKit_SOURCES
+diff --git a/tests/webkitwidgets/cmake/CMakeLists.txt b/tests/webkitwidgets/cmake/CMakeLists.txt
+index 8f266fccb48c..2f5dd261971e 100644
+--- a/tests/webkitwidgets/cmake/CMakeLists.txt
++++ b/tests/webkitwidgets/cmake/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(qmake_cmake_files)
+ 
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
