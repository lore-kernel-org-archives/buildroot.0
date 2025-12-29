Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18F6D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 12:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86303407AD;
	Mon, 29 Dec 2025 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMtVz7X3QFuU; Mon, 29 Dec 2025 12:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6FF407A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767011893;
	bh=LfQ+zB3HDTlk4Kf/VOipZFZmvwvMkpWCR+ijYXjRR/M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dG9JP9B+GuavG9++ZxvEyAl1sUDeEWMdXtrIWftdG/OzDjMgckr4uqgIPu+T8M8d+
	 R5gXPH0iH+uCS0XoZsCecs3bJVmJnc/GIBalGyyTqwZv8CKk2UzLKL1oeP6nUi7IHw
	 RltuaEMLZ1rY5n6IO/u4iqaiOTvvVm/qvj7EJls7qPqs9xR4/p7iim0ap5fYtKU9OF
	 TWmfYXbX3RaIh3FUZDm6YHbdXJojdD9bde+ViQYg/SVv7qfUJKEBMN3mJoeX+raFzy
	 13gK0fZD3awTj51P2xZ9uIJBUT4S/mtT16hZguWQzKJl8MLmZXSMxyo0qLUCkUZr+u
	 pOd25cpN2ATrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6FF407A5;
	Mon, 29 Dec 2025 12:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0652B177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC908407A5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ftHiZhoFaI7 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 12:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BC1A4079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC1A4079D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BC1A4079D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:38:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53653A4C0DEE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:38:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38128)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaCVi-000000001If-36sL
 for buildroot@buildroot.org; Mon, 29 Dec 2025 12:38:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 13:38:06 +0100
Message-ID: <20251229123806.2862367-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767011887;
 bh=gQQ8Hnt/LNRbfstVRbB/eaCcg7aIVyH4wULjW6lo4Yg=;
 h=From:To:Subject:Date:From;
 b=df1uBsVSSiIEAbzcv48W6SQnINckgfhuTNwz52PkxhcRa4hBRNOqy2FKwO31nK2/+
 Slpb5VElSLnGozG9BBDMm/oKGIv0YRHc+QsDRy2Y0U3u+LGw+yWb634qAFIRNrlJfo
 1ObqbC2xSdDpgEOIwbHuruqo0K5y1+AT2U+akvRoxlIvc6LlI38rJAMij/+n04mywN
 /GFIxWdFCRHf7t0f9NDOhfM+BdioK6IofZ7goDH3ZJU+tHuAonEACJutj6xofbxd+5
 TPnRQ2Vj/Uy43KTOuQ2NQ5LYJclmhn7Lvkd8eR6LUEBPkgqvSQ1XVm9ay+8Az5hJNJ
 g5dCr9We+EC6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=df1uBsVS
Subject: [Buildroot] [PATCH 1/1] package/libid3tag: fix build without c++
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

Buildroot commit 82094b802877c1128b21b978466641373f283666 bumped the
package to 0.16.3 switching the build system to CMake causing build
errors when the toolchain lacks c++.

Fixes:
https://autobuild.buildroot.net/results/02d/02db8c1a1b461fa3b5b5932e5b48c77be50b68af/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libid3tag/0002-CMake-Disable-c.patch | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libid3tag/0002-CMake-Disable-c.patch

diff --git a/package/libid3tag/0002-CMake-Disable-c.patch b/package/libid3tag/0002-CMake-Disable-c.patch
new file mode 100644
index 0000000000..151084b3b2
--- /dev/null
+++ b/package/libid3tag/0002-CMake-Disable-c.patch
@@ -0,0 +1,33 @@
+From b3b045a762ee35fab0e13d1837b9b407da47e59e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 29 Dec 2025 13:31:43 +0100
+Subject: [PATCH] CMake: Disable c++
+
+https://cmake.org/cmake/help/latest/command/project.html
+"By default C and CXX are enabled if no language options are given."
+
+libid3tag only contains C code. This fix allows the build with
+toolchains containing no c++ compiler like some buildroot toolchains:
+https://autobuild.buildroot.net/results/02d/02db8c1a1b461fa3b5b5932e5b48c77be50b68af/build-end.log
+
+Upstream: https://codeberg.org/tenacityteam/libid3tag/pulls/26
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f71b245..0c2f13e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.10)
+-project(id3tag VERSION 0.16.3)
++project(id3tag VERSION 0.16.3 LANGUAGES C)
+ 
+ option(BUILD_SHARED_LIBS "Build dynamic library" ON)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
