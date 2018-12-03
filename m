From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:48:49 +0100
Subject: [Buildroot] [git commit] support/testing: add perl test
Message-ID: <20181203194907.2C7597FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e729bf722b55c1e87939a46cfc2df1c1046deb2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                             |  1 +
 support/testing/tests/package/test_perl.py | 66 ++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd2d5ecad7..8edd96853c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -315,6 +315,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
+tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
new file mode 100644
index 0000000000..033b7cf347
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
+        self.module_test("IO::Handle")
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
