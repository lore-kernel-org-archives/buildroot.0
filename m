Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC21607EC;
	Sun, 27 Feb 2022 20:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYMPCpCrlylN; Sun, 27 Feb 2022 20:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA82606CB;
	Sun, 27 Feb 2022 20:35:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F21D1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DC33605BA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnzY_76eLTcm for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B98EC606CB
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:34:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3DEE6831CB; Sun, 27 Feb 2022 20:26:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:32:51 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 57fb6f520180cbe458fbf2c2b95efe2b7bec7d04
X-Git-Newrev: bec884cf3b507753a88c55dc1417da7693fd8e06
X-Patchwork-Hint: ignore
Message-Id: <20220227202625.3DEE6831CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] toolchain: fix gcc bug
 99140 condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=bec884cf3b507753a88c55dc1417da7693fd8e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Gcc bug 99140 exhibits with gcc versions:
- up to 7.x
- 9.x
- 10.x
and doesn't show up with gcc versions:
- 8.x
- 11.x
then moving BR2_TOOLCHAIN_GCC_AT_LEAST_9 to BR2_TOOLCHAIN_GCC_AT_LEAST_10
makes gcc version 9 set as working but it's not. So let's back substitute
BR2_TOOLCHAIN_GCC_AT_LEAST_10 with BR2_TOOLCHAIN_GCC_AT_LEAST_9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 33ea4d7887b15ccb3e11d1390c697eee531af565)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index f63aec6735..1792070720 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -195,7 +195,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
