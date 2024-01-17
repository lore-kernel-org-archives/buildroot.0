Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96FC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E18E4040D;
	Wed, 17 Jan 2024 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E18E4040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gicDpD4rS1n; Wed, 17 Jan 2024 20:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2649843722;
	Wed, 17 Jan 2024 20:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2649843722
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ABB31BF487
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22D2F615AA
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D2F615AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ne-J9MDV0v46 for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 20:12:10 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82A2161595
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82A2161595
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2268313F88E;
 Wed, 17 Jan 2024 21:12:06 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 21:11:57 +0100
Message-ID: <20240117201157.51827-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705522327;
 bh=3cdN0t8JgoaKqbastkq65Lw+UYYLr8iPtxs0hhrWMTM=;
 h=From:To:Cc:Subject:Date:From;
 b=Fb3tHQYv8242gyoclaKby/StNyDi4z/Ktj4++HJpZTJrkl96GOFPahaonDLsGPfc0
 kumFIEHqpGlA0xWC4TRCbytGYcqZSMyo4Sd7vQBex/+OFHyqli42huj2ktw7Dkl0nM
 7fvGe2zgdVRkhOQSDNSwa8TSx7/l4flVa7HTLxa74Xfa36MiMS0b3g0TGqnynoWF4c
 pG0wFcYRurUm8mKvb7aHluhUJrd3EMTtnJeydde9PXu48Rv9a9MH7o76EYbYBlom1F
 a+4mavJ/vuflXpEeiQXV0+mso+1VvJPx84z4I8P5oeZpVy8d1nUM+mNZ3rofZzBW9K
 7Oz6chWwqMhPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fb3tHQYv
Subject: [Buildroot] [PATCH 1/1] support/testing: add pciutils runtime test
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
Patch tested on branch master at commit b200632 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_pciutils
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_pciutils.py    | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 support/testing/tests/package/test_pciutils.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..bc92bdb813 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1797,6 +1797,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_python_distro.py
diff --git a/support/testing/tests/package/test_pciutils.py b/support/testing/tests/package/test_pciutils.py
new file mode 100644
index 0000000000..3221b0cfd1
--- /dev/null
+++ b/support/testing/tests/package/test_pciutils.py
@@ -0,0 +1,83 @@
+import os
+
+import infra.basetest
+
+
+class TestPCIUtils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PCIUTILS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+
+        # Note: we add a qemu pci-testdev in order to have a stable
+        # device ID, and for writing in configuration space without
+        # interfering with the rest of the emulation. See:
+        # https://www.qemu.org/docs/master/specs/pci-testdev.html
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file,
+                                    "-device", "pci-testdev"])
+        self.emulator.login()
+
+        # Check the program executes. This test also check that we
+        # have "lspci" from the pciutils package, rather than the
+        # busybox applet (which does not recognize the --version
+        # option)"
+        self.assertRunOk("lspci --version")
+
+        # Check few program invocations.
+        self.assertRunOk("lspci")
+        for lspci_opt in ["-t", "-n", "-v", "-vv", "-x"]:
+            self.assertRunOk(f"lspci {lspci_opt}")
+
+        # Check we can see the qemu pci-testdev.
+        # Vendor: 1b36: Red Hat, Inc.
+        # Device: 0005: QEMU PCI Test Device
+        pci_vendor_id = "1b36"
+        pci_device_id = "0005"
+        pci_dev = f"{pci_vendor_id}:{pci_device_id}"
+        cmd = f"lspci -d {pci_dev}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Red Hat, Inc.", output[0])
+        self.assertIn("QEMU PCI Test Device", output[0])
+
+        # We disable INTx emulation by setting bit 10 of the COMMAND
+        # register in the configuration space. See:
+        # https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/lib/header.h?h=v3.10.0#n26
+        dis_int_x = 0x400
+        data_mask = f"{hex(dis_int_x)}:{hex(dis_int_x)}"
+        cmd = f"setpci -d {pci_dev} COMMAND.w={data_mask}"
+        self.assertRunOk(cmd)
+
+        # We read back and check the value.
+        cmd = f"setpci -d {pci_dev} COMMAND.w"
+        output, exit_code = self.emulator.run(cmd)
+        read_value = int(output[0], 16)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue((read_value & dis_int_x) == dis_int_x)
+
+        # We check lspci now see the disabled INTx emulation.
+        cmd = f"lspci -vv -d {pci_dev} | grep -F 'DisINTx+'"
+        self.assertRunOk(cmd)
+
+        # We re-enable the INTx emulation by clearing the bit 10.
+        data_mask = f"0x0:{hex(dis_int_x)}"
+        cmd = f"setpci -d {pci_dev} COMMAND.w={data_mask}"
+        self.assertRunOk(cmd)
+
+        # We read back and check the value, again.
+        cmd = f"setpci -d {pci_dev} COMMAND.w"
+        output, exit_code = self.emulator.run(cmd)
+        read_value = int(output[0], 16)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue((read_value & dis_int_x) == 0)
+
+        # We check lspci now see the enabled INTx emulation.
+        cmd = f"lspci -vv -d {pci_dev} | grep -F 'DisINTx-'"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
