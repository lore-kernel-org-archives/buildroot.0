From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add luasec test
Message-ID: <20190328161637.634F687F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97032e2f4fbd7f087c52461552031789e99e938e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                               |  2 ++
 support/testing/tests/package/test_luasec.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5d04d2b985..36603cb1b3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -342,6 +342,8 @@ tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test
 tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
 tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
 tests.package.test_luaossl.TestLuajitLuaossl: { extends: .runtime_test }
+tests.package.test_luasec.TestLuaLuaSec: { extends: .runtime_test }
+tests.package.test_luasec.TestLuajitLuaSec: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luasec.py b/support/testing/tests/package/test_luasec.py
new file mode 100644
index 0000000000..f87326362d
--- /dev/null
+++ b/support/testing/tests/package/test_luasec.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaSec(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUASEC=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("ssl")
+
+
+class TestLuajitLuaSec(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUASEC=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("ssl")
