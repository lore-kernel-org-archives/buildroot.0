Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B4C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFED66162D;
	Fri,  4 Jul 2025 16:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwBxlg80mENg; Fri,  4 Jul 2025 16:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B0E61624
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B0E61624;
	Fri,  4 Jul 2025 16:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D29CE12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C2783F89
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUgRmuFCPLal for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6C2983E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6C2983E00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6C2983E00
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:52:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 370CAA4C22FA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:51:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47690)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjdj-000000005Rt-3gbA
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:51:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:51:53 +0200
Message-Id: <20250704165155.3639008-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751647916;
 bh=MLnjJxpS2sQhrl5Iz8Yrbhtl1mVWTtbFewGQGLh2u1s=;
 h=From:To:Subject:Date:From;
 b=TRPdjd+QiTMx1Fz6WiUo4kHxZuWZDmEYtM12l+hAEIoENwCJqeKZCcE42wtpMAoIA
 MEEbrBHnFOnj7+2RuLYShyuVpTg/E95ZfdVNrx6bCI+NYy5CNb6jue1o19BnV2M9XW
 G20ihUULZj/RAi3obH6H3NnvaaZj4VQrxo9W2d4hPH/05CoWvjgZmRf9L0J+lh/x8W
 HdZzbOPabNb5sJYhNZ606FhoKybA1eap2ItFRHxa3AxxHJsd4I/YmUed3Ue7LeA/7C
 47sO4JtFwuDe7Pun+QVuLICTP9Gk/KXctvIkp2tRCYimm4lmnQce4A8C5jkixr766O
 7NU13C5zlsZQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=TRPdjd+Q
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to 22.8.0
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

Removed patch 0002 which was applied upstream:
https://github.com/intel/gmmlib/commit/af5f033fbe71da454953e04db9804443e2cec746

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...imum_required-to-3.5-consisently-acr.patch | 43 -------------------
 package/intel-gmmlib/intel-gmmlib.hash        |  2 +-
 package/intel-gmmlib/intel-gmmlib.mk          |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch

diff --git a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
deleted file mode 100644
index 400cdf667f..0000000000
--- a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c9db6e993d4e440a276f2918f48de0868fe98093 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 28 Mar 2025 04:45:44 +0000
-Subject: [PATCH] Update cmake_minimum_required to 3.5 consisently across
- CMakeLists
-
-Source/GmmLib/CMakeLists.txt already is requiring CMake 3.5. Update
-remaining files to 3.5. This supports the compilation with cmake-4.0.0
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/intel/gmmlib/pull/130
----
- CMakeLists.txt                      | 2 +-
- Source/GmmLib/os_release_info.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1a3ad36..ca42104 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- 
- if (NOT DEFINED RUN_TEST_SUITE)
- option (RUN_TEST_SUITE "run test suite after install" ON)
-diff --git a/Source/GmmLib/os_release_info.cmake b/Source/GmmLib/os_release_info.cmake
-index 70c8318..0951a4a 100755
---- a/Source/GmmLib/os_release_info.cmake
-+++ b/Source/GmmLib/os_release_info.cmake
-@@ -28,7 +28,7 @@ if(NOT DEFINED _os_release_info)
- set(_os_release_info TRUE)
- 
- # Set cmake policies for at least this level:
--cmake_minimum_required(VERSION 2.8.12)
-+cmake_minimum_required(VERSION 3.5)
- 
- if(POLICY CMP0054)
-     cmake_policy(SET CMP0054 NEW)
--- 
-2.34.1
-
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 771b20e074..fc7b62bd9e 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  36f2ff2b59158d1253a33d735f4e35a1b5740c4751818bdaa222b8ddf96ee881  intel-gmmlib-22.7.2.tar.gz
+sha256  0e509edf0b7892fad210e406014b3f6a53816a2ddb80650e9e1294f55aa493aa  intel-gmmlib-22.8.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 8b269d3e7b..bc29e434d9 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.7.2
+INTEL_GMMLIB_VERSION = 22.8.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
