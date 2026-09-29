Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B499CA5FA1
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6114054E;
	Tue, 29 Sep 2026 06:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I1nJuHfb0gQ; Tue, 29 Sep 2026 06:36:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72D2740541
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790663761;
	b=FhpOSQ125c72sKcY4WLBZlOTKfm2NFl35aAhH7yVxKGs1rCfhr4n1RN+ghGjon/pTEzf
	 OZDmC0kAiYYXW+PVtbE9VLX8rh7dndcLyP6oZw08lPiRfcBI4AYIKypvl/WXvISBPBUGo
	 hK+8uOkpolfQKl66ySeK++SzZZSCAztSI0EKl8yPRzOxOOHeDEXbiMSs+MH1RyPpLadSe
	 2XCWeC/Uka9dKCWFYn4hbcbci+rdIjJ2C3yoYQqXLEaFo8BKQWKMDaYUVHdeX5iMb7f/x
	 r2Rh7YbkjcKF4cnZKM7U2b+L6nj6xNIH0chcRgZwIFWAGN7CGKN+XmcsUuxqBTpgqcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790663761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mztsxt57r0x/+O2abrV/dzrsPDyEkmEVT56JIE3BRK4=;
	b=MAK40QGe3QkViZW1uOPYIlWXtP0ORhMNcy5z9T5VImq55Cbf3qriS3ZZoeqPtt5Ws228
	 uf8F8kuvto3aTFX2Rcqc3VPFylTbsdAxj0lCIed4U5G1cNZp3k6NZEx6Eq4khHSEVI2Ge
	 qisdJ+SOqrZW4qBZzoT4N4vjDNpc/MJCSdmuH0MTktRjdzjeimXMQchHK+Nc8UUK07gjt
	 UiKOQvBQDwEOFFrTkXf953u/2spwjv2R4vgdkNA6JM2V+ncN/0nMztv7zfgwgiFyuKW69
	 jszfmXhR1eZBliY5QqXLCUNApmz5AmNoUGT5xXnjFRJMXkJSkVk1nNkk/AH9gIyBJDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790663761;
	bh=Mztsxt57r0x/+O2abrV/dzrsPDyEkmEVT56JIE3BRK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EfOMG0ogVGnYcPkMcDOes7ALd5NW81u6oYlMnOKAf7ecrkqESXl1KgO8Zm+7TMMWd
	 DE19HS2yLEBUpqvDtNKG2msLdDpuSmKRWtSGUCdCaXbt3S17G5oyoyr7FRH3PLB0kr
	 DcbSQgiBS/eKZ2OiwOaJVTdmKyv8TkPBtD8ZEVshqdSQyoZG+CZe1fmREFW6oxlLDs
	 BRGGfgy/h6hok61467Y8bghD5/PxD9YSfxv9aPMknk4Q3wzzh0F3n9evHFn8sEgKiE
	 F0BF9lqWhxq02lRPQX4U1ti59NqNwepb7YKBteb08RAV8pRWEU/hilZAYUh4J0ABHQ
	 RcwTr8qdbsEFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D2740541;
	Tue, 29 Sep 2026 06:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9897335
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 06:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9929B80A47
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 06:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FIKTGISVM7W for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 06:35:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B31E9809EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790663758;
 b=pAATOZUFWAXrntA1cWeB/+4I6woT1qVfvlEa4HnQDWrec7jbCtWjJd6kCkCIQnW+D21T
 9+AMHUTgWvGf0wXCdtmVFdidDFE2OWCqOMRWqsA/PJwDRIZJhDm/R03zuhtwAWkN4Eb/X
 k4nt75a+JXPB9ZN5t7lSBFVarpMPfKSeqRhL+65sKSYCh1twAr/DGspbeLSiWTKGrcue0
 8mjw1Og1W5VyVnkmO37Tn5iVxm9dJdEQ/mcpNuleQk9iNQNFX17YVQ86nQmb2Xt4eMrfI
 xwPVGeHra5eCst/4O16QFeCvS7Pnv5pRKulN1qlKJMMxce9GzRX77gIpnalcj/vxihA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790663758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=42WiUCd1/Uoo5s+uUN2ooQYiyG4gvlSkbbgKCHMWqos=;
 b=sxXdrnPF3sJHIfjTR132pJiZWLafNsPjCZnAjng/S/Fm3wB1G84GY7fzZFo5Y9VusuMc
 I61yZPuyMURFvDcvXoYLazmCeNM+GXhuBPLFFH7wJxmRqwVeG8sfEe2RWY5e5WmUiw3LV
 4gSaTsjUCo+dP2anATu3zhS2hvLUHTT6g+Mq1C87/lRrO9wcDfZTLcjeMb818AsdwsD76
 BTd8jSSAqVsbnBVuxfoGLjxzGM3SbnpWypLEhOCijcjoBbSTGqwZnj+YqlkZ9bmJZwY98
 dWwhTKHWxx/s9SREHIoNnInTu/czCL2FCl4XbZ+Zz/KigjDDnVsNK5VSKKvXfIM63+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31E9809EB
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 06:35:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008B990004; Tue, 29 Sep 2026 06:34:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 08:35:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54ccee7e6763801a48451cac52e9cb93ebee3b7c
X-Git-Newrev: 1ad0796f2b40eb8dadc43e95dd1d56708b191375
X-Patchwork-Hint: ignore
Message-Id: <20260929063446.008B990004@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: bubblewrap: new runtime
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ad0796f2b40eb8dadc43e95dd1d56708b191375
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |   1 +
 support/testing/tests/package/test_bubblewrap.py | 127 +++++++++++++++++++++++
 2 files changed, 128 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
