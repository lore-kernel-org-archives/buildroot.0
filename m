Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D51C54F30
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 23:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D57E980973;
	Fri, 23 May 2025 23:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPt-sV_a_OW6; Fri, 23 May 2025 23:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4AEB807C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4AEB807C1;
	Fri, 23 May 2025 23:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6174D68
 for <buildroot@buildroot.org>; Fri, 23 May 2025 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9A9410D7
 for <buildroot@buildroot.org>; Fri, 23 May 2025 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKmRunyPGmjq for <buildroot@buildroot.org>;
 Fri, 23 May 2025 23:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34F69410C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F69410C2
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F69410C2
 for <buildroot@buildroot.org>; Fri, 23 May 2025 23:00:27 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 3E048E0012F;
 Sat, 24 May 2025 01:00:24 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 24 May 2025 01:00:11 +0200
Message-ID: <20250523230019.27747-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748041224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TZ0XgqjmvDlEyt1rgXgPMl0giZbKgsrMF/T8q1rlbp4=;
 b=zXNFFOHmss+KumXdfOvhy40s9gWlUa2rCTCM6m3jPH0c31IClY3XA0WhKzBeV9HDxTGuuM
 DWIgmzcjSNHk0Krm/9ACyEmspiDDBCSiK5kS0LVBXVQA76coYarvOsHJQb9WBBjX32+/uL
 OQ0srlYdbe2G4XltBcOjMgn3RJ2rZwU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=zXNFFOHm
Subject: [Buildroot] [PATCH 1/1] package/lzo: fix CMake 4.0 compatibility
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

Add a patch to fix lzo builds with CMake 4.0.

Fixes:
 https://autobuild.buildroot.org/results/8d9/8d9cc53d68d93432e6a7bddad0ed3fdaed913da6 (target)
 https://autobuild.buildroot.org/results/aba/aba68e0889b66300f87706e15ff34899d3e1e97f (host)
 (and many more)

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...-bump-compatibility-level-up-to-3.10.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch

diff --git a/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch b/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch
new file mode 100644
index 0000000000..2c5c9d95b7
--- /dev/null
+++ b/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch
@@ -0,0 +1,48 @@
+From 8158764baaa6cea81f514af157019c0dc81b6e46 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Thu, 22 May 2025 23:46:42 +0200
+Subject: [PATCH] cmake: bump compatibility level up to 3.10
+
+As of CMake 4.0, backwards compatibility to versions older than 3.5 has
+been removed and is deprecated for versions older than 3.10. Bump
+compatibility to version 3.10 using the process described in [1].
+
+Of the changed policies, only CMP0065 seems to affect the LZO build as
+is, namely the example binaries, but this seems like a reasonable change
+rather than an actual compatibility issue.
+
+[1] https://cmake.org/cmake/help/v4.0/manual/cmake-policies.7.html#updating-projects
+
+Upstream: Submitted to upstream via direct email as there is no public
+          mailing list or forge presence.
+
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 98c0a1a..108537c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -8,7 +8,7 @@
+ # All Rights Reserved.
+ #
+ 
+-cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.0...3.10 FATAL_ERROR)
+ 
+ #
+ # simple usage example (Unix):
+@@ -57,7 +57,7 @@ if(NOT ENABLE_STATIC AND NOT ENABLE_SHARED)
+     set(ENABLE_STATIC ON)
+ endif()
+ if(ENABLE_SHARED AND WIN32)
+-    cmake_minimum_required(VERSION 3.4.3 FATAL_ERROR) # needed for WINDOWS_EXPORT_ALL_SYMBOLS
++    cmake_minimum_required(VERSION 3.4.3...3.10 FATAL_ERROR) # needed for WINDOWS_EXPORT_ALL_SYMBOLS
+ endif()
+ 
+ # install directories
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
