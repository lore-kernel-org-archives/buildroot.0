From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 30 Oct 2019 10:32:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add netdata test
In-Reply-To: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
References: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
Message-ID: <20191030093243.2936111-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v1 -> v2:
 - squash DEVELOPERS entry from another commit (suggested by Arnout)

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_netdata.py | 35 +++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 support/testing/tests/package/test_netdata.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d71257a20..2e164d8800 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -411,6 +411,7 @@ tests.package.test_luasyslog.TestLuaLuasyslog: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
 tests.package.test_luvi.TestLuvi: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
+tests.package.test_netdata.TestNetdata: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 515626517f..8658686023 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1460,6 +1460,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/test_netdata.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
 F:	package/libostree/
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
new file mode 100644
index 0000000000..b5437ba3fe
--- /dev/null
+++ b/support/testing/tests/package/test_netdata.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestNetdata(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NETDATA=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        cmd = "mkdir -p /var/cache/netdata"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "netdata -u root -p 80"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "sleep 1"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "wget localhost -O - | grep '<title>netdata dashboard</title>'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
-- 
2.23.0
