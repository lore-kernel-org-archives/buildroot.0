Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88269C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC5934FA24;
	Fri, 28 Feb 2025 17:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsMfNt2vQzwT; Fri, 28 Feb 2025 17:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313F04F19B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313F04F19B;
	Fri, 28 Feb 2025 17:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10001711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67AF342EC3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XObqc8cqEms for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0533642884
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0533642884
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00BED867B4; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 00:11:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3bfa5ebcbf34800367a89b63aa548643e51297b4
X-Git-Newrev: cd0ffd598cf94b9d15c489f2429602825a18753c
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.00BED867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: test_xen:
 repair and leverage xen tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1180148192167821084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1180148192167821084==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd0ffd598cf94b9d15c489f2429602825a18753c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Current test runs a Xen hypervisor and a Linux dom0, from which we can
detect that we run under Xen but not much more. Indeed, with current
test's setup the Xen tools are not functional.

We add back networking to our stripped-down kernel config to repair Xen
tools.

With Xen tools functionals, we can enhance the test with the creation of
a VM. To be able to use the rootfs that we build in both the dom0 and in
this new dom1, we switch to an initramfs; no more rootfs partition in
the image. After stripping the ramdisk a bit we can even reduce Qemu's
memory to 1 GB.

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py          | 64 +++++++++++++++++++---
 .../testing/tests/package/test_xen/genimage.cfg    |  8 +--
 .../testing/tests/package/test_xen/linux.config    |  3 +
 .../package/test_xen/overlay/etc/init.d/S99custom  | 61 +++++++++++++++++++++
 .../package/test_xen/overlay/etc/xen/dom1.cfg      |  5 ++
 .../testing/tests/package/test_xen/post-build.sh   |  7 +++
 support/testing/tests/package/test_xen/xen.cfg     |  5 +-
 7 files changed, 138 insertions(+), 15 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 875ba19e70..f680187db0 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -1,15 +1,20 @@
 import os
+import pexpect
 import infra.basetest
 
 
 class TestXen(infra.basetest.BRTest):
     # We have a custom kernel config to reduce build time.
     # Our genimage.cfg is inspired from qemu_aarch64_ebbr_defconfig as we boot
-    # Xen with UEFI.
+    # Xen with UEFI. We run only in the initramfs; this allows to use a single
+    # ramdisk image for both the host and the guest.
+    # The Xen startup scripts need bash.
     config = \
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_OVERLAY="support/testing/tests/package/test_xen/overlay"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/test_xen/post-build.sh"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/tests/package/test_xen/post-image.sh support/scripts/genimage.sh"
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/testing/tests/package/test_xen/genimage.cfg"
         BR2_LINUX_KERNEL=y
@@ -21,9 +26,7 @@ class TestXen(infra.basetest.BRTest):
         BR2_PACKAGE_XEN=y
         BR2_PACKAGE_XEN_HYPERVISOR=y
         BR2_PACKAGE_XEN_TOOLS=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_4=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -37,24 +40,37 @@ class TestXen(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_MTOOLS=y
         """
 
+    def get_dom_uuid(self) -> str:
+        out, rc = self.emulator.run("cat /sys/hypervisor/uuid")
+        self.assertEqual(rc, 0, "Failed to get domain UUID")
+        return out[0]
+
+    def assertNumVM(self, x: int) -> None:
+        out, rc = self.emulator.run("xl vm-list")
+        self.assertEqual(rc, 0, "Failed to get VM list")
+        num_vm = len(out) - 1
+        self.assertEqual(num_vm, x, f"Expected {x} VM(s) but found {num_vm}")
+
     def test_run(self):
         uboot_bin = os.path.join(self.builddir, "images", "u-boot.bin")
         disk_img = os.path.join(self.builddir, "images", "disk.img")
 
+        # We need to run Qemu with virtualization to run Xen.
         qemu_opts = [
             "-bios", uboot_bin,
             "-cpu", "cortex-a53",
             "-device", "virtio-blk-device,drive=hd0",
             "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
-            "-m", "2G",
+            "-m", "1G",
             "-machine", "virt,gic-version=3,virtualization=on,acpi=off",
             "-smp", "2"
         ]
 
         # Boot the emulator:
         # Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
-        self.emulator.boot(arch="aarch64",
-                           options=qemu_opts)
+        # We need to boot Xen in UEFI to read xen.cfg; we use U-Boot as our
+        # UEFI firmware.
+        self.emulator.boot(arch="aarch64", options=qemu_opts)
         self.emulator.login()
 
         # Avoid double-cooking the terminal, otherwise the test infrastructure
@@ -63,3 +79,37 @@ class TestXen(infra.basetest.BRTest):
 
         # Verify that we are indeed running under Xen.
         self.assertRunOk("xl info")
+
+        # Check that we are dom0.
+        uuid = self.get_dom_uuid()
+        dom0_uuid = "00000000-0000-0000-0000-000000000000"
+        self.assertEqual(uuid, dom0_uuid, f"Unexpected dom UUID {uuid}")
+
+        # Check that we have one VM running.
+        self.assertNumVM(1)
+
+        # Create dom1 with console attached and login.
+        self.emulator.qemu.sendline("xl create -c /etc/xen/dom1.cfg")
+        self.emulator.login()
+
+        # Avoid double-cooking the terminal for dom1, too.
+        self.assertRunOk("stty raw")
+
+        # Check that we are not talking to dom0 anymore.
+        uuid = self.get_dom_uuid()
+        self.assertNotEqual(uuid, dom0_uuid, "Unexpected dom0 UUID")
+
+        # Detach from dom1's console with CTRL-].
+        # dom1 is still running in the background after that.
+        self.emulator.qemu.send(chr(0x1d))
+        mult = self.emulator.timeout_multiplier
+        index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT],
+                                          timeout=2 * mult)
+        self.assertEqual(index, 0, "Timeout exiting guest")
+
+        # Check that we are talking to dom0 again.
+        uuid = self.get_dom_uuid()
+        self.assertEqual(uuid, dom0_uuid, f"Unexpected dom UUID {uuid}")
+
+        # Check that we have two VMs running.
+        self.assertNumVM(2)
diff --git a/support/testing/tests/package/test_xen/genimage.cfg b/support/testing/tests/package/test_xen/genimage.cfg
index 6d8ec8ad8e..7d7a83d6b6 100644
--- a/support/testing/tests/package/test_xen/genimage.cfg
+++ b/support/testing/tests/package/test_xen/genimage.cfg
@@ -10,10 +10,11 @@ image efi-part.vfat {
 
 		files = {
 			"Image",
+			"rootfs.cpio"
 		}
 	}
 
-	size = 16M
+	size = 128M
 }
 
 image disk.img {
@@ -27,9 +28,4 @@ image disk.img {
 		offset = 32K
 		bootable = true
 	}
-
-	partition root {
-		partition-type-uuid = root-arm64
-		image = "rootfs.ext2"
-	}
 }
diff --git a/support/testing/tests/package/test_xen/linux.config b/support/testing/tests/package/test_xen/linux.config
index e0323d0325..4afab3c171 100644
--- a/support/testing/tests/package/test_xen/linux.config
+++ b/support/testing/tests/package/test_xen/linux.config
@@ -71,6 +71,9 @@ CONFIG_IOSCHED_BFQ=y
 # CONFIG_SWAP is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KSM=y
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
diff --git a/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom b/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
new file mode 100755
index 0000000000..889350725e
--- /dev/null
+++ b/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
@@ -0,0 +1,61 @@
+#!/bin/sh
+#
+# Custom script for test_xen.py
+# This will run both in dom0 and in dom1.
+# When we detect that we are in dom0 we mount the boot partition under /mnt,
+# to see the kernel image and the initramfs.
+#
+
+DAEMON="custom"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	case $(cat /sys/hypervisor/uuid) in
+		00000000-0000-0000-0000-000000000000)
+			printf "dom0 "
+			mount /dev/vda1 /mnt -o ro
+			;;
+		*) printf "domU " ;;
+	esac
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	case $(cat /sys/hypervisor/uuid) in
+		00000000-0000-0000-0000-000000000000)
+			printf "dom0 "
+			umount /mnt
+			;;
+		*) printf "domU " ;;
+	esac
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/support/testing/tests/package/test_xen/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/overlay/etc/xen/dom1.cfg
new file mode 100644
index 0000000000..869c12beb8
--- /dev/null
+++ b/support/testing/tests/package/test_xen/overlay/etc/xen/dom1.cfg
@@ -0,0 +1,5 @@
+name="dom1"
+kernel="/mnt/Image"
+ramdisk="/mnt/rootfs.cpio"
+memory=256
+cmdline="console=hvc0"
diff --git a/support/testing/tests/package/test_xen/post-build.sh b/support/testing/tests/package/test_xen/post-build.sh
new file mode 100755
index 0000000000..67b726cf3a
--- /dev/null
+++ b/support/testing/tests/package/test_xen/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+set -eu
+
+# Remove unnecessary Xen binaries to spare ramdisk size.
+for ext in bin fd rom; do
+	rm -vf "${TARGET_DIR}/usr/share/qemu-xen/qemu/"*."$ext"
+done
diff --git a/support/testing/tests/package/test_xen/xen.cfg b/support/testing/tests/package/test_xen/xen.cfg
index 41b3ed3ee5..8007ba725c 100644
--- a/support/testing/tests/package/test_xen/xen.cfg
+++ b/support/testing/tests/package/test_xen/xen.cfg
@@ -1,2 +1,3 @@
-options=dom0_mem=128M loglvl=all guest_loglvl=all
-kernel=\Image root=PARTLABEL=root rootwait console=hvc0
+options=dom0_mem=256M loglvl=all guest_loglvl=all
+kernel=\Image console=hvc0
+ramdisk=\rootfs.cpio

--===============1180148192167821084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1180148192167821084==--
