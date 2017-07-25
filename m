From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:35 +0200
Subject: [Buildroot] [PATCH 14/14 v4] support/testing: add runtime testing
	for read-only systemd
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <bcdaf713d6a72b04818c74b1810db0beac85972b.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We add the 3 following combinations:

  - basic systemd, read-only, network w/ ifupdown
  - basic systemd, read-only, network w/ networkd
  - full systemd, read-only, network w/ networkd

The tests just verify what the /sbin/init binary is, and that we were
able to grab an IP address. More tests can be added later, for example
to check each systemd features (journal, tmpfiles...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../testing/tests/init/systemd-factory/var/foo/bar |  1 +
 support/testing/tests/init/test_systemd.py         | 70 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 support/testing/tests/init/systemd-factory/var/foo/bar

diff --git a/support/testing/tests/init/systemd-factory/var/foo/bar b/support/testing/tests/init/systemd-factory/var/foo/bar
new file mode 100644
index 0000000000..323fae03f4
--- /dev/null
+++ b/support/testing/tests/init/systemd-factory/var/foo/bar
@@ -0,0 +1 @@
+foobar
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 7a80aa1145..b1b6517373 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -22,6 +22,28 @@ class InitSystemSystemdBase(InitSystemBase):
 
 
 #-------------------------------------------------------------------------------
+class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """.format(infra.filepath("tests/init/systemd-factory"))
+
+    def test_run(self):
+        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+        # This one must be executed on the target, to check that
+        # the factory feature works as expected
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -36,6 +58,22 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
 
 
 #-------------------------------------------------------------------------------
+class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+
+#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -52,6 +90,38 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
 
 
 #-------------------------------------------------------------------------------
+class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
+        BR2_PACKAGE_SYSTEMD_BINFMT=y
+        BR2_PACKAGE_SYSTEMD_COREDUMP=y
+        BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
+        BR2_PACKAGE_SYSTEMD_HIBERNATE=y
+        BR2_PACKAGE_SYSTEMD_IMPORTD=y
+        BR2_PACKAGE_SYSTEMD_LOCALED=y
+        BR2_PACKAGE_SYSTEMD_LOGIND=y
+        BR2_PACKAGE_SYSTEMD_MACHINED=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
+        BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
+        BR2_PACKAGE_SYSTEMD_RFKILL=y
+        BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
+        BR2_PACKAGE_SYSTEMD_SYSUSERS=y
+        BR2_PACKAGE_SYSTEMD_VCONSOLE=y
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.startEmulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+
+#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
-- 
2.11.0
