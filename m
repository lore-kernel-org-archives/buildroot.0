From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 18:50:38 +0100
Subject: [Buildroot] [git commit] support/testing: add openrc tests
Message-ID: <20200311173839.E75C290955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23d343330291d16d75ac42d70f1e285774d8f373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two simple tests to ensure that openrc boots without any services crashing
with a read only and a read write filing system.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998 at free.fr: really check the init process]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                            |  2 ++
 support/testing/tests/init/test_openrc.py | 51 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d45b0a203b..abd9dab250 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -369,6 +369,8 @@ tests.init.test_busybox.TestInitSystemBusyboxRoNet: { extends: .runtime_test }
 tests.init.test_busybox.TestInitSystemBusyboxRw: { extends: .runtime_test }
 tests.init.test_busybox.TestInitSystemBusyboxRwNet: { extends: .runtime_test }
 tests.init.test_none.TestInitSystemNone: { extends: .runtime_test }
+tests.init.test_openrc.TestInitSystemOpenrcRoFull: { extends: .runtime_test }
+tests.init.test_openrc.TestInitSystemOpenrcRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoIfupdown: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: { extends: .runtime_test }
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
new file mode 100644
index 0000000000..7db4c34119
--- /dev/null
+++ b/support/testing/tests/init/test_openrc.py
@@ -0,0 +1,51 @@
+import infra.basetest
+from tests.init.base import InitSystemBase as InitSystemBase
+
+
+class InitSystemOpenrcBase(InitSystemBase):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_OPENRC=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.5.7"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_init(self):
+        super(InitSystemOpenrcBase, self).check_init('/sbin/openrc-init')
+
+        # Test all services are OK
+        output, _ = self.emulator.run("rc-status -c")
+        self.assertEqual(len(output), 0)
+
+
+class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
+
+
+class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.check_init()
