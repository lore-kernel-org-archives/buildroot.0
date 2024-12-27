Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0A6E77192
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B0C80A07;
	Fri, 27 Dec 2024 13:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1WPSK7JYR2Y; Fri, 27 Dec 2024 13:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B5780575
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B5780575;
	Fri, 27 Dec 2024 13:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EBD4F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 13:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B8E1401BE
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 13:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4kH3hhBUYCF for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 13:02:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB1C84010E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1C84010E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB1C84010E
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 13:02:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A0633B00571;
 Fri, 27 Dec 2024 14:02:42 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	"Yann E. MORIN" <yann.morin@orange.com>
Date: Fri, 27 Dec 2024 14:02:31 +0100
Message-ID: <20241227130231.862029-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735304564;
 bh=+UqEdSaCCTZ9o9piNEunjEhcBm41FgJnOMQ2jq8wWjM=;
 h=From:To:Cc:Subject:Date:From;
 b=sWclMRZ8uvsEJTqBvKCiKdXwdZvDGsfynEasZ4lBoJPmaOSPSF7I31cL5dLtjO6oz
 qKew4dNMb/2PReLhs0n0elqOWc9ZxPJq5KLNWcP4DCTPbE9tYCqD7XL/SHhNNpU3r0
 m+bngWQncW0aFZSKRrWzBIRx00Xgr1o7wri87HOXWwBszmloe3iYJI9UFdRb+uZuVg
 Uu4uQkpGQ5xu2dV4KNZfPJ/Jpr4k6D49XA5udu6pXTCDk7f0kS2dhFIzCpXr3Mq5uq
 f/v4x7kO4YwGzu2z1MYqIVsvf/uRgiIHBCqthlhQwpHsox1RBfWfLXdcoqO6wjhFIu
 lGJTVxSViq8TQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sWclMRZ8
Subject: [Buildroot] [PATCH 1/1] support/testing: new usbip runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced the usbip package. This commit adds a new runtime
test to check this functionality.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f05f2c1ad717b7cda065ee06fc1daa80cd09d859

Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8731249477
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_usbip.py   | 100 ++++++++++++++++++
 .../package/test_usbip/linux-usbip.fragment   |   5 +
 3 files changed, 107 insertions(+)
 create mode 100644 support/testing/tests/package/test_usbip.py
 create mode 100644 support/testing/tests/package/test_usbip/linux-usbip.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index f2abab2ef3..c384054e33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1993,6 +1993,8 @@ F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_unbound.py
 F:	support/testing/tests/package/test_unbound/
+F:	support/testing/tests/package/test_usbip.py
+F:	support/testing/tests/package/test_usbip/
 F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
new file mode 100644
index 0000000000..da94d6f92c
--- /dev/null
+++ b/support/testing/tests/package/test_usbip.py
@@ -0,0 +1,100 @@
+import os
+
+import infra.basetest
+
+
+class TestUsbIp(infra.basetest.BRTest):
+    # A specific configuration is needed for testing usbip, to
+    # enable USB 2.0 and USBIP support in the Kernel.
+    linux_fragment = \
+        infra.filepath("tests/package/test_usbip/linux-usbip.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EUDEV=y
+        BR2_PACKAGE_HWDATA=y
+        BR2_PACKAGE_HWDATA_USB_IDS=y
+        BR2_PACKAGE_USBIP=y
+        BR2_PACKAGE_USBUTILS=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # We add a USB keyboard and mouse devices for the test.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img,
+                                    "-device", "usb-ehci,id=ehci",
+                                    "-device", "usb-kbd,bus=ehci.0",
+                                    "-device", "usb-mouse,bus=ehci.0"])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("usbipd --version")
+
+        # We check "lsusb" sees exactly one QEMU USB Keyboard.
+        out, ret = self.emulator.run("lsusb")
+        self.assertEqual(ret, 0)
+        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        self.assertEqual(kbd_count, 1)
+
+        # The daemon is not running yet. Listing remote devices is
+        # expected to fail.
+        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertNotEqual(ret, 0)
+
+        # We start the USBIP daemon.
+        self.assertRunOk("usbipd -D")
+
+        # The daemon is started. Listing remote devices is now
+        # expected to succeed, but with an empty list (since we did
+        # not exported any device yet).
+        out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertEqual(ret, 0)
+        self.assertIn("no exportable devices found", "\n".join(out))
+
+        # We list the local devices seen by usbip. We check we can see
+        # our local USB keyboard device in it.
+        out, ret = self.emulator.run("usbip list --local")
+        self.assertEqual(ret, 0)
+        self.assertIn("busid 1-1", "\n".join(out))
+
+        # We bind the first device (USB Keyboard)
+        self.assertRunOk("usbip bind --busid=1-1")
+
+        # We list the remote devices. We should see our exported
+        # keyboard: we check we have the list header, and the device
+        # ID in the output.
+        out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out)
+        self.assertNotIn("no exportable devices found", out_str)
+        self.assertIn("Exportable USB devices", out_str)
+        self.assertIn("(0627:0001)", out_str)
+
+        # We attach the keyboard. This should create a second USB
+        # keyboard.
+        self.assertRunOk("usbip attach --remote=127.0.0.1 --busid=1-1")
+
+        # We check "lsusb" now sees exactly two QEMU USB Keyboards
+        # (the original one, and a second one created by usbip).
+        out, ret = self.emulator.run("lsusb")
+        self.assertEqual(ret, 0)
+        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        self.assertEqual(kbd_count, 2)
diff --git a/support/testing/tests/package/test_usbip/linux-usbip.fragment b/support/testing/tests/package/test_usbip/linux-usbip.fragment
new file mode 100644
index 0000000000..592f461145
--- /dev/null
+++ b/support/testing/tests/package/test_usbip/linux-usbip.fragment
@@ -0,0 +1,5 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USBIP_CORE=y
+CONFIG_USBIP_HOST=y
+CONFIG_USBIP_VHCI_HCD=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
