Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43099C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00B79401EF;
	Mon, 14 Feb 2022 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Af-ejINJS_XV; Mon, 14 Feb 2022 20:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B65141526;
	Mon, 14 Feb 2022 20:43:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 990001BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57915404F3
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUYix_loGz4v for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45CBD404DB
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 15C8582CFC; Mon, 14 Feb 2022 20:35:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:38:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 132eec5c47f5f9542d0c2e93d12341d624627de0
X-Git-Newrev: 33ea4d7887b15ccb3e11d1390c697eee531af565
X-Patchwork-Hint: ignore
Message-Id: <20220214203507.15C8582CFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: fix gcc bug 99140 condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=33ea4d7887b15ccb3e11d1390c697eee531af565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 53d2046379..d2c81217c8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -189,7 +189,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
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
