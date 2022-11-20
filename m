Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCC5C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 11:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8501F607F7;
	Sun, 20 Nov 2022 11:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8501F607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fqy-p4qd84k; Sun, 20 Nov 2022 11:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B96D9607C1;
	Sun, 20 Nov 2022 11:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96D9607C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD83E1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 11:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B65B281EFD
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 11:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65B281EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER8FwIAsyvoV for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 11:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7279A81EF8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7279A81EF8
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 11:17:12 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E8BD7B0057F;
 Sun, 20 Nov 2022 12:17:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 12:16:56 +0100
Message-Id: <20221120111656.8253-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
References: <20221119224225.589941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668943030;
 bh=dMxa9BZ3YuJvIoZDMQ5sIm5H4IBw0AcyGcANhkoTjHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJ00nB7z/UzUC0CkegVcoPMx+VqSU0CwBv0vNx+E8cEMD+tqdN+BUaNbhcHbYhzKz
 fjPX52CfYBow0yNFNZ7RXxiZnRSUIZP6SkoiIb84JwbbG0Z7vZb445VyGuyhSUutaO
 1blPFpQ326N+tVMogaMPrGhTaU8qi1+0J8SH1EJsVerSkAOmkChucKqfu0JsySRlWZ
 r2br1iRN96K1YGG39nhNIZVBA1VuYwj1jBHhEJLe83VoIpftUFiwD5vYzl5q4LTIf1
 Gy8gTQjfm/K/+6E6VeT3zj56DwRP/3+WZmPH9xxTkZbkokcQjRFAQB9sB5s4ObG6Y5
 j0KhyNo/LTFUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RJ00nB7z
Subject: [Buildroot] [PATCH next 7/7]
 support/testing/tests/package/test_python_magic_wormhole.py: new runtime
 test
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: This patch email was blocked by smtp spam filter. Resending.
---
 DEVELOPERS                                    |  1 +
 .../package/test_python_magic_wormhole.py     | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_magic_wormhole.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e68b3044..80ee4a0d08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 
diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
new file mode 100644
index 0000000000..d6541a2480
--- /dev/null
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -0,0 +1,62 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MagicWormhole(TestPythonPackageBase):
+    __test__ = True
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    timeout = 60
+
+    def twistd_cmd(self, command):
+        s = "twistd"
+        s += " --pidfile=/tmp/{}.pid".format(command)
+        s += " --logfile=/tmp/{}.log".format(command)
+        s += " {}".format(command)
+
+        return s
+
+    def test_run(self):
+        code = "123-hello-buildroot"
+        text = "Hello Buildroot!"
+
+        relay_url = "ws://localhost:4000/v1"
+        transit_helper = "tcp:localhost:4001"
+
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5", kernel="builtin",
+                           options=["-initrd", img])
+
+        self.emulator.login()
+
+        cmd = self.twistd_cmd("wormhole-mailbox")
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = self.twistd_cmd("transitrelay")
+        self.assertRunOk(cmd, timeout=30)
+
+        wormhole_cmd = "wormhole --relay-url={} --transit-helper={}".format(
+            relay_url, transit_helper)
+
+        cmd = wormhole_cmd + " send --code={} --text=\"{}\" & ".format(code, text)
+        cmd += "sleep 25"
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = wormhole_cmd + " receive {}".format(code)
+        output, exit_code = self.emulator.run(cmd, timeout=35)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], text)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
