Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526F660AD1;
	Sun, 30 Oct 2022 16:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526F660AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQ3JUBEDSaUt; Sun, 30 Oct 2022 16:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E21606EC;
	Sun, 30 Oct 2022 16:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E21606EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D584A1BF47A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B034B40332
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B034B40332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DUNaRicYAfL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4FB40330
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A4FB40330
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7624A8753E; Sun, 30 Oct 2022 16:03:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:02:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6e7d5c2ca091372a759bad60e6a7d8064d05234
X-Git-Newrev: 241db490b703fc734f0e8719a07d0f9ff40faaba
X-Patchwork-Hint: ignore
Message-Id: <20221030160315.7624A8753E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: fix infinite loop in
 configure
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

commit: https://git.buildroot.net/buildroot/commit/?id=241db490b703fc734f0e8719a07d0f9ff40faaba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch to fix an infinite loop bug in configure.

Fixes:
 - http://autobuild.buildroot.net/results/82a/82af705f7ca282495461cb3994f5a7e6f64273e1
 - http://autobuild.buildroot.net/results/06c/06c9414a1ecbc1a147bc8dfddced03fc659af694
 - http://autobuild.buildroot.net/results/59e/59e36093f7e437a5a37037f7fa50ce2443c47fd3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...gue-runProgramTerminationCommands-used-a-.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
new file mode 100644
index 0000000000..0f81254e08
--- /dev/null
+++ b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
@@ -0,0 +1,29 @@
+From 4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f Mon Sep 17 00:00:00 2001
+From: Dave Mielke <Dave@Mielke.cc>
+Date: Sat, 15 Oct 2022 15:20:38 -0400
+Subject: [PATCH] shell prologue: runProgramTerminationCommands used a bash
+ command. (dm)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f]
+---
+ brltty-prologue.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/brltty-prologue.sh b/brltty-prologue.sh
+index 05b817742..6d1faf983 100644
+--- a/brltty-prologue.sh
++++ b/brltty-prologue.sh
+@@ -102,7 +102,7 @@ runProgramTerminationCommands() {
+    while [ "${programTerminationCommandCount}" -gt 0 ]
+    do
+       set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
+-      let "programTerminationCommandCount -= 1"
++      programTerminationCommandCount=$((programTerminationCommandCount - 1))
+ 
+       local process="${1}"
+       local directory="${2}"
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
