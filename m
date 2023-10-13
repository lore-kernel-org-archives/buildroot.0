Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597B3CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FCD86068B;
	Fri, 13 Oct 2023 14:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCD86068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be1eKR-4wqdR; Fri, 13 Oct 2023 14:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 462386F5DE;
	Fri, 13 Oct 2023 14:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462386F5DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC2E1BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F62060767
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F62060767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5sCtf7adL5C for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 286466F568
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286466F568
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1794C814B6; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:42:59 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8fceb06e6c31067e79bedc28f7ac1f8df749335b
X-Git-Newrev: 80388d5a8019ee8ce6513877e4ff680e77e6706b
X-Patchwork-Hint: ignore
Message-Id: <20231013144707.1794C814B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/Makefile.in: set
 --shuffle=none for MAKE1
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

commit: https://git.buildroot.net/buildroot/commit/?id=80388d5a8019ee8ce6513877e4ff680e77e6706b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit f664d7dc24c70ef08ced78d5d3f50a8ad673ea02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index d70aded82b..7e6ae19559 100644
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
