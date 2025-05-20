Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6828C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 05:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926D780F7A;
	Tue, 20 May 2025 05:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pci4FB_6oTIj; Tue, 20 May 2025 05:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECE380F63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECE380F63;
	Tue, 20 May 2025 05:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98445E4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89A4680F63
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjLoZ4W5NNhy for <buildroot@buildroot.org>;
 Tue, 20 May 2025 05:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D10280F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D10280F5F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D10280F5F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:21:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0958A4C119D
 for <buildroot@buildroot.org>; Tue, 20 May 2025 07:21:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43474)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uHFPZ-000000007ZJ-2nNC
 for buildroot@buildroot.org; Tue, 20 May 2025 05:21:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 07:21:10 +0200
Message-Id: <20250520052110.8394-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747718470;
 bh=IBjS4GpZo7PIT9/BigAxjQ8vOoFRCczVuESBG4SB74A=;
 h=From:To:Subject:Date:From;
 b=XCLaO1E9Xme10F7cSB9Ub1ohmxvIxdTE3ek5YesYpJF7DbUwi7LC6zK5sn0VNkFpt
 6YiFcwIi38lYgBiBRz1JXoE+vVwXiyDWYEK6CDo5gGQwNOCmqD+++NHDW8VWTH6hSX
 f7bWviiejSAcdZiBZdF47d7bQ6askd9T4MlPbB8qMbPjgGOgob8517dSDo0lp2sGSp
 am86eMv0p8PUMVPc1HbybYbyyatIFjf76m+KkFCEwpVjy81utuVCsJ+36wexCLz/Dm
 WppxSDNX1BzwFpBWfX1JdUoOh92ta6K949pfp+3nrdGuudnDMxaN6k+NTyIm8DRVwu
 sNmJsgqJOYcxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=XCLaO1E9
Subject: [Buildroot] [PATCH 1/1] package/bcg729: fix cmake 4 compatibility
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

Backport a patch fixing cmake 4 compatibility.

Fixes:
https://autobuild.buildroot.net/results/118/118349d20eae2dccdadab949065f6bc6471c825e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Update-cmake_minimum_required-to-3.5.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/bcg729/0001-Update-cmake_minimum_required-to-3.5.patch

diff --git a/package/bcg729/0001-Update-cmake_minimum_required-to-3.5.patch b/package/bcg729/0001-Update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..fc744acd90
--- /dev/null
+++ b/package/bcg729/0001-Update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,41 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 20 May 2025 07:10:26 +0200
+Subject: [PATCH] Update cmake_minimum_required to 3.5
+
+This supports compilation with cmake-4.0.0.
+
+Fixes:
+CMake Error at CMakeLists.txt:23 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: https://github.com/BelledonneCommunications/bcg729/pull/20
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to version 1.1.1]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6c40d55..7c722de 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -20,7 +20,7 @@
+ #
+ ############################################################################
+ 
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(bcg729 VERSION 1.1.1 LANGUAGES C)
+ 
+ 
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
