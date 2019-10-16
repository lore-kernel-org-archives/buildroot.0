From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 15 Oct 2019 22:09:50 -0300
Subject: [Buildroot] [PATCH] support/testing: improve commands on syslog-ng
 test
Message-ID: <20191016010950.19189-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need for double grep, so choose a better regexp.
Use && instead of ; between commands so the sequence of commands fail
faster.
Break the last sequence of commands in 2 calls run() so the proper
return code can be tested for each.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/322021813
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
-- 
2.17.1
