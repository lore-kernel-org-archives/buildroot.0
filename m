From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 20 Oct 2018 23:42:54 +0100
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: do runtime tests only on
 explicit trigger
Message-ID: <20181020224254.5895-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the runtime tests were first introduced, they still ran pretty
quickly. Nowadays, however, there are a lot of runtime tests, and some
of them take a really long time. So running them on every push is
really too much.

Just like we do for the defconfigs, run them on explicit trigger only.

The explicit trigger is now done every week, but it can be increased
to e.g. twice or three times per week.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 73 ++++-------------------------------------------
 .gitlab-ci.yml.in |  5 ++++
 2 files changed, 10 insertions(+), 68 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6a2319ba0..d621692ce1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -62,6 +62,11 @@ check-package:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
@@ -261,71 +266,3 @@ zynq_zc706_defconfig: *defconfig
 zynq_zed_defconfig: *defconfig
 zynq_zybo_defconfig: *defconfig
 zynqmp_zcu106_defconfig: *defconfig
-tests.boot.test_atf.TestATFAllwinner: *runtime_test
-tests.boot.test_atf.TestATFMarvell: *runtime_test
-tests.boot.test_atf.TestATFVexpress: *runtime_test
-tests.core.test_file_capabilities.TestFileCapabilities: *runtime_test
-tests.core.test_hardening.TestFortifyConserv: *runtime_test
-tests.core.test_hardening.TestFortifyNone: *runtime_test
-tests.core.test_hardening.TestRelro: *runtime_test
-tests.core.test_hardening.TestRelroPartial: *runtime_test
-tests.core.test_hardening.TestSspNone: *runtime_test
-tests.core.test_hardening.TestSspStrong: *runtime_test
-tests.core.test_post_scripts.TestPostScripts: *runtime_test
-tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
-tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
-tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
-tests.core.test_timezone.TestNoTimezone: *runtime_test
-tests.fs.test_ext.TestExt2: *runtime_test
-tests.fs.test_ext.TestExt2r1: *runtime_test
-tests.fs.test_ext.TestExt3: *runtime_test
-tests.fs.test_ext.TestExt4: *runtime_test
-tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
-tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress: *runtime_test
-tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
-tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
-tests.fs.test_iso9660.TestIso9660SyslinuxExternalCompress: *runtime_test
-tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
-tests.fs.test_jffs2.TestJffs2: *runtime_test
-tests.fs.test_squashfs.TestSquashfs: *runtime_test
-tests.fs.test_ubi.TestUbi: *runtime_test
-tests.fs.test_yaffs2.TestYaffs2: *runtime_test
-tests.init.test_busybox.TestInitSystemBusyboxRo: *runtime_test
-tests.init.test_busybox.TestInitSystemBusyboxRoNet: *runtime_test
-tests.init.test_busybox.TestInitSystemBusyboxRw: *runtime_test
-tests.init.test_busybox.TestInitSystemBusyboxRwNet: *runtime_test
-tests.init.test_none.TestInitSystemNone: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRoFull: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRoIfupdown: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
-tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
-tests.package.test_dropbear.TestDropbear: *runtime_test
-tests.package.test_ipython.TestIPythonPy2: *runtime_test
-tests.package.test_ipython.TestIPythonPy3: *runtime_test
-tests.package.test_python.TestPython2: *runtime_test
-tests.package.test_python.TestPython3: *runtime_test
-tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
-tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
-tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
-tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
-tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
-tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
-tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
-tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
-tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
-tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
-tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
-tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: *runtime_test
-tests.package.test_rust.TestRust: *runtime_test
-tests.package.test_rust.TestRustBin: *runtime_test
-tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
-tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: *runtime_test
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 38e24c8d01..db526c4b5a 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -62,6 +62,11 @@ check-package:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
-- 
2.17.2
