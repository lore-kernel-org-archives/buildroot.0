Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF19C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8469B608F1;
	Fri, 10 Jul 2026 16:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zz2o3qjAIscY; Fri, 10 Jul 2026 16:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC583606F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701688;
	bh=NXUuuzZYA4kMd4fMgWv42MbmqV2425ZKkpzfzpUlS/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RVofJoXyq/4ttzr4qoutlPZ6FZwEjrRwUmSLHljP7JwdM3wXd59wkqzhBrZBmbtgv
	 ggBrYTF+tdIdR+CzlyJ0O3kdD11giPtZF+p3cH2F3eaKlmbczYjD77g87L9dB1/q00
	 idKphm5ElA26zrbPoLnxw9GLafnyKsVxU1nHbuotrmp6rq6AzcfKFRaxL2Uc5WQZ0f
	 gH+Jb5eLB7lv1Yf2tBfXDdrjbnX1b1kaqzePMr+4tw+xa67bALpL2B+R0y8q5HZei8
	 TZXK4rvlMuGLtTdtZhY7s/LFmspIXYsX3n6Gfm8QSBGV958RkATdKm1Fd+nshXROQl
	 nJxxMO9z/QMkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC583606F8;
	Fri, 10 Jul 2026 16:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED0DC320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9BFB810CA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNV0GjE-XCGP for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFBD810B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CFBD810B5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:41:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B97588699; Fri, 10 Jul 2026 16:40:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:40:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 760f471db1857bbd33f338d58a2501a69680f6f3
X-Git-Newrev: e33010926ccb94cfd4b8c635b56a3e287183c4bf
X-Patchwork-Hint: ignore
Message-Id: <20260710164054.2B97588699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmt: fix 32-bit builds
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e33010926ccb94cfd4b8c635b56a3e287183c4bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Provide a fallback when native __int128 is not available.

Fixes:
https://autobuild.buildroot.org/results/39df217ad5a1036d5e606ae0e8291d885e9d0e1a/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-fix-fallback-uint128-bitwise-not.patch    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch b/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch
new file mode 100644
index 0000000000..123c43ab2c
--- /dev/null
+++ b/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch
@@ -0,0 +1,42 @@
+From 588b3a0f8f6a8bcf2a959cae882d5b2703e86737 Mon Sep 17 00:00:00 2001
+From: Vinay Kumar <vkslog69@gmail.com>
+Date: Thu, 18 Jun 2026 12:22:12 +0530
+Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
+
+Upstream: https://github.com/fmtlib/fmt/commit/588b3a0f8f6a8bcf2a959cae882d5b2703e86737
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+ include/fmt/format.h | 3 +++
+ test/format-test.cc  | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index 5044befdd863..570627922c62 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -326,6 +326,9 @@ class uint128 {
+       -> uint128 {
+     return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
+   }
++  friend constexpr auto operator~(const uint128& n) -> uint128 {
++    return {~n.hi_, ~n.lo_};
++  }
+   friend FMT_CONSTEXPR auto operator+(const uint128& lhs, const uint128& rhs)
+       -> uint128 {
+     auto result = uint128(lhs);
+diff --git a/test/format-test.cc b/test/format-test.cc
+index 9a2258d5921f..8c2670a19fc3 100644
+--- a/test/format-test.cc
++++ b/test/format-test.cc
+@@ -82,6 +82,11 @@ TEST(uint128_test, minus) {
+   EXPECT_EQ(n - 2, 40);
+ }
+ 
++TEST(uint128_test, bitwise_not) {
++  auto n = ~uint128(0x123456789abcdef0, 0x0fedcba987654321);
++  EXPECT_EQ(n, uint128(0xedcba9876543210f, 0xf0123456789abcde));
++}
++
+ TEST(uint128_test, plus_assign) {
+   auto n = uint128(32);
+   n += uint128(10);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
