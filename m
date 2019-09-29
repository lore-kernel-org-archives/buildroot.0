From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 29 Sep 2019 14:55:20 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing: add luvi test
In-Reply-To: <20190929125520.16957-1-francois.perrad@gadz.org>
References: <20190929125520.16957-1-francois.perrad@gadz.org>
Message-ID: <20190929125520.16957-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                             |  1 +
 support/testing/tests/package/test_luvi.py | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 support/testing/tests/package/test_luvi.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ecbcbcb78..2f73644e3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -403,6 +403,7 @@ tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
 tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuaLuasyslog: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
+tests.package.test_luvi.TestLuvi: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luvi.py b/support/testing/tests/package/test_luvi.py
new file mode 100644
index 000000000..a85a6f4d2
--- /dev/null
+++ b/support/testing/tests/package/test_luvi.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestLuvi(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUVI=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_PACKAGE_PCRE=y
+        BR2_PACKAGE_ZLIB=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def version_test(self):
+        cmd = "luvi -v"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertIn('luvi', output[0])
+        self.assertIn('zlib', output[1])
+        self.assertIn('rex', output[2])
+        self.assertIn('libuv', output[3])
+        self.assertIn('ssl', output[4])
+
+    def test_run(self):
+        self.login()
+        self.version_test()
-- 
2.20.1
