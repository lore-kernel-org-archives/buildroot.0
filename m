From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Nov 2018 18:52:41 +0100
Subject: [Buildroot] [RFC 1/4] support/testing: add perl test
In-Reply-To: <20181117175244.23594-1-francois.perrad@gadz.org>
References: <20181117175244.23594-1-francois.perrad@gadz.org>
Message-ID: <20181117175244.23594-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                             |  1 +
 support/testing/tests/package/test_perl.py | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0dfb3537c..ae5d57026 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -312,6 +312,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
+tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
new file mode 100644
index 000000000..4f6e69075
--- /dev/null
+++ b/support/testing/tests/package/test_perl.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestPerl(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_PERL=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def version_test(self, timeout=-1):
+        cmd = "perl -v"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def module_test(self, module, script="1", timeout=-1):
+        cmd = "perl -M{} -e '{}'".format(module, script)
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        self.login()
+        self.version_test()
-- 
2.17.1
