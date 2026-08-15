Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B6AC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 13:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED35480E18;
	Sat, 15 Aug 2026 13:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_tdOZniTv5a; Sat, 15 Aug 2026 13:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1815280DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786799083;
	bh=asfXNsKO6px/+UjXZBrfAv84YCxZDnJSnW9eFDm4cUE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qiBzlapX2GTnyj/IYIQwE3Tt0A96QfeQJo7rFT753iTEuVRy0wzkI8tp6n46kCryZ
	 B6pqgjfqlNkgEb2036fB98NkijRrpupMnP67ELGXiIvDS5/HF48HdNnj1Ussz03dGx
	 vv99SqahpI5XSfsRgNHKyHomVRZUZjmhA4PIoVU2mxscK2TmbWGP7bxl7XHjSs2o8k
	 PeNFu2CwVXM2HJi9liIzisNfkLPOfntqFatyKZi8yhJpjHKnYOsdHCpAh7MOIOFDgz
	 sHjx4wWVcCQqpJrbI3Bhmb5+kChHKzXSf4KLTnU8cy0gtPBaGypOdddxsE7uVwWuT4
	 +20JbVdR3kpgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1815280DDF;
	Sat, 15 Aug 2026 13:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D22114CD
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D2A80DDF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cFumpqzNURp for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 13:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B50880DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B50880DA1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B50880DA1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:04:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 520565FFBA;
 Sat, 15 Aug 2026 15:04:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 15 Aug 2026 15:04:30 +0200
Message-ID: <20260815130430.1016271-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: fs: new cramfs runtime test
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15915576004
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/fs/test_cramfs.py       | 42 +++++++++++++++++++
 .../fs/test_cramfs/linux-cramfs.fragment      |  1 +
 3 files changed, 45 insertions(+)
 create mode 100644 support/testing/tests/fs/test_cramfs.py
 create mode 100644 support/testing/tests/fs/test_cramfs/linux-cramfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 4460523447..586407a200 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1856,6 +1856,8 @@ F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
+F:	support/testing/tests/fs/test_cramfs.py
+F:	support/testing/tests/fs/test_cramfs/
 F:	support/testing/tests/fs/test_erofs.py
 F:	support/testing/tests/fs/test_erofs/
 F:	support/testing/tests/fs/test_xfs.py
diff --git a/support/testing/tests/fs/test_cramfs.py b/support/testing/tests/fs/test_cramfs.py
new file mode 100644
index 0000000000..8beb27f4ab
--- /dev/null
+++ b/support/testing/tests/fs/test_cramfs.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestCramfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_cramfs/linux-cramfs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CRAMFS=y
+        BR2_TARGET_ROOTFS_CRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.cramfs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in cramfs format.
+        cmd = "mount | grep '/dev/root on / type cramfs'"
+        self.assertRunOk(cmd)
+
+        # We run cramfsck on the filesystem.
+        self.assertRunOk("cramfsck -v /dev/vda")
diff --git a/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
new file mode 100644
index 0000000000..91bc54bed3
--- /dev/null
+++ b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
@@ -0,0 +1 @@
+CONFIG_CRAMFS=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
