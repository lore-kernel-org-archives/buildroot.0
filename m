Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E038AC77B70
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 06:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229A581E5E;
	Mon, 17 Apr 2023 06:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229A581E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMzsUIIFDxQ5; Mon, 17 Apr 2023 06:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D56D81E20;
	Mon, 17 Apr 2023 06:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D56D81E20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E47331C4152
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBAD960A64
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBAD960A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIgytpFU3HTs for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DF776079B
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DF776079B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF2E9840B8; Mon, 17 Apr 2023 06:48:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 08:46:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ace31aec59dc06375ba192b5838c4cc99072e81
X-Git-Newrev: 1557312f18a5e2a84387055aada9b1e6d59c5ad4
X-Patchwork-Hint: ignore
Message-Id: <20230417064833.EF2E9840B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dcron: fix /etc/cron.d/system cron
 jobs
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

commit: https://git.buildroot.net/buildroot/commit/?id=1557312f18a5e2a84387055aada9b1e6d59c5ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jobs with the syntax @hourly, @daily, ... were not executed since the
version bump from `v4.5` to commit `1ba33c3325df48de46263276a43ed76cf9d81518`.
This patch fixes the bug downstream.

Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dcron/0002-system-crontab.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
new file mode 100644
index 0000000000..ac29368727
--- /dev/null
+++ b/package/dcron/0002-system-crontab.patch
@@ -0,0 +1,28 @@
+From 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f Mon Sep 17 00:00:00 2001
+From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+Date: Fri, 2 Sep 2022 23:20:14 +0200
+Subject: [PATCH] Make @hourly, @daily, ... work again
+
+closes #15
+
+Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+Upstream: https://github.com/dubiousjim/dcron/pull/35
+---
+ database.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/database.c b/database.c
+index 37cf17a..6ec720e 100644
+--- a/database.c
++++ b/database.c
+@@ -455,6 +455,8 @@ SynchronizeFile(const char *dpath, const char *fileName, const char *userName)
+ 							line.cl_Days[j] = 1;
+ 						for (j=0; j<12; ++j)
+ 							line.cl_Mons[j] = 1;
++						for (j=0; j<7; ++j)
++							line.cl_Dow[j] = ALL_DOW;
+ 					}
+ 
+ 					while (*ptr == ' ' || *ptr == '\t')
+-- 
+2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
