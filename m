Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA84C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB982843DF;
	Sat, 17 Sep 2022 21:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB982843DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36-iyYYE_YU5; Sat, 17 Sep 2022 21:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 049EF843BA;
	Sat, 17 Sep 2022 21:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049EF843BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 603D81BF96B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37627843BA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37627843BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYdoQhkvL06a for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C98182730
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C98182730
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34ED4846CE; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 23:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d8d60ee36fe2b509f12e81584aa9a5dfd77e62
X-Git-Newrev: 2040961b48ea2d7f35b5cdd7de0deca36c9c65cb
X-Patchwork-Hint: ignore
Message-Id: <20220917213624.34ED4846CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: test
 /usr/share/polkit-1/rules.d
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

commit: https://git.buildroot.net/buildroot/commit/?id=2040961b48ea2d7f35b5cdd7de0deca36c9c65cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Polkit has two directories that are used to store rules.
Add the second directory to the existing tests, to ensure
that both work in the future.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_polkit.py | 56 ++++++++++++++++++----------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 502d38d13e..3da63c437b 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -15,6 +15,10 @@ class TestPolkitInfra(infra.basetest.BRTest):
         BR2_PACKAGE_POLKIT=y
         BR2_PACKAGE_POLKIT_RULES_TEST=y
         """
+    rule_paths = [
+        "/etc/polkit-1/rules.d",
+        "/usr/share/polkit-1/rules.d"
+    ]
 
     def base_test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -36,17 +40,23 @@ class TestPolkitSystemd(TestPolkitInfra):
     def test_run(self):
         TestPolkitInfra.base_test_run(self)
 
-        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 1)
+        rule_file = "systemd-timesyncd-restart.rules"
+        for rule_path in TestPolkitInfra.rule_paths:
+            cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 1)
 
-        cmd = "mv /root/systemd-timesyncd-restart.rules /etc/polkit-1/rules.d"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
-        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
+
+            cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
 
 class TestPolkitInitd(TestPolkitInfra):
@@ -55,16 +65,22 @@ class TestPolkitInitd(TestPolkitInfra):
     def test_run(self):
         TestPolkitInfra.base_test_run(self)
 
-        cmd = "su brtest -c 'pkexec hello-polkit'"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 127)
-        self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+        rule_file = "hello-polkit.rules"
+        for rule_path in TestPolkitInfra.rule_paths:
+            cmd = "su brtest -c 'pkexec hello-polkit'"
+            output, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 127)
+            self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+
+            cmd = "cp /root/{file} {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
-        cmd = "mv /root/hello-polkit.rules /etc/polkit-1/rules.d/hello-polkit.rules"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "su brtest -c 'pkexec hello-polkit'"
+            output, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
+            self.assertEqual(output[0], "Hello polkit!")
 
-        cmd = "su brtest -c 'pkexec hello-polkit'"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "Hello polkit!")
+            cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
