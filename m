From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add luaossl test
Message-ID: <20190328161637.5D59687F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2db91b334c7e5cfb0ba7395bdbdcd5e786f3b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  2 ++
 support/testing/tests/package/test_luaossl.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a687b984dc..5d04d2b985 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -340,6 +340,8 @@ tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
 tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test }
 tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
+tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
+tests.package.test_luaossl.TestLuajitLuaossl: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luaossl.py b/support/testing/tests/package/test_luaossl.py
new file mode 100644
index 0000000000..f6914e0544
--- /dev/null
+++ b/support/testing/tests/package/test_luaossl.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaossl(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAOSSL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("openssl")
+
+
+class TestLuajitLuaossl(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAOSSL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("openssl")
