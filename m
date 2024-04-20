Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225BC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 13:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D49600CB;
	Sat, 20 Apr 2024 13:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGnZD2k8qZds; Sat, 20 Apr 2024 13:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1543B60637
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1543B60637;
	Sat, 20 Apr 2024 13:28:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0201BF369
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 13:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75135400FB
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 13:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beiOcR-3oxOn for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 13:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AAFA400F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AAFA400F0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AAFA400F0
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 13:28:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0F2AAB00585;
 Sat, 20 Apr 2024 15:28:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 15:28:17 +0200
Message-ID: <20240420132817.1352847-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713619706;
 bh=eCj0g7UTkNsIssr5hdKYh8rwB/ZkfbQv3k6vcHq3BL4=;
 h=From:To:Cc:Subject:Date:From;
 b=dNN6U/xh65VH5u+WJx3Gvm/aIntQUKBV99l/CWptRqt2FKh/2eyRcOMTs60kbnrL6
 WACvK5Zt7eUkrTz919aQ33MyM1N98bOi4q1sTSAuSUpfJ5ykK1jkk+587OdD5DVZ3p
 iPRpLO4JVXzHvAiX9R41e8eYvM1kGV+Oxxp41elSZpDTF3GieYajXwiOjjmJnVJb+J
 bvyyupvZroxlX9tFTRNjIhWtDC5tM7V9JF293V6sg2A1e8mLufvXDeSYNEqGuRO0o5
 od5pShpgTOst9Prv+qNhLS2COUpeChZkDnXFKewmL53BL9x8mL84+fN4CxMZAZdJtD
 Ur3/qf+ECir1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dNN6U/xh
Subject: [Buildroot] [PATCH 1/1] support/testing: add fwts runtime test
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
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_fwts.py | 67 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 support/testing/tests/package/test_fwts.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..a790a8c108d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1789,6 +1789,7 @@ F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
+F:	support/testing/tests/package/test_fwts.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_ghostscript.py
 F:	support/testing/tests/package/test_ghostscript/
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
new file mode 100644
index 00000000000..ef792136c22
--- /dev/null
+++ b/support/testing/tests/package/test_fwts.py
@@ -0,0 +1,67 @@
+import os
+
+import infra.basetest
+
+
+class TestFwts(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_ARM64_EFI=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_PACKAGE_FWTS=y
+        BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
+        flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
+        self.emulator.boot(arch="aarch64",
+                           options=["-M", "sbsa-ref",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-pflash", flash0,
+                                    "-pflash", flash1,
+                                    "-hda", hda])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("fwts --version")
+
+        # We run a simple UEFI runtime service variable interface test
+        # suite. Those tests are using the fwts efi_runtime kernel
+        # module.
+        self.assertRunOk("fwts -q uefirtvariable", timeout=30)
+
+        # The previous fwts invocation is expected to have created a
+        # "results.log" report. We check the file exists and contains
+        # a known header string.
+        expected_str = "Results generated by fwts:"
+        cmd = f"grep -F '{expected_str}' results.log"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith(expected_str))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
