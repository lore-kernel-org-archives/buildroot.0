Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B6CAC594
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300B942401;
	Thu, 11 Sep 2025 18:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tzMOdZoklGv; Thu, 11 Sep 2025 18:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D755423F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D755423F5;
	Thu, 11 Sep 2025 18:55:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6785E443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26983400F9
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9bg0M_T1I-e for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574CB41E8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574CB41E8C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54A4E84108; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:42:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 00a5d1b7d7cd9f51a1f6464ac06cc67ccf64d33d
X-Git-Newrev: de2bf5404b7bc0417d7983d7e2f817973f941197
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.54A4E84108@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 TestSWIPL: increase timeout value
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de2bf5404b7bc0417d7983d7e2f817973f941197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit dac94834cc7db00b47576cf44c7841ed12a1d55f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
