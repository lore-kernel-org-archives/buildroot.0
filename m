From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:25:40 +0100
Subject: [Buildroot] [git commit] support/testing: add netdata test
Message-ID: <20200324212004.70B5488186@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803fc6ad51c1f6580c26f5c8f5480e2eb24aca8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_netdata.py | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 95b75cf14b..6f3e177882 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -426,6 +426,7 @@ tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
 tests.package.test_luvi.TestLuvi: { extends: .runtime_test }
 tests.package.test_lxc.TestLxc: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
+tests.package.test_netdata.TestNetdata: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_opkg.TestOpkg: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 256be1b2b7..1fb4e65755 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1575,6 +1575,7 @@ F:	package/murata-cyw-fw/
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
