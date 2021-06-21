From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 23:01:10 +0200
Subject: [Buildroot] [PATCH v6 5/5]
 support/testing/tests/package/test_bmap_tools: add test for host bmap-tools
In-Reply-To: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210621210111.363433-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/test_bmap_tools.py  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
index e8802fc057..a0f8d5c2ad 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -1,5 +1,6 @@
 import os
 import infra
+import subprocess
 
 from infra.basetest import BRTest
 
@@ -59,3 +60,31 @@ class TestPy3BmapTools(TestBmapTools):
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
+        cmd = [os.path.join(self.b.builddir, "host", "bin", "bmaptool"),
+               "create",
+               "-o", os.path.join(self.b.builddir, "images", "rootfs.ext2.bmap"),
+               os.path.join(self.b.builddir, "images", "rootfs.ext2")]
+        ret = subprocess.call(cmd,
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile)
+        self.assertEqual(ret, 0)
+
+        cmd = [os.path.join(self.b.builddir, "host", "bin", "bmaptool"),
+               "copy",
+               os.path.join(self.b.builddir, "images", "rootfs.ext2"),
+               os.path.join(self.b.builddir, "images", "rootfs.ext2.copy")]
+        ret = subprocess.call(cmd,
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile)
+        self.assertEqual(ret, 0)
-- 
2.31.1
