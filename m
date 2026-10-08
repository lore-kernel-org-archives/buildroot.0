Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC5BCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A996560623;
	Sat, 10 Oct 2026 09:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VExblkOXWGC; Sat, 10 Oct 2026 09:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96FB460727
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624108;
	b=X0SiLSMA330KUlsPaZArV+KLemqnjTNKEzD3kn+gTbwuD6Z8f36JBlRj+Z/pc25n2A4F
	 YMxtLvIFNMN3qoIQcYOsgmoQMMjb7NQNHfCSfWdMsN60mmxa02rbFJHqjDU5SPcE5muuM
	 2wWKGhRFvtIzgsupe6KZRsZIJ9yLjXQ3Qq3ggKmQwWnD5MReS8/Fg0/adwEb2/pp3TIpW
	 WLmnuNZh6mBAShEnVzDoa5zuDZo0+Z6DaxB7WAXznebNQ7OFpEBheWw+Q1ur7EdXdJIEp
	 QdYSbrvFvSs6T0wC32CMkpHhNJm/0JiOUHyhd0OuBaK/1D5Av9u9Qgn9O3VWDHsrjkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YuRz3a1Vhj31Ww6SJqn0DiHb4uCh+mynD/oAcjBxWlo=;
	b=Y/ZJjUaflK9gCGRn3K/5u0jaeYkYv3Q+6G5wOeXmcpwSwafLdo16UTMY+ucd8oY7O81d
	 MbJ0osOJOl1dDzTYDufYTRZ1lDJQmTG0wjUeZReUUiNijF8dvnsjiw7CwbQgy/DPj9cdQ
	 JTfbPOyv4Hnl1NB85tPjt6lJO/E4wHibo2mxRxTsZ2rUb2uKGIDV+uKymVNI797H5anyS
	 W/iPQeR9LXHwu4HTNiD8876QzMt86JeSb5unQkSOZzZiAHlbWjOwKiRh81WfkWKE+AApB
	 xfJoOTsD6qA4jJlNjVPCmz45PtQAsNYFyMk6z7jX/36t7A/pGCadMvkMIuvIPA4RXSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624108;
	bh=YuRz3a1Vhj31Ww6SJqn0DiHb4uCh+mynD/oAcjBxWlo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VbzniXnHTH/mAmctN9yMjtyV6tLjcrifAVm70gJjOg+8UwW53d+fOAW3kl4DSMP+q
	 6eWMDIDHXajxVP9VLLY+fwknPGb4jcwTsh5WH9JA53jfS8F5la63ujUdJJ/wvwIWYV
	 OU/XtJIL+7ncchPMzp5xRBtBcbp2ZNZOimoj/tGuvHw2xYhI1yg6jw4C+PNIPiXZFw
	 C0fR52c7iDpmO7k6u2OftsTdwclVkdblTarG6tlHUV4uq2C/Tw+a5sQYbnInp53uUf
	 ZdcxII7xgdHcAkHr05bLLR+Gyl5cU4Te8W9S6GVKcQwu47Oc1IGaJ4h8dejAMKyKNX
	 81f8nxFKYOzsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96FB460727;
	Sat, 10 Oct 2026 09:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E319E75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C51AE8121D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi7uVQkWBGtW for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CBB2811FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=fF5E5CO9uz/651aDXj1VVb0SEmtwNhwKxSuX536FO72UqpeKEviMWGPRRHnsLOjtvskU
 YHGLyx+6MMSWa1qFg7DZ02gibRzNAE6MJvKbXIt8LaW5K0yY42wP87ciVZlDZpFUzfiCy
 EhFZTfn8/gJINS4v+k1Vd9F8eiWUGEsneoMBY5k0SzHPztoxXRcThhlWeC6jGgmLBqyHl
 Srhyf1JWQZFG+7TwAT3gVPd2rKL2QoL81vWYu+nAGmYTsqUvGYg2TXrjeAqxGfRmxk6n2
 QpybvG3p33NpsEZKewGLF4Joux8gAgYYCpyD//Mk8bM+bkBCM2lTTCiOJzfRHKjuN6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AOl8qxYxtgtLh2GT63PZcWQJhAFGUpH8oqOsPejsGJc=;
 b=tTxMeJkY2TD2/4z2ctn+KHC5DzQGaEALK8naZhkQtdwlDCZN88Ul1j5BHcOSq2SUNdMR
 sItqPdsFMJTrww3FyreenQW4yDVrMbynLzk7HfoMJWTjOE/J5xT69c3BdwMjN7p65DLk7
 7yr7hLkJYfTwy+P79uqRdMXyCrOEZiC6umdFYZGyjDwQ8RQ6V5K8uujLKYeH83Oq4DN2A
 VxXDM2T1DoPYxa1VqgSB/kOib9SkAN/QwhU66YVo165BFbirpi4xbGAH6hLzhjdRQJQLd
 ELH/iljlAktoTl8rB1azYHLQOcjq+VwVIaPlIHvXvXuKZcCkev5Hyhq9HvAd42uPsEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CBB2811FC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A6988F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:48:15 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: aacf9c6ad6220d0f127b0b3f2f0dc5819b866e82
X-Git-Newrev: 9800b5d3b46560c3b6f52b3a790776d415fe4149
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.3A6988F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing:
 bubblewrap: new runtime test
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9219453914504749300=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9219453914504749300==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9800b5d3b46560c3b6f52b3a790776d415fe4149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ad0796f2b40eb8dadc43e95dd1d56708b191375)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                       |   1 +
 support/testing/tests/package/test_bubblewrap.py | 127 +++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ca2f7df2b2..ae4e81a9e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1895,6 +1895,7 @@ F:	support/testing/tests/package/test_bitcoin.py
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

--===============9219453914504749300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9219453914504749300==--
