Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3207CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E717660B38;
	Sat, 10 Oct 2026 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXwmj3JaoB2V; Sat, 10 Oct 2026 09:27:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE28660BAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624454;
	b=d8sQCv4W50Alegl+dfoEYRKnJUJrZPJHuWVYrrqg4sXISS5LORVFNQYFMdxWoOduxkt5
	 G0HilDiWFpvK7wByUhB/LdsfeLzaHLIGqzTxGczYdtWPY5sEZ1wgPTrMDveZ9GJXidat+
	 fG1CnG0cRROj51vItdYf76wwTOJW4lDP1cFTNwPRqGi2ll8iN0d/UQC0huHGyHU+MTC1c
	 KnmQlib3XJnIu3PgIo1aENQZlWmB6X63c+5FQAVycNlnPM9ntUE0XaoDMnBLwfQNd77oi
	 7B42o9eHwKJUKsSC81zLDuNXkTTvmv2bWo64iEUM6JXJvIWHWxJ7/Z+Wjs1LT85DBGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xsx2vLI/3Xoop/u77rG2w0XQU+rYIxbzvgj7WDQBUWs=;
	b=SOZr+vOuc6ujIdbPU5gf9lMw/lyQYvjrOhw7FAAcUsBgXRjDRtBvSXxY/d3ahzFNfSox
	 oAGDWbv97ePS64D2gwcP+l37w1mbqsPfGNCzV4sRy0iRQCx831k729tXuwWFqYQbk55k0
	 hpuw/0STejOve8J9YjnETCg67/Fyz69i9ZOtR0fAIBr592RH7i5jW+sultlT51G2QtBC+
	 ttiFecpMwwbVFbZB70vXUiWDZpKHyN0JERQEgDDyTTYvQ2RrUIl/MEnZ2H2Znga2ISoaS
	 haZYUxD/PARrofhNiBkzxMhimOxOkoKBYafg0cF5MYCXW3IlybHojoj2mJztQ7F1ndg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624454;
	bh=xsx2vLI/3Xoop/u77rG2w0XQU+rYIxbzvgj7WDQBUWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fgZ9kJ1PJmZE1i8yYqrZOKwlcoHRP0Po74bEe/wMCmFjJkQsa2flno74WrCjiSon3
	 4nDkVmrdoUVN9ZzeUlKjq08aJAfXw5I8IJFY1us3J1NGHLBR3JKCLzHmRvO1+lXZYT
	 RYvnHRXdC9hWATSQOHaGZ1MemcL038CxrAYu5IpPG6AtTcn9VAY/kNC+zjtyy4xPZF
	 ZUUaKKCenpQXQrqBeLzwkJsokBcrmQEsMODoR+fp/8OpT3FG/fU4eoMqOGZAGX0+wg
	 5dmSE25ff/9EtO3ZXi2EN4TLs5O2hZzkg8ouv4HCgdmvfZBX/ypa1zpdItW5UAedqR
	 A46kxdG/R7GRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE28660BAC;
	Sat, 10 Oct 2026 09:27:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 367B9DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32037811E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy6j8UTqG1Cw for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 49AE68112C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=U6BoIidcrxT1w5Vq5ifjFeym/Uu9VQ2OP3z2paC/Kk/qZms7sPn/PYI3zSwpHMavevTo
 jc0AEPore5Uyf2hYI0nxxEtfwCzqD+oWdmwXgiM79CeZGxgsTImqQeA6PKuLuDx3BuY7P
 jPYHQI46GjRRsuuT6xGCwMFPJdFY8KDnf0Hb0XGL/e3BQkIxZf20I930ZWqjbVErAEzbm
 mOZGlJ8F59afA9FxfxEvHADqvzGDgnNTE0rG9E4Y1QbgtDaJipeAUbwC94heGvZY51/4O
 7mQg00T4UFNuKkB0C04zMf29QH8i0dTQohp3hxdDqZnIrwZKCtnzBhSygvmd249jD8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rJKONGrppyqa9xOfXzVXdvzvQVIkOHsnmPUzm+AL9Y0=;
 b=lDt759a/6Omn2uTtmW1poO05Lj9xLbxSdmLwtrUMshr1hxKlWnweIVgPaivk88ZAFSsG
 UJfYuKb16sTENTnCqjY3Vsdu57w3RrnYUtKURCVn8/OJB7LwdsxmmvZgUnat7qH4L5OJp
 d/CSFdT6lA4dRoqYA1X+nfRimxSfUL7Amg93d1mhdPagLoGnGIa4yzWxuMTDYEz2/8kZi
 XHIdcW7O0/Vo19cv9c0Jz03F4TI9BQosiw7rWOIdNCweDxSGUXyRKyTnmawDMQD3emtrl
 4yeeWjj198Ax4n8puDYiRSkvQ/K8vmr3O8fKtpUzM3QCY3fuYFtKrKaAG8SgKUEWqgw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49AE68112C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 320668F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:48:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f56bc5ffed61b597f3137b6e6c9a7bc656c88222
X-Git-Newrev: 4e0db0269a5e60d30ada0cf97bfc5064c8fbd503
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.320668F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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
Content-Type: multipart/mixed; boundary="===============4290832222175118487=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4290832222175118487==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e0db0269a5e60d30ada0cf97bfc5064c8fbd503
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ad0796f2b40eb8dadc43e95dd1d56708b191375)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                       |   1 +
 support/testing/tests/package/test_bubblewrap.py | 127 +++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82d60cf430..29acec54ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1819,6 +1819,7 @@ F:	support/testing/tests/package/test_bitcoin.py
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

--===============4290832222175118487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4290832222175118487==--
