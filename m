From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:39 -0300
Subject: [Buildroot] [PATCH v4] testing/infra: split runtime test from BRTest
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Move the setup of emulator to a new class, RuntimeTestBase, that bahaves
exactly like BRTest currently does.
It will avoid duplicating code when adding a common class to test the
git download infra.

Change all current test cases to use the new class.
Do this by first using automatic replace:
$ find support/testing/ -name '*.py' | \
  xargs grep -l BRTest | \
  xargs sed -i \
    -e 's,import infra.basetest,\0\nimport infra.runtimetest,g' \
    -e 's,infra.basetest.BRTest,infra.runtimetest.RuntimeTestBase,g'
and then manually add code to import runtimetest in test_external.py to
avoid this error:
 AttributeError: 'module' object has no attribute 'LoadTestsFailure'
This explicit import was not need before because run-tests imports
BRTest and this is the only test file that do not use the defconfig
fragments from basetest.py in its code.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
WARNING: this patch changes all current test cases, so if a new test case was
applied after this patch was sent, 'git am' will apply this patch cleanly, yet
any testcase created in the meantime will be broken.
But I can refresh it if need. It will probably only need the automatic replace
from the commit log to be re-run.

Changes v3 -> v4:
  - re-run the automatic replace command

Changes v2 -> v3:
  - new patch
  - search for "RuntimeTestBase" in
    http://patchwork.ozlabs.org/patch/806161/
---
 support/testing/infra/basetest.py                 | 10 ----------
 support/testing/infra/runtimetest.py              | 23 +++++++++++++++++++++++
 support/testing/tests/boot/test_atf.py            |  7 ++++---
 support/testing/tests/core/test_post_scripts.py   |  3 ++-
 support/testing/tests/core/test_rootfs_overlay.py |  3 ++-
 support/testing/tests/core/test_timezone.py       |  7 ++++---
 support/testing/tests/fs/test_ext.py              |  9 +++++----
 support/testing/tests/fs/test_iso9660.py          | 13 +++++++------
 support/testing/tests/fs/test_jffs2.py            |  3 ++-
 support/testing/tests/fs/test_squashfs.py         |  3 ++-
 support/testing/tests/fs/test_ubi.py              |  3 ++-
 support/testing/tests/fs/test_yaffs2.py           |  3 ++-
 support/testing/tests/init/base.py                |  3 ++-
 support/testing/tests/package/test_dropbear.py    |  3 ++-
 support/testing/tests/package/test_python.py      |  3 ++-
 support/testing/tests/package/test_rust.py        |  3 ++-
 support/testing/tests/package/test_syslog_ng.py   |  3 ++-
 support/testing/tests/toolchain/test_external.py  |  3 ++-
 18 files changed, 67 insertions(+), 38 deletions(-)
 create mode 100644 support/testing/infra/runtimetest.py

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index f3f13ad97f..4773312585 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -3,7 +3,6 @@ import os
 import datetime
 
 from infra.builder import Builder
-from infra.emulator import Emulator
 
 BASIC_TOOLCHAIN_CONFIG = \
     """
@@ -41,7 +40,6 @@ class BRTest(unittest.TestCase):
         super(BRTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
-        self.emulator = None
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
@@ -57,17 +55,9 @@ class BRTest(unittest.TestCase):
             self.b.delete()
 
         if not self.b.is_finished():
-            self.show_msg("Building")
             self.b.configure()
-            self.b.build()
-            self.show_msg("Building done")
-
-        self.emulator = Emulator(self.builddir, self.downloaddir,
-                                 self.logtofile, self.timeout_multiplier)
 
     def tearDown(self):
         self.show_msg("Cleaning up")
-        if self.emulator:
-            self.emulator.stop()
         if self.b and not self.keepbuilds:
             self.b.delete()
diff --git a/support/testing/infra/runtimetest.py b/support/testing/infra/runtimetest.py
new file mode 100644
index 0000000000..68bb03d091
--- /dev/null
+++ b/support/testing/infra/runtimetest.py
@@ -0,0 +1,23 @@
+from infra.basetest import BRTest
+from infra.emulator import Emulator
+
+
+class RuntimeTestBase(BRTest):
+    def __init__(self, names):
+        super(RuntimeTestBase, self).__init__(names)
+        self.emulator = None
+
+    def setUp(self):
+        super(RuntimeTestBase, self).setUp()
+        if not self.b.is_finished():
+            self.show_msg("Building")
+            self.b.build()
+            self.show_msg("Building done")
+
+        self.emulator = Emulator(self.builddir, self.downloaddir,
+                                 self.logtofile, self.timeout_multiplier)
+
+    def tearDown(self):
+        if self.emulator:
+            self.emulator.stop()
+        super(RuntimeTestBase, self).tearDown()
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 75cea01fc8..0ea486fb5b 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,7 +1,8 @@
 import infra.basetest
+import infra.runtimetest
 
 
-class TestATFVexpress(infra.basetest.BRTest):
+class TestATFVexpress(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_aarch64=y
@@ -25,7 +26,7 @@ class TestATFVexpress(infra.basetest.BRTest):
         pass
 
 
-class TestATFAllwinner(infra.basetest.BRTest):
+class TestATFAllwinner(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_aarch64=y
@@ -54,7 +55,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         pass
 
 
-class TestATFMarvell(infra.basetest.BRTest):
+class TestATFMarvell(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_aarch64=y
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index a0e5b6b454..c4dfb91550 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -2,9 +2,10 @@ import os
 import csv
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestPostScripts(infra.basetest.BRTest):
+class TestPostScripts(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_INIT_NONE=y
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
index fedd40d8ac..66b5531221 100644
--- a/support/testing/tests/core/test_rootfs_overlay.py
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -2,13 +2,14 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 
 def compare_file(file1, file2):
     return subprocess.call(["cmp", file1, file2])
 
 
-class TestRootfsOverlay(infra.basetest.BRTest):
+class TestRootfsOverlay(infra.runtimetest.RuntimeTestBase):
 
     rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
 
diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index 050624e0aa..dca38bebe8 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -1,6 +1,7 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
 def boot_armv5_cpio(emulator, builddir):
@@ -10,7 +11,7 @@ def boot_armv5_cpio(emulator, builddir):
         emulator.login()
 
 
-class TestNoTimezone(infra.basetest.BRTest):
+class TestNoTimezone(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         # BR2_TARGET_TZ_INFO is not set
@@ -26,7 +27,7 @@ class TestNoTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "UTC")
 
 
-class TestGlibcAllTimezone(infra.basetest.BRTest):
+class TestGlibcAllTimezone(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_arm=y
@@ -48,7 +49,7 @@ class TestGlibcAllTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "CET")
 
 
-class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
+class TestGlibcNonDefaultLimitedTimezone(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_arm=y
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index f5f9e9fdf1..a8f68bc54c 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -2,6 +2,7 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 VOLNAME_PROP = "Filesystem volume name"
 REVISION_PROP = "Filesystem revision #"
@@ -41,7 +42,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
     return exit_code
 
 
-class TestExt2(infra.basetest.BRTest):
+class TestExt2(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_EXT2=y
@@ -60,7 +61,7 @@ class TestExt2(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-class TestExt2r1(infra.basetest.BRTest):
+class TestExt2r1(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_EXT2=y
@@ -80,7 +81,7 @@ class TestExt2r1(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-class TestExt3(infra.basetest.BRTest):
+class TestExt3(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_EXT2=y
@@ -99,7 +100,7 @@ class TestExt3(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-class TestExt4(infra.basetest.BRTest):
+class TestExt4(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_EXT2=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 68f4840852..77255ac93b 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -1,6 +1,7 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 BASIC_CONFIG = \
     """
@@ -47,7 +48,7 @@ def test_touch_file(emulator):
 # Grub 2
 
 
-class TestIso9660Grub2External(infra.basetest.BRTest):
+class TestIso9660Grub2External(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
@@ -67,7 +68,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
+class TestIso9660Grub2ExternalCompress(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
@@ -88,7 +89,7 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestIso9660Grub2Internal(infra.basetest.BRTest):
+class TestIso9660Grub2Internal(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
@@ -111,7 +112,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
 # Syslinux
 
 
-class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
+class TestIso9660SyslinuxExternal(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
@@ -130,7 +131,7 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
+class TestIso9660SyslinuxExternalCompress(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
@@ -150,7 +151,7 @@ class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
+class TestIso9660SyslinuxInternal(infra.runtimetest.RuntimeTestBase):
     config = BASIC_CONFIG + \
         """
         BR2_TARGET_ROOTFS_ISO9660=y
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index 2ff5099180..8f73cf1f06 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -2,6 +2,7 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 
 def jffs2dump_find_file(files_list, fname):
@@ -12,7 +13,7 @@ def jffs2dump_find_file(files_list, fname):
     return False
 
 
-class TestJffs2(infra.basetest.BRTest):
+class TestJffs2(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_JFFS2=y
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 066c054342..f80149f9d9 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -2,9 +2,10 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestSquashfs(infra.basetest.BRTest):
+class TestSquashfs(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_SQUASHFS=y
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 015d82f769..c724f4f740 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -2,9 +2,10 @@ import subprocess
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestUbi(infra.basetest.BRTest):
+class TestUbi(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_UBIFS=y
diff --git a/support/testing/tests/fs/test_yaffs2.py b/support/testing/tests/fs/test_yaffs2.py
index b60e90e660..c7c8c1f724 100644
--- a/support/testing/tests/fs/test_yaffs2.py
+++ b/support/testing/tests/fs/test_yaffs2.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestYaffs2(infra.basetest.BRTest):
+class TestYaffs2(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         infra.basetest.MINIMAL_CONFIG + \
         """
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 75cfbe9c59..1b736af657 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -1,9 +1,10 @@
 import os
 import subprocess
 import infra.basetest
+import infra.runtimetest
 
 
-class InitSystemBase(infra.basetest.BRTest):
+class InitSystemBase(infra.runtimetest.RuntimeTestBase):
 
     def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
         img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index 8f7f1fee82..8f7f30e3af 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestDropbear(infra.basetest.BRTest):
+class TestDropbear(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 26cf49947b..787364c719 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestPythonBase(infra.basetest.BRTest):
+class TestPythonBase(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 2dc814f99d..df445f1186 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -4,9 +4,10 @@ import subprocess
 import shutil
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestRustBase(infra.basetest.BRTest):
+class TestRustBase(infra.runtimetest.RuntimeTestBase):
 
     target = 'armv7-unknown-linux-gnueabihf'
     crate = 'hello-world'
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index 0155ef14e4..df6ce8b8d0 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestSyslogNg(infra.basetest.BRTest):
+class TestSyslogNg(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 881d2b00db..b72e19f740 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -1,5 +1,6 @@
 import os
 import infra
+import infra.runtimetest
 
 BASIC_CONFIG = \
     """
@@ -17,7 +18,7 @@ def has_broken_links(path):
     return False
 
 
-class TestExternalToolchain(infra.basetest.BRTest):
+class TestExternalToolchain(infra.runtimetest.RuntimeTestBase):
     def common_check(self):
         # Check for broken symlinks
         for d in ["lib", "usr/lib"]:
-- 
2.14.1
