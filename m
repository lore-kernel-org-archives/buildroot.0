From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 18:06:17 +0100
Subject: [Buildroot] [PATCH 3/3] support/tests: enhance the runtime systemd
 tests
In-Reply-To: <cover.1520183159.git.yann.morin.1998@free.fr>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
Message-ID: <12fe4b30ba04733e7c58451fd2e44ca796465db2.1520183159.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent systemd bump has broken DBus dameon and DBus applications can no
longer find the daemon. So we want to catch those kind of failures
early.

We also want to check that the system as a whole is stable: no unit
should be failed.

Finally, ensure that we cn read the jounrnal, even when we are doing our
tricks on read-only systems.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.14.1
