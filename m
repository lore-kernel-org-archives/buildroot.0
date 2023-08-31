Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CECDC83F35
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 17:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE53C835C9;
	Thu, 31 Aug 2023 17:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE53C835C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBNmFrT0lAun; Thu, 31 Aug 2023 17:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E1A5835D9;
	Thu, 31 Aug 2023 17:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1A5835D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879CD1BF2FE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 17:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EFD418F8
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 17:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55EFD418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lo47OLRg90-Y for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 17:37:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B2A4418D1
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 17:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2A4418D1
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3085E13F8D9;
 Thu, 31 Aug 2023 19:37:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 19:37:36 +0200
Message-ID: <20230831173736.84288-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693503464;
 bh=sX+VsyqsNv1fEMv/1vC3ZoA0VM1/QpCO5bmzuZSx4Fo=;
 h=From:To:Cc:Subject:Date:From;
 b=Tr4+RUrnFCk2aPdMJKKM8YTmtQsPwSJDiq4eBodquepWQLCNrj+rtRNx/RNKHrZbi
 aDXcW/iQ8N/LyV+jrlQ7yRW+a9xcrAntvG5bbkzDbKas57Vekr/YkIXu4u3iwlekGJ
 IA4YkfVrf2jmNc0omQghDGgF2SGFhUiZshvotVvJIv3vC470jh8Y6iJsdceK/j8Y6b
 D+qERBdoCKNmgt3PK1fy07fTKQ9aA3gkSu4Tjj0cbjxAJdgiZh2PctL5Up/4X8nFVM
 +tc5ko7lZlUc7WM7CazGePhtEPG4ZpYAN42HrSDcgIKhioYLIEKJRztDqRLeCXiQlp
 hztiMY62dxDNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tr4+RUrn
Subject: [Buildroot] [PATCH 1/1] support/testing: python-magic-wormhole: fix
 random failures
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
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The magic-wormhole "receive" command can output "waiting" messages
when key receival or verification are longer than a predefined
timeout:
https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L135

The intent is to have an interactive user experience.

This behavior makes the runtime test unreliable as the test always
expect the sent message as the exact output. When the test execution
is slower, it sometimes get the "waiting" message instead of the
expected message.

Some test jobs are succeeding:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4968059737
while some other are failing.

magic-wormhole can override those timers with environment variables.
See:
https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L26

This commit sets those environment variable to larger values
(100 seconds instread of 1 by default), to make sure the test will
always pass.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4962923235

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python_magic_wormhole.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index abd34bca50..5a0f0277b0 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -50,7 +50,9 @@ class TestPythonPy3MagicWormhole(TestPythonPackageBase):
         cmd += "sleep 25"
         self.assertRunOk(cmd, timeout=30)
 
-        cmd = wormhole_cmd + " receive {}".format(code)
+        wormhole_env = "_MAGIC_WORMHOLE_TEST_KEY_TIMER=100 "
+        wormhole_env += "_MAGIC_WORMHOLE_TEST_VERIFY_TIMER=100 "
+        cmd = wormhole_env + wormhole_cmd + " receive {}".format(code)
         output, exit_code = self.emulator.run(cmd, timeout=35)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], text)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
