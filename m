Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA884D65543
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B88E6FA7B;
	Tue, 26 Nov 2024 18:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OR-w0YKbTM8R; Tue, 26 Nov 2024 18:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C5276FA83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5276FA83;
	Tue, 26 Nov 2024 18:30:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F375DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F34844EBD6
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR_uZXgLorWl for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD6074EBD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6074EBD4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD6074EBD4
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:30:20 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 98C4FB00572;
 Tue, 26 Nov 2024 19:30:17 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 26 Nov 2024 19:30:12 +0100
Message-ID: <20241126183012.39202-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732645818;
 bh=AexR0f5OIdkV+RphlRPgXSVVOQE75PZHi8d5e4kODkA=;
 h=From:To:Cc:Subject:Date:From;
 b=NkOGYl7esZnmJ5SLPvJABLGxKdoPGx9MNHBecBdZWq17QElv4W/v50D4fYItemUif
 /N/WI2sh4DFaLZ1hwuewQUU5vuMYdtQn4X4gY7bH1pb4Sb5BTmeQuoEzeVY+ffqaQO
 qzO1eCVugYTGdhbOg9EMLUu9+YYvc4mYb+NU/Sm/SXCMSmo5B/NaptgUjKB2I1h/9A
 qyTeU1JLfvM0yrsN3tPE8zoGQSewF20pO9Vqg2TNi07/BGwZC0YNkWGSXOtpM1jfs8
 KgKAbI8h45t6o85hFE+bvD60R7hCPpU4t02wco3IbR9gZCuLf2K/9/mlt3vTmAnkZa
 vQVbZK7kylupg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NkOGYl7e
Subject: [Buildroot] [PATCH 1/1] support/testing: new openocd runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8477140333
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openocd.py | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 support/testing/tests/package/test_openocd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d75df5cc55..1045324a52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1953,6 +1953,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_openocd.py
 F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
diff --git a/support/testing/tests/package/test_openocd.py b/support/testing/tests/package/test_openocd.py
new file mode 100644
index 0000000000..fe4d203073
--- /dev/null
+++ b/support/testing/tests/package/test_openocd.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenOCD(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OPENOCD=y
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
+        # We check the program can run.
+        self.assertRunOk("openocd --version")
+
+        msg = "Buildroot"
+
+        # We check openocd can run, load a "dummy" driver in the
+        # standard search path, and use some of its TCL commands. See:
+        # https://github.com/openocd-org/openocd/blob/v0.12.0/doc/manual/primer/commands.txt#L117
+        # https://github.com/openocd-org/openocd/blob/v0.12.0/src/jtag/drivers/dummy.c
+        cmd = "openocd"
+        cmd += " -f interface/dummy.cfg"
+        cmd += f" -c 'dummy hello {msg}'"
+        cmd += " -c shutdown"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_str = f"Greetings {msg}!"
+        self.assertIn(expected_str, out)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
