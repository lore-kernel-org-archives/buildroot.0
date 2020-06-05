From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:17:40 +0200
Subject: [Buildroot] [git commit] support/testing: add runtime test for Redis
Message-ID: <20200605222828.3C706811F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc267d7ab4ad40abeb2780eebcfc97253ec173a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_redis.py | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0bf8a73b36..4642c3065c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -514,6 +514,7 @@ tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: { extends: .runtime_te
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy2Ubjson: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy3Ubjson: { extends: .runtime_test }
+tests.package.test_redis.TestRedis: { extends: .runtime_test }
 tests.package.test_rings.TestLuaRings: { extends: .runtime_test }
 tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index e3ac8aa06a..f697c96ce4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2525,6 +2525,7 @@ F:	package/python-avro/
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
