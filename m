From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 22:45:47 +0200
Subject: [Buildroot] [RFC-next 2/2] support/testing: add tests for the
	genimage generation logic
In-Reply-To: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
References: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170823204547.16672-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds two new test cases, to validate that the genimage
related functionality in Buildroot is working as expected:

 - One test case with just one ext4 partition. We do the build, check
   in the image that one partition is available with the right type,
   and then boot the system under Qemu to validate that the root
   filesystem can be mounted from /dev/mmcblk0p1.

 - One test case with one VFAT partition and one ext4 partition. We do
   the build, check in the image that two partitions are available
   with the right types, and then boot the system under Qemu. This
   allows to validate that the root filesystem can be mounted from
   /dev/mmcblk0p2, and that /dev/mmcblk0p1 can be mounted as a VFAT
   filesystem and contains the expected file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/genimage-simple.cfg |  9 ++++
 support/testing/tests/fs/genimage-vfat.cfg   | 25 ++++++++++
 support/testing/tests/fs/test_genimage.py    | 74 ++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 support/testing/tests/fs/genimage-simple.cfg
 create mode 100644 support/testing/tests/fs/genimage-vfat.cfg
 create mode 100644 support/testing/tests/fs/test_genimage.py

diff --git a/support/testing/tests/fs/genimage-simple.cfg b/support/testing/tests/fs/genimage-simple.cfg
new file mode 100644
index 0000000..baafe31
--- /dev/null
+++ b/support/testing/tests/fs/genimage-simple.cfg
@@ -0,0 +1,9 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/support/testing/tests/fs/genimage-vfat.cfg b/support/testing/tests/fs/genimage-vfat.cfg
new file mode 100644
index 0000000..5a5388b
--- /dev/null
+++ b/support/testing/tests/fs/genimage-vfat.cfg
@@ -0,0 +1,25 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"rootfs.tar",
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/support/testing/tests/fs/test_genimage.py b/support/testing/tests/fs/test_genimage.py
new file mode 100644
index 0000000..f2edd2b
--- /dev/null
+++ b/support/testing/tests/fs/test_genimage.py
@@ -0,0 +1,74 @@
+import json
+import os
+import subprocess
+import infra.basetest
+
+class TestGenimageSimple(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+             """
+             BR2_TARGET_ROOTFS_EXT2=y
+             BR2_TARGET_ROOTFS_EXT2_4=y
+             BR2_TARGET_ROOTFS_GENIMAGE=y
+             BR2_TARGET_ROOTFS_GENIMAGE_CFG_FILE="{}"
+             """.format(infra.filepath("tests/fs/genimage-simple.cfg"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "sdcard.img")
+        sfdisk_cmd = ["host/usr/sbin/sfdisk", "-J", img]
+        out = subprocess.check_output(sfdisk_cmd, cwd=self.builddir,
+                                      env={"LANG":"C"})
+        data = json.loads(out)
+        partitions = data['partitiontable']['partitions']
+        self.assertEqual(len(partitions), 1)
+        ext_part = partitions[0]
+        self.assertTrue(ext_part['node'].endswith("sdcard.img1"))
+        self.assertEqual(ext_part['type'], "83")
+
+        subprocess.call(["truncate", "-s", "%1M", img])
+
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0p1", "rootfstype=ext4"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img)])
+        self.emulator.login()
+
+class TestGenimageVfat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+             """
+             BR2_TARGET_ROOTFS_EXT2=y
+             BR2_TARGET_ROOTFS_EXT2_4=y
+             BR2_TARGET_ROOTFS_GENIMAGE=y
+             BR2_TARGET_ROOTFS_GENIMAGE_CFG_FILE="{}"
+             BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT=y
+             """.format(infra.filepath("tests/fs/genimage-vfat.cfg"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "sdcard.img")
+        sfdisk_cmd = ["host/usr/sbin/sfdisk", "-J", img]
+        out = subprocess.check_output(sfdisk_cmd, cwd=self.builddir,
+                                      env={"LANG":"C"})
+        data = json.loads(out)
+        partitions = data['partitiontable']['partitions']
+        self.assertEqual(len(partitions), 2)
+        vfat_part = partitions[0]
+        self.assertTrue(vfat_part['node'].endswith("sdcard.img1"))
+        self.assertEqual(vfat_part['type'], "c")
+        ext_part = partitions[1]
+        self.assertTrue(ext_part['node'].endswith("sdcard.img2"))
+        self.assertEqual(ext_part['type'], "83")
+
+        subprocess.call(["truncate", "-s", "%1M", img])
+
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0p2", "rootfstype=ext4"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img)])
+        self.emulator.login()
+
+        cmd = "mount -t vfat /dev/mmcblk0p1 /mnt"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        cmd = "ls -l /mnt/rootfs.tar"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
-- 
2.9.4
