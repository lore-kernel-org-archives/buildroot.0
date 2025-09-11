Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBAFCAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C856F55F;
	Thu, 11 Sep 2025 19:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rn6HcKyvqTYH; Thu, 11 Sep 2025 19:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E236F54D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E236F54D;
	Thu, 11 Sep 2025 19:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A19E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CBEC41EF6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuvD73p3TEBb for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F45D41ED2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F45D41ED2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C97D842A4; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:05 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c80f90e4d281cb332a888ae74abb399f59c93a1c
X-Git-Newrev: 393b36b22bb230eefb1b480351b0e60ea61c0f89
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.1C97D842A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing:
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

commit: https://git.buildroot.net/buildroot/commit/?id=393b36b22bb230eefb1b480351b0e60ea61c0f89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
