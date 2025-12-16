Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F4D64060
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 23:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57B282304;
	Tue, 16 Dec 2025 23:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2cf_kXTzIhe; Tue, 16 Dec 2025 23:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9466182333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765926919;
	bh=lppl0ip+NVJKyN1cJkDCyW9PnrcSI6ZpfpHnoxeDg8Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EnYB8S9LN8Sxk9U2bwK1L9r0bS1oS5Z2VHf5mZwQUR92i7nx9PtlYB9omCjbS5QvF
	 hy29ILzodvugG7fK165ZlwRhsD3NLOA3FyR3CFs9QBKkRohgTWRQ1461dHrNGjtUNw
	 X9qYdEzGQSPaSkCsv3bbp/45Hvet6ZGly1Ca2/SHO/kphs6UWd+QoVhJ2WS5raTpov
	 L7LwqnaY+mxA/1shJdQ2c4nNvhtNTCNCngMQzSyMntIhYBeWX+lagRDWC5v1LDlD2Z
	 TtoSVEvP/FrrWFUKP4KJeEbkwfU28hxl/YBVBovi4rnSwW6RFzs93X8eDEyneMAOYd
	 zz32oXbM8oXeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9466182333;
	Tue, 16 Dec 2025 23:15:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134A4364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05C5740CAE
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfyLiYJm8Qfe for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 23:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD23E40AC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD23E40AC0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD23E40AC0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EBABA19F576;
 Wed, 17 Dec 2025 00:15:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 17 Dec 2025 00:14:45 +0100
Message-ID: <20251216231456.347739-3-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216231456.347739-1-ju.o@free.fr>
References: <20251216231456.347739-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765926915;
 bh=/5PncHxaHagwxyBbL73mdbCMuGNdQSCYtd4wtkpsN/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TaNenzYppR7yExcgFSo1dy0IKX3abadIxR6IWnd6V/emVwjkZkMK3cu3rZ54L181d
 JfOaFhCaccxQFJbrKWiPKOGgiEkYta6y3e0ZyS//L5G7xD3nE33eeRindJXshh2vIU
 Wt0mbo1RmszggG4n5MMl6Txni54hkZNsF8lymCWokj04lH4XX7quE35aF2bZTU+WZX
 W+dLEDZQEa30FIjnCOeYfWi9FjJz2xBYMD0HIlw0KHgUFctr/l0kyz5E6YiBB9ZYAI
 GvKL49BtG+1IqoC9ey+lGTrh1WSOSN02U7mx92LWfpaK9j4P3Ha+fawFrDNRJnjfWp
 XQBGNNyfiM/gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TaNenzYp
Subject: [Buildroot] [PATCH 3/3] support/testing: new kvmtool runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/12462463585
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_kvmtool.py | 97 +++++++++++++++++++
 .../package/test_kvmtool/linux-kvm.fragment   |  6 ++
 .../rootfs-overlay/etc/profile.d/stty-raw.sh  |  3 +
 4 files changed, 108 insertions(+)
 create mode 100644 support/testing/tests/package/test_kvmtool.py
 create mode 100644 support/testing/tests/package/test_kvmtool/linux-kvm.fragment
 create mode 100644 support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..ca2cb44b87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1926,6 +1926,8 @@ F:	support/testing/tests/package/test_kmod.py
 F:	support/testing/tests/package/test_kmod/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
+F:	support/testing/tests/package/test_kvmtool.py
+F:	support/testing/tests/package/test_kvmtool/
 F:	support/testing/tests/package/test_lame.py
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
diff --git a/support/testing/tests/package/test_kvmtool.py b/support/testing/tests/package/test_kvmtool.py
new file mode 100644
index 0000000000..d6859172bd
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool.py
@@ -0,0 +1,97 @@
+import os
+
+import infra.basetest
+
+
+class TestKvmTool(infra.basetest.BRTest):
+    # This test passes the Buildroot image directory to the emulated
+    # guest using the 9p virtiofs. This guest enables the
+    # virtualization support. It will start a nested KVM virtual
+    # machine, using the same Kernel/initramfs images. For these
+    # reasons, we need a specific kernel configuration that enables
+    # KVM and 9P.
+    kern_frag = \
+        infra.filepath("tests/package/test_kvmtool/linux-kvm.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_kvmtool/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_KVMTOOL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "Image")
+        img_dir = os.path.join(self.builddir, "images")
+        virtfs_tag = "br-imgs"
+        virtfs_opts = [
+            f"local,path={img_dir}",
+            f"mount_tag={virtfs_tag}",
+            "security_model=mapped-xattr",
+            "readonly"
+        ]
+        qemu_opts = ["-M", "virt,gic-version=3,virtualization=on",
+                     "-cpu", "cortex-a57",
+                     "-smp", "4",
+                     "-m", "1G",
+                     "-virtfs", ','.join(virtfs_opts),
+                     "-initrd", img]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Test the program can execute.
+        self.assertRunOk("lkvm --version")
+
+        # We mount the virtfs to get the Kernel and initramfs from the
+        # test host.
+        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
+
+        # We define an arbitrary kernel command line argument that we
+        # will use to detect we are in our virtual machine.
+        kvm_karg = "br-kvm"
+
+        # The number of CPU of our virtual machine
+        kvm_nproc = 2
+
+        # We run the KVM virtual machine
+        cmd = "lkvm run"
+        cmd += " --kernel /mnt/Image"
+        cmd += " --initrd /mnt/rootfs.cpio"
+        cmd += f" --cpus {kvm_nproc}"
+        cmd += " --mem 320M"
+        cmd += " --console virtio"
+        cmd += " --irqchip gicv3"
+        cmd += f" --params {kvm_karg}"
+
+        # We use qemu.sendline() to run the command because the
+        # program will not return an exit code. The command "lkvm run"
+        # will spawn the new virtual machine console. The login is
+        # expected to be reached after the command is issued.
+        self.emulator.qemu.sendline(cmd)
+
+        # We login in the virtual machine.
+        self.emulator.login()
+
+        # We check we can see our kernel argument.
+        out, ret = self.emulator.run("cat /proc/cmdline")
+        self.assertEqual(ret, 0)
+        self.assertIn(kvm_karg, out[0])
+
+        # We check the virtual machine has the expected number of CPU.
+        out, ret = self.emulator.run("nproc")
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), kvm_nproc)
diff --git a/support/testing/tests/package/test_kvmtool/linux-kvm.fragment b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
new file mode 100644
index 0000000000..8058ac41c3
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
@@ -0,0 +1,6 @@
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..24d72995e6
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the terminal, otherwise the test infrastructure
+# would not be able to retrieve return codes properly.
+grep -Fq br-kvm /proc/cmdline && stty raw
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
