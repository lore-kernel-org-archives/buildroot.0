Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAD7C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 22:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06D840112;
	Mon, 22 Aug 2022 22:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06D840112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R096UXgdgog2; Mon, 22 Aug 2022 22:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69D66400C6;
	Mon, 22 Aug 2022 22:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D66400C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52C41BF3EC
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F1B2405AE
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1B2405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBNDNIZ9KPOv for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 22:14:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CDC4054E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32CDC4054E
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 22:14:48 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.117.143])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C7EC96012E;
 Tue, 23 Aug 2022 00:14:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 00:14:30 +0200
Message-Id: <20220822221430.355066-2-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822221430.355066-1-ju.o@free.fr>
References: <20220822221430.355066-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661206486;
 bh=VxEIMg5T1lNc4bWrPMIHH9Vh9RO3GW/tUSRf4krVio4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PC5F8SUomcidAYJ+ANNZCTf9adlS3KgDtlljv7R5O28faMqGFk1B0CZRCat1Nm4Ob
 oep3R7IGrEyn4/AKSOxnzBosWg0vM0XGuL7ku8+U/iLzpE/DQQf+nOpCZX6mgbM++4
 bznBFNXwLLWEtyDmZ0F0VaZypO26psVC8qydlUHPM/yCVusMvyE9Aay5X102y3Zf6b
 joyCRA0bGJgxM3hD1R8JUKMWLh5YQ2xbRJvsOv+Lh8HJPm6PjLU1tShAgsHLQOj0bl
 gxKzJ5frXYkPYqtI6YrLO8NgEdgovUb9sUYz/Ki+s6536slXp+woIkh1EAK+z0vlCT
 zo5KGV0nZxeEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PC5F8SUo
Subject: [Buildroot] [RFC next 2/2]
 support/testing/tests/core/test_kernel3_10: new test
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

This commit add a test to check that a relatively old 3.10 kernel are
building successfully in Buildroot. This test was written for
investigating the bug described in:
- https://bugs.busybox.net/show_bug.cgi?id=14971

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    python3 -m flake8 \
        support/testing/tests/core/test_kernel3_10.py
    [no-output]

    support/testing/run-tests \
        -d dl \
        -o output_folder tests.core.test_kernel3_10.TestOldKernel3_10
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/core/test_kernel3_10.py | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/core/test_kernel3_10.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4287fd9cf7..5cf63e919e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1680,6 +1680,7 @@ F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
+F:	support/testing/tests/core/test_kernel3_10.py
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
diff --git a/support/testing/tests/core/test_kernel3_10.py b/support/testing/tests/core/test_kernel3_10.py
new file mode 100644
index 0000000000..5ff5ed1cad
--- /dev/null
+++ b/support/testing/tests/core/test_kernel3_10.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+# For testing the compilation of an old 3.10 kernel, we use a armv7
+# gcc5 bootlin toolchain, which also includes 3.10 kernel headers.
+class TestOldKernel3_10(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_EABIHF=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.108"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
+        """
+
+    def test_run(self):
+        initrd = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "zImage")
+        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7", kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "vexpress-a9", "-dtb", dtb, "-initrd", initrd])
+        self.emulator.login()
+        self.assertRunOk("true")
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
