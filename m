From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 30 Jul 2019 20:13:21 -0300
Subject: [Buildroot] [PATCH] support/testing: use virtio-rng-pci to test
 syslog-ng
Message-ID: <20190730231321.10673-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent versions of syslog-ng need some entropy on startup.
So use VirtIORNG to provide it. In order to accomplish this:
 - build the kernel containing the driver;
 - pass '-device virtio-rng-pci' to qemu.

Use the same kernel version and kernel config as qemu_arm_versatile.
It already has PCI enabled but it does not have HW_RANDOM_VIRTIO, so add
a defconfig fragment to enable the drivers.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/259856394

At the same time, fix a typo (missing '#') that resulted in the
generation of root.tar. This file is not used in the test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/262628554
---
 .../conf/syslog-ng-kernel-fragment.config     |  3 +++
 .../testing/tests/package/test_syslog_ng.py   | 20 ++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 support/testing/conf/syslog-ng-kernel-fragment.config

diff --git a/support/testing/conf/syslog-ng-kernel-fragment.config b/support/testing/conf/syslog-ng-kernel-fragment.config
new file mode 100644
index 0000000000..5b96e418be
--- /dev/null
+++ b/support/testing/conf/syslog-ng-kernel-fragment.config
@@ -0,0 +1,3 @@
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_VIRTIO_PCI=y
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index 0155ef14e4..d1444d3d0d 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -6,15 +6,29 @@ import infra.basetest
 class TestSyslogNg(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
         BR2_PACKAGE_SYSLOG_NG=y
         BR2_TARGET_ROOTFS_CPIO=y
-        BR2_TARGET_ROOTFS_TAR is not set
-        """
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(infra.filepath("conf/syslog-ng-kernel-fragment.config"))
 
     def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "zImage")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5", kernel="builtin", options=["-initrd", cpio_file])
+        dtb = os.path.join(self.builddir, "images", "versatile-pb.dtb")
+        options = ["-M", "versatilepb",
+                   "-dtb", dtb,
+                   "-initrd", cpio_file,
+                   "-device", "virtio-rng-pci"]
+        self.emulator.boot(arch="armv5", kernel=kernel, options=options)
         self.emulator.login()
 
         cmd = "grep syslog-ng /var/log/messages | grep starting"
-- 
2.17.1
