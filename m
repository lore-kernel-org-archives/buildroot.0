From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 20 Nov 2019 14:39:51 +0100
Subject: [Buildroot] [PATCH v2 1/2] support/testing: add assertRunOk method
 to BRTest class
Message-ID: <20191120133952.22978-1-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This method asserts that the given command ran successfully.
The goal is for it to be used by the different tests when needed.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes
v1 -> v2
[Thomas
 - Moved this function to the BRTest class
 - Removed unnecessary "sh -c"
---
 support/testing/infra/basetest.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index a176bc328a..023039f6af 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -84,3 +84,9 @@ class BRTest(BRConfigTest):
         if self.emulator:
             self.emulator.stop()
         super(BRTest, self).tearDown()
+
+    # Run the given 'cmd' with a 'timeout' on the target and 
+    # assert that the command succeeded
+    def assertRunOk(self, cmd, timeout=-1):
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
-- 
2.17.1
