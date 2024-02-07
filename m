Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6F2C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5462400DF;
	Wed,  7 Feb 2024 19:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVfy7C18fqkp; Wed,  7 Feb 2024 19:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF934400E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF934400E7;
	Wed,  7 Feb 2024 19:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49AF61BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A9981779
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngsY_a_AZ6Fd for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9142E81775
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9142E81775
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BF5E876D1; Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:49:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdcd5adf39186e8c67a2b55c05a67fd45bc04110
X-Git-Newrev: f44c0807c63f0bdd9640b7b29c131590f03be0ca
X-Patchwork-Hint: ignore
Message-Id: <20240207195030.8BF5E876D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: gnupg2: increase a timeout
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

commit: https://git.buildroot.net/buildroot/commit/?id=f44c0807c63f0bdd9640b7b29c131590f03be0ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symmetric encryption test can sometimes take longer than the default
timeout. This commit increase the timeout to 10 seconds for that
command.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 4505e1c339..2b18f54fa3 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -37,7 +37,7 @@ class TestGnupg2(infra.basetest.BRTest):
         # Test symmetric encrypt
         cmd = "gpg --batch --symmetric"
         cmd += " --passphrase '{}' {}".format(good_passphrase, plain_file)
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=10)
 
         # Test symmetric decrypt
         cmd = "gpg --batch --decrypt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
