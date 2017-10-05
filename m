From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  5 Oct 2017 18:42:09 -0300
Subject: [Buildroot] [PATCH v2 3/6] support/testing: fix code style
In-Reply-To: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
References: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
Message-ID: <20171005214212.27613-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the trivial warnings from flake8:
 - remove modules imported but unused;
 - use 2 lines before class or module level method;
 - remove blank line at end of file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - no change

Number of warnings reported by flake8 for the test infra:
before:  99
after:   17
---
 support/testing/infra/__init__.py                 |  7 ++++++-
 support/testing/infra/basetest.py                 |  2 ++
 support/testing/infra/builder.py                  |  1 +
 support/testing/run-tests                         |  2 ++
 support/testing/tests/core/test_post_scripts.py   |  1 +
 support/testing/tests/core/test_rootfs_overlay.py |  2 ++
 support/testing/tests/core/test_timezone.py       |  4 ++++
 support/testing/tests/fs/test_ext.py              |  9 +++++++--
 support/testing/tests/fs/test_iso9660.py          |  8 ++++++--
 support/testing/tests/fs/test_jffs2.py            |  2 ++
 support/testing/tests/fs/test_squashfs.py         |  1 +
 support/testing/tests/fs/test_ubi.py              |  1 +
 support/testing/tests/fs/test_yaffs2.py           |  1 +
 support/testing/tests/init/base.py                |  1 +
 support/testing/tests/init/test_busybox.py        |  5 +----
 support/testing/tests/init/test_none.py           |  1 +
 support/testing/tests/init/test_systemd.py        |  7 +------
 support/testing/tests/package/test_dropbear.py    |  1 +
 support/testing/tests/package/test_ipython.py     |  8 +++-----
 support/testing/tests/package/test_python.py      |  5 +++++
 support/testing/tests/toolchain/test_external.py  | 10 ++++++++++
 21 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 27e2a2708d..b03e891771 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -1,4 +1,3 @@
-import contextlib
 import os
 import re
 import sys
@@ -8,6 +7,7 @@ from urllib2 import urlopen, HTTPError, URLError
 
 ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 
+
 def open_log_file(builddir, stage, logtofile=True):
     """
     Open a file for logging and return its handler.
@@ -20,9 +20,11 @@ def open_log_file(builddir, stage, logtofile=True):
         fhandle = sys.stdout
     return fhandle
 
+
 def filepath(relpath):
     return os.path.join(os.getcwd(), "support/testing", relpath)
 
+
 def download(dldir, filename):
     finalpath = os.path.join(dldir, filename)
     if os.path.exists(finalpath):
@@ -46,6 +48,7 @@ def download(dldir, filename):
     os.rename(tmpfile, finalpath)
     return finalpath
 
+
 def get_elf_arch_tag(builddir, prefix, fpath, tag):
     """
     Runs the cross readelf on 'fpath', then extracts the value of tag 'tag'.
@@ -66,9 +69,11 @@ def get_elf_arch_tag(builddir, prefix, fpath, tag):
         return m.group(1)
     return None
 
+
 def get_file_arch(builddir, prefix, fpath):
     return get_elf_arch_tag(builddir, prefix, fpath, "Tag_CPU_arch")
 
+
 def get_elf_prog_interpreter(builddir, prefix, fpath):
     """
     Runs the cross readelf on 'fpath' to extract the program interpreter
diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 52dad7c43d..5210f0ae58 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -28,6 +28,7 @@ MINIMAL_CONFIG = \
     # BR2_TARGET_ROOTFS_TAR is not set
     """
 
+
 class BRTest(unittest.TestCase):
     config = None
     downloaddir = None
@@ -47,6 +48,7 @@ class BRTest(unittest.TestCase):
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg)
+
     def setUp(self):
         self.show_msg("Starting")
         self.b = Builder(self.config, self.builddir, self.logtofile)
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index ef66b86113..7512339ae1 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -4,6 +4,7 @@ import subprocess
 
 import infra
 
+
 class Builder(object):
     def __init__(self, config, builddir, logtofile):
         self.config = '\n'.join([line.lstrip() for line in
diff --git a/support/testing/run-tests b/support/testing/run-tests
index ae0bd336b5..270e78cff7 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -7,6 +7,7 @@ import multiprocessing
 
 from infra.basetest import BRTest
 
+
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
     parser.add_argument('testname', nargs='*',
@@ -116,5 +117,6 @@ def main():
 
     nose2.discover(argv=nose2_args)
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index 7ca9b9d836..1db568b0d6 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -3,6 +3,7 @@ import csv
 
 import infra.basetest
 
+
 class TestPostScripts(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
index 22ef9722d6..fedd40d8ac 100644
--- a/support/testing/tests/core/test_rootfs_overlay.py
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -3,9 +3,11 @@ import subprocess
 
 import infra.basetest
 
+
 def compare_file(file1, file2):
     return subprocess.call(["cmp", file1, file2])
 
+
 class TestRootfsOverlay(infra.basetest.BRTest):
 
     rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index f4ba5039ca..050624e0aa 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -2,12 +2,14 @@ import os
 
 import infra.basetest
 
+
 def boot_armv5_cpio(emulator, builddir):
         img = os.path.join(builddir, "images", "rootfs.cpio")
         emulator.boot(arch="armv5", kernel="builtin",
                       options=["-initrd", img])
         emulator.login()
 
+
 class TestNoTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -23,6 +25,7 @@ class TestNoTimezone(infra.basetest.BRTest):
         tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
         self.assertEqual(tz[0].strip(), "UTC")
 
+
 class TestGlibcAllTimezone(infra.basetest.BRTest):
     config = \
         """
@@ -44,6 +47,7 @@ class TestGlibcAllTimezone(infra.basetest.BRTest):
         tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
         self.assertEqual(tz[0].strip(), "CET")
 
+
 class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 49bce45dc8..f5f9e9fdf1 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -12,6 +12,7 @@ RESBLKCNT_PROP = "Reserved block count"
 
 CHECK_FS_TYPE_CMD = "mount | grep '/dev/root on / type {}'"
 
+
 def dumpe2fs_run(builddir, image):
     cmd = ["host/sbin/dumpe2fs", os.path.join("images", image)]
     ret = subprocess.check_output(cmd,
@@ -20,12 +21,14 @@ def dumpe2fs_run(builddir, image):
                                   env={"LANG": "C"})
     return ret.strip().splitlines()
 
+
 def dumpe2fs_getprop(out, prop):
     for line in out:
         fields = line.split(": ")
         if fields[0] == prop:
             return fields[1].strip()
 
+
 def boot_img_and_check_fs_type(emulator, builddir, fs_type):
     img = os.path.join(builddir, "images", "rootfs.{}".format(fs_type))
     emulator.boot(arch="armv7",
@@ -37,6 +40,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
     _, exit_code = emulator.run(CHECK_FS_TYPE_CMD.format(fs_type))
     return exit_code
 
+
 class TestExt2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -55,6 +59,7 @@ class TestExt2(infra.basetest.BRTest):
                                                self.builddir, "ext2")
         self.assertEqual(exit_code, 0)
 
+
 class TestExt2r1(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -74,6 +79,7 @@ class TestExt2r1(infra.basetest.BRTest):
                                                self.builddir, "ext2")
         self.assertEqual(exit_code, 0)
 
+
 class TestExt3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -92,6 +98,7 @@ class TestExt3(infra.basetest.BRTest):
                                                self.builddir, "ext3")
         self.assertEqual(exit_code, 0)
 
+
 class TestExt4(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -116,5 +123,3 @@ class TestExt4(infra.basetest.BRTest):
         exit_code = boot_img_and_check_fs_type(self.emulator,
                                                self.builddir, "ext4")
         self.assertEqual(exit_code, 0)
-
-
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 60dcbdc139..41430eb4d2 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -25,6 +25,7 @@ BASIC_CONFIG = \
     # BR2_TARGET_ROOTFS_TAR is not set
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
+
 def test_mount_internal_external(emulator, builddir, internal=True):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
     emulator.boot(arch="i386", options=["-cdrom", img])
@@ -38,13 +39,14 @@ def test_mount_internal_external(emulator, builddir, internal=True):
     _, exit_code = emulator.run(cmd)
     return exit_code
 
+
 def test_touch_file(emulator):
     _, exit_code = emulator.run("touch test")
     return exit_code
 
 #
 # Grub 2
-#
+
 
 class TestIso9660Grub2External(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
@@ -65,6 +67,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         exit_code = test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
+
 class TestIso9660Grub2Internal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -86,7 +89,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
 
 #
 # Syslinux
-#
+
 
 class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
@@ -106,6 +109,7 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
         exit_code = test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
+
 class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index a84c858238..2ff5099180 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -3,6 +3,7 @@ import subprocess
 
 import infra.basetest
 
+
 def jffs2dump_find_file(files_list, fname):
     for file_name in files_list:
         file_name = file_name.strip()
@@ -10,6 +11,7 @@ def jffs2dump_find_file(files_list, fname):
             return True
     return False
 
+
 class TestJffs2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 9fad28f834..066c054342 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -3,6 +3,7 @@ import subprocess
 
 import infra.basetest
 
+
 class TestSquashfs(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 360932a0bf..015d82f769 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -3,6 +3,7 @@ import os
 
 import infra.basetest
 
+
 class TestUbi(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_yaffs2.py b/support/testing/tests/fs/test_yaffs2.py
index a11c1a40a7..b60e90e660 100644
--- a/support/testing/tests/fs/test_yaffs2.py
+++ b/support/testing/tests/fs/test_yaffs2.py
@@ -2,6 +2,7 @@ import os
 
 import infra.basetest
 
+
 class TestYaffs2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         infra.basetest.MINIMAL_CONFIG + \
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index a261d7dd46..c09ee46eb0 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -2,6 +2,7 @@ import os
 import subprocess
 import infra.basetest
 
+
 class InitSystemBase(infra.basetest.BRTest):
 
     def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
index c3e425bf5d..6c75f685ad 100644
--- a/support/testing/tests/init/test_busybox.py
+++ b/support/testing/tests/init/test_busybox.py
@@ -1,6 +1,7 @@
 import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
+
 class InitSystemBusyboxBase(InitSystemBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -11,7 +12,6 @@ class InitSystemBusyboxBase(InitSystemBase):
         super(InitSystemBusyboxBase, self).checkInit("/bin/busybox")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -25,7 +25,6 @@ class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
         self.checkNetwork("eth0", 1)
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -38,7 +37,6 @@ class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
         self.checkNetwork("eth0", 1)
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -53,7 +51,6 @@ class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
         self.checkNetwork("eth0")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemBusyboxRwNet(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index f55db5d3e0..c8a79f0bab 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -3,6 +3,7 @@ import pexpect
 import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
+
 class TestInitSystemNone(InitSystemBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index b1b6517373..77d734895b 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -1,6 +1,7 @@
 import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
+
 class InitSystemSystemdBase(InitSystemBase):
     config = \
         """
@@ -21,7 +22,6 @@ class InitSystemSystemdBase(InitSystemBase):
         super(InitSystemSystemdBase, self).checkInit("/lib/systemd/systemd")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -43,7 +43,6 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         self.assertEqual(out[0], "foobar")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -57,7 +56,6 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         self.checkNetwork("eth0")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -73,7 +71,6 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.checkNetwork("eth0")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -89,7 +86,6 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.checkNetwork("eth0")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -121,7 +117,6 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         self.checkNetwork("eth0")
 
 
-#-------------------------------------------------------------------------------
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index da569d9b1b..8f7f1fee82 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -2,6 +2,7 @@ import os
 
 import infra.basetest
 
+
 class TestDropbear(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index a943101372..3b291d9583 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -1,5 +1,3 @@
-import os
-
 from tests.package.test_python import TestPythonBase
 #
 # The following pythong tests are not being used here:
@@ -8,7 +6,8 @@ from tests.package.test_python import TestPythonBase
 #
 # - zlib_test: IPython does not return a non-zero code the way CPython
 #              does, so this test ends up being a false-negative
-#
+
+
 class TestIPythonPy2(TestPythonBase):
     config = TestPythonBase.config + \
         """
@@ -22,6 +21,7 @@ class TestIPythonPy2(TestPythonBase):
         self.math_floor_test(40)
         self.libc_time_test(40)
 
+
 class TestIPythonPy3(TestPythonBase):
     config = TestPythonBase.config + \
         """
@@ -34,5 +34,3 @@ class TestIPythonPy3(TestPythonBase):
         self.login()
         self.math_floor_test(40)
         self.libc_time_test(40)
-
-
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 79773fff63..26cf49947b 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -2,6 +2,7 @@ import os
 
 import infra.basetest
 
+
 class TestPythonBase(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -40,11 +41,13 @@ class TestPythonBase(infra.basetest.BRTest):
         _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 1)
 
+
 class TestPython2(TestPythonBase):
     config = TestPythonBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         """
+
     def test_run(self):
         self.login()
         self.version_test("Python 2")
@@ -52,11 +55,13 @@ class TestPython2(TestPythonBase):
         self.libc_time_test()
         self.zlib_test()
 
+
 class TestPython3(TestPythonBase):
     config = TestPythonBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         """
+
     def test_run(self):
         self.login()
         self.version_test("Python 3")
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index ad2f56a20e..072cf0048e 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -7,6 +7,7 @@ BASIC_CONFIG = \
     # BR2_TARGET_ROOTFS_TAR is not set
     """
 
+
 def has_broken_links(path):
     for root, dirs, files in os.walk(path):
         for f in files:
@@ -15,6 +16,7 @@ def has_broken_links(path):
                 return True
     return False
 
+
 class TestExternalToolchain(infra.basetest.BRTest):
     def common_check(self):
         # Check for broken symlinks
@@ -30,6 +32,7 @@ class TestExternalToolchain(infra.basetest.BRTest):
         interp_path = os.path.join(self.builddir, "target", interp[1:])
         self.assertTrue(os.path.exists(interp_path))
 
+
 class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -61,6 +64,7 @@ class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainSourceryArmv5(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -86,6 +90,7 @@ class TestExternalToolchainSourceryArmv5(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainSourceryArmv7(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -124,6 +129,7 @@ class TestExternalToolchainSourceryArmv7(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainLinaroArm(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -155,6 +161,7 @@ class TestExternalToolchainLinaroArm(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -180,6 +187,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainCtngMusl(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -206,6 +214,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -230,6 +239,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestExternalToolchainCCache(TestExternalToolchainBuildrootuClibc):
     extraconfig = \
         """
-- 
2.13.0
