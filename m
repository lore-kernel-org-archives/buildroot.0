Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16EEECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 22:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219F441814;
	Tue, 30 Aug 2022 22:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219F441814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaSG44nKHvnd; Tue, 30 Aug 2022 22:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C49741765;
	Tue, 30 Aug 2022 22:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C49741765
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8C51BF372
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42DCF812D9
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42DCF812D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9_OdnyNVaC1 for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C99812A7
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C99812A7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C51D868AE; Tue, 30 Aug 2022 22:22:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 00:26:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: db57110be6a7376c9866a23d8c776eed72fd4130
X-Git-Newrev: 12b706f7624acc9d795adb46eb7f386417706c9c
X-Patchwork-Hint: ignore
Message-Id: <20220830222254.0C51D868AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/testing/run-tests: fix --testcases option
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

commit: https://git.buildroot.net/buildroot/commit/?id=12b706f7624acc9d795adb46eb7f386417706c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 8dce595a68bf86b351f2b990c5c489a21e1e5064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
