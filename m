Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A01C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9134F403CD;
	Sat, 27 Jul 2024 14:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztvSIWFp4d9p; Sat, 27 Jul 2024 14:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4104019A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4104019A;
	Sat, 27 Jul 2024 14:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3401BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5973540137
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2pF6UXhyF0c for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 734B9400C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 734B9400C6
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B69875E6; Sat, 27 Jul 2024 14:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:20:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a97ba343e55d4f269256579a0d5d483a89317e1
X-Git-Newrev: 6b70913703c4364f27ece83c07b23a6e0ef8225f
X-Patchwork-Hint: ignore
Message-Id: <20240727142425.E1B69875E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix s6-portable-utils test
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
Content-Type: multipart/mixed; boundary="===============3074792864474605441=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3074792864474605441==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b70913703c4364f27ece83c07b23a6e0ef8225f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s6-test was removed in s6-portable-utils 2.3.0.0, and replaced with
eltest (from execline). This change broke the existing runtime tests
with commit 42fad03182 ("packages: bump skalibs-related packages").

Instead of s6-test simply use the shell built-in "test", which provides
sufficient functionality.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388010

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_s6_portable_utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_s6_portable_utils.py b/support/testing/tests/package/test_s6_portable_utils.py
index 372e3ba812..d4df70cd51 100644
--- a/support/testing/tests/package/test_s6_portable_utils.py
+++ b/support/testing/tests/package/test_s6_portable_utils.py
@@ -28,5 +28,5 @@ class TestS6PortableUtils(infra.basetest.BRTest):
 
         _, exit_code = self.emulator.run("s6-mkfifo testpipe")
         self.assertEqual(exit_code, 0)
-        _, exit_code = self.emulator.run("s6-test -p testpipe")
+        _, exit_code = self.emulator.run("test -p testpipe")
         self.assertEqual(exit_code, 0)

--===============3074792864474605441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3074792864474605441==--
