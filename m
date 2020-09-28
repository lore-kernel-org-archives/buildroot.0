From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:20 +0200
Subject: [Buildroot] [PATCH 2/7] support/testing: add an
 SELinuxSystemdSquashfs test
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-3-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a test called 'SELinuxSystemdSquashfs' which will perform the same
tests as the Ext4 version, but using a Squashfs filesystem. Thanks to
this, we'll have a test on a real only filesystem.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/boot/test_selinux.py           | 12 ++++++++++++
 .../tests/boot/test_selinux/linux-squashfs.fragment  |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/boot/test_selinux/linux-squashfs.fragment

diff --git a/support/testing/tests/boot/test_selinux.py b/support/testing/tests/boot/test_selinux.py
index b7e15655e7eb..d4e314a646ef 100644
--- a/support/testing/tests/boot/test_selinux.py
+++ b/support/testing/tests/boot/test_selinux.py
@@ -57,3 +57,15 @@ class TestSELinuxSystemdExt4(TestSELinuxSystemd):
 
     def test_run(self):
         self.run_tests("ext4")
+
+class TestSELinuxSystemdSquashfs(TestSELinuxSystemd):
+    config = TestSELinuxSystemd.config + \
+            """
+            BR2_TARGET_ROOTFS_SQUASHFS=y
+            BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+            """.format(
+                infra.filepath("tests/boot/test_selinux/linux-squashfs.fragment"),
+            )
+
+    def test_run(self):
+        self.run_tests("squashfs")
diff --git a/support/testing/tests/boot/test_selinux/linux-squashfs.fragment b/support/testing/tests/boot/test_selinux/linux-squashfs.fragment
new file mode 100644
index 000000000000..7a89d006fa26
--- /dev/null
+++ b/support/testing/tests/boot/test_selinux/linux-squashfs.fragment
@@ -0,0 +1 @@
+CONFIG_SQUASHFS=y
-- 
2.26.2
