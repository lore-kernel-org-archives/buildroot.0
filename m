From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 14:24:34 +0200
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_bmap_tools: add test for host bmap-tools
Message-ID: <20210625115307.E5DEF800B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81d1c6cf288f6ad76235557d5a6220f4cbaa79c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: check the two files are identical]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_bmap_tools.py | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
index e8802fc057..5b4e5dcd3f 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -1,5 +1,6 @@
 import os
 import infra
+import subprocess
 
 from infra.basetest import BRTest
 
@@ -59,3 +60,34 @@ class TestPy3BmapTools(TestBmapTools):
         """
         BR2_PACKAGE_PYTHON3=y
         """
+
+
+class TestHostBmapTools(BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_BMAP_TOOLS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        bmap_x = os.path.join(self.b.builddir, "host", "bin", "bmaptool")
+        src_f = os.path.join(self.b.builddir, "images", "rootfs.ext2")
+        dst_f = os.path.join(self.b.builddir, "images", "rootfs.ext2.copy")
+        map_f = os.path.join(self.b.builddir, "images", "rootfs.ext2.bmap")
+
+        ret = subprocess.call([bmap_x, "create", "-o", map_f, src_f],
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile)
+        self.assertEqual(ret, 0)
+
+        ret = subprocess.call([bmap_x, "copy", src_f, dst_f],
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile)
+        self.assertEqual(ret, 0)
+
+        with open(src_f, 'rb') as f:
+            src = f.read()
+        with open(dst_f, 'rb') as f:
+            dst = f.read()
+        self.assertEqual(src, dst)
