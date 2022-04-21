Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB124C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1770B611C5;
	Thu, 21 Apr 2022 21:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70vSshi8vElF; Thu, 21 Apr 2022 21:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1668611AD;
	Thu, 21 Apr 2022 21:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0648C1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F13141149
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byHeZar6bB2s for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B184114C
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB511840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90bdef4f17d46929c2c0e19110a11dbcc4ba851d
X-Git-Newrev: 7e0fbf4dcd4cd0cf17cfe89ebf6808fdace8f01f
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.CB511840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: fix mips build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e0fbf4dcd4cd0cf17cfe89ebf6808fdace8f01f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable Loongson MMI fast paths to fix the following mips build failure:

./loongson-mmintrin.h:407:2: error: impossible constraint in 'asm'
  407 |  asm("pinsrh_%3 %0, %1, %2\n\t"
      |  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/75267aa5b5a631f091d4c8cb6ad9baeb5f72ee11
 - http://autobuild.buildroot.org/results/55b7431a50b85c24406131af1932d6f3f6853de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pixman/pixman.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6fab539593..64302fa49a 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -19,7 +19,9 @@ HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 PIXMAN_AUTORECONF = YES
 
 # don't build gtk based demos
-PIXMAN_CONF_OPTS = --disable-gtk
+PIXMAN_CONF_OPTS = \
+	--disable-gtk \
+	--disable-loongson-mmi
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
