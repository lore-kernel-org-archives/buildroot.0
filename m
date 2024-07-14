Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E190C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CB054010D;
	Sun, 14 Jul 2024 16:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4v65QoQLm5W; Sun, 14 Jul 2024 16:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF176401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF176401F6;
	Sun, 14 Jul 2024 16:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71361BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A308240574
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXG1M1c0dTEY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B3C240571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3C240571
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B3C240571
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:55:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D2221B0059A;
 Sun, 14 Jul 2024 18:55:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 18:55:27 +0200
Message-ID: <20240714165527.2451312-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720976133;
 bh=L6XSGybhqIsKVT+fZPIbCB/OlUnSGb7ptdzbsvu7eak=;
 h=From:To:Cc:Subject:Date:From;
 b=kTWOduyOAVpzk0DxKbn9IJJFFfb/efOPyUPa+ALA0jltv6tDscl092W9dUuvjrMYH
 C3Ub0MP5fOQMIdl3Cbu1TRexQBvEWmtoyxdv6UMfpQxF7jpsRmE+MMivAkkEvqH1IR
 qbCJ0HefB/IJdsrElKo6DE/y/1Rye08q49Mo1fvq9+l37OvLg8PfL+jtcIK7bQPOsz
 no5meDIqoi64KT5yE8Cd8Erab5gFiP9RQ2ei+MA/trF3RC4HPAMKYt7yOioWYth09m
 598gU8L8wlTJPiKA6yuKAZswmtitUXLK2UHnN7hydbDemtpYsvUt2w6GSXLPapBjyk
 gWU8WGo229MTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kTWOduyO
Subject: [Buildroot] [PATCH 1/1] support/testing: new dmidecode runtime test
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

Note: this test was not working in Buildroot test infrastructure
before commit [1] was merged, because dmidecode has the string "# "
in its output.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dmidecode.py   | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 support/testing/tests/package/test_dmidecode.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 466dcd4826..2190567246 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1831,6 +1831,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
new file mode 100644
index 0000000000..33c19f0d96
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
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
