Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C954CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A61C40902;
	Sat, 10 Oct 2026 05:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HP4E1UodMS1L; Sat, 10 Oct 2026 05:40:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FD6340920
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610802;
	b=KEsb1JDtNUSSk2fI2NXK8QP+rZ/9k5Mz4x2SphFKP1Tee3vNAd2Nzj9bx7Rfz2kqwgod
	 qEThV4+2bo/99m8/1gT92AVIculPV2TeT3XXx2YSaBR2IoW+bt8nGKlWjQfZ1WNP+Y+cQ
	 qbf4SYhovO9tf0mfcbWlUY2M7L7PtZWPuMZKWOB55cMiK74skYFNBaXn+CaxwRFpwGFbf
	 /qIAt500UQHV/iazLcbi4zW//zDrqaXzvH0g/pDGcL5PCxUCCZv4R0WCuFQG1ZSJeKh4E
	 P3I+KfwZMfii87dImas//JMJtRhXhZYEY5nnxZtP1/InnPOn7YKjEfeJrTdiYrkGolQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7gmPYr+HITFGdElGDvbXRpQ+Jqs/4FlS9qcEFj8giWw=;
	b=n4LCXLNvWwY1GTmqmpCf9oho5Rzyq6RuPLnUnj4MDhBCA8G7o08L8GpEVqpeJKJDtTKS
	 V4KRSoT3Wtl42qhsSybigSYrTfIAclntDaYivtTBjpYIHmMMInrsIH8yMW3BYiLq61n94
	 RFzFqE0Vx52JMIUt1kYwR0aSVEYPUTJ83S8BivLCjNZfw76fx0VMufL+FHgdqgIZmheaE
	 SMyMs4mT+M8w6AOn239hv18y2BPwFzFX0XJu50niZjmUhp9dq61JFAZtSfAx5xXGi5vWO
	 rCNTwJ6mx/v0f8lOKq0Uq+KrYMrzZnl/1489R1G7DUwTappZsYSQqEllIWQiSPCo3Dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610802;
	bh=7gmPYr+HITFGdElGDvbXRpQ+Jqs/4FlS9qcEFj8giWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ORB3bAd22H9NWhhOXgNopA47otUnbzxNiKnj0X8WMZzuZsUqVRxdBQBpaYPJs/4TE
	 XSTISBto4B4QVs++0nbyvw/i4ZSaxii3nDq1VTF63gk7IakTFUaieUIbrsbiAQ6JrH
	 W5DjFWkTMY5UyBIuxBWb5BVfm4uUIvlopSe9fGf9EETVOcJnYE/FjBysWEreWxs7vG
	 a8ny5guYAhZPcCV85rkZ+ddMZB+oDgz2JmmH46LakIO3Xh+6L/t9JYyntAsHufhXT0
	 cf2H2JEPRqZTxzy24msZBYWoZtFqj1KkZ2EmmhMPHH01DDGf0zBAfkMDSdYyrUnyEh
	 idWdD7eWhcsAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD6340920;
	Sat, 10 Oct 2026 05:40:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B70F8380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CEA3813E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNP_eo2pFZCk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D5BDA813D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610796;
 b=A4fGGUf8h6X7LFU6ivXK26d38ZOelc7TA/aeYvxjQ8QncaDsMz4CUbolkx2Uve/f3LgJ
 TnR8+5IrlS6LBGYop/2QUod9EQxJRSuzQMQpG1CLzsIwKWHccfFalZp+MlnEAl+gRZ9+t
 5RzT0isorwrm4qwwHqJrU+rnCLUYg/p70w/tnDqXQdkAgP8JELbQilENse8TZ8dkj1xiB
 JJ8g9oERcH3XDTAXIwA7A+yW2hbZr4udMjCJd+dGHMuawtsO7YXv5Ox8MKx3Ifhxm4hgh
 BgqVLh6+jZvrKjC5wBjDjIiXZq77VG+OyBxyvJCe47B1hjUAVfnxc5aPnfEJMeiiVJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610796;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JbKU1TdNbfAaBb0prGCryQbTpclYRThfbDGKW9Jnuug=;
 b=ppf9BNx+hmKLHAAtq8a1HA0S0cBAX7DOtEoxUf3B9L+YuWu7XvOcg9bRbkvN2woQUDiG
 aq29Y+uc39G8imRGOSN6euIvfJi9EJ65A3tJ/CEYKOR+C2HNjQcZa6WgriqBUm3dEku5a
 t20/1Mgrc0N+xa54v4KbgsviceIj2QdOKbTXX4hXwbtNf179JUO7gaIuFaBK3eliF1k82
 moGoOENRvV8cAPj5FsQYvMM0C+BcYaUMw+vZQHIg/f25Auj1mGSl+Qu20Zd3UORU7lIce
 MNtTwpo0JnMr0VJD7crVV6G0aVD9obufKbs82TsUzoWXVbsQlwjjoanrPum8C6KXBWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5BDA813D5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B657D8E49A; Sat, 10 Oct 2026 05:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 07:38:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7396b459ad58cd62405b0b2e114e203c86e4c58b
X-Git-Newrev: 458fe813450414f5fd9f319dd27e6508bbc46210
X-Patchwork-Hint: ignore
Message-Id: <20261010053838.B657D8E49A@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_libusb_compat: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/458fe813450414f5fd9f319dd27e6508bbc46210
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 .../testing/tests/package/test_libusb_compat.py    | 58 ++++++++++++++++++++++
 .../package/test_libusb_compat/linux-usb.fragment  |  2 +
 3 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c703e50b14..dca5ecc5c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3629,4 +3629,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+F:	support/testing/tests/package/test_libusb_compat.py
+F:	support/testing/tests/package/test_libusb_compat/
 F:	support/testing/tests/package/test_quazip.py
diff --git a/support/testing/tests/package/test_libusb_compat.py b/support/testing/tests/package/test_libusb_compat.py
new file mode 100644
index 0000000000..d0bb57d4cc
--- /dev/null
+++ b/support/testing/tests/package/test_libusb_compat.py
@@ -0,0 +1,58 @@
+import os
+
+import infra.basetest
+
+
+class TestLibusbCompat(infra.basetest.BRTest):
+    # enable USB 2.0 support so we can test the USB enumeration in qemu
+    linux_fragment = \
+        infra.filepath("tests/package/test_libusb_compat/linux-usb.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_LIBUSB=y
+        BR2_PACKAGE_LIBUSB_COMPAT=y
+        BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    examples_dir = "/usr/libexec/libusb-compat/examples"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # We add a USB keyboard device for the test.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img,
+                                    "-device", "usb-ehci,id=ehci",
+                                    "-device", "usb-kbd,bus=ehci.0"])
+        self.emulator.login()
+
+        # The lsusb example prints "idVendor:idProduct" for every
+        # device. We expect the Linux Foundation 2.0 root hub
+        # (1d6b:0002) and the QEMU USB keyboard (0627:0001).
+        output, exit_code = self.emulator.run(f"{self.examples_dir}/lsusb")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("1d6b:0002", output)
+        self.assertIn("0627:0001", output)
+
+        # The testlibusb example opens every device and prints its
+        # descriptors. The keyboard should show up as a HID
+        # (bInterfaceClass 3) device.
+        output, exit_code = self.emulator.run(f"{self.examples_dir}/testlibusb -v")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("bInterfaceClass:    3", "\n".join(output))
diff --git a/support/testing/tests/package/test_libusb_compat/linux-usb.fragment b/support/testing/tests/package/test_libusb_compat/linux-usb.fragment
new file mode 100644
index 0000000000..d9abd2821e
--- /dev/null
+++ b/support/testing/tests/package/test_libusb_compat/linux-usb.fragment
@@ -0,0 +1,2 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
