Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C406DC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DF94981D;
	Tue, 23 Jan 2024 21:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DF94981D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZu2s4pMrLWd; Tue, 23 Jan 2024 21:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5214927A;
	Tue, 23 Jan 2024 21:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5214927A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8473A1BF362
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D55E853C3
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D55E853C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsNOSuy_yy4C for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:55:04 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41B54853CD
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B54853CD
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0F78013F89C;
 Tue, 23 Jan 2024 22:54:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 22:54:54 +0100
Message-ID: <20240123215454.81191-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706046901;
 bh=2cJOCY17wwpkzi8U5+0IeCUOQe5lFfP7RraVm9gx5w0=;
 h=From:To:Cc:Subject:Date:From;
 b=aAioJvpdnoWRwJ1668CRGz8esqMDVNB8mWgYxMK0X/XMim34XqTQCjXC5wH0foWTl
 jpTfOstKA434muBA+CAbulyfkcCJpcHVSGHgQGsHSC1yYjbymNgj7Py8z7cXlFUOHz
 Uo6rr7Pe6o0Fiw9FPNo0xD3DR7IomrIfRaNS5MFt4lzF0WSLDlewa/pL9t2kzbHJz0
 wm7uzxVDd7ZS7oE5CX8FrffHKOWuZy2LqYT82iTGnS7YxbgZEc2qBuqZb2Jp3075Rr
 6JNcMVo1lZnGoun3n92xFVi7z4XZUItdQh+60P3ega7XNnIqZWTKVfw/vOhJJDkZ24
 0H7hVEC2c4HWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aAioJvpd
Subject: [Buildroot] [PATCH 1/1] support/testing: add fping runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_fping.py | 45 +++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 support/testing/tests/package/test_fping.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..fa760cb3ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,6 +1769,7 @@ F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
+F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
new file mode 100644
index 0000000000..58a1c92c0b
--- /dev/null
+++ b/support/testing/tests/package/test_fping.py
@@ -0,0 +1,45 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestFping(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_FPING=y
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
+        # Check the program can execute.
+        self.assertRunOk("fping --version")
+
+        # Fping v5.1 need to wait few seconds after a kernel booted
+        # before starting. This sleep time can be removed when the
+        # issue will be closed and the package updated. See:
+        # https://github.com/schweikert/fping/issues/288
+        time.sleep(5)
+
+        # Run 3 pings on localhost.
+        self.assertRunOk("fping -e -c 3 localhost")
+
+        # Run pings on a local subnet and print statistics.
+        self.assertRunOk("fping -s -g 127.0.0.0/28")
+
+        # Test an IPv6 ping.
+        self.assertRunOk("fping -6 ::1")
+
+        # Create a prohibited route to make fping fail.
+        self.assertRunOk("ip route add to prohibit 192.168.12.0/24")
+
+        # We expect fping to fail when pinging the prohibited network.
+        _, ret = self.emulator.run("fping 192.168.12.34")
+        self.assertNotEqual(ret, 0)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
