From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add luasocket test
Message-ID: <20190328161637.6943487F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ad1a47f9f67924ad724c7ebbc92a4fc07718296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                  |  2 ++
 support/testing/tests/package/test_luasocket.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36603cb1b3..4197b4d0b1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -344,6 +344,8 @@ tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
 tests.package.test_luaossl.TestLuajitLuaossl: { extends: .runtime_test }
 tests.package.test_luasec.TestLuaLuaSec: { extends: .runtime_test }
 tests.package.test_luasec.TestLuajitLuaSec: { extends: .runtime_test }
+tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
+tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luasocket.py b/support/testing/tests/package/test_luasocket.py
new file mode 100644
index 0000000000..c2d19d78c9
--- /dev/null
+++ b/support/testing/tests/package/test_luasocket.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaSocket(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUASOCKET=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("socket")
+
+
+class TestLuajitLuaSocket(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUASOCKET=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("socket")
