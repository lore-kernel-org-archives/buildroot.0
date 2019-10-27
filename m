From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 13:37:05 +0000
Subject: [Buildroot] [PATCH v3 4/4] support/testing: add bmap_tools test
In-Reply-To: <20191027133630.7706-1-nicolas.carrier@orolia.com>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
Message-ID: <20191027133630.7706-4-nicolas.carrier@orolia.com>
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

Changes v2 -> v3:
  - title changed to "support/testing: add bmap_tools test"
    I followed Arnout's suggestion, but if there's a veto on that I can still
    change...
  - added myself in the DEVELOPERS file for both test scripts
  - implemented genericity following Thomas' comment, i.e. without ABC, which
    results in a simpler, cleaner and shorter code (thank you btw ^^)
  - fixed all the defects reported by flake8
  - increased timeout to 20s

I saw that most of the python tests duplicate code between tests for v2 and v3.
I think we should factor that, even if only small portions of code are
concerned and, of course, I'm willing to do that if it's considered a good idea.

---

 DEVELOPERS                                    |  2 +
 .../tests/package/sample_bmap_tools.sh        | 15 ++++++
 .../testing/tests/package/test_bmap_tools.py  | 47 +++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100755 support/testing/tests/package/sample_bmap_tools.sh
 create mode 100644 support/testing/tests/package/test_bmap_tools.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 322201301c..7e8f537588 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1727,6 +1727,8 @@ F:	package/uacme/
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
+F:	support/testing/tests/package/sample_bmap_tools.sh
+F:	support/testing/tests/package/test_bmap_tools.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
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
index 0000000000..7ea4057aba
--- /dev/null
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -0,0 +1,47 @@
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
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        cmd = f"/root/{os.path.basename(self.sample_script)}"
+        _, exit_code = self.emulator.run(cmd, timeout=20)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPy2BmapTools(TestBmapTools):
+    __test__ = True
+    config = f"""{TestBmapTools.config}
+    BR2_PACKAGE_PYTHON=y"""
+
+
+class TestPy3BmapTools(TestBmapTools):
+    __test__ = True
+    config = f"""{TestBmapTools.config}
+    BR2_PACKAGE_PYTHON3=y"""
-- 
2.20.1
