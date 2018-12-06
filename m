From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:37:10 +0100
Subject: [Buildroot] [git commit] support/testing: add lua test
Message-ID: <20181206220522.D55EC85A8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcfbf6437a67199916af9098f3cd38bd5d6c453c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                            |  2 ++
 support/testing/tests/package/test_lua.py | 59 +++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 67f5da6839..a7edaddf3d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -315,6 +315,8 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
+tests.package.test_lua.TestLua: *runtime_test
+tests.package.test_lua.TestLuajit: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: *runtime_test
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
new file mode 100644
index 0000000000..77358ba138
--- /dev/null
+++ b/support/testing/tests/package/test_lua.py
@@ -0,0 +1,59 @@
+import os
+
+import infra.basetest
+
+
+class TestLuaBase(infra.basetest.BRTest):
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
+    def version_test(self, version):
+        cmd = "lua -v"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(version, output[0])
+
+    def g_version_test(self, expected):
+        cmd = "lua -e 'print(_G._VERSION)'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], expected)
+
+    def module_test(self, module, script="a=1"):
+        cmd = "lua -l {} -e '{}'".format(module, script)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestLua(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test('Lua 5.3')
+        self.g_version_test('Lua 5.3')
+
+
+class TestLuajit(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test('LuaJIT 2')
+        self.g_version_test('Lua 5.1')
