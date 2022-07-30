Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DD5C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA1F40493;
	Sat, 30 Jul 2022 15:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA1F40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmkzbN13kxzd; Sat, 30 Jul 2022 15:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9213D4018F;
	Sat, 30 Jul 2022 15:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9213D4018F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37FE51BF470
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10884415E2
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10884415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GD5WQxMQQ4RK for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 120A4415DE
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 120A4415DE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C501D86A10; Sat, 30 Jul 2022 15:31:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 17:43:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fbd213eda5d7e984bfb19ea7be9e598c2961eae
X-Git-Newrev: 81e7e2e773a7ea59bbb129233183b481066ecf6e
X-Patchwork-Hint: ignore
Message-Id: <20220730153139.C501D86A10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: improve gcc bug 43744
 condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=81e7e2e773a7ea59bbb129233183b481066ecf6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes the condition easier to read and it's easier to maintain the
gcc bug too because we don't have to take care about new gcc versions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: fix comment while at it]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/Config.in | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a122e43c87..9612bdf8b2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -109,16 +109,13 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_or1k
 	depends on !BR2_xtensa
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744. This bug no
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744. This bug
 # reappeared on gcc 9.x and is still not fixed on gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
-	default y if BR2_sh4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_sh4
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
