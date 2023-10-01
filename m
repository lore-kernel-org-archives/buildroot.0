Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFBBE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9554581326;
	Sun,  1 Oct 2023 16:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9554581326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYwYysmhkbbj; Sun,  1 Oct 2023 16:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D714B81353;
	Sun,  1 Oct 2023 16:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D714B81353
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 370AB1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 111F381306
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111F381306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0uHvdWvUB4I for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:10:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41FEC81304
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41FEC81304
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E303838C1; Sun,  1 Oct 2023 16:10:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:06:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e3105d5c8bd9ab31e728af9732a67d203c0a2e4
X-Git-Newrev: f664d7dc24c70ef08ced78d5d3f50a8ad673ea02
X-Patchwork-Hint: ignore
Message-Id: <20231001161002.2E303838C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: set --shuffle=none
 for MAKE1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f664d7dc24c70ef08ced78d5d3f50a8ad673ea02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make 4.4 introduces a shuffle mode which randomizes prerequisites
in order to better flush out issues with parallel builds. On the other
hand, we use MAKE1 to build packages that are known to be broken with
parallel build. For these, passing the shuffle option would be
counter-productive and lead to spurious build failures.

The --shuffle=none option exists to turn off shuffling again. We can't
add this option unconditionally, however, because Make < 4.4 doesn't
know it. Therefore, conditionally pass --shuffle=none only if there is a
shuffle option in MAKEFLAGS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Makefile.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4953d2d418..5c11cae732 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -17,7 +17,9 @@ else
 PARALLEL_JOBS := $(BR2_JLEVEL)
 endif
 
-MAKE1 := $(HOSTMAKE) -j1
+# Only build one job at a time, *and* to not randomise goals and
+# prerequisites ordering in make 4.4+
+MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)
 override MAKE = $(HOSTMAKE) \
 	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
