From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 22:34:53 +0100
Subject: [Buildroot] [git commit branch/next] support/testing: add
 assertRunOk method to BRTest class
Message-ID: <20191120220403.F376B8F488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63966e56a3cd83df36c6357be9e48608e95dac54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This method asserts that the given command ran successfully.
The goal is for it to be used by the different tests when needed.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
