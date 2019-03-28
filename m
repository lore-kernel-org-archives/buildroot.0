From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add luafilesystem test
Message-ID: <20190328161637.56B8287F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a3a661303c0518226ce2000ed73055efc10ac7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/test_luafilesystem.py    | 25 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 83e2049139..a687b984dc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -338,6 +338,8 @@ tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
+tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test }
+tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luafilesystem.py b/support/testing/tests/package/test_luafilesystem.py
new file mode 100644
index 0000000000..a84c1f300c
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
