From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:21 +0200
Subject: [Buildroot] [PATCH 3/7] support/testing: add a test for
 BR2_REFPOLICY_EXTRA_MODULES
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-4-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a test for the BR2_REFPOLICY_EXTRA_MODULES
functionality (which allows to select extra modules within the SELinux
refpolicy using Kconfig).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/core/test_selinux.py | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 support/testing/tests/core/test_selinux.py

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
new file mode 100644
index 000000000000..10be30d7913d
--- /dev/null
+++ b/support/testing/tests/core/test_selinux.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestSELinuxInfra(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG +\
+             """
+             BR2_PACKAGE_REFPOLICY=y
+             BR2_PACKAGE_PYTHON3=y
+             BR2_PACKAGE_SETOOLS=y
+             BR2_TARGET_ROOTFS_CPIO=y
+             """
+
+    def base_test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5", kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+class TestSELinuxExtraModules(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_REFPOLICY_EXTRA_MODULES="ntp tor"
+             """
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -t ntpd_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "ntpd_t")
+
+        out, ret = self.emulator.run("seinfo -t tor_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "tor_t")
-- 
2.26.2
