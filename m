From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue,  8 Sep 2020 17:51:41 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: add an SELinuxSquashfs test
In-Reply-To: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
References: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
Message-ID: <20200908155142.1385820-4-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a test called 'SELinuxSquashfs' which will perform the same tests as
the Ext4 version, but using a Squashfs filesystem. Thanks to this, we'll
have a test on a real only filesystem.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/boot/test_selinux.py    | 21 +++++++++++++++++++
 .../boot/test_selinux/linux-squashfs.fragment |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 support/testing/tests/boot/test_selinux/linux-squashfs.fragment

diff --git a/support/testing/tests/boot/test_selinux.py b/support/testing/tests/boot/test_selinux.py
index 7b67feed83b5..2e94596e63e9 100644
--- a/support/testing/tests/boot/test_selinux.py
+++ b/support/testing/tests/boot/test_selinux.py
@@ -40,3 +40,24 @@ class TestSELinuxExt4(TestSELinux):
 
         self.wait_boot()
         self.run_tests()
+
+class TestSELinuxSquashfs(TestSELinux):
+    config = TestSELinux.config + \
+            """
+            BR2_TARGET_ROOTFS_SQUASHFS=y
+            BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+            """.format(
+                infra.filepath("tests/boot/test_selinux/linux-squashfs.fragment"),
+            )
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.squashfs")
+
+        self.emulator.boot(arch="x86_64", kernel=kernel,
+                           kernel_cmdline=["root=/dev/vda", "rootfstype=squashfs",
+                                           "console=ttyS0", "security=selinux"],
+                           options=["-drive", "file={},if=virtio,format=raw".format(rootfs)])
+
+        self.wait_boot()
+        self.run_tests()
diff --git a/support/testing/tests/boot/test_selinux/linux-squashfs.fragment b/support/testing/tests/boot/test_selinux/linux-squashfs.fragment
new file mode 100644
index 000000000000..7a89d006fa26
--- /dev/null
+++ b/support/testing/tests/boot/test_selinux/linux-squashfs.fragment
@@ -0,0 +1 @@
+CONFIG_SQUASHFS=y
-- 
2.26.2
