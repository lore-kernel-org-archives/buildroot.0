Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B11C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 11:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6101980E24;
	Sun, 18 Aug 2024 11:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVdBnEDJY51k; Sun, 18 Aug 2024 11:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6D480E2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6D480E2A;
	Sun, 18 Aug 2024 11:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 755C81BF419
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 11:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62028401E0
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 11:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9Sk9XzUkNC8 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 11:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0449A401DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0449A401DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0449A401DA
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 11:27:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C3BCB0051B;
 Sun, 18 Aug 2024 13:27:04 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 13:26:52 +0200
Message-ID: <20240818112652.1232927-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723980425;
 bh=b9q3L0lucjztV2ex0f57d//Y6XmWoEO2VWTUkRdbt4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=a9RHyMPe1V08/63tIT27a/tepHA9o7KJj/8t+9MCLHR0w5GfzUDUv1GHI35iohi7S
 i+E0i6vPPXhsWzGWM8huuNTfkez3p62xPz/W50ut3jdOF8TvBTOE7rEVzMvcDpx/SY
 wZbFpw7hDTUW5FwacJbsAVwctkbnOohQOwOGFM62k4HjZlYieIr4GaVl0yFent5758
 aiII983L6YuQVerNYBESOtS9jHX5PZGwaNb++eYPJz8uj4Gp5Bidg5KsAnIdNAuVJg
 pcV7lN9GQlbkTjMhsFdh0ObfP+Yk4Em9VXMWM8XG0WG2U4oCrmUde2fQCgtrqwDdb/
 5REFp0p508SHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a9RHyMPe
Subject: [Buildroot] [PATCH 1/1] support/testing: fs: new erofs runtime test
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
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7606961571
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/fs/test_erofs.py        | 51 +++++++++++++++++++
 .../tests/fs/test_erofs/linux-erofs.fragment  |  1 +
 3 files changed, 54 insertions(+)
 create mode 100644 support/testing/tests/fs/test_erofs.py
 create mode 100644 support/testing/tests/fs/test_erofs/linux-erofs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..5113b5e60d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1820,6 +1820,8 @@ F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
+F:	support/testing/tests/fs/test_erofs.py
+F:	support/testing/tests/fs/test_erofs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_erofs.py b/support/testing/tests/fs/test_erofs.py
new file mode 100644
index 0000000000..47c75262e0
--- /dev/null
+++ b/support/testing/tests/fs/test_erofs.py
@@ -0,0 +1,51 @@
+import os
+
+import infra.basetest
+
+
+class TestErofs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_erofs/linux-erofs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.46"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EROFS_UTILS=y
+        BR2_TARGET_ROOTFS_EROFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        root_dev = "/dev/vda"
+        disk = os.path.join(self.builddir, "images", "rootfs.erofs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = [f"root={root_dev}", "console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in erofs format.
+        cmd = "mount | grep '/dev/root on / type erofs'"
+        self.assertRunOk(cmd)
+
+        # Since we are on a read-only mounted filesystem, we can run a
+        # check...
+        self.assertRunOk(f"fsck.erofs {root_dev}")
+
+        # We check we can dump the superblock.
+        self.assertRunOk(f"dump.erofs -s {root_dev}")
+
+        # We check we can dump statistics on the image.
+        self.assertRunOk(f"dump.erofs -S {root_dev}")
diff --git a/support/testing/tests/fs/test_erofs/linux-erofs.fragment b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
new file mode 100644
index 0000000000..e14017aae4
--- /dev/null
+++ b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
@@ -0,0 +1 @@
+CONFIG_EROFS_FS=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
