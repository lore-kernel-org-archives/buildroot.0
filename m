From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  2 Jun 2020 12:40:09 +0200
Subject: [Buildroot] [PATCH v2 2/4] support/testing: add runtime test for
 Redis
In-Reply-To: <20200602104011.837-1-titouan.christophe@railnova.eu>
References: <20200602104011.837-1-titouan.christophe@railnova.eu>
Message-ID: <20200602104011.837-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_redis.py | 24 +++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/test_redis.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..a3800d4ba1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -513,6 +513,7 @@ tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: { extends: .runtime_te
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy2Ubjson: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy3Ubjson: { extends: .runtime_test }
+tests.package.test_redis.TestRedis: { extends: .runtime_test }
 tests.package.test_rings.TestLuaRings: { extends: .runtime_test }
 tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index efb97c739c..ae46331c63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2521,6 +2521,7 @@ F:	package/python-avro/
 F:	package/redis/
 F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
+F:	support/testing/tests/package/test_redis.py
 
 N:	Trent Piepho <tpiepho@impinj.com>
 F:	package/libp11/
diff --git a/support/testing/tests/package/test_redis.py b/support/testing/tests/package/test_redis.py
new file mode 100644
index 0000000000..d79998514e
--- /dev/null
+++ b/support/testing/tests/package/test_redis.py
@@ -0,0 +1,24 @@
+import os
+
+import infra.basetest
+
+
+class TestRedis(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_REDIS=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        _, exit_code = self.emulator.run("redis-cli SET hello world")
+        self.assertEqual(exit_code, 0)
+
+        output, exit_code = self.emulator.run("redis-cli GET hello")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), '"world"')
-- 
2.25.3
