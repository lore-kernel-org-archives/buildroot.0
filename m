From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:00:44 +0200
Subject: [Buildroot] [git commit] support/testing: add runtime testing for
	read-only systemd
Message-ID: <20170802185639.25C4B821F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd9dfb64eaefb2561d928effdd93bd5bc2c702bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We add the 3 following combinations:

  - basic systemd, read-only, network w/ ifupdown
  - basic systemd, read-only, network w/ networkd
  - full systemd, read-only, network w/ networkd

The tests just verify what the /sbin/init binary is, and that we were
able to grab an IP address. More tests can be added later, for example
to check each systemd features (journal, tmpfiles...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Arnout: regenerate .gitlab-ci.yml]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                     |  3 +
 .../testing/tests/init/systemd-factory/var/foo/bar |  1 +
 support/testing/tests/init/test_systemd.py         | 70 ++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cdae953..9cd52c6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -234,6 +234,9 @@ tests.init.test_busybox.TestInitSystemBusyboxRoNet: *runtime_test
 tests.init.test_busybox.TestInitSystemBusyboxRw: *runtime_test
 tests.init.test_busybox.TestInitSystemBusyboxRwNet: *runtime_test
 tests.init.test_none.TestInitSystemNone: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRoFull: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRoIfupdown: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
diff --git a/support/testing/tests/init/systemd-factory/var/foo/bar b/support/testing/tests/init/systemd-factory/var/foo/bar
new file mode 100644
index 0000000..323fae0
--- /dev/null
+++ b/support/testing/tests/init/systemd-factory/var/foo/bar
@@ -0,0 +1 @@
+foobar
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 7a80aa1..b1b6517 100644
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
