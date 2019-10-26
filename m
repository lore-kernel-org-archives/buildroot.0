From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sat, 26 Oct 2019 14:41:21 +0000
Subject: [Buildroot] [PATCH 2/2] support/testing/tests/package/: runtime test
In-Reply-To: <20191026144101.30599-1-nicolas.carrier@orolia.com>
References: <20191026144101.30599-1-nicolas.carrier@orolia.com>
Message-ID: <20191026144101.30599-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch implements a simple test in which a dummy file system image
is created, then `bmaptool create` and `bmaptool copy` are used to copy
it to another file.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 .../tests/package/sample_bmap_tools.sh        | 15 ++++++
 .../testing/tests/package/test_bmap_tools.py  | 54 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100755 support/testing/tests/package/sample_bmap_tools.sh
 create mode 100644 support/testing/tests/package/test_bmap_tools.py

diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmap_tools.sh
new file mode 100755
index 0000000000..7c90368c17
--- /dev/null
+++ b/support/testing/tests/package/sample_bmap_tools.sh
@@ -0,0 +1,15 @@
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
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
new file mode 100644
index 0000000000..02bd4634d4
--- /dev/null
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -0,0 +1,54 @@
+import os
+import sys
+import infra
+
+from infra.basetest import BRTest
+from abc import ABC, abstractproperty
+
+class AbstractBmapToolsTest(BRTest, ABC):
+    __test__ = False
+    sample_script = "tests/package/sample_bmap_tools.sh"
+
+    copy_script = 'tests/package/copy-sample-script-to-target.sh'
+    config = f'''
+        {infra.basetest.BASIC_TOOLCHAIN_CONFIG}
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_BMAP_TOOLS=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{infra.filepath(copy_script)}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{infra.filepath(sample_script)}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_UTIL_LINUX=y
+        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
+        '''
+
+    def __init__(self, names):
+        super(AbstractBmapToolsTest, self).__init__(names)
+        self.config += f"BR2_PACKAGE_PYTHON{self.python_version}=y"
+
+    @abstractproperty
+    def python_version(self):
+        pass
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        print(self.config, file=sys.stderr)
+        self.login()
+        cmd = f"/root/{os.path.basename(self.sample_script)}"
+        _, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+
+class TestPy2BmapTools(AbstractBmapToolsTest):
+    __test__ = True
+    python_version = ""
+
+class TestPy3BmapTools(AbstractBmapToolsTest):
+    __test__ = True
+    python_version = "3"
-- 
2.20.1
