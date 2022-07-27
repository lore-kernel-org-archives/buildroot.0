Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F84A60E95;
	Wed, 27 Jul 2022 16:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F84A60E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nwRKQXk05Yb; Wed, 27 Jul 2022 16:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6DD60E72;
	Wed, 27 Jul 2022 16:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6DD60E72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD9931BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6C50408B4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C50408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CujGCCXHNCXb for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F302040608
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F302040608
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8974986700; Wed, 27 Jul 2022 16:07:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 18:20:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42646265d5dd23d65e96e85b0ec12d5de1ee0042
X-Git-Newrev: 8dce595a68bf86b351f2b990c5c489a21e1e5064
X-Patchwork-Hint: ignore
Message-Id: <20220727160713.8974986700@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/run-tests: fix --testcases
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dce595a68bf86b351f2b990c5c489a21e1e5064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --testcases option of run-tests says how many test cases to build in
parallel. It automatically derives a jlevel from it by dividing the
number of cores + 1 by the number of parallel testcases. However, this
will typically result in a fractional number. Make doesn't like
fractional numbers as argument to -j.

Convert the number to integer (rounding down).

* br2_jlevel is an int, as multiprocessing.cpu_count() is an int, so it
  will be always >=2  (cpu_count() raises an error if it can't determine
  the number of CPU, so it will always return at least 1);

* args.testcases is an int, and is checked to be >=1

So br2_jlevel + args.testcases is guaranteed to always be bigger
than or equal to args.testcases, and the division thus bigger than 1.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - ensure division provide at least 1
  - drop the test below
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/run-tests | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 022209b414..bf40019362 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -87,9 +87,7 @@ def main():
             return 1
         # same default BR2_JLEVEL as package/Makefile.in
         br2_jlevel = 1 + multiprocessing.cpu_count()
-        each_testcase = br2_jlevel / args.testcases
-        if each_testcase < 1:
-            each_testcase = 1
+        each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
         BRConfigTest.jlevel = each_testcase
 
     if args.jlevel:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
