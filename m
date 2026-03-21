Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E98109446F
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 18:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F086084A58;
	Sat, 21 Mar 2026 18:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4VQXZPePCuK; Sat, 21 Mar 2026 18:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00E584A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774117379;
	bh=FggUOAZJhMNatIuM5BtmaYf+9pQ6LmKhYh/0cbah6H0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CUe/bChG/E2w74+tvYMTDuGTy/bozMuWLzgNh5oNCSxx4FnoXePmlyWMrGCm1UH0v
	 mSDALXKOMWsvmgpW46rEXSEewUl4j+jf5ZdyrMzt8KKKcd4qSky/ZqjZ1p85t/oEyd
	 TGX5YGRAoCllAVPcpk2gJ48Ehfq+JFEjUKnRrM1iDJl7aa2ssSmHldf6E9kqt/i+wf
	 Tm4bD/3dvEkoKoddmMlI/yAlrVEJGbOmxOrWBcyt8Wm9cW2ll9NVuK4fDb02/+WT1T
	 AfQOC6EgjQqGkOhqNwP9M037iZKefxgIkCR7nJqx0dKmFxnejFtu7nzER7p+qixEy3
	 AjdE/mYp7FQ0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00E584A54;
	Sat, 21 Mar 2026 18:22:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F3D34C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F4684A54
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCJoEDz297cG for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 18:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84C1384A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C1384A53
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84C1384A53
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:22:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1976E19F58A;
 Sat, 21 Mar 2026 19:22:52 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Sat, 21 Mar 2026 19:22:44 +0100
Message-ID: <20260321182244.2282547-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774117375;
 bh=rIctDkFjtu+Vj6Dpymzmx9D8WycXUMZx/F84IeXzq7w=;
 h=From:To:Cc:Subject:Date:From;
 b=n13G1l8gbm2REl1g7aCU1bjoe2tsCtG8PpiiVRxtjp1dFTejnyEY9WTR31icE4eb+
 EkTa6KoJ2nqZtXR8BzM4NDYud7a+paLVYtY0RhpRS539EFtTCaQV+elAOmE/KXjGPN
 p5EjRci1plSS8DyeWQJPxmhrTS8s/jZFLr8nwtyo/LZir9ThPkzPiXN1BfPyNWHAr0
 zpi24tRfP82gg5+bEWvyIqmlo7efynDSoHHK7vDvDTliaUN7UgL3ktHaxjq6O9HJwV
 hi56pQVmTADQvdMQWFP7sDJi38CT28eKjdoM146ObbQmLBmC6oE6FRyOMPHu+wWxKR
 fH+noSGBNnAiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n13G1l8g
Subject: [Buildroot] [PATCH 1/1] support/testing: ndctl: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/13591501309
or with command:
utils/docker-run support/testing/run-tests \
    -k -d dl -o output_folder tests.package.test_ndctl
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_ndctl.py   | 54 +++++++++++++++++++
 .../package/test_ndctl/linux-pmem.fragment    |  3 ++
 3 files changed, 59 insertions(+)
 create mode 100644 support/testing/tests/package/test_ndctl.py
 create mode 100644 support/testing/tests/package/test_ndctl/linux-pmem.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c51a1db03..d1e5c720e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1976,6 +1976,8 @@ F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
 F:	support/testing/tests/package/test_nmap.py
+F:	support/testing/tests/package/test_ndctl.py
+F:	support/testing/tests/package/test_ndctl/
 F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
diff --git a/support/testing/tests/package/test_ndctl.py b/support/testing/tests/package/test_ndctl.py
new file mode 100644
index 0000000000..6cb44b2de2
--- /dev/null
+++ b/support/testing/tests/package/test_ndctl.py
@@ -0,0 +1,54 @@
+import json
+import os
+
+import infra.basetest
+
+
+class TestNdctl(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/package/test_ndctl/linux-pmem.fragment")
+    config = \
+        f"""
+        BR2_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.19"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_NDCTL=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        pmem_file = os.path.join(self.builddir, "images", "virtio-pmem.img")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel, kernel_cmdline=["console=ttyS0"],
+            options=["-M", "pc",
+                     "-m", "1G,slots=2,maxmem=2G",
+                     "-object", f"memory-backend-file,id=mem1,share=on,mem-path={pmem_file},size=64M",
+                     "-device", "virtio-pmem-pci,memdev=mem1,id=nv1",
+                     "-initrd", cpio_file]
+        )
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("ndctl --version")
+
+        # We check we can see our pmem block device.
+        self.assertRunOk("ls -l /dev/pmem0")
+
+        # We check we can also see it with ndctl.
+        out, ret = self.emulator.run("ndctl list")
+        self.assertEqual(ret, 0)
+        ndctl_json = "".join(out)
+        pmem = json.loads(ndctl_json)
+        self.assertEqual(pmem[0]["blockdev"], "pmem0")
+        self.assertEqual(pmem[0]["size"], 64*1024*1024)
diff --git a/support/testing/tests/package/test_ndctl/linux-pmem.fragment b/support/testing/tests/package/test_ndctl/linux-pmem.fragment
new file mode 100644
index 0000000000..d636c3a22a
--- /dev/null
+++ b/support/testing/tests/package/test_ndctl/linux-pmem.fragment
@@ -0,0 +1,3 @@
+CONFIG_LIBNVDIMM=y
+CONFIG_BLK_DEV_PMEM=y
+CONFIG_VIRTIO_PMEM=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
