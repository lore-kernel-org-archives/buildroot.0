From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit]
 support/testing/tests/core/test_selinux.py: new test for
 BR2_REFPOLICY_EXTRA_MODULES
Message-ID: <20201006132255.F3C998EB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e383f2835f4ee765be3b57d164cda4a63662bd31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a test for the BR2_REFPOLICY_EXTRA_MODULES
functionality (which allows to select extra modules within the SELinux
refpolicy using Kconfig).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/core/test_selinux.py | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3aed57dbc5..ba96174670 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/gnuplot/
 
 N:	Antoine T??nart <antoine.tenart@bootlin.com>
 F:	package/wf111/
+F:	support/testing/tests/core/test_selinux.py
 F:	support/testing/tests/init/test_systemd_selinux/
 F:	support/testing/tests/init/test_systemd_selinux.py
 
diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
new file mode 100644
index 0000000000..10be30d791
--- /dev/null
+++ b/support/testing/tests/core/test_selinux.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestSELinuxInfra(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG +\
+             """
+             BR2_PACKAGE_REFPOLICY=y
+             BR2_PACKAGE_PYTHON3=y
+             BR2_PACKAGE_SETOOLS=y
+             BR2_TARGET_ROOTFS_CPIO=y
+             """
+
+    def base_test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5", kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+class TestSELinuxExtraModules(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_REFPOLICY_EXTRA_MODULES="ntp tor"
+             """
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -t ntpd_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "ntpd_t")
+
+        out, ret = self.emulator.run("seinfo -t tor_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "tor_t")
