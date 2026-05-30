Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D4DCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD21853D8;
	Sat, 30 May 2026 17:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRstiuiMtMDp; Sat, 30 May 2026 17:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E89BF853D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780161695;
	bh=ls3Pjm0XWm/n0HmtwvkcWSFXFSXy4JmQUCf7MUB8M5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T2Rx2oGfzAgMs+WHQJvxSbE5TjgYebSpLd12elRjup2Rvpz4ijsSco2XrxGzRoGm0
	 QMdI5lETs5yTo9CmmkN9YZo1nh39uSwPpepCGe0zVr16stZclNmJCBu+O8yEaPkUjx
	 o3yQMPCa4ZkdyxsZaEPIXsruvVHjMPErsgXIiqysrr0+00yfvUQ4yD9A7/cJAOf/8F
	 BHbmrJp9klcNzN+9vzUPls741Pk+QcDjmNsM1Nh64QVRaFQ3GiGSU9nOTTHte4y89S
	 24W+d9VqZaPyunyq6/yXTJ4iaQdhvVD/W8lMASC+tX7EcISw7B4yhZ9K197+n+xpVA
	 khMi17t72ucWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89BF853D9;
	Sat, 30 May 2026 17:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 856FBF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 769DC853D9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1G1t0IOtHfJ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4C48853D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C48853D8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 880D487533; Sat, 30 May 2026 17:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:16:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 513f800cf32041274d0af3c8947a38aa89bbe57f
X-Git-Newrev: 7d4e403f025607b47659a36ad4ed90e57d7bb4f8
X-Patchwork-Hint: ignore
Message-Id: <20260530172119.880D487533@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: fix build with recent
 versions of ICU
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d4e403f025607b47659a36ad4ed90e57d7bb4f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 in
2025.11-rc1 that bumped package/icu to version 77-1, the build of xerces
with ICU support enabled fails:

In file included from /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/uset.h:38,
                 from /home/bernd/buildroot/output/build/xerces-3.3.0/src/xercesc/util/regx/RangeToken.cpp:40:
/home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:55:
 error: 'is_same_v' is not a member of 'std'; did you mean 'is_same'?

Indeed, ICU now requires C++17. Instead of using a patch from Gentoo[1]
we use a backported upstream commit, limited to CMakeLists.txt, to raise
the c++ version.

The build error was not recorded yet by the autobuilders but can be
reproduced with this defconfig:

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XERCES=y
BR2_PACKAGE_ICU=y

[1] https://bugs.gentoo.org/931105

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...nable-C++17-C++14-or-C++11-when-available.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
new file mode 100644
index 0000000000..24f7aef6ef
--- /dev/null
+++ b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
@@ -0,0 +1,32 @@
+From 6883e346fa88f48022edf84328a09a4653b8c2fe Mon Sep 17 00:00:00 2001
+From: Roger Leigh <rleigh@codelibre.net>
+Date: Sat, 10 Mar 2018 21:27:27 +0000
+Subject: [PATCH] XERCESC-2141: Enable C++17, C++14 or C++11 when available
+
+Upstream: https://github.com/apache/xerces-c/commit/6883e346fa88f48022edf84328a09a4653b8c2fe
+
+[Bernd: rebased for version 3.3.0, limited to CMakeLists.txt]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt              |   4 +-
+ configure.ac                |   9 +
+ m4/ax_cxx_compile_stdcxx.m4 | 982 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 993 insertions(+), 2 deletions(-)
+ create mode 100644 m4/ax_cxx_compile_stdcxx.m4
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4254f89bb..f5cdb55cc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -32,9 +32,9 @@ if (POLICY CMP0067)
+ 
+ cmake_minimum_required(VERSION 3.12.0)
+ 
+-# Try C++14, then fall back to C++11 and C++98.  Used for feature tests
++# Try C++17, then fall back to C++14, C++11 then C++98.  Used for feature tests
+ # for optional features.
+-set(CMAKE_CXX_STANDARD 14)
++set(CMAKE_CXX_STANDARD 17)
+ 
+ # Use folders (for IDE project grouping)
+ set_property(GLOBAL PROPERTY USE_FOLDERS ON)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
