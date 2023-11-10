Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADB8C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 11:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282E68305A;
	Fri, 10 Nov 2023 11:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 282E68305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lh7NSX2vC6qQ; Fri, 10 Nov 2023 11:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D38183947;
	Fri, 10 Nov 2023 11:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D38183947
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 609E41BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED5A418D2
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED5A418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFBF-uhk4Xty for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 11:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C0E3418C4
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C0E3418C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E20C86EFF; Fri, 10 Nov 2023 11:54:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 12:49:57 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8208fbb393e53e68ebf9e956447dfec5d4989e33
X-Git-Newrev: fc4bccfa25fd0456ba45f636b61a2f40479c91ac
X-Patchwork-Hint: ignore
Message-Id: <20231110115443.0E20C86EFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 support/testing/tests/package/test_python_django.py: fix timeout
 calculation.
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc4bccfa25fd0456ba45f636b61a2f40479c91ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

timeout = 35 * self.emulator.timeout_multiplier
[...]
        self.assertRunOk(cmd, timeout=timeout)

Gets re-multiplied by self.emulator.timeout_multiplier in self.emulator.run().
Drop multiplying the timeout by self.emulator.timeout_multiplier to fix this
issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a81c7a7a4629cc009b05195c9b4e37a582287ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_django.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 0b7d35bb6a..e1ca50f6d8 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -6,7 +6,7 @@ class TestPythonDjango(TestPythonPackageBase):
     sample_scripts = ["tests/package/sample_python_django.py"]
 
     def run_sample_scripts(self):
-        timeout = 35 * self.emulator.timeout_multiplier
+        timeout = 35
 
         cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
         self.assertRunOk(cmd, timeout=timeout)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
