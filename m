Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76DCCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807BE40548;
	Thu,  4 Sep 2025 16:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqVT6h9EF8j2; Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE1540525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE1540525;
	Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67159111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58CF980B85
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9z050AcuR_s8 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5587980B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5587980B9E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4374687F80; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:41:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3618f6b6f97597623bd54946a9574820daa9c2fc
X-Git-Newrev: dac94834cc7db00b47576cf44c7841ed12a1d55f
X-Patchwork-Hint: ignore
Message-Id: <20250904165346.4374687F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestSWIPL: increase
 timeout value
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dac94834cc7db00b47576cf44c7841ed12a1d55f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The swipl runtime test is unreliable, depending on the execution speed
of its runner or local host.

Running on a build server, the last test resolve the sudoku in
30sec while the timeout is 10sec.

  # time swipl -g top -t halt /root/sudoku.pl
  Sudoku solution:
  [9, 8, 7, 6, 5, 4, 3, 2, 1].
  [2, 4, 6, 1, 7, 3, 9, 8, 5].
  [3, 5, 1, 9, 2, 8, 7, 4, 6].
  [1, 2, 8, 5, 3, 7, 6, 9, 4].
  [6, 3, 4, 8, 9, 2, 1, 5, 7].
  [7, 9, 5, 4, 6, 1, 8, 3, 2].
  [5, 1, 9, 2, 8, 6, 4, 7, 3].
  [4, 7, 2, 3, 1, 9, 5, 6, 8].
  [8, 6, 3, 7, 4, 5, 2, 1, 9].
  real	0m 28.53s
  user	0m 27.99s
  sys	0m 0.51s

Increase the timout to 120sec.

Note: On Gitlab-CI, every emulator timeout are increased by a factor 10
to avoid sporadic failures in elastic runners.

https://gitlab.com/buildroot.org/buildroot/-/blame/2025.08-rc3/support/misc/gitlab-ci.yml.in?ref_type=tags#L101

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_swipl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
index 0839101599..0f317bb617 100644
--- a/support/testing/tests/package/test_swipl.py
+++ b/support/testing/tests/package/test_swipl.py
@@ -43,4 +43,4 @@ class TestSWIPL(infra.basetest.BRTest):
 
         # Run a more complex logic program (solve a sudoku).
         cmd = "swipl -g top -t halt /root/sudoku.pl"
-        self.assertRunOk(cmd, timeout=10)
+        self.assertRunOk(cmd, timeout=120)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
