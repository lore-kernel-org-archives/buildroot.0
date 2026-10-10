Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB19CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F16409B1;
	Sat, 10 Oct 2026 09:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRYSjQLQBnKl; Sat, 10 Oct 2026 09:32:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59E69409B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624760;
	b=dP6bwarfBurPuyMbXjkWwvX5qMfL53pxtWeHz4kBNGCqeSQ+lqSujB9nLVWHBPV7/tel
	 pG4OxP1PWW9IoFFJPRBotzEsGK+DDU8Lp0M2Y3H4ElFNfmc73SdixsMacGhHNBBkaiXOh
	 OjFybGemIJEI0MJE3Bn4s3fwmFjwJfAvJZ1dSP/zL3eqsmkwKxBGLykilXWuCXZwqkF2O
	 2H0aL19fUXIb15zktbGq9jV+mpv+Mge6kJYXxuO3Wo4McyerQxS3G02RiSswTxS9ROBvo
	 +W6BpYrFBKlDmCv8FxOstgIMQkisz4pb9x0OtWb2nSJSx500I/KukDiidzV+IRJOJZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nCdDN5/WPdLilNogTBhotLWGWJjg6gOOu0KUGxL5+Yo=;
	b=sIlK8j5YCtLwzsfXjRfKgGTPv52HtW3AZNwwwHY62KlIMNp7Io5v0iE11FOe1VGgP8L3
	 YdpBxG+QjYXYPX4cswcYtzM4XLHcBBhyPVVhw6BxzPa4Wq1zrhIzp2XvvpffaO+tGG3kU
	 kQWrPY67lZBQY7qhSoYdtqVQ4+IWjiBbazWIy/aycrtKccAPxPQiI496vCcmORl5qWtY5
	 griplQ2C0eukcCIXcJ7ZRMTp4xrrTfTCWnE7x8Qypf5RPn00aYg8DTYgbfwTzY8KbpdDk
	 +/KPa3R4d/TSs8dkK6tYMgJe9qIYdSynB42GFZ1W/2TFE4efG0ozjMUnbLAKtXtDq2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624760;
	bh=nCdDN5/WPdLilNogTBhotLWGWJjg6gOOu0KUGxL5+Yo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PO4abyIUwrpFAVPHpTRTiXUjed7pyruecx57Xw7+ut4LMI3tbSXDHaUGGTZ/7b9Bd
	 EFahdBLNKkmgYUAO4MHUoYh3olPtY+0NqIm1uTthsGOK1WUQeo9ji/mJ+a7imMu5n0
	 5OKLfG6Qvp8O6Oe6cpBRo2H3MQ/P59e1wS4r8zCuPTf6Y+4y2F6WxkZrLNMaNeLwTm
	 GmqzQZCBH6YLsaoZmbKJe6xBQOC+xBs8H9GS+hhjoaLElZ85Ig2dyd/w+PXRDnU+uv
	 XoNbCnzge3MKbSKmBVlkv9TpBfG9VClVfVI8liYgx1IWja7urECRbFqHLGU2kgQ8Xs
	 FOX3hiMGzbKpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E69409B2;
	Sat, 10 Oct 2026 09:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8AA775
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA68560A80
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q40U9Hnxs_z6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0457560A77
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624758;
 b=K2T7RAa6kk4x8v15pqBj/eoE4QwMG0DH/YZck4KZ9tE3LBiqI/zVDcOxLkvIwDqkwDOi
 BKwX///CDUOqKMgexobqn3yxyb0yaEd4kSTQcxp0vI01otdIgB8VGJpe3pAhZj4bX7Et3
 tV/Q1UQqdoLzAlXXRpI8685jEzRF51OXnDLMyb51Sp4XpAYjwny+SNiS+WyfqhyWhAnC3
 CzPtxdr+KUJSJ4aL2wgQQJvg8uY/Mv4H5syUtLYAd1T8lXSMgEvk1CCGhPSLv50oozo0y
 xjTD2TAVY4CUvD6Gc247vceQj0SLS1vW8aV/J5woUci9ti1LC7K65WxyxqDdSyB0oKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WJro6qedjiFSCOpFSOgyzCOvmV0+eqLIBtCbkcPwA/4=;
 b=HE+0TFc6XrBeOWKJTa0yyqC3abCdM2ucaXUd310GZpzLEm3rVcRAiiCjribJJKrQlXRs
 qryjK8vFemSLYHd9+blt1qpnGDoe4CQ02YFLHW0MHLc+hb0/Tz++KWy2LFKDiXixwk75O
 5GgXPfbPtRYmcIgopaxGbTJ4fHICm3Dp2NhZEw1CqajBYDaHA5tp48ofnACea1hWVfXCz
 VIn/5v7q4if8s2TVrdd6HYp2i2TJUlQUdJGBuWkGbwt362ApBB/ny7z6MSq7txbftoIIT
 7E0s5lYDeB09FFsoydzUuH0hvVKRmLqxViWEK9kU68h8/PtAPR4av+6MU60E9d10OQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0457560A77
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D04758EF4D; Sat, 10 Oct 2026 09:31:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ab7d13248ef9229cbd94961baec6023e6827f07
X-Git-Newrev: d267b59fa9219f3a6127dd687cf68a0c51e189ac
X-Patchwork-Hint: ignore
Message-Id: <20261010093119.D04758EF4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: fix build without c++
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d267b59fa9219f3a6127dd687cf68a0c51e189ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-CMakeLists.txt-only-require-a-C-compiler.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..6f4ecdea80
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,45 @@
+From c6a1f6a3650e8487e506080eb34a244e75e37a78 Mon Sep 17 00:00:00 2001
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
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 8978910..55d1cde 100644
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
+@@ -298,6 +298,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++	enable_language(CXX)
+ 	set(CMAKE_CXX_STANDARD 20)
+ 	set(CMAKE_CXX_STANDARD_REQUIRED YES)
+ 	
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
