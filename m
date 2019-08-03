From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 14:53:05 +0200
Subject: [Buildroot] [git commit] support/testing: test syslog-ng with
 builtin kernel
Message-ID: <20190803125127.6201681585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56e38a705e62a429576635b0a26cc4d3b3e88023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new builtin kernel 4.19 with VirtIORNG to provide entropy to
test syslog-ng.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../testing/conf/syslog-ng-kernel-fragment.config    |  3 ---
 support/testing/tests/package/test_syslog_ng.py      | 20 ++++----------------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/support/testing/conf/syslog-ng-kernel-fragment.config b/support/testing/conf/syslog-ng-kernel-fragment.config
deleted file mode 100644
index 5b96e418be..0000000000
--- a/support/testing/conf/syslog-ng-kernel-fragment.config
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_HW_RANDOM=y
-CONFIG_HW_RANDOM_VIRTIO=y
-CONFIG_VIRTIO_PCI=y
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index d1444d3d0d..6cc7c18945 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -6,29 +6,17 @@ import infra.basetest
 class TestSyslogNg(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
         BR2_PACKAGE_SYSLOG_NG=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(infra.filepath("conf/syslog-ng-kernel-fragment.config"))
+        """
 
     def test_run(self):
-        kernel = os.path.join(self.builddir, "images", "zImage")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        dtb = os.path.join(self.builddir, "images", "versatile-pb.dtb")
-        options = ["-M", "versatilepb",
-                   "-dtb", dtb,
-                   "-initrd", cpio_file,
-                   "-device", "virtio-rng-pci"]
-        self.emulator.boot(arch="armv5", kernel=kernel, options=options)
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
         self.emulator.login()
 
         cmd = "grep syslog-ng /var/log/messages | grep starting"
