Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83293EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 211256113B;
	Thu,  6 Jul 2023 20:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 211256113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIm5YCk_c-pR; Thu,  6 Jul 2023 20:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A11F61127;
	Thu,  6 Jul 2023 20:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A11F61127
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7A691BF4DB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1AFF60C19
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1AFF60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHlIg5EDswjh for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 20:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F95160A82
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F95160A82
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 20:19:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2155213F84C;
 Thu,  6 Jul 2023 22:19:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 22:19:15 +0200
Message-ID: <20230706201917.284060-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706201917.284060-1-ju.o@free.fr>
References: <20230706201917.284060-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688674776;
 bh=xUU+bm+qZrT5z3IKQuRzY4IQuLdE3F8bsOHLjeYncaw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z2QcqqyGxXQjbqelR9PiDa82EF+iGRIMC0VqNkeqjP6tWBoiwhX3VhHHz+KOqNsNX
 MlNKosSmrAtLOkK+d+jM2f/h3/4zrEIlDoYYUS1KRaYpJcNqITWf9WwFPckKu5HTXG
 u5Us573Z520+wL1LIVxJ/GSHtJ+YBHLkwVXWW989tGAFk29Ha0WPZ3vlijrZRgEleK
 b8aQoriPayfRmpFfeqWBhSDfeRRjrjqvw0Gltw4NFoZEc/X7CI95MRWdhAzYh9aWQB
 08uWh02n3pzuH4g8UiaNU/iKnomVZhT7mAnYjn9e97VuOfPgY/eAXZA843GDb7ayjW
 gZ56+4LXxNVvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z2QcqqyG
Subject: [Buildroot] [PATCH v3 2/4]
 support/testing/tests/package/test_bash.py: do not read startup files
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit:
"support/testing/infra/emulator.py: change the shell prompt before running tests"
changed the prompt before running tests.

When bash is invoked as a login shell in this test, it will read
system-wide configuration files. The "/etc/profile" file, in the
Buildroot filesystem skeleton in "system/skeleton/etc/profile" always
overwrite the PS1 prompt variable. Since the prompt set in the
emulator is different than the one in the system skeleton, the test
fails.

This commit adds the "--noprofile --norc" options when invoking "bash"
to make sure the PS1 prompt variable will not be overwritten, and will
rather be inherited from the calling shell.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This is a new patch in this v3 series to fix the bash runtime test, as
reported by Yann in:
https://lists.buildroot.org/pipermail/buildroot/2023-June/669510.html
---
 support/testing/tests/package/test_bash.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
index f0ee8cadc1..2a25da13e7 100644
--- a/support/testing/tests/package/test_bash.py
+++ b/support/testing/tests/package/test_bash.py
@@ -27,7 +27,9 @@ class TestBash(infra.basetest.BRTest):
         out, _ = self.emulator.run('echo "${BASH}"')
         self.assertEqual(out[0], "", "Already running bash instead of busybox' sh")
 
-        self.assertRunOk("bash -il")
+        # We disable profile/rc files to avoid overwriting PS1 prompt.
+        # The new bash process will inherit PS1 from the caller shell.
+        self.assertRunOk("bash --noprofile --norc -il")
         # Twist! The above command is still runing, it's just that
         # bash did display the prompt we expect. Check we are indeed
         # actually bash
@@ -41,7 +43,7 @@ class TestBash(infra.basetest.BRTest):
         self.assertEqual(out[0], "", "Still running bash instead of busybox' sh")
 
         # Try to run with a non-available locale
-        self.assertRunOk("LC_ALL=en_US bash -il")
+        self.assertRunOk("LC_ALL=en_US bash --noprofile --norc -il")
         out, _ = self.emulator.run('echo "${BASH}"')
         self.assertEqual(out[0], "/bin/bash", "Not running bash")
         self.emulator.run("exit 0")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
