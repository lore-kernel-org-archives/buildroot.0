Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F3CCFA47E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F13D86084F;
	Wed, 23 Oct 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxr1XviC7ENK; Wed, 23 Oct 2024 21:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B2C60664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B2C60664;
	Wed, 23 Oct 2024 21:37:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C81B27ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D4AF40294
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz0MsfQTwrY6 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABCC340148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCC340148
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABCC340148
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:37:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C339B0051E;
 Wed, 23 Oct 2024 23:36:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 23 Oct 2024 23:36:43 +0200
Message-ID: <20241023213643.915658-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729719420;
 bh=HhbUv+mzsAmL4/wRxuulQr0DNvWtsbxDZRV9y5xgQJ0=;
 h=From:To:Cc:Subject:Date:From;
 b=twUVyr37ldRRAKFloQy0G1bg2bix3hqS8JKxnwwKvzCEw60PJfBuea8OFz7cE25T2
 KOUXIrvKEfUqfgeamuCDfOCggqOX/D0p6MB71O1A5tPYQr6leIa6tCUADeCkv/k+rV
 g/8xElU9t7y1i8hCbZEY3xw2zZRxOWR5XvINFdL/T6OvvIMzWDjIh2uaSzirQyXtep
 c1TIubR2m4YYWJ8WleBMy/yWqsXtU15dFlPX4OP9br+EEjn2GCuadet8AjCi3ijEQj
 PJPciJSlpF5qoVEj2+tjwRyxM8SSsn8pHgzgvCPmfWbK/qJBlx8JSiV3jo8t+CDQ0E
 CqeGjbo+UG0tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=twUVyr37
Subject: [Buildroot] [PATCH 1/1] support/testing: add dpdk runtime test
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8169488724
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_dpdk.py | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_dpdk.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 386b4ef38f..f08e15425a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1880,6 +1880,7 @@ F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_dosfstools.py
 F:	support/testing/tests/package/test_dosfstools/
+F:	support/testing/tests/package/test_dpdk.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
new file mode 100644
index 0000000000..de2828298a
--- /dev/null
+++ b/support/testing/tests/package/test_dpdk.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestDPDK(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_nehalem=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_DPDK=y
+        BR2_PACKAGE_DPDK_TESTS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="300M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
+                           options=["-cpu", "Nehalem", "-m", "512M",
+                                    "-smp", "4",
+                                    "-device", "virtio-rng-pci",
+                                    "-drive", f"file={img},format=raw,if=virtio",
+                                    "-net", "nic,model=virtio",
+                                    "-net", "user"])
+        self.emulator.login()
+
+        # We run few DPDK test cases.
+        dpdk_tests = [
+            "crc_autotest",
+            "threads_autotest",
+            "lcores_autotest"
+        ]
+        cmd = "dpdk-test --no-huge " + " ".join(dpdk_tests)
+        self.assertRunOk(cmd, timeout=30)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
