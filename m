From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:33:04 +0200
Subject: [Buildroot] [git commit] support/testing: test_syslog_ng: improve
 commands
Message-ID: <20191016192721.92C6F8E25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3c4a9e1cde3a305058ff46a3afc4e0e32a7c42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need for double grep, so choose a better regexp. Use &&
instead of ; between commands so the sequence of commands fail faster.

Break the last sequence of commands in 2 calls run() so the proper
return code can be tested for each.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_syslog_ng.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index 6cc7c18945..3fb0be5fb8 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -19,18 +19,20 @@ class TestSyslogNg(infra.basetest.BRTest):
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
-        cmd = "grep syslog-ng /var/log/messages | grep starting"
+        cmd = "grep 'syslog-ng starting' /var/log/messages"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-        cmd = "logger my-message;"
-        cmd += "sleep 1;"
+        cmd = "logger my-message && "
+        cmd += "sleep 1 && "
         cmd += "grep my-message /var/log/messages"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-        cmd = "syslog-ng-ctl reload;"
-        cmd += "sleep 1;"
-        cmd += "grep syslog-ng /var/log/messages | grep -i warning"
+        cmd = "syslog-ng-ctl reload && "
+        cmd += "sleep 1"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        cmd = "grep -i 'syslog-ng.*warning' /var/log/messages"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
