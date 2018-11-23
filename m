From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Nov 2018 05:31:03 +0100
Subject: [Buildroot] [PATCH/next v2 1/8] support/testing: add perl test
In-Reply-To: <20181123043110.5353-1-francois.perrad@gadz.org>
References: <20181123043110.5353-1-francois.perrad@gadz.org>
Message-ID: <20181123043110.5353-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                             |  1 +
 support/testing/tests/package/test_perl.py | 66 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
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
index 000000000..04ec3e5f4
--- /dev/null
+++ b/support/testing/tests/package/test_perl.py
@@ -0,0 +1,66 @@
+import os
+
+import infra.basetest
+
+
+class TestPerlBase(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def module_test(self, module, script="1"):
+        cmd = "perl -M{} -e '{}'".format(module, script)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPerl(TestPerlBase):
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        """
+
+    def version_test(self):
+        cmd = "perl -v"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("This is perl 5", output[1])
+
+    def core_modules_test(self):
+        self.module_test("Cwd")
+        self.module_test("Data::Dumper")
+        self.module_test("Devel::Peek")
+        self.module_test("Digest::MD5")
+        self.module_test("Digest::SHA")
+        self.module_test("Encode")
+        self.module_test("Fcntl")
+        self.module_test("File::Glob")
+        self.module_test("Hash::Util")
+        self.module_test("I18N::Langinfo")
+        self.module_test("IO")
+        self.module_test("IPC::SysV")
+        self.module_test("List::Util")
+        self.module_test("MIME::Base64")
+        self.module_test("POSIX")
+        self.module_test("Socket")
+        self.module_test("Storable")
+        self.module_test("Sys::Hostname")
+        self.module_test("Sys::Syslog")
+        self.module_test("Time::HiRes")
+        self.module_test("Time::Piece")
+        self.module_test("Unicode::Collate")
+        self.module_test("Unicode::Normalize")
+
+    def test_run(self):
+        self.login()
+        self.version_test()
+        self.core_modules_test()
-- 
2.17.1
