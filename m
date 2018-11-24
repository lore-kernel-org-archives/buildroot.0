From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Nov 2018 10:07:52 +0100
Subject: [Buildroot] [PATCH/next 1/3] support/testing: add lua test
In-Reply-To: <20181124090754.14775-1-francois.perrad@gadz.org>
References: <20181124090754.14775-1-francois.perrad@gadz.org>
Message-ID: <20181124090754.14775-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                            |  2 +
 support/testing/tests/package/test_lua.py | 59 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b7114f5dc..bc5970f1d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -312,6 +312,8 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
+tests.package.test_lua.TestLua: *runtime_test
+tests.package.test_lua.TestLuajit: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
new file mode 100644
index 000000000..77358ba13
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
-- 
2.17.1
