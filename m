Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BB1073C8A
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 10:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DCC8231D;
	Wed,  8 Apr 2026 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiT92ACDpMCt; Wed,  8 Apr 2026 10:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B0582328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775642802;
	bh=m4u71F8aVp1yeXtI5JxieCIwotgrBCvw7KT1wAuHxJE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEd3e+8OgwSB93auMwE90511Qyo/THSNjAzvWxDVVa0U2KmhS1S9N8OIRXq4Yb2Gd
	 /4mvat8X49XnhyoPfMQ9raWTi2mrtzQ4r8NThiR93yA59TXtOzn56OB38aEZrSQ9/N
	 5kjl7g2iWHvINHYulnxSMWiwcUA2uZ2TY28wFIwSZC7d9JxuareOfRg+pGs1Yrp6lP
	 wxLUZEXbjVpi30ifuJFa0swbiVk+oqqRKDbxw8qORVFgu1Kyy7aif8QCQ4N1gXTfPC
	 4VAwoVsnS7jy1XqPBaVkxMkzeSIrFwxMUogqy+nHrTslH0He2EVj4HWUu34oqoa/at
	 66FQHXXP2sTVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B0582328;
	Wed,  8 Apr 2026 10:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3331F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E391400B7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38AhmsuWQG32 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 10:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.181;
 helo=6.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99B35400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B35400A0
Received: from 6.mo533.mail-out.ovh.net (6.mo533.mail-out.ovh.net
 [54.36.140.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99B35400A0
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:06:36 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net [51.68.94.138])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4frJcn5Hj0z5xLc;
 Wed,  8 Apr 2026 10:06:33 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net. [127.0.0.1])
 by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Wed,  8 Apr 2026 10:06:32 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.188.192])
 by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4frJcl5H5cz7tq6; Wed,  8 Apr 2026 10:06:31 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.11])
 (Authenticated sender: mooz@blockos.org)
 by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id DBE0E8E1590; 
 Wed,  8 Apr 2026 10:06:30 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Cruz <mooz@blockos.org>
Date: Wed,  8 Apr 2026 12:04:26 +0200
Message-ID: <20260408100528.468929-3-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260408100528.468929-1-mooz@blockos.org>
References: <20260408100528.468929-1-mooz@blockos.org>
MIME-Version: 1.0
x-ovh-tracer-id: 2929310082966277069
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFZQigiH3MfJ0G+G8HTcrqzJYCGpKRZPWCvOecX/yF0554Y38xLU1CWCGazUSNpQMVM9lXOzPF4AIwVmWx0w6haVgy046spMJdRdNGnRXXmziTa1XovhhPDl7ry0iRv5FPaTfORaj5OUwY5LUk7bZNeOa61NBJaGHk1SnzLEd4QC9I5iv6gmI0xM8SHV9b8ChBthhBu3v4YNjXA64fYr+yrHhEdc0tWZ0tlEibVib/V66sBAyuzF8Tt/5cOJPmE8xmsimdvUSUSRGFNvNtXi4LBosmypjQ3RgLwXDQbV1s02wxYx8mntXDe/DWVteh2WSDpgPx9xqbApdmyFv3a8M6Rt2c52nYYPh97N1R1bT4wr5wZewRO1iaY1xt1ckWOESqH8iqR0YXajP7ctVWBoI1DwnlXc/cScttwaWBrQZecct4B+08wRXpjJISozYJ1uOB5TOS50Jp7f/P0dn6YeSTUIcSfpjyHN0ZTs1CPoPxSo5qxSMlAOWcAOiMmsNXb6oBxsY5KEeqHA+yAvapFDK0Li91/vsakqxJ6pukbVBQmh3cmDEqY/Z7hHd3ugqQHHjEpLg/GTyn7T8Q9iFc0+BIquR/xsPG2EsKIs52lHOEd7JptfGdR4jIQirmoTTFBREODhGajUUJ6UKkLiJ5FxRskD0PzhyBhvgr5kFA/LjwKfg
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-112S006ade23365-e7f7-414a-8a3e-8001f56dea41,
 5B82DD0164FC1DC6325A08E0C5996C36621A43D2) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH 2/2] support/testing: add rwmem tests
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

Add a basic runtime test for rwmem package.
This test verifies that `rwmem` package can read register values from
an I2C device and a memory mapped file.

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 support/testing/tests/package/test_rwmem.py   | 72 +++++++++++++++++++
 .../package/test_rwmem/linux-rwmem.fragment   |  3 +
 .../test_rwmem/rootfs-overlay/root/tests.py   | 22 ++++++
 3 files changed, 97 insertions(+)
 create mode 100644 support/testing/tests/package/test_rwmem.py
 create mode 100644 support/testing/tests/package/test_rwmem/linux-rwmem.fragment
 create mode 100644 support/testing/tests/package/test_rwmem/rootfs-overlay/root/tests.py

diff --git a/support/testing/tests/package/test_rwmem.py b/support/testing/tests/package/test_rwmem.py
new file mode 100644
index 0000000000..15d9fbc8d0
--- /dev/null
+++ b/support/testing/tests/package/test_rwmem.py
@@ -0,0 +1,72 @@
+import os
+
+import infra.basetest
+
+
+class TestRwmem(infra.basetest.BRTest):
+    kernel_fragment = infra.filepath("tests/package/test_rwmem/linux-rwmem.fragment")
+    rootfs_overlay = infra.filepath("tests/package/test_rwmem/rootfs-overlay")
+
+    config = \
+        f"""
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_RWMEM=y
+        BR2_PACKAGE_RWMEM_PYTHON=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "zImage")
+        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "vexpress-a9",
+                                    "-dtb", dtb,
+                                    "-device", "virtio-rng-device",
+                                    "-device", "tmp105,address=0x49,id=sensor",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        self.assertRunOk("i2cset -y 0 0x49 0x02 0x5a 0x80 i")
+
+        out, ret = self.emulator.run("rwmem -S 8 -s 16be --i2c=0:0x49 0x02")
+        self.assertEqual(ret, 0)
+        self.assertIn("0x02 (+0x0) = 0x5a80", out)
+
+        out, ret = self.emulator.run("rwmem -S 8 -s 8 --mmap /etc/os-release 0x6-0xe")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out, [
+            "0x06 (+0x0) = 0x75",
+            "0x07 (+0x1) = 0x69",
+            "0x08 (+0x2) = 0x6c",
+            "0x09 (+0x3) = 0x64",
+            "0x0a (+0x4) = 0x72",
+            "0x0b (+0x5) = 0x6f",
+            "0x0c (+0x6) = 0x6f",
+            "0x0d (+0x7) = 0x74"
+        ])
+
+        self.assertRunOk("i2cset -y 0 0x49 0x02 0x7c 0xa0 i")
+        out, ret = self.emulator.run("python3 /root/tests.py")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out, [
+            "0x7ca0",
+            "0x75696c64726f6f74"
+        ])
diff --git a/support/testing/tests/package/test_rwmem/linux-rwmem.fragment b/support/testing/tests/package/test_rwmem/linux-rwmem.fragment
new file mode 100644
index 0000000000..15d1e73bc8
--- /dev/null
+++ b/support/testing/tests/package/test_rwmem/linux-rwmem.fragment
@@ -0,0 +1,3 @@
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_SENSORS_LM75=y
\ No newline at end of file
diff --git a/support/testing/tests/package/test_rwmem/rootfs-overlay/root/tests.py b/support/testing/tests/package/test_rwmem/rootfs-overlay/root/tests.py
new file mode 100644
index 0000000000..f3e094b913
--- /dev/null
+++ b/support/testing/tests/package/test_rwmem/rootfs-overlay/root/tests.py
@@ -0,0 +1,22 @@
+#! /usr/bin/env python3
+# This is the python version of the rwmem cli tests.
+import sys
+
+import rwmem as rw
+
+# rwmem -S 8 -s 16be --i2c=0:0x49 0x02
+map = rw.I2CTarget(i2c_adapter_nr=0, i2c_dev_addr=0x49,
+                   offset=0x0, length=16,
+                   addr_endianness=rw.Endianness.Big, addr_size=1,
+                   data_endianness=rw.Endianness.Big, data_size=2,
+                   mode=rw.MapMode.ReadWrite)
+
+out = map.read(0x02)
+print(hex(out))
+
+# rwmem -S 8 -s 8 --mmap /etc/os-release 0x6-0xe
+map = rw.MMapTarget('/etc/os-release', 0, 32, rw.Endianness.Big, 1, rw.MapMode.Read)
+out = map.read(0x6, 8)
+print(hex(out))
+
+sys.exit(0)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
