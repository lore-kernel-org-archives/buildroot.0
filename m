From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:17:51 +0100
Subject: [Buildroot] [git commit] support/testing: add test for the f2fs
 filesystem support
Message-ID: <20181108202325.1261F817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5244fd29a1096d3b3e947bf3b75b9c9724bdc350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/conf/f2fs-kernel-fragment.config |  5 +++
 support/testing/tests/fs/test_f2fs.py            | 49 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/support/testing/conf/f2fs-kernel-fragment.config b/support/testing/conf/f2fs-kernel-fragment.config
new file mode 100644
index 0000000000..0fca7e784b
--- /dev/null
+++ b/support/testing/conf/f2fs-kernel-fragment.config
@@ -0,0 +1,5 @@
+CONFIG_F2FS_FS=y
+CONFIG_F2FS_STAT_FS=y
+CONFIG_F2FS_FS_XATTR=y
+CONFIG_F2FS_FS_POSIX_ACL=y
+CONFIG_F2FS_FS_SECURITY=y
diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
new file mode 100644
index 0000000000..9f7c393cdc
--- /dev/null
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -0,0 +1,49 @@
+import os
+import subprocess
+
+import infra.basetest
+
+def dumpf2fs_getprop(out, prop):
+    for line in out:
+        fields = line.split(" = ")
+        if fields[0] == prop:
+            return fields[1].strip()
+
+class TestF2FS(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_F2FS=y
+        BR2_TARGET_ROOTFS_F2FS_SIZE="128M"
+        BR2_TARGET_ROOTFS_F2FS_OVERPROVISION=0
+        BR2_TARGET_ROOTFS_F2FS_DISCARD=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        """.format(infra.filepath("conf/f2fs-kernel-fragment.config"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.f2fs")
+        out = subprocess.check_output(["host/sbin/dump.f2fs", img],
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"})
+        out = out.splitlines()
+        prop = dumpf2fs_getprop(out, "Info: total sectors")
+        self.assertEqual(prop, "262144 (128 MB)")
+
+        kernel = os.path.join(self.builddir, "images", "zImage")
+        kernel_cmdline=["root=/dev/mmcblk0", "rootfstype=f2fs",
+                        "console=ttyAMA0"]
+        dtb = infra.download(self.downloaddir, "vexpress-v2p-ca9.dtb")
+        options = ["-M", "vexpress-a9", "-dtb", dtb,
+                   "-drive", "file={},if=sd,format=raw".format(img)]
+        self.emulator.boot(arch="armv7", kernel=kernel,
+                           kernel_cmdline=kernel_cmdline,
+                           options=options)
+        self.emulator.login()
+        cmd = "mount | grep '/dev/root on / type f2fs'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
