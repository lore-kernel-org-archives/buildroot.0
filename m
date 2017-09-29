From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 28 Sep 2017 23:27:13 -0300
Subject: [Buildroot] [PATCH 5/5] testing/tests/init: use lowercase method
	names
In-Reply-To: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
Message-ID: <20170929022713.2967-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use method naming convention from PEP8 as other test cases already do.

sed \
  -e 's,startEmulator,start_emulator,g' \
  -e 's,checkInit,check_init,g' \
  -e 's,checkNetwork,check_network,g' \
  -i support/testing/tests/init/*.py

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
0 warnings from flake8
---
 support/testing/tests/init/base.py         |  6 ++---
 support/testing/tests/init/test_busybox.py | 28 ++++++++++-----------
 support/testing/tests/init/test_none.py    |  4 +--
 support/testing/tests/init/test_systemd.py | 40 +++++++++++++++---------------
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 3764d6ab95..1f9e33b620 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -5,7 +5,7 @@ import infra.basetest
 
 class InitSystemBase(infra.basetest.BRTest):
 
-    def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
+    def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
         img = os.path.join(self.builddir, "images", "rootfs." + fs_type)
         subprocess.call(["truncate", "-s", "%1M", img])
 
@@ -37,12 +37,12 @@ class InitSystemBase(infra.basetest.BRTest):
         if init is None:
             self.emulator.login()
 
-    def checkInit(self, path):
+    def check_init(self, path):
         cmd = "cmp /proc/1/exe {}".format(path)
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-    def checkNetwork(self, interface, exitCode=0):
+    def check_network(self, interface, exitCode=0):
         cmd = "ip addr show {} |grep inet".format(interface)
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, exitCode)
diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
index 6c75f685ad..3be4dea35f 100644
--- a/support/testing/tests/init/test_busybox.py
+++ b/support/testing/tests/init/test_busybox.py
@@ -8,8 +8,8 @@ class InitSystemBusyboxBase(InitSystemBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
-    def checkInit(self):
-        super(InitSystemBusyboxBase, self).checkInit("/bin/busybox")
+    def check_init(self):
+        super(InitSystemBusyboxBase, self).check_init("/bin/busybox")
 
 
 class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
@@ -20,9 +20,9 @@ class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
         """
 
     def test_run(self):
-        self.startEmulator("squashfs")
-        self.checkInit()
-        self.checkNetwork("eth0", 1)
+        self.start_emulator("squashfs")
+        self.check_init()
+        self.check_network("eth0", 1)
 
 
 class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
@@ -32,9 +32,9 @@ class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
         """
 
     def test_run(self):
-        self.startEmulator("ext2")
-        self.checkInit()
-        self.checkNetwork("eth0", 1)
+        self.start_emulator("ext2")
+        self.check_init()
+        self.check_network("eth0", 1)
 
 
 class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
@@ -46,9 +46,9 @@ class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
         """
 
     def test_run(self):
-        self.startEmulator("squashfs")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("squashfs")
+        self.check_init()
+        self.check_network("eth0")
 
 
 class TestInitSystemBusyboxRwNet(InitSystemBusyboxBase):
@@ -59,6 +59,6 @@ class TestInitSystemBusyboxRwNet(InitSystemBusyboxBase):
         """
 
     def test_run(self):
-        self.startEmulator("ext2")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("ext2")
+        self.check_init()
+        self.check_network("eth0")
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index 22e4850853..49ea3b276a 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -13,7 +13,7 @@ class TestInitSystemNone(InitSystemBase):
         """
 
     def test_run(self):
-        self.startEmulator(fs_type="squashfs", init="/bin/sh")
+        self.start_emulator(fs_type="squashfs", init="/bin/sh")
         index = self.emulator.qemu.expect(["/bin/sh: can't access tty; "
                                            "job control turned off",
                                            pexpect.TIMEOUT], timeout=60)
@@ -32,4 +32,4 @@ class TestInitSystemNone(InitSystemBase):
         _, exit_code = self.emulator.run("mount -t proc none /proc")
         self.assertEqual(exit_code, 0)
 
-        self.checkInit("/bin/sh")
+        self.check_init("/bin/sh")
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 77d734895b..48fac1490f 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -18,8 +18,8 @@ class InitSystemSystemdBase(InitSystemBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
-    def checkInit(self):
-        super(InitSystemSystemdBase, self).checkInit("/lib/systemd/systemd")
+    def check_init(self):
+        super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
 
 
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
@@ -32,9 +32,9 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """.format(infra.filepath("tests/init/systemd-factory"))
 
     def test_run(self):
-        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
 
         # This one must be executed on the target, to check that
         # the factory feature works as expected
@@ -51,9 +51,9 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
 
 
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
@@ -66,9 +66,9 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
 
 
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
@@ -81,9 +81,9 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
 
 
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
@@ -112,9 +112,9 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
 
 
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
@@ -142,6 +142,6 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.checkInit()
-        self.checkNetwork("eth0")
+        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+        self.check_network("eth0")
-- 
2.13.0
