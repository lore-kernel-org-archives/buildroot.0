From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:07 +0100
Subject: [Buildroot] [next/testing Lua modules 07/11] support/testing: add
 luafilesystem test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/test_luafilesystem.py       | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_luafilesystem.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f96f7f130..a73d6b7d0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -338,6 +338,8 @@ tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
+tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test }
+tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luafilesystem.py b/support/testing/tests/package/test_luafilesystem.py
new file mode 100644
index 000000000..a84c1f300
--- /dev/null
+++ b/support/testing/tests/package/test_luafilesystem.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaFileSystem(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAFILESYSTEM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lfs")
+
+
+class TestLuajitLuaFileSystem(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAFILESYSTEM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lfs")
-- 
2.17.1
