Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D8C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 22:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F61406CE;
	Sat, 12 Sep 2026 22:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9rf45EiCAIX; Sat, 12 Sep 2026 22:58:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B4E2405DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789253934;
	b=qbkfJELSmgPKV/AVhSkkfCp2EH3nb2SyDVjqHdPfDomiGs/BSWs+YeczwGHzdPUiufDW
	 b60TlwMAMobZMZ7nHzyQyknCUtzHDXWqmTWWsEj0fMk7QVntPDcgKPuBGPS1pehbG98ba
	 a8SuIO4SIIWNEB5sEU28YW/eEaWGKbTHbwV8nos1i8eQQ5C+KyaxXCoVbb5jQ0i85fWcz
	 GlVG/iyXUl3pqcMX83IPFUzKnBQHWnFk3wNt0qa4ZV7BVErmHTlBT255daO4iCpta/eS2
	 /s5cj61fnZFtHu+4iiSJUv0D5Nok+yU0z5Br3du/cN5YHzxSX3Z/Hb2403NbQ/X0Ogw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789253934;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=c/7+pamndgqZexAMRmifTBMAdAi0Iamvisk5sUfhGxC4anPVI9DfxuvSsuwdgxa8ZjvW
	 z+TOOS85FUyoQElUCpQe4hrtBuwH5kiud+DdhfFEgXTseudjn1g2zfd/UhOoWv1eUKrOm
	 70r9PqAAAeTKEDy4/t+Ni87V/XZ3yjX0RxNM83If9nKvZthkuqlCrGxfh8Gp7Cci5wmkg
	 tq35XElDV7vjOMOWhqD3anWot3W37e073/nTd7RxcuCEE7S1eoZhk4qKRk5C168Q+Il+q
	 9Sx7lCmwCxr8GUKDIvCHv1weZYZWMKHjAD0/IXi0fCTgNpIftiI9wPS6157pZpM+2KA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789253934;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GtlSAtaAQvTWpr2NV8G7u+gQ1zKfzjew01jMiDijB79O76Ay5eHzoRoZi8rW3iwOQ
	 i4Ls9IYN/e7UApY7HlJzXJH5+CwigWuXLftSUU3nng8hpQvOcgQQfLE+REQaPDb1J+
	 YX5SxnbH57h1m7FRy81RDZ6NheWY6USJRnsrCuc3CYycSDS4GkNxbDp+QtC1gaiAK8
	 BjqNb5wTkzO39ENNPdOXQBuYMKTpelPquSJVS6RdPZ+5QkaQ/vYNA0J5bSKkS0g5tV
	 foFZzSMMQvwPPyeKY72qZiw9F8mSVxYRKCSgRt/3UDCQ4jsEJZ45ksv9/u9bmyoPSG
	 3viGG8uExhC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B4E2405DA;
	Sat, 12 Sep 2026 22:58:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB25701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 22:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFE454008D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 22:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuXE5ErMxV7G for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 22:58:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 508CE40067
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789253931;
 b=AYQfxGmkOWqPEEOBeStcmzI/F4ssXcR1/PkLE4Sdtj9vrLkRSc1NMsmCqg3B1HqnBmKV
 bPIRW1GKN6OmwfIQba9uOh51nwjzdk+nDhuFQWItohWdKgip16RwuPu1xrDsSUc3GKAT5
 CAcRKC33p/V3kmC0XM8VwxcFitVZWn8TSza5GpXfCD3QHhHUGOMvLxlIgZdOK9Hr194Xh
 4YmEODZy7MPePAYi2pGNa0vX8EqtOX1hLebl5o7z0epRtNSmPXn7UOpKNFgut9/OtQ2aL
 iiMskFQa1g+j5zCf+0BG2AJEjewMhi5u/3nEwWWdMi0B6utp66T0yMz0MnyhEgkwWzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789253931;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=oafLjlzOSGdwqsnCSckDMoWYcjs1NhzX1T8hqjCswK2vzb9XYNBrB7zeIo0u7RvPBBSy
 bJRvPHZTgXZiX20yg2iiKWOZe2J3ebmOyq0RVNwb245RVp7bh/Bci/Sw3bR8nlmTZZbAZ
 rhEak3WoHgvCgU3pY280lYExZq+957JnwM2SUOOip9sd+gRHLINdgU0CXESSF1MX2mOhp
 rmPf4S/sM7LHeFhUbI6gqb1/t+pfqExVkIpAo2W5Ln1431qv1z7bbK8ljS+u/5IuDctHp
 xlUr30q3nRTl4s6ZQFLZp+Ut5QO31bgWk4M0ESR3zXTd5Hwc58QBIHyGPxFx7xpTWWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mMFqk0VH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mMFqk0VH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 508CE40067
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789253925;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Subject:Date:From;
 b=mMFqk0VH+aaJA5QH6SuTkjtMpRp2Fr8qC7EEgHQWGmz/zhIkxHHrG/RXkji6p7Uga
 4SPhOVmE5oHmGOv41DAibaWnPds6PD8q9Ol9qDsCdBsDGk1cAreZJKrlr4u7fuMy95
 EY/vXaTT39ryYohV6+eNymcNbatGDut/35RejagWD8m99NRZ1Hw3ZSzHaoJQPCCuBb
 PfnFpeYfdbTmKOzK8XOczzOOGBYOtPHjrSjSYPT6vJxNQJ5T/YmdM6eg/wbNMTesSQ
 xoMdIjIcmO66QQMGva7hMpx875XLgxvEdj1M86rc858c6jUNegi2dSven+Vy0B40t/
 n3Un7+K54pN6w==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F564A4C33FC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 00:58:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34170)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5WgG-000000003up-3B1k
 for buildroot@buildroot.org; Sat, 12 Sep 2026 22:58:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 00:58:42 +0200
Message-ID: <20260912225844.1946840-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/2] package/luvi: fix build without c++
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

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..c68e05bdc7
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,47 @@
+From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/miniz/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 156df83..e0933f8 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++  enable_language(CXX)
+   set(CMAKE_CXX_STANDARD 20)
+   set(CMAKE_CXX_STANDARD_REQUIRED YES)
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
