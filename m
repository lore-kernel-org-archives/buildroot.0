Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45039EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE18C40967;
	Mon, 26 Jun 2023 20:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE18C40967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHXE5LGzZPSj; Mon, 26 Jun 2023 20:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85499409E2;
	Mon, 26 Jun 2023 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85499409E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 413E31BF31B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A2C581F86
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2C581F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4VhA6lRk6jy for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 20:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18DFA81FB6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18DFA81FB6
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 20:06:05 +0000 (UTC)
Received: from home.juju.sh (unknown [37.171.107.73])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 01FA25FFB7;
 Mon, 26 Jun 2023 22:06:00 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 22:05:50 +0200
Message-ID: <20230626200550.13214-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230611203909.113108-1-ju.o@free.fr>
References: <20230611203909.113108-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687809962;
 bh=LWWt1ZO457LHsYSJOaNktsbB0oWAhW1HNXOMfIOx7Fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vMNDsG+z6wczmN4pap4/fO27whkl7j4+5k/PdN7xrYYatmnZV20hAR6YC+I8rcbVP
 eHEQTrAWgGne8f0KsVm77fP5gHEG8nF9JoHCMWaHazMXccN+z7x5UoEIpyW/JTU6QW
 1+WpA2y4MPYGh7WH2u6qsDIihWW1gNhTtLF2PjpgCvWbuKxhrYw2xTQ/sN5Q0MUfcx
 Qxjz9++WncxFApUcB8cUnc4S4yyXKvBaDL8Of7qzpYV7GmU8PiOh9Ik6Pw8LOmGCtv
 V6iQisBwSxEXFXDPdhl3p8vXEd3h5w2c/rzOGXlTfS3IcMVkoj5bIM/x511mI+PFKm
 z1a2K96dz7SiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vMNDsG+z
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_dos2unix.py: new runtime test
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dos2unix.py    | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 support/testing/tests/package/test_dos2unix.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..da9027f6f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1737,6 +1737,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
new file mode 100644
index 0000000000..af5850ae3e
--- /dev/null
+++ b/support/testing/tests/package/test_dos2unix.py
@@ -0,0 +1,45 @@
+import os
+
+import infra.basetest
+
+
+class TestDos2Unix(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_DOS2UNIX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can run. This test also checks that we're
+        # using the real "dos2unix" rather than the applet provided in
+        # BusyBox, since the "--version" option is recognized by the
+        # real dos2unix and return an error in BusyBox.
+        self.assertRunOk("dos2unix --version")
+
+        # Create a text file with UNIX new-lines
+        self.assertRunOk("echo -e 'Hello\\nBuildroot' > original.txt")
+
+        # Convert the original UNIX file to DOS
+        self.assertRunOk("unix2dos -n original.txt dos.txt")
+
+        # DOS file is expected to be different than the UNIX file
+        _, exit_code = self.emulator.run("cmp original.txt dos.txt")
+        self.assertNotEqual(exit_code, 0)
+
+        # The "cat -A" command should print '^M$' for CR-LF
+        self.assertRunOk("cat -A dos.txt | grep -Fq '^M$'")
+
+        # Convert back DOS file to UNIX
+        self.assertRunOk("dos2unix -n dos.txt unix.txt")
+
+        # "unix.txt" should be identical to "original.txt"
+        self.assertRunOk("cmp original.txt unix.txt")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
