Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93962C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5025740967;
	Tue, 17 Jun 2025 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKMI0CLVKwNp; Tue, 17 Jun 2025 21:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D7A40950
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D7A40950;
	Tue, 17 Jun 2025 21:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0827416B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D4F83A66
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNt0a3peBXZr for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 21:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1057A83A0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1057A83A0C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1057A83A0C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:02:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D246AA4C082C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 23:02:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59538)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRdRs-0000000028b-0qeX
 for buildroot@buildroot.org; Tue, 17 Jun 2025 21:02:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 23:02:28 +0200
Message-Id: <20250617210228.1146390-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750194148;
 bh=glMkj8qe+ZvilfVpDKhqVbJ7qDs9VGQbLEcf7bPUARQ=;
 h=From:To:Subject:Date:From;
 b=JS6bxwN3HdoDOcUlGyZPbcYzVv06JJyk8Qc0YZ3JiYGHHVZWkc1tC7dZB0tx0ZFX3
 PhtwPogRWO1i4G3jCZZvGdQte0q4W8WINyDOr7PidR5fm2GUnfkHvmzPhMbKsBq/Cf
 HldzcXJogLrlXp/A4aDoKtdsWql6GrFE16z0CmQ/64kPXyivuImRr1mmDKeqHYkema
 JT8BdFMz2jQZPhxIHKD5lkVQFvrjXUIsaLCnze4qnrW7ma2EBmGfXm3Fo43eRneYE6
 6IE1DL1IbskyfUQUbr0Su5RdA18IvgsoA84gRGA2DRleVnp+/qX6ILepQbg2kMk4Mj
 OUyW4YeRTmrLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JS6bxwN3
Subject: [Buildroot] [PATCH 1/1] package/libplatform: bump version
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

Removed patch which is included in this release:
https://github.com/Pulse-Eight/platform/commit/e48db06c64613ac76c820511da95228bcd072f64

Use upstream-provided license file:
https://github.com/Pulse-Eight/platform/commit/92220248b11c43a80105567dbb074c5f30b04029

This bump includes compatibility with cmake 4.x:
https://github.com/Pulse-Eight/platform/commit/d7faed1c696b1a6a67f114a63a0f4c085f0f9195

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...require-c-11-as-the-minimum-standard.patch | 26 -------------------
 package/libplatform/libplatform.hash          |  4 +--
 package/libplatform/libplatform.mk            |  4 +--
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch

diff --git a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch b/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
deleted file mode 100644
index b880a31953..0000000000
--- a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ad9fcceb6267e737316b616551b7aac3cf676481 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Fri, 2 Oct 2020 15:31:36 -0700
-Subject: [PATCH] [cmake] require c++11 as the minimum standard
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Pulse-Eight/platform/pull/46]
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7144b0b..e9112f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,6 +3,10 @@ project(p8-platform)
- cmake_minimum_required(VERSION 2.8.9)
- enable_language(CXX)
- 
-+set(CMAKE_CXX_STANDARD 11)
-+set(CMAKE_CXX_STANDARD_REQUIRED YES)
-+set(CMAKE_CXX_EXTENSIONS NO)
-+
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
- 
- find_package(Threads REQUIRED)
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 283b435b7c..5fead5eb95 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ebee46c76b86b40b703fa913465f5004fa3166eeb6a4794c58fc8a5c25702931  libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2.tar.gz
-sha256  80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
+sha256  2ab98ba486b28dd9c31e9f0f8a04eddad12c09ad1951c359fdef475baafba296  libplatform-2748be52ae27e6007ef548b697d4a03ff7de4291.tar.gz
+sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 90192369fe..aeded5e9a7 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = a7cd0d5780ed80a4e70480d1650749f29e8a1fb2
+LIBPLATFORM_VERSION = 2748be52ae27e6007ef548b697d4a03ff7de4291
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPL-2.0+
-LIBPLATFORM_LICENSE_FILES = src/os.h
+LIBPLATFORM_LICENSE_FILES = LICENSE.md
 LIBPLATFORM_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
