Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7BDEEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 11:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 003E680A69;
	Thu,  1 Jan 2026 11:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J---UVWhWIdl; Thu,  1 Jan 2026 11:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E45CA80A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767267383;
	bh=atCM6IeKvmse6CCmUlN85l4yLGg44kJk6x61UCUDlVU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AKZHCgBwDjEeRbP1Tp9RO/583lQ6o9c+cJ9gptCXyIcu9t2GYGTL0VcUUcO89HuUG
	 tiDZyva9ptb4uOvzPz8F+PdPYXpF48X2aFL6A107E8iuxkyhLl2S8xV1c/rZsxik1C
	 BGVuBUhkuOsrqpE9iOnzxtm2fH72UU6iNHZ57mjDFJKRDI60i3TauR+vg1sbCRvWtk
	 fAA4uZ2WAnrjdFJSr8z5cwJBPA2Yhs2lHf9lcln/dO82BVxvReooLsNv7evC1dXWHt
	 CpczVfXlyn/UmwtLAp8YbjT2vBG+pkN/0uulcn5mDu/+UJio3awRxs84SmgbVFs2LG
	 4An8yhKxAGrbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E45CA80A06;
	Thu,  1 Jan 2026 11:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A0319D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12785809C1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1HHXfjK0_3z for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 11:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54D1A809A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D1A809A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D1A809A4
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8EBCA4C3020
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 12:36:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38862)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbGyW-000000004G0-021P
 for buildroot@buildroot.org; Thu, 01 Jan 2026 11:36:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 12:36:15 +0100
Message-ID: <20260101113616.1893585-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767267376;
 bh=MW/n2fGG6N+NF2baBaWp9B0WCtAyYDrpO022YYVdOFI=;
 h=From:To:Subject:Date:From;
 b=VTouSooqUAvyEknrjToLwPV90nT0GTDWeecTEBlVD6TZMI5NKazAw5ouckt3T0azw
 7NUWG2VGFCvg7r7zVG68ICE+GgG3X4Fm/8l9RNd1d1s46Sp00o3HrBQZ4VrA122HBt
 Ajmvb5MfByg4xpljflP5lsJGh4RUYxBRp3yPONuEvZbrmqX4pV//C1awMnHc5cV9xh
 9lhVZm0M0gqOggmQ7rghB3ZvR5GcG0BUB6o+bWT/iyeRzlx76wuJBln4PBEsrwU8sZ
 R4+Q2201qY/5g1MiDXzUYEo75RDD1LINC4fHWflvHEIJ/iOMouvRKayq8XnDtr09lz
 3+kc9eq+dkt5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VTouSooq
Subject: [Buildroot] [PATCH 1/2] package/cegui: Fix cmake 4 build
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

Renamed current patches to prepare for their removal with the upcoming
version bump that will not touch the CMake fix which is not committed
upstream yet.

Fixes:
https://autobuild.buildroot.net/results/a23/a23e3a81e3526d12206ea0f036f6e8db8dc5eaab/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cegui/0001-Fix-cmake-4-build.patch    | 28 +++++++++++++++++++
 ...0002-XMLParser.cpp-include-string.h.patch} |  0
 ...of-xmlGetLastError-for-libxml2-2-12.patch} |  0
 3 files changed, 28 insertions(+)
 create mode 100644 package/cegui/0001-Fix-cmake-4-build.patch
 rename package/cegui/{0001-XMLParser.cpp-include-string.h.patch => 0002-XMLParser.cpp-include-string.h.patch} (100%)
 rename package/cegui/{0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch => 0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch} (100%)

diff --git a/package/cegui/0001-Fix-cmake-4-build.patch b/package/cegui/0001-Fix-cmake-4-build.patch
new file mode 100644
index 0000000000..952b17e494
--- /dev/null
+++ b/package/cegui/0001-Fix-cmake-4-build.patch
@@ -0,0 +1,28 @@
+From 6c0e6d8ffb3c13cd7fb08c8ef217daf45eabdf99 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Dec 2025 20:38:29 +0100
+Subject: [PATCH] Fix cmake 4 build
+
+Upstream: https://github.com/cegui/cegui/pull/1334
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 418931822..645ff6cf7 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ################################################################################
+ # Top-level CMakeLists.txt file for Crazy Eddie's GUI System
+ ################################################################################
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if (APPLE AND NOT CMAKE_OSX_ARCHITECTURES)
+     set( CMAKE_OSX_ARCHITECTURES ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Build architectures for Mac OS X")
+-- 
+2.47.3
+
diff --git a/package/cegui/0001-XMLParser.cpp-include-string.h.patch b/package/cegui/0002-XMLParser.cpp-include-string.h.patch
similarity index 100%
rename from package/cegui/0001-XMLParser.cpp-include-string.h.patch
rename to package/cegui/0002-XMLParser.cpp-include-string.h.patch
diff --git a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
similarity index 100%
rename from package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
rename to package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
