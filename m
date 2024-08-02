Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7767DC52D71
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 06:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37772820D2;
	Fri,  2 Aug 2024 06:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuDHVTjRv-5p; Fri,  2 Aug 2024 06:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F8A820D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F8A820D7;
	Fri,  2 Aug 2024 06:36:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0BE11BF421
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA9E14011D
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MzrxiKwIXdJ for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78ED7400FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78ED7400FF
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61C2A83B0C; Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 08:35:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84ae3b04fe6cd70a4abccc5d9e19218583410c16
X-Git-Newrev: 905b9c8868fc4b021d7d7e0bce331f17d5e20d71
X-Patchwork-Hint: ignore
Message-Id: <20240802063627.61C2A83B0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odb: backport upstream patch to
 fix GCC 14.x build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=905b9c8868fc4b021d7d7e0bce331f17d5e20d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/f1b802e65273ae348569f37feb7e4bd2a04bb46e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-ODB-compiler-plugin-to-work-with-GCC-14.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/odb/0014-Update-ODB-compiler-plugin-to-work-with-GCC-14.patch b/package/odb/0014-Update-ODB-compiler-plugin-to-work-with-GCC-14.patch
new file mode 100644
index 0000000000..bcab6c12ed
--- /dev/null
+++ b/package/odb/0014-Update-ODB-compiler-plugin-to-work-with-GCC-14.patch
@@ -0,0 +1,66 @@
+From 4bd8af5dbd1f58bf631b4d5af90086f214553157 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Thu, 25 Apr 2024 07:15:47 +0200
+Subject: [PATCH] Update ODB compiler plugin to work with GCC 14
+
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=acb0c5194690d2751d2211bf91aec21da2fadc26
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ odb/cxx-lexer.cxx |  4 +++-
+ odb/processor.cxx | 18 +++++++++++++++---
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/odb/cxx-lexer.cxx b/odb/cxx-lexer.cxx
+index acd13be6..e283abd5 100644
+--- a/odb/cxx-lexer.cxx
++++ b/odb/cxx-lexer.cxx
+@@ -217,7 +217,9 @@ cxx_string_lexer ()
+   linemap_init (&line_map_);
+ #endif
+ 
+-#if BUILDING_GCC_MAJOR > 4 || BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR > 6
++#if BUILDING_GCC_MAJOR >= 14
++  line_map_.m_round_alloc_size = ggc_round_alloc_size;
++#elif BUILDING_GCC_MAJOR > 4 || BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR > 6
+   line_map_.round_alloc_size = ggc_round_alloc_size;
+ #endif
+ 
+diff --git a/odb/processor.cxx b/odb/processor.cxx
+index c787e0d1..8f273545 100644
+--- a/odb/processor.cxx
++++ b/odb/processor.cxx
+@@ -438,8 +438,14 @@ namespace
+               // functions. Note that TREE_PUBLIC() returns something
+               // other than what we need.
+               //
+-              if (!DECL_NONSTATIC_MEMBER_FUNCTION_P (f) ||
+-                  TREE_PRIVATE (f) || TREE_PROTECTED (f))
++              if (
++#if BUILDING_GCC_MAJOR >= 14
++                !DECL_OBJECT_MEMBER_FUNCTION_P (f)
++#else
++                !DECL_NONSTATIC_MEMBER_FUNCTION_P (f)
++#endif
++                  || TREE_PRIVATE (f)
++                  || TREE_PROTECTED (f))
+                 continue;
+ 
+               found_type r (k == "get"
+@@ -548,7 +554,13 @@ namespace
+ #endif
+               // We are only interested in non-static member functions.
+               //
+-              if (!DECL_NONSTATIC_MEMBER_FUNCTION_P (f))
++              if (
++#if BUILDING_GCC_MAJOR >= 14
++                !DECL_OBJECT_MEMBER_FUNCTION_P (f)
++#else
++                !DECL_NONSTATIC_MEMBER_FUNCTION_P (f)
++#endif
++              )
+                 continue;
+ 
+               if ((k == "get"
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
