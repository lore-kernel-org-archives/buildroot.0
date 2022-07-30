Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7111CC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 15:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A4683EE9;
	Sat, 30 Jul 2022 15:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A4683EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53XNUdIaOTAh; Sat, 30 Jul 2022 15:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1D883E9A;
	Sat, 30 Jul 2022 15:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1D883E9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F366B1BF470
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE55F83E9A
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE55F83E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQffO9z3qrle for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EFB883E92
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 15:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFB883E92
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BB5ED86A0F; Sat, 30 Jul 2022 15:31:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 17:09:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d919211edc362abd2f3226a2376a15d0b3365ca
X-Git-Newrev: 8fbd213eda5d7e984bfb19ea7be9e598c2961eae
X-Patchwork-Hint: ignore
Message-Id: <20220730153139.BB5ED86A0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: improve gcc bug 83143
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fbd213eda5d7e984bfb19ea7be9e598c2961eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes the condition easier to read and it's easier to maintain the
gcc bug too because we don't have to take care about new gcc versions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3ab594a1d3..a122e43c87 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -150,9 +150,9 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 # it still not been fixed yet.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
 	bool
-	default y if BR2_sh
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		   BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
