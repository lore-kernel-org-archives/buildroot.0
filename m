Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDC4C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C08180AA2;
	Sun,  6 Aug 2023 12:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C08180AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XB4MeWbxjPf1; Sun,  6 Aug 2023 12:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9260481A30;
	Sun,  6 Aug 2023 12:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9260481A30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1471BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27FAE4027F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FAE4027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxfkY0WiLGOn for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:10:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5905540106
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5905540106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45B9484355; Sun,  6 Aug 2023 12:10:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 14:09:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcfa3d6d1b45e8aedea38142c12665d7d76f390b
X-Git-Newrev: f5d68db8bd7001ff25be1f512c8518dbbe7fe83d
X-Patchwork-Hint: ignore
Message-Id: <20230806121049.45B9484355@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblo: add upstream patch to fix
 build error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5d68db8bd7001ff25be1f512c8518dbbe7fe83d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the merge of gcc 13.x, a warning treated as error causes liblo
to fail building:

server.c: In function 'lo_server_del_lo_method':
server.c:2251:16: error: pointer 'prev' used after 'free' [-Werror=use-after-free]

Fixes:
http://autobuild.buildroot.net/results/c98/c98c21093714542d4c0546a742fdcc48f3f07d04/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Fix-use-after-free-warning-in-server.c.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
new file mode 100644
index 0000000000..be815a0a61
--- /dev/null
+++ b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
@@ -0,0 +1,29 @@
+From 8187a8456c14eeb3af08c86ffa1228823c9ef1c5 Mon Sep 17 00:00:00 2001
+From: Guido Aulisi <guido.aulisi@gmail.com>
+Date: Sun, 25 Jun 2023 15:58:30 +0200
+Subject: [PATCH] Fix use-after-free warning in server.c
+
+That assignment is not necessary before returning
+
+Upstream: https://sourceforge.net/p/liblo/git/ci/8187a8456c14eeb3af08c86ffa1228823c9ef1c5/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/server.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/server.c b/src/server.c
+index ba02d8e..35c9ba5 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -2289,7 +2289,6 @@ int lo_server_del_lo_method(lo_server s, lo_method m)
+             free((void *) it->path);
+             free((void *) it->typespec);
+             free(it);
+-            it = prev;
+             return 0;
+         }
+         prev = it;
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
