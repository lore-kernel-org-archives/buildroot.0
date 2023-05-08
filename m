Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E808C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 18:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8173B41DF1;
	Mon,  8 May 2023 18:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8173B41DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 326t79bwp-gz; Mon,  8 May 2023 18:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26D64286F;
	Mon,  8 May 2023 18:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26D64286F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB3A51BF342
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E2D4016F
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E2D4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9Hb_FqNAI0o for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 18:10:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1BF40562
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE1BF40562
 for <buildroot@buildroot.org>; Mon,  8 May 2023 18:10:19 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.150.105])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 490F778050D;
 Mon,  8 May 2023 20:10:15 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 20:10:01 +0200
Message-Id: <20230508181001.18771-2-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508181001.18771-1-ju.o@free.fr>
References: <20230508181001.18771-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683569417;
 bh=BOA8Crf2xhBD8cx8XBsxKakfUQrKRFz8LvesHsFb5s8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BKCYVVPSOFXj3mDgKxkgFuCjewaQCbrQm0pKTDimQ+w2Wbff/feGZ959hrl7Y1bX8
 9O0FR7RHo4M2QnWARGazGo6qXM3m0o+AQtLHNfAQTnQW/6FgummEPu++dqG9g5/H1V
 kUl10bRW1Xms88gVZtxLIAPEdepPqXpqUjhP6ggCxMTMDFYJH96+0aif6Zxhpi2LJK
 aiLzaOr0AOEaN8QLKrJsZk85x+eYIZfLLLCIz5PVF5Z+KB2UDUssje00+CQ14EkJQz
 hhrrk3EoF2hOrLPtN6tN0FYcLv6hcVWosMMu5Ll5tC8Xl7mrBRvIVT/O+spyEdn6A1
 fc08G0JUBHLcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BKCYVVPS
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_openblas.py: new runtime test
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
Patch tested on branch master at commit d2f45de with commands:

    utils/docker-run make check-package
    379602 lines processed
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_openblas
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_openblas.py    | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/test_openblas.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 5658dfa14b..ffece52d6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1749,6 +1749,7 @@ F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
+F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
diff --git a/support/testing/tests/package/test_openblas.py b/support/testing/tests/package/test_openblas.py
new file mode 100644
index 0000000000..9cfe08ef2c
--- /dev/null
+++ b/support/testing/tests/package/test_openblas.py
@@ -0,0 +1,56 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenBLAS(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_OPENBLAS=y
+        BR2_PACKAGE_OPENBLAS_INSTALL_TESTS=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-smp", "2", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        test_prefix = "/usr/libexec/openblas/tests"
+
+        # BLAS data types:
+        blas_data_types = [
+            "s",  # Single precision (32bit) float
+            "d",  # Double precision (64bit) double
+            "c",  # Single precision (32bit) complex
+            "z"   # Double precision (64bit) complex
+        ]
+
+        # BLAS routine levels:
+        # Level 1: Vector operations,
+        # Level 2: Matrix-Vector operations,
+        # Level 3: Matrix-Matrix operations.
+        for blas_level in range(1, 4):
+            for blas_data_type in blas_data_types:
+                test_name = f"x{blas_data_type}cblat{blas_level}"
+                cmd = test_prefix + "/" + test_name
+
+                if blas_level > 1:
+                    cmd += f" < {test_prefix}/{blas_data_type}in{blas_level}"
+
+                self.assertRunOk(cmd, timeout=30)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
