Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB989C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE54040509;
	Wed,  5 Feb 2025 10:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMInTLSp-ut4; Wed,  5 Feb 2025 10:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 844EE40575
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844EE40575;
	Wed,  5 Feb 2025 10:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 318F612A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 151F640510
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbpfy0wkfKBs for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266EA403C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 266EA403C4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DBDF8709A; Wed,  5 Feb 2025 10:42:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:19:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d4a61247d704c3bc9dda4ccbef80caa447fa6f3
X-Git-Newrev: 824c660c7540bdfd969dbb260c094bdc0508e2fa
X-Patchwork-Hint: ignore
Message-Id: <20250205104220.0DBDF8709A@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_waitress: rework assertion
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=824c660c7540bdfd969dbb260c094bdc0508e2fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like Yann E. Morin did for
support/testing/tests/package/test_python_django.py, adjust the logic
to avoid the weird "self.assertTrue(False, ...)" construct, and
instead test exit_code after the loop.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_waitress.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_python_waitress.py b/support/testing/tests/package/test_python_waitress.py
index 46f04109c0..8024aaacfd 100644
--- a/support/testing/tests/package/test_python_waitress.py
+++ b/support/testing/tests/package/test_python_waitress.py
@@ -30,5 +30,4 @@ class TestPythonWaitress(TestPythonPackageBase):
             if exit_code == 0:
                 self.assertEqual(output[0], 'Hello, World!')
                 break
-        else:
-            self.assertTrue(False, "Timeout while waiting for waitress server")
+        self.assertEqual(exit_code, 0, "Timeout while waiting for django server")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
