From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add lua-curl test
Message-ID: <20190328161637.4262A81504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f830d891215fee6424ccfadd4f28d119e91acf19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  2 ++
 support/testing/tests/package/test_lua_curl.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 46c86f277b..cca93aa615 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -332,6 +332,8 @@ tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
 tests.package.test_lsqlite3.TestLuajitLsqlite3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
+tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
+tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_curl.py b/support/testing/tests/package/test_lua_curl.py
new file mode 100644
index 0000000000..5ee79313f2
--- /dev/null
+++ b/support/testing/tests/package/test_lua_curl.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuacURL(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_CURL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cURL")
+
+
+class TestLuajitLuacURL(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_CURL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cURL")
