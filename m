Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D4C61DA4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 22:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CDC416BD;
	Fri,  3 Mar 2023 22:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0CDC416BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lltvGUyTdTPB; Fri,  3 Mar 2023 22:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6707416B8;
	Fri,  3 Mar 2023 22:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6707416B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95EA41BF4DB
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 22:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E54A41D79
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 22:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E54A41D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XqzaxREpCob for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 22:27:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8896841D6B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8896841D6B
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 22:27:47 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.206.117])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 38B18B00533;
 Fri,  3 Mar 2023 23:27:43 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 23:26:58 +0100
Message-Id: <20230303222658.157671-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303222658.157671-1-ju.o@free.fr>
References: <20230303222658.157671-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677882465;
 bh=tAr8RGH9RLGZMeIsFPI0tE1+elYWti5ytXXpmChS52s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahF+4D9HQaefnAamWximbvrJelqwgGzRHnC56Ctit4ZjsOYII9YOmpXcwx1YF07Qd
 nj4INvbZe7/kpokvlzrjEn7n6KUQMigqLb7ZQojQ+HNGv/6nyXcb8k+lbYhO+H/iVP
 IZM4mmmxczzuwL5HufImP2/h0QxHzoGZ8DaTFp2ZPNq+muS9phUohBvNGQgyyPLVMi
 97H/0Cp8A40n5GOiTpTl6+NSqLqZ65EM+BW5hnHZ1OWS5YoAce4xgwkmKomovEt4Ns
 6xvDPUhZ3yq6IQVZK/rS97vC1IzAwlac36TUfdwzSuThlzqY6AT0puhNoUYS0zizMj
 nOjDrLWmMKqbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ahF+4D9H
Subject: [Buildroot] [PATCH next 2/2]
 support/testing/tests/package/test_kexec.py: new runtime test
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
Patch tested on branch next at commit b793f3a with commands:

    python3 -m flake8 \
        support/testing/tests/package/test_kexec.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_kexec
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_kexec.py   | 93 +++++++++++++++++++
 .../package/test_kexec/linux-kexec.fragment   |  5 +
 3 files changed, 100 insertions(+)
 create mode 100644 support/testing/tests/package/test_kexec.py
 create mode 100644 support/testing/tests/package/test_kexec/linux-kexec.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 21ea2b53e8..5cebaeb4f3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1719,6 +1719,8 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_kexec.py
+F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
new file mode 100644
index 0000000000..77e383373e
--- /dev/null
+++ b/support/testing/tests/package/test_kexec.py
@@ -0,0 +1,93 @@
+import os
+
+import infra.basetest
+
+
+class TestKexec(infra.basetest.BRTest):
+
+    # A specific configuration is needed for using kexec:
+    # - We use Aarch64 since it is well supported for kexec,
+    # - A kernel config fragment enables all the kexec parts,
+    # - The kernel Image is installed on target filesystem to be
+    #   reloaded through kexec,
+    # - We use a ext4 rootfs image exposed as a virtio storage (rather
+    #   than cpio initrd). This avoids needing to install the initrd
+    #   inside the rootfs.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_KEXEC=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
+        )
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Notes:
+        # Sufficient memory is needed to load the kernel: having at
+        # least 512MB works. kexec could silently fail if not enough
+        # memory is present. KASLR needs to be disabled for the test:
+        # we pass "nokaslr" to kernel bootargs, and also pass
+        # "dtb-kaslr-seed=off" to qemu virt machine.
+        bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
+        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={hda},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Test the program can execute
+        self.assertRunOk("kexec --version")
+
+        # Check the kexec kernel is NOT loaded:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 0")
+
+        # Load the Kernel:
+        # "--append br-test" adds a dummy kernel args we'll be able to
+        # check in the second executed kernel.
+        # We use the dtb image from /sys/firmware/fdt (since we don't
+        # have the dtb file in the system)
+        self.assertRunOk("kexec -d -l --dtb=/sys/firmware/fdt --reuse-cmdline --serial=ttyAMA0 --append=br-test /boot/Image")
+
+        # Check the kexec kernel IS loaded:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 1")
+
+        # Create a marker file in tmpfs which is supposed to disappear
+        # after kexec kernel restart.
+        self.assertRunOk("touch /dev/shm/br-kexec-marker")
+
+        # Execute the loaded kernel (i.e perform a kexec reboot)
+        # qemu.sendline() is used here because no exit code nor
+        # program return is expected, since kexec is like a
+        # reboot. The login is expected to be reached after the
+        # command is issued.
+        self.emulator.qemu.sendline("kexec -d -e")
+
+        # Wait for the login, and log again
+        self.emulator.login()
+
+        # Check the "br-test" dummy kernel arg is present
+        self.assertRunOk("grep br-test /proc/cmdline")
+
+        # Check the test marker file is no longer here
+        self.assertRunOk("test ! -e /dev/shm/br-kexec-marker")
+
+        # After restart, the kernel is not supposed to have a kexec
+        # loaded image:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 0")
diff --git a/support/testing/tests/package/test_kexec/linux-kexec.fragment b/support/testing/tests/package/test_kexec/linux-kexec.fragment
new file mode 100644
index 0000000000..04c65f5cae
--- /dev/null
+++ b/support/testing/tests/package/test_kexec/linux-kexec.fragment
@@ -0,0 +1,5 @@
+CONFIG_KEXEC=y
+CONFIG_KEXEC_FILE=y
+CONFIG_PROC_KCORE=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_KALLSYMS_ALL=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
