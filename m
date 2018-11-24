From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Nov 2018 10:07:53 +0100
Subject: [Buildroot] [PATCH/next 2/3] support/testing; add prosody test
In-Reply-To: <20181124090754.14775-1-francois.perrad@gadz.org>
References: <20181124090754.14775-1-francois.perrad@gadz.org>
Message-ID: <20181124090754.14775-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 +
 support/testing/tests/package/test_prosody.py | 48 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 support/testing/tests/package/test_prosody.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bc5970f1d..944f4b226 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -321,6 +321,8 @@ tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_perl_x10.TestPerlX10: *runtime_test
 tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: *runtime_test
+tests.package.test_prosody.TestLua51Prosody: *runtime_test
+tests.package.test_prosody.TestLuajitProsody: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_prosody.py b/support/testing/tests/package/test_prosody.py
new file mode 100644
index 000000000..8ef8ff95f
--- /dev/null
+++ b/support/testing/tests/package/test_prosody.py
@@ -0,0 +1,48 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestProsody(TestLuaBase):
+    def lua_dependencies_test(self):
+        self.module_test('bit')     # luabitop
+        self.module_test('lfs')     # luafilesystem
+        self.module_test('lxp')     # luaexpat
+        self.module_test('socket')  # luasocket
+        self.module_test('ssl')     # luasec
+
+    def prosody_test(self):
+        # prosody was launched as service
+        cmd = "prosodyctl status"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Prosody is running", output[0])
+
+
+class TestProsodyLua51(TestProsody):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_1=y
+        BR2_PACKAGE_PROSODY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test('Lua 5.1')
+        self.g_version_test('Lua 5.1')
+        self.lua_dependencies_test()
+        self.prosody_test()
+
+
+class TestProsodyLuajit(TestProsody):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_PROSODY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test('LuaJIT 2')
+        self.g_version_test('Lua 5.1')
+        self.lua_dependencies_test()
+        self.prosody_test()
-- 
2.17.1
