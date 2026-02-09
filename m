Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F8AE9461B
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA464115A;
	Mon,  9 Feb 2026 22:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqmkw152hccv; Mon,  9 Feb 2026 22:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D6C40DB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676436;
	bh=cx58Ta1O768jW40Ru2ueOPhT3+ixW3TphXMvntIW3j4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TgrRImKNfcEu3rtjyRBE4/K8+n3nQ8kG7GH64Z0JCtVTYsttwW9+JUsP3TlTECAqR
	 91j2zEYIG/kWOXPsRdgeVbMFjZCOBDtRuOAbVZvFraTzh8vBfyUadJYgjjn7CfMYug
	 nuN9GBQXkwvBXNP2wt0dG7jKynutu7GHWQvfUWbGzbcQyAivGwhDxVTG4LncoHipP8
	 A5+u0G93xBLeIAFv0r5wPjdlp7H6FAcanJqEoeUvzQ+RINyC/IPMJxg3iIRdn1b20c
	 0bq52fEHmvEMMnQYmUVRVfFET0flGGjUiKQOqxvAu7Crr0KXT7Rfqp7H5KXYdJUxMB
	 UZl0dYBojLB7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D6C40DB4;
	Mon,  9 Feb 2026 22:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86205F2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6844160807
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmDx7TW9-vYd for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9762605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9762605E8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9762605E8
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2C97719F57B;
 Mon,  9 Feb 2026 23:33:45 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 23:32:59 +0100
Message-ID: <20260209223259.1002212-6-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209223259.1002212-1-ju.o@free.fr>
References: <20260209223259.1002212-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770676432;
 bh=NL0lUXXZj9QX56Xmgipr9li7VDZ1RPyCFZRDEF8G3Cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ry0uA+EyBDokmYIhrijYpJEvuXJuDZO/iOhgT+5+6+WVbx+Bqiu525gSa8qpFfpXl
 utnxxB0fst4IWo53lm0aXczV0UfbOGCTR7YBuqzHQtrhh+NRTvnrn784VsLgIr6YOy
 COAFyrBIJ7U1cUe4RXejiakHg+hLGB2tdldAnOtYCwX/RCntSzpIc4PGsgEX5zJs+e
 BX61lFLMaqeALFNFiuvvx+gHw4T+jT4XJ3CGUHwcmakSrNqYLhxwFLTEhWez6o46hi
 JlHdsSZmYC1IE4oRAtsO65pie0ERfvIXx/vESKhjfKXzkUil4Qnyynn+IhE+GR7i4E
 kETXxDUujr2+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ry0uA+Ey
Subject: [Buildroot] [PATCH 6/6] support/testing: fs: new xfs runtime test
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
Patch series tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/13047320475
https://gitlab.com/jolivain/buildroot/-/jobs/13047322702
https://gitlab.com/jolivain/buildroot/-/pipelines/2315409055
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/fs/test_xfs.py          | 55 +++++++++++++++++++
 .../tests/fs/test_xfs/linux-xfs.fragment      |  1 +
 3 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/fs/test_xfs.py
 create mode 100644 support/testing/tests/fs/test_xfs/linux-xfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..7b5f5282fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1844,6 +1844,8 @@ F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
 F:	support/testing/tests/fs/test_erofs.py
 F:	support/testing/tests/fs/test_erofs/
+F:	support/testing/tests/fs/test_xfs.py
+F:	support/testing/tests/fs/test_xfs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_xfs.py b/support/testing/tests/fs/test_xfs.py
new file mode 100644
index 0000000000..283c88f34c
--- /dev/null
+++ b/support/testing/tests/fs/test_xfs.py
@@ -0,0 +1,55 @@
+import os
+
+import infra.basetest
+
+
+class TestXfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_xfs/linux-xfs.fragment")
+    xfs_label = "BR_TEST"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.9"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_XFS=y
+        BR2_TARGET_ROOTFS_XFS_LABEL="{xfs_label}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.xfs")
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
+        # We check our root filesystem is in xfs format.
+        cmd = "mount | grep '/dev/root on / type xfs'"
+        self.assertRunOk(cmd)
+
+        # We try to write data on the root filesystem.
+        msg = "Hello Buildroot"
+        fname = "/root/file.txt"
+        self.assertRunOk(f"echo '{msg}' > {fname}")
+
+        # We sync and drop all caches, to make sure we will read back
+        # from the filsystem.
+        self.assertRunOk("sync")
+        self.assertRunOk("echo 3 > /proc/sys/vm/drop_caches")
+
+        # We check we can read back out data.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
diff --git a/support/testing/tests/fs/test_xfs/linux-xfs.fragment b/support/testing/tests/fs/test_xfs/linux-xfs.fragment
new file mode 100644
index 0000000000..32f7f6d872
--- /dev/null
+++ b/support/testing/tests/fs/test_xfs/linux-xfs.fragment
@@ -0,0 +1 @@
+CONFIG_XFS_FS=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
