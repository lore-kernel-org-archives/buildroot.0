Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49255C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D9F414C6;
	Sun,  7 Jan 2024 17:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D9F414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9oOol9f-gQn; Sun,  7 Jan 2024 17:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203E8413D3;
	Sun,  7 Jan 2024 17:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203E8413D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAAF1BF863
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 524AE4029F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524AE4029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_Hzi-ANRmX8 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:00:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2662A401C2
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2662A401C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10F04847E4; Sun,  7 Jan 2024 17:00:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 17:59:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9501bc80f5c34cd04bdc686cd74324beb452649e
X-Git-Newrev: 292949c638e304ad5104004b95de7895ef3bd405
X-Patchwork-Hint: ignore
Message-Id: <20240107170054.10F04847E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: change default optimization
 level from -Os to -O2
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

commit: https://git.buildroot.net/buildroot/commit/?id=292949c638e304ad5104004b95de7895ef3bd405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Historically, Buildroot has defaulted to -Os as the gcc optimization
flags. However, this default is probably not the most appropriate
anymore, and this commit therefore changes the default to -O2.

Here are some arguments in favor of this change:

- Most Buildroot users use Buildroot for platforms that have a
  reasonable amount of storage, and the difference between -Os and -O2
  in terms of code size is no longer as significant compared to the
  size of storage available on average embedded Linux devices
  typically found these days.

- -Os can have a pretty bad performance impact, compared to -O2.

- -Os is much less widely tested than -O2. For example, with recent
   versions of gcc, there are parts of Qt5 that segfault when compiled
   with -Os and work perfectly fine with -O2. Yes, it's a compiler bug
   that should be fixed, but in the mean time, having a default that's
   more widely used/tested makes sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 7b6ea801e7..113adf0755 100644
--- a/Config.in
+++ b/Config.in
@@ -474,7 +474,7 @@ config BR2_STRIP_EXCLUDE_DIRS
 
 choice
 	prompt "gcc optimization level"
-	default BR2_OPTIMIZE_S
+	default BR2_OPTIMIZE_2
 	help
 	  Set the optimization level for gcc
 
@@ -520,6 +520,7 @@ config BR2_OPTIMIZE_2
 	  -falign-loops -falign-labels -ftree-vrp -ftree-pre. Please
 	  note the warning under -fgcse about invoking -O2 on programs
 	  that use computed gotos.
+	  This is the default.
 
 config BR2_OPTIMIZE_3
 	bool "optimization level 3"
@@ -548,7 +549,6 @@ config BR2_OPTIMIZE_S
 	  -falign-loops -falign-labels -freorder-blocks
 	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
-	  This is the default.
 
 config BR2_OPTIMIZE_FAST
 	bool "optimize for fast (may break packages!)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
