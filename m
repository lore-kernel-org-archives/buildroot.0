Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB86E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 13:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C467E8133F;
	Mon, 29 Dec 2025 13:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzrLsAt4LZ_h; Mon, 29 Dec 2025 13:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E762F819B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767013907;
	bh=o+6EfWfIhQHeQSKmMvGN/sxpP7bMMCJnydWz83KXdmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UygL+VRD5AcXdDqwQUQK16H2cR0dlulG6XMsQJP5jAcTgIj7m/C6D2P+CIW5K6pCq
	 75Tqee3jx95E9O05LA1RCuT2KrIWEUufHau7ywF+m3i9C1sSEDvatDm1oBiywSliXc
	 EwQ+vwxS9HKt810RnD0ctn7jAyoD/xLsvLoSPeXpd1NCFUxphxEjNg4ofkNFjm7PWB
	 VoUiVFE18OAB3kftYap44MS9eXYQS+a1KRrMDm/Q0ZGFat7oXITcwuXWo1E+zyEwEN
	 b6rGcteAycMQSCW2ap23ITX1jFATcfyQlMq5WvKgm8BmMGcSmcuRhZ7QD/KhaKiA9f
	 6RjeOgF/ZFBeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E762F819B4;
	Mon, 29 Dec 2025 13:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63EA1B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E14A4049F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FodzLf4qEg3G for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 13:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6473C40373
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6473C40373
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:11:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5661186FE0; Mon, 29 Dec 2025 13:11:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 14:11:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc9fc60ca12bad99183663f266c278540057f15e
X-Git-Newrev: 47ba1f6fb35131121d1d0840c9782d6b37788780
X-Patchwork-Hint: ignore
Message-Id: <20251229131144.5661186FE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libid3tag: fix build without c++
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

commit: https://git.buildroot.net/buildroot/commit/?id=47ba1f6fb35131121d1d0840c9782d6b37788780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 82094b802877c1128b21b978466641373f283666 bumped the
package to 0.16.3 switching the build system to CMake causing build
errors when the toolchain lacks c++.

Fixes:
https://autobuild.buildroot.net/results/02d/02db8c1a1b461fa3b5b5932e5b48c77be50b68af/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libid3tag/0002-CMake-Disable-c.patch | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
