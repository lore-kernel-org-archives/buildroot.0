From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 14:24:22 +0200
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_bmap_tools: new test
Message-ID: <20210625115307.D6EC68E227@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1023f742b8e4213685b9e4efe23f75885482fd8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch implements a simple test in which a dummy file system image
is created, then `bmaptool create` and `bmaptool copy` are used to copy
it to another file.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: several reworks, add myself to DEVELOPERS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: check the two files are identical]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/sample_bmap_tools.sh | 16 ++++++
 support/testing/tests/package/test_bmap_tools.py   | 61 ++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b5df54386..98dde8773b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1988,7 +1988,9 @@ N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
 F:	package/php-xdebug/
 F:	package/python-augeas/
+F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_python_augeas.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmap_tools.sh
new file mode 100755
index 0000000000..08605b3b99
--- /dev/null
+++ b/support/testing/tests/package/sample_bmap_tools.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# simple test which creates a dummy file system image, then use bmaptool create
+# and bmaptool copy to copy it to another file
+
+set -xeu
+
+# create the necessary test files
+dd if=/dev/zero of=disk.img bs=2M count=1
+mkfs.ext4 disk.img
+fallocate -d disk.img
+dd if=/dev/zero of=copy.img bs=2M count=1
+
+# do a test copy of the file system image
+bmaptool create -o disk.img.bmap disk.img
+bmaptool copy disk.img copy.img
+cmp disk.img copy.img
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
new file mode 100644
index 0000000000..e8802fc057
--- /dev/null
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -0,0 +1,61 @@
+import os
+import infra
+
+from infra.basetest import BRTest
+
+
+class TestBmapTools(BRTest):
+    __test__ = False
+    sample_script = "tests/package/sample_bmap_tools.sh"
+    copy_script = 'tests/package/copy-sample-script-to-target.sh'
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a8=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_BMAP_TOOLS=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="65536"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_UTIL_LINUX=y
+        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
+        """.format(infra.filepath(copy_script),
+                   infra.filepath(sample_script))
+    timeout = 60
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=ext4"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img)])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        cmd = "/root/{}".format(os.path.basename(self.sample_script))
+        _, exit_code = self.emulator.run(cmd, timeout=20)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPy2BmapTools(TestBmapTools):
+    __test__ = True
+    config = TestBmapTools.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        """
+
+
+class TestPy3BmapTools(TestBmapTools):
+    __test__ = True
+    config = TestBmapTools.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        """
