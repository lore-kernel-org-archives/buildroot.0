Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D01C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC51A50309;
	Fri, 28 Feb 2025 17:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzoVNf6DDuAw; Fri, 28 Feb 2025 17:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D59B50815
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D59B50815;
	Fri, 28 Feb 2025 17:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 032EE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5335941489
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdg4CvCqGern for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D5342F64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D5342F64
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A9E85FAE; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 13:57:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5389f9b1a2deb8bcbb0475a6ef853011208c00b0
X-Git-Newrev: c4772ecef6c44ade30f4befb38e32d6dc293aad3
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.92A9E85FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_mender.py: Add a systemd test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4772ecef6c44ade30f4befb38e32d6dc293aad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Move the check for /var/run/mender.pid to before self.run_mender_test()
    for the two tests using sysvinit.

  - Instead of checking for /var/run/mender.pid during the systemd test,
    check to ensure "systemctl is-active mender-client" returns "active"

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: fix flake8 issue]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_mender.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 0938cb77e1..976d03b172 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -20,8 +20,6 @@ class TestMenderInfra(infra.basetest.BRTest):
         self.emulator.login()
 
     def run_mender_test(self):
-        # Check if the Daemon is running
-        self.assertRunOk("ls /var/run/mender.pid")
         self.assertRunOk("ps aux | egrep [m]ender")
 
         # Check if a simple Mender command is correctly executed
@@ -35,6 +33,9 @@ class TestMenderInfra(infra.basetest.BRTest):
 class TestMenderRW(TestMenderInfra):
     def test_run(self):
         TestMenderInfra.base_test_run(self)
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
         self.run_mender_test()
 
 
@@ -47,4 +48,21 @@ class TestMenderRO(TestMenderInfra):
 
     def test_run(self):
         TestMenderInfra.base_test_run(self)
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
+        self.run_mender_test()
+
+
+class TestMenderSystemd(TestMenderInfra):
+    config = \
+        """
+        {}
+        BR2_INIT_SYSTEMD=y
+        """.format(TestMenderInfra.config)
+
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        output, _ = self.emulator.run("systemctl is-active mender-client")
+        self.assertEqual(output[0], "active")
         self.run_mender_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
