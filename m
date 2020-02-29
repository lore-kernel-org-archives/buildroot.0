From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 15:28:28 -0800
Subject: [Buildroot] [PATCH/next 3/3] support/testing: add openrc tests
In-Reply-To: <20200229232829.4177324-1-aduskett@gmail.com>
References: <20200229232829.4177324-1-aduskett@gmail.com>
Message-ID: <20200229232829.4177324-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Two simple tests to ensure that openrc boots without any services crashing
with a read only and a read write filing system.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                            |  2 +
 support/testing/tests/init/test_openrc.py | 51 +++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 support/testing/tests/init/test_openrc.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6436a8417..6717d78367 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -368,6 +368,8 @@ tests.init.test_busybox.TestInitSystemBusyboxRoNet: { extends: .runtime_test }
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
index 0000000000..23669a9572
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
+        super(InitSystemOpenrcBase, self)
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
-- 
2.24.1
