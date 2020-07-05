From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2020 12:23:37 +0200
Subject: [Buildroot] [PATCH 3/4 v4] support/testsuite: de-duplicate the
 systemd runtime tests
In-Reply-To: <cover.1593944605.git.yann.morin.1998@free.fr>
References: <cover.1593944605.git.yann.morin.1998@free.fr>
Message-ID: <fe0649504adbfce62eba10fdd3019b3974ea186a.1593944605.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Of all the systemd init tests, only one does some additional tests, and
for just this lone wolf, we duplicate the test function.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/init/test_systemd.py | 32 ++++++++--------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 371be4ad7d..cf952bef44 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -21,8 +21,9 @@ class InitSystemSystemdBase(InitSystemBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
 
-    def check_init(self):
-        super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
+    def check_systemd(self, fs):
+        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
         output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
@@ -36,6 +37,9 @@ class InitSystemSystemdBase(InitSystemBase):
         output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
         self.assertEqual(len(output), 1)
 
+        # Check the network is up
+        self.check_network("eth0")
+
 
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
@@ -47,9 +51,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """.format(infra.filepath("tests/init/systemd-factory"))
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
         # This one must be executed on the target, to check that
         # the factory feature works as expected
@@ -66,9 +68,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
@@ -81,9 +81,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
@@ -96,9 +94,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
@@ -127,9 +123,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
@@ -157,6 +151,4 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
-- 
2.20.1
