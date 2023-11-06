Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF72C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB1256129C;
	Mon,  6 Nov 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1256129C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odv2PNCdX0hi; Mon,  6 Nov 2023 19:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB78A61288;
	Mon,  6 Nov 2023 19:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB78A61288
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05B2E1BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C039415D0
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C039415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpLyFKmWo30e for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7DC415A8
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7DC415A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55765869A5; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:43:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4889ac89b8438cfaba0708338fb52d553110c1a1
X-Git-Newrev: 9a81c7a7a4629cc009b05195c9b4e37a582287ea
X-Patchwork-Hint: ignore
Message-Id: <20231106194413.55765869A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a81c7a7a4629cc009b05195c9b4e37a582287ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

timeout = 35 * self.emulator.timeout_multiplier
[...]
        self.assertRunOk(cmd, timeout=timeout)

Gets re-multiplied by self.emulator.timeout_multiplier in self.emulator.run().
Drop multiplying the timeout by self.emulator.timeout_multiplier to fix this
issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
