Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F85C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1ECE41969;
	Wed,  8 Nov 2023 13:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1ECE41969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SkAVoIHSFgr; Wed,  8 Nov 2023 13:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89B44193C;
	Wed,  8 Nov 2023 13:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89B44193C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38D4E1BF954
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F52C4146F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F52C4146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XInjlxz-pJ54 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48F81410BA
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F81410BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3185686CF4; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 14:38:42 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: f2bd43c79dad4c174f16f0fb59facd8fc317115e
X-Git-Newrev: 0d72086f612ad77429f6e26c11aad75101995dcb
X-Patchwork-Hint: ignore
Message-Id: <20231108134734.3185686CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pistache: fix
 build with gcc >= 13
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d72086f612ad77429f6e26c11aad75101995dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure with gcc >= 13:

In file included from ../include/pistache/reactor.h:19,
                 from ../src/common/reactor.cc:13:
../include/pistache/flags.h:29:35: error: 'uint8_t' was not declared in this scope
   29 |         struct TypeStorage<sizeof(uint8_t)>
      |                                   ^~~~~~~
../include/pistache/flags.h:17:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   16 | #include <iostream>
  +++ |+#include <cstdint>
   17 | #include <type_traits>

Fixes:
 - http://autobuild.buildroot.org/results/d3b6eb6fb943d69571a311235944df879fccc831

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6bb275a59a2a0d8454a1121b2660d382c2476b2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...3-Add-missing-cstdint-header-include-1142.patch | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
new file mode 100644
index 0000000000..3451e4aa4c
--- /dev/null
+++ b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
@@ -0,0 +1,23 @@
+From dabe9fcd3eaaa6b0b8723369b2565778341630c0 Mon Sep 17 00:00:00 2001
+From: a-andre <13609565+a-andre@users.noreply.github.com>
+Date: Thu, 29 Jun 2023 16:34:11 +0200
+Subject: [PATCH] Add missing cstdint header include (#1142)
+
+Upstream: https://github.com/pistacheio/pistache/commit/dabe9fcd3eaaa6b0b8723369b2565778341630c0
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/pistache/flags.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/pistache/flags.h b/include/pistache/flags.h
+index 9be2b32bb..6adcc74bc 100644
+--- a/include/pistache/flags.h
++++ b/include/pistache/flags.h
+@@ -13,6 +13,7 @@
+ #pragma once
+ 
+ #include <climits>
++#include <cstdint>
+ #include <iostream>
+ #include <type_traits>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
