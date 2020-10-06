From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit] support/testing/tests/core/test_selinux:
 new test for BR2_REFPOLICY_EXTRA_MODULES_DIRS
Message-ID: <20201006132256.0A3F68EB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fe09f4cabcd59bd9fb5f46c5160cc17b79377ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a test for the BR2_REFPOLICY_EXTRA_MODULES_DIRS functionality (which
allows to provide custom SELinux modules).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                  |  1 +
 support/testing/tests/core/test_selinux.py                  | 13 +++++++++++++
 .../tests/core/test_selinux/extra_modules/buildroot.fc      |  0
 .../tests/core/test_selinux/extra_modules/buildroot.if      |  1 +
 .../tests/core/test_selinux/extra_modules/buildroot.te      |  3 +++
 5 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ba96174670..53b476501b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/gnuplot/
 
 N:	Antoine T??nart <antoine.tenart@bootlin.com>
 F:	package/wf111/
+F:	support/testing/tests/core/test_selinux/
 F:	support/testing/tests/core/test_selinux.py
 F:	support/testing/tests/init/test_systemd_selinux/
 F:	support/testing/tests/init/test_systemd_selinux.py
diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 10be30d791..9e189d6114 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -34,3 +34,16 @@ class TestSELinuxExtraModules(TestSELinuxInfra):
         out, ret = self.emulator.run("seinfo -t tor_t", 15)
         self.assertEqual(ret, 0)
         self.assertEqual(out[2].strip(), "tor_t")
+
+class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_REFPOLICY_EXTRA_MODULES_DIRS="{}"
+             """.format(infra.filepath("tests/core/test_selinux/extra_modules"))
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -t buildroot_test_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "buildroot_test_t")
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.fc b/support/testing/tests/core/test_selinux/extra_modules/buildroot.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.if b/support/testing/tests/core/test_selinux/extra_modules/buildroot.if
new file mode 100644
index 0000000000..acf797e604
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/extra_modules/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.te b/support/testing/tests/core/test_selinux/extra_modules/buildroot.te
new file mode 100644
index 0000000000..266bc03be0
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/extra_modules/buildroot.te
@@ -0,0 +1,3 @@
+policy_module(buildroot, 1.0.0)
+
+type buildroot_test_t;
