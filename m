From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  3 Feb 2020 17:30:50 +0100
Subject: [Buildroot] [PATCH v4 2/2] support/testing: add netdata test
In-Reply-To: <20200203163050.4071698-1-m.niestroj@grinn-global.com>
References: <20200203163050.4071698-1-m.niestroj@grinn-global.com>
Message-ID: <20200203163050.4071698-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v3 -> v4:
 - do not launch netdata explicitly, but rely on init script to run netdata on
   default port

changes v2 -> v3: none

changes v1 -> v2:
 - squash DEVELOPERS entry from another commit (suggested by Arnout)

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_netdata.py | 23 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/test_netdata.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d5a2a06b6e..98d6995d7e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -414,6 +414,7 @@ tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
 tests.package.test_luvi.TestLuvi: { extends: .runtime_test }
 tests.package.test_lxc.TestLxc: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
+tests.package.test_netdata.TestNetdata: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 25e8c5849a..ca5e6e2b36 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1532,6 +1532,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/test_netdata.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
 F:	package/libostree/
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
new file mode 100644
index 0000000000..7418b762a4
--- /dev/null
+++ b/support/testing/tests/package/test_netdata.py
@@ -0,0 +1,23 @@
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
+        cmd = "wget localhost:19999 -O - | grep '<title>netdata dashboard</title>'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
-- 
2.24.1
