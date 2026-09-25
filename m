Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05068C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 19:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53AA811A8;
	Fri, 25 Sep 2026 19:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnW-Y_QqnsDL; Fri, 25 Sep 2026 19:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8EB3481314
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790364255;
	b=s1VXPW1+jBATsAo1LzNkJlhYKv3eiEVBLA/aWn1aYkQqb9PBY5YsMqgps4XwUX+R9w+7
	 ixlYTLqgnnYNQOcqaCbd+tQQQAHtQguQoEg192ILykC0PATXM2mfMNFLggKZsNzRzT4Ad
	 NcMzbAP5BEJZwrjgwcLtBQ5JYa5GNE3dLvTvblxGuBiY3zrcoXPIm3dal7fzzChFH8PVP
	 j98WEmHb8kIISRT7UufabJ2Cb562CFLAkEl/kSKmVCDzf2N+jX6WGZz/n8AbtO9tU/9Yn
	 IrGRGa0g0LAL/tfZhQZXVfgSbWj9VGA+h1TJi6hKCdJSRnupil5Fus6AbLC6/60aOfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790364255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QTpeu6NHYat6aYznE5DhECLwdDWGGHZgBhbY9OdsAMo=;
	b=LX4+8JigigmmuZWmmw6BTnvfKLZsRZ01tpMby00iy8WP+x2Te65X1v4zWTap/tIvDjEK
	 Ky6yCScC5ZaeWdT054+fcdtyRmdzlJTHBiDtQ0KhLyxul/MiYR7WZZUzv6jG35AZoPUlu
	 aR+qeqY9+4V+10JBit++zJLjq+pUB5pwugUZb05Hgf3KVAdHlEQ10XW2d+XcB/LRyH/yf
	 vb/FxpKu+1uie0jaT8L+C723bHCOY0Blqi5bGmypmy/YOF4LF7IUaduKFVucm0jXy+pzh
	 4dp9uRg8G24XDTzVuBWVwvDaxNYhnJ4xUxsI5XyLwiCMkA4RanZsXkw+96+C1rgDlxw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790364255;
	bh=QTpeu6NHYat6aYznE5DhECLwdDWGGHZgBhbY9OdsAMo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MTIRha1pBAkHHIVQxlO3qiukGMDaNGal6FZL+Q87VDAhtvZ7CCERvl3hbivfQB3rL
	 ena79szXQbLedhHu+BbOeG/IucwR7c47HiVoZsaC9AdT0/b1jsjW0ap3E31k6FtZdA
	 8Yajw/6A0+TyqEa6U+8STzvAdE3dNlaDMjPBAWyZuIavP5Z18S/+e5jDb90LcZpeuo
	 xIqkppgrDYshSGR4gNL+fQTVJsbk1JYmdjB34xzcQ8Tdid/Dgw0qqpt/a61puXVvnT
	 TAKShHLoogvE2MeiKnqtfmOMi0yztufnlhqqJ5J+KFYE5YsQPuDzb6OML2HD+rocFf
	 /6Do32U2u9YtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB3481314;
	Fri, 25 Sep 2026 19:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EB41335
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35164400D6
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1JRVmjCcIQ7 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 19:24:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 93FE34007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790364252;
 b=fGbpsGT6viG2Upco5zsaMhAg2Ns/48sEmkHXYccpy+Tg/g1CeAtR+oGCnlxHiIuu2J9Y
 rYGG3Y79+ShD33k5BY+W06QnbvSDvsU5xolrVwMyc/st3YHnFvfG/0nEVi7gweWNvpW3p
 6uRzLJNjU+UYMEVsnj88BxQvBSFVAsUL9J0GvINYD/LgfFxWvxkiPiSzbqAEP11Rbl6bq
 2H4BQBi3252oLtpb7TgwTIm8Gem5Eys3Bls6v7ehBHhcUDZXzbLvTGWTbURyrXmpPw90G
 RzsOmjAy2J9z7fHeUB+92xnrZh6qq9JmPzm4DOQliVEwihBVztsOr1CtGQUWxMaRMgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790364252;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=irIjOVI+nbMJu65INzV2LaVgPqxqOolxKg8o0c76L+0=;
 b=gsq5l+VWFBTVVe7FNhi7UYLCG1fcnF3pgxsWZLpVuKgIF2oIbGc8bsc19S3phYirLkzR
 EMyUTC7Ogh7j6zUHR7hrUfytyE4hBZFQsYbYum6lYOtA3TnMTFvHn7K9Re+jF4guVOwvW
 7oVgW4n8vuJp1eCWafhe/mE5G4fL9x67A/w26w68TzPDCAZ5p5QLpFMjoc+zjRlK/5VXH
 hYI2jtyI46WygXn839TVfI5DrBhbHGRoMTjYMpexZME+q38Hp54YeAtDLVBvgsvzw8iEF
 DWPaovHg6KB6mAMRAP9I3xqJjXtVMkQhZu/SfMqKN+oKwHWQpu6Y6qoMVkbrRWUVkkg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oFYp09vw; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93FE34007B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:24:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 539625FFAF;
 Fri, 25 Sep 2026 21:24:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 25 Sep 2026 21:24:02 +0200
Message-ID: <20260925192402.2559326-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: bubblewrap: new runtime
 test
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
 DEVELOPERS                                    |   1 +
 .../testing/tests/package/test_bubblewrap.py  | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 support/testing/tests/package/test_bubblewrap.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f4b746290e..d62bfaafb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1899,6 +1899,7 @@ F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_btrfs_progs.py
 F:	support/testing/tests/package/test_btrfs_progs/
+F:	support/testing/tests/package/test_bubblewrap.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_connman.py
diff --git a/support/testing/tests/package/test_bubblewrap.py b/support/testing/tests/package/test_bubblewrap.py
new file mode 100644
index 0000000000..624b331e5e
--- /dev/null
+++ b/support/testing/tests/package/test_bubblewrap.py
@@ -0,0 +1,127 @@
+import os
+
+import infra.basetest
+
+
+class TestBubblewrap(infra.basetest.BRTest):
+    # Bubblewrap uses mount_setattr(2) introduced in Kernel 5.12:
+    # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2a1867219c7b27f928e2545782b86daaf9ad50bd
+    # The Buildroot prebuilt Kernel is 5.10. To avoid testing
+    # Bubblewrap with its fallback code, we build a newer kernel.
+    # https://github.com/containers/bubblewrap/blob/v0.13.0/bind-mount.c#L27-L31
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.53"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BUBBLEWRAP=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.ext4")
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
+        # Check the program can execute
+        self.assertRunOk("bwrap --version")
+
+        # We set an arbitrary message used as test data.
+        msg = "Hello Buildroot!"
+
+        # We create three files to test the sandbox functionality.
+        # One fully hidden to the sandbox, one passed as read-only and
+        # one passed as fully read-write.
+        dirs = ["hidden", "read-only", "read-write"]
+        for d in dirs:
+            self.assertRunOk(f"mkdir -p /mnt/{d}")
+            self.assertRunOk(f"echo {d} > /mnt/{d}/file.txt")
+
+        # We start the sandbox.
+        cmd = [
+            "bwrap",
+            "--ro-bind /bin /bin",
+            "--ro-bind /lib /lib",
+            "--symlink lib /lib64",
+            "--ro-bind /usr /usr",
+            "--ro-bind /mnt/read-only /mnt/read-only",
+            "--bind /mnt/read-write /mnt/read-write",
+            "--proc /proc",
+            "--dev /dev",
+            "--unshare-pid",
+            "--new-session",
+            "sh"
+        ]
+        self.assertRunOk(" ".join(cmd))
+
+        # The "--unshare-pid" option creates a new PID namespace.
+        # In this new namespace, Bubblewrap act as the PID-1 process.
+        # We check the PID-1 executable is bwrap.
+        out, ret = self.emulator.run("readlink -f /proc/1/exe")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "/usr/bin/bwrap")
+
+        # Inside the sandbox, we should not see the /root home
+        # directory.
+        self.assertRunOk("test ! -d /root")
+
+        # Inside the sandbox, we should not be able to remove a file
+        # from /bin, even as the root user.
+        self.assertRunNotOk("rm -f /bin/ls")
+
+        # We check the hidden file is not visible.
+        self.assertRunNotOk("cat /mnt/hidden/file.txt")
+
+        # We check the read-only file is readable.
+        out, ret = self.emulator.run("cat /mnt/read-only/file.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "read-only")
+
+        # We also check the read-only file cannot be written.
+        cmd = f"echo '{msg}' > /mnt/read-only/file.txt"
+        self.assertRunNotOk(cmd)
+
+        # We check the read-write file is readable.
+        cmd = "cat /mnt/read-write/file.txt"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "read-write")
+
+        # We check the read-write file is also writable.
+        cmd = f"echo '{msg}' > /mnt/read-write/file.txt"
+        _, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+
+        # We exit from the sandbox.
+        self.assertRunOk("exit")
+
+        # Since we exited the sandbox, we check the PID-1
+        # is no longer bwrap.
+        out, ret = self.emulator.run("readlink -f /proc/1/exe")
+        self.assertEqual(ret, 0)
+        self.assertNotEqual(out[0], "/usr/bin/bwrap")
+
+        # We should now be able to read the hidden file.
+        out, ret = self.emulator.run("cat /mnt/hidden/file.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "hidden")
+
+        # We check the writable file now contains our test message.
+        cmd = "cat /mnt/read-write/file.txt"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
