Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E81C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C24B41C31;
	Wed,  3 Aug 2022 16:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C24B41C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSa9UO30THTs; Wed,  3 Aug 2022 16:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA4B541C2B;
	Wed,  3 Aug 2022 16:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA4B541C2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0FF1BF9B9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19F68828B5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F68828B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Q5SZp8XTAf4 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:35:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C27D80C0E
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C27D80C0E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C66F686D64; Wed,  3 Aug 2022 16:21:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 18:34:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e80d68dd1545d193886501953b284b0f2fad145c
X-Git-Newrev: 3dceb0402a0647136393cedd93b49287dae9cc6c
X-Patchwork-Hint: ignore
Message-Id: <20220803162105.C66F686D64@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_scipy: relax timeout value
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dceb0402a0647136393cedd93b49287dae9cc6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Importing the scipy module in the Python interpreter running in Qemu
takes quite a while on slow machine, so a timeout extension to 30
seconds is needed to make sure the test has the time to run.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_scipy.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index fec4f4319f..007bc9ffa5 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -20,6 +20,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_scipy.py"]
+    timeout = 30
 
     def login(self):
         ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
