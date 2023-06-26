Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FC9EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D829340971;
	Mon, 26 Jun 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D829340971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1Iqfg__22iQ; Mon, 26 Jun 2023 20:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD2040967;
	Mon, 26 Jun 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD2040967
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6C4C1BF951
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C10888183D
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C10888183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeUSdIPPcMWX for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 20:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0835380C16
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0835380C16
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 20:01:17 +0000 (UTC)
Received: from home.juju.sh (unknown [37.171.207.173])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C93A92003D6;
 Mon, 26 Jun 2023 22:01:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 22:01:08 +0200
Message-ID: <20230626200108.12517-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230611104518.337528-1-ju.o@free.fr>
References: <20230611104518.337528-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687809676;
 bh=SpG1RGkY7+Hk2xs4ZvM3B176SQ+7zphezD2mZyMYVkk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DflUWroV7UFqkjbQXm8lQ6m9Am/ylLD9wGarY8myKRGnsota8VibPZWQ73rto0Oa0
 fCFLK8JCkmqL0+oi7bZWnH7gBxhNobf2qC24s4+pukVO/qGwShev50f1Z+zMSaBZsj
 ZpI/UxYXHewW9c47WZYon5RSkEKE/w4prvbM9D1MOmW+Z2rRZV3bPKGKVcr2tJ6liR
 i2Sovk4PxSNzxaGnCcemFs1iGQz72We5kEPuI5AZbPff2dW6AAb2pmEgGSZbdtCWnQ
 AGam9htJIgnamRkLqsvPMABYsZPQfX3iRDc0eDvxBubBEUmfXZb19tqFzLrFEnOHIW
 SUG1SlWqgboWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DflUWroV
Subject: [Buildroot] [PATCH v2 3/3]
 support/testing/tests/package/test_dmidecode.py: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dmidecode.py   | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 support/testing/tests/package/test_dmidecode.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bf1969ac6..a9475ec689 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1738,6 +1738,7 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dieharder.py
+F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
new file mode 100644
index 0000000000..2363470e22
--- /dev/null
+++ b/support/testing/tests/package/test_dmidecode.py
@@ -0,0 +1,67 @@
+import os
+
+import infra.basetest
+
+
+class TestDmidecode(infra.basetest.BRTest):
+    # We use a x86_64 arch for this dmidecode test because aarch64
+    # SMBIOS is not supported in non-UEFI use-cases (and using a UEFI
+    # aarch64 would make the test longer).
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.33"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_DMIDECODE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+
+        # An arbitrary SMBIOS OEM string for the test
+        oem_string = "Hello Buildroot SMBIOS"
+
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "256", "-initrd", cpio_file,
+                     "-smbios", f"type=11,value={oem_string}"],
+        )
+        self.emulator.login()
+
+        # Check the program can run
+        cmd = "dmidecode --version"
+        self.assertRunOk(cmd)
+
+        # Check a simple invocation of "dmidecode"
+        self.assertRunOk("dmidecode")
+
+        # Check a simple invocation of "biosdecode"
+        self.assertRunOk("biosdecode")
+
+        # Check dmidecode detects SMBIOS
+        cmd = "dmidecode | grep -E '^SMBIOS .* present\\.$'"
+        self.assertRunOk(cmd)
+
+        # Check the system-manufacturer is QEMU
+        cmd = "dmidecode -s system-manufacturer"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "QEMU")
+
+        # Check we read back our OEM string
+        cmd = "dmidecode --oem-string 1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], oem_string)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
