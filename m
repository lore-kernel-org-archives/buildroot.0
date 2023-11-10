Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240FCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 11:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5321838C9;
	Fri, 10 Nov 2023 11:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5321838C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZodjEwyBzYl; Fri, 10 Nov 2023 11:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2393083883;
	Fri, 10 Nov 2023 11:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2393083883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAB91BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D87400CE
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D87400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzQVeG4QS5aT for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB5F400DD
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB5F400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C26E86EE8; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 12:50:32 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c9e4f18658ecc07c78492cea0d3e644ba9313f1d
X-Git-Newrev: 8e407fcc2b43a0cbbc6db8b205cc14be394d9825
X-Patchwork-Hint: ignore
Message-Id: <20231110115336.7C26E86EE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e407fcc2b43a0cbbc6db8b205cc14be394d9825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
