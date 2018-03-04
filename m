From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 21:10:23 +0100
Subject: [Buildroot] [git commit] support/tests: enhance the runtime systemd
 tests
Message-ID: <20180304202312.A44F181513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69781ebb509c835cad7b6cd12ea37cb8296fb64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent systemd bump has broken DBus dameon and DBus applications can no
longer find the daemon. So we want to catch those kind of failures
early.

We also want to check that the system as a whole is stable: no unit
should be failed.

Finally, ensure that we can read the jounrnal, even when we are doing our
tricks on read-only systems.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_systemd.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 48fac1490f..a324ba8569 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -21,6 +21,18 @@ class InitSystemSystemdBase(InitSystemBase):
     def check_init(self):
         super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
 
+        # Test all units are OK
+        output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
+        self.assertEqual(len(output), 0)
+
+        # Test we can reach the DBus daemon
+        _, exit_code = self.emulator.run("busctl --no-pager")
+        self.assertEqual(exit_code, 0)
+
+        # Test we can read at least one line from the journal
+        output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
+        self.assertEqual(len(output), 1)
+
 
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
