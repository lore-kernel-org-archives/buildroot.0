From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 03:26:31 -0600
Subject: [Buildroot] [PATCH v6] testing/infra: split runtime test from BRTest
Message-ID: <1549358791-19797-1-git-send-email-matthew.weber@rockwellcollins.com>
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
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

WARNING: this patch changes all current test cases, so if a new test
case was applied after this patch was sent, 'git am' will apply this
patch cleanly, yet any testcase created in the meantime will be broken.
It will probably only need the automatic replace from the commit log to
be re-run.

Changes v5 -> v6:
  - Fixed rebase which added extra args being passed to
    self.b.configure() for br2-external support
  - Added additional test cases with class updates committed since v5

Changes v4 -> v5:
  - no changes

Changes v3 -> v4:
  - re-run the automatic replace command

Changes v2 -> v3:
  - new patch
  - search for "RuntimeTestBase" in
    http://patchwork.ozlabs.org/patch/806161/
---
 support/testing/infra/basetest.py                  | 10 ----------
 support/testing/infra/runtimetest.py               | 23 ++++++++++++++++++++++
 support/testing/tests/boot/test_atf.py             |  7 ++++---
 .../testing/tests/core/test_file_capabilities.py   |  3 ++-
 support/testing/tests/core/test_hardening.py       |  3 ++-
 support/testing/tests/core/test_post_scripts.py    |  3 ++-
 support/testing/tests/core/test_rootfs_overlay.py  |  3 ++-
 support/testing/tests/core/test_timezone.py        |  7 ++++---
 support/testing/tests/fs/test_ext.py               |  9 +++++----
 support/testing/tests/fs/test_f2fs.py              |  3 ++-
 support/testing/tests/fs/test_iso9660.py           | 13 ++++++------
 support/testing/tests/fs/test_jffs2.py             |  3 ++-
 support/testing/tests/fs/test_squashfs.py          |  3 ++-
 support/testing/tests/fs/test_ubi.py               |  3 ++-
 support/testing/tests/fs/test_yaffs2.py            |  3 ++-
 support/testing/tests/init/base.py                 |  3 ++-
 support/testing/tests/package/test_atop.py         |  3 ++-
 support/testing/tests/package/test_dropbear.py     |  3 ++-
 support/testing/tests/package/test_lua.py          |  3 ++-
 support/testing/tests/package/test_perl.py         |  3 ++-
 support/testing/tests/package/test_python.py       |  3 ++-
 support/testing/tests/package/test_rust.py         |  3 ++-
 support/testing/tests/package/test_syslog_ng.py    |  3 ++-
 support/testing/tests/toolchain/test_external.py   |  3 ++-
 24 files changed, 79 insertions(+), 44 deletions(-)
 create mode 100644 support/testing/infra/runtimetest.py

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index e67bf1a..13ee0ef 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -3,7 +3,6 @@ import os
 import datetime
 
 from infra.builder import Builder
-from infra.emulator import Emulator
 
 BASIC_TOOLCHAIN_CONFIG = \
     """
@@ -42,7 +41,6 @@ class BRTest(unittest.TestCase):
         super(BRTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
-        self.emulator = None
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
@@ -58,17 +56,9 @@ class BRTest(unittest.TestCase):
             self.b.delete()
 
         if not self.b.is_finished():
-            self.show_msg("Building")
             self.b.configure(make_extra_opts=["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
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
index 0000000..68bb03d
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
index bb3701b..fa07ab3 100644
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
diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index 945b48a..82f3c1b 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -2,9 +2,10 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestFileCapabilities(infra.basetest.BRTest):
+class TestFileCapabilities(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_arm=y
diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 82e0f3d..aa44897 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -3,9 +3,10 @@ import subprocess
 import json
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestHardeningBase(infra.basetest.BRTest):
+class TestHardeningBase(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_powerpc64=y
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index 40a36b7..468be35 100644
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
index fedd40d..66b5531 100644
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
index 050624e..dca38be 100644
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
index f5f9e9f..a8f68bc 100644
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
diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 819c619..3a46d0a 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -2,6 +2,7 @@ import os
 import subprocess
 
 import infra.basetest
+import infra.runtimetest
 
 
 def dumpf2fs_getprop(out, prop):
@@ -11,7 +12,7 @@ def dumpf2fs_getprop(out, prop):
             return fields[1].strip()
 
 
-class TestF2FS(infra.basetest.BRTest):
+class TestF2FS(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_F2FS=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 68f4840..77255ac 100644
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
index 2ff5099..8f73cf1 100644
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
index 066c054..f80149f 100644
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
index 015d82f..c724f4f 100644
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
index b60e90e..c7c8c1f 100644
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
index 75cfbe9..1b736af 100644
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
diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 32c5a07..dc0da79 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestAtop(infra.basetest.BRTest):
+class TestAtop(infra.runtimetest.RuntimeTestBase):
     config = \
         """
         BR2_arm=y
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index 8f7f1fe..8f7f30e 100644
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
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 77358ba..3c8345f 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestLuaBase(infra.basetest.BRTest):
+class TestLuaBase(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
index 033b7cf..de1c541 100644
--- a/support/testing/tests/package/test_perl.py
+++ b/support/testing/tests/package/test_perl.py
@@ -1,9 +1,10 @@
 import os
 
 import infra.basetest
+import infra.runtimetest
 
 
-class TestPerlBase(infra.basetest.BRTest):
+class TestPerlBase(infra.runtimetest.RuntimeTestBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index bcd363a..e16c280 100644
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
index 9854c36..36edb27 100644
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
index 0155ef1..df6ce8b 100644
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
index 881d2b0..b72e19f 100644
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
1.9.1
