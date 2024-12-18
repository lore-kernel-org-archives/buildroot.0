Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A64E77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 23:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A45426BE;
	Wed, 18 Dec 2024 23:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTFMl28-qO2c; Wed, 18 Dec 2024 23:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29924426BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29924426BF;
	Wed, 18 Dec 2024 23:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD86C0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3F685161
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5PQ5uJcQm6R for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 23:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4ECD08515F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ECD08515F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ECD08515F
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:05:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 236D9B0051B;
 Thu, 19 Dec 2024 00:05:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 19 Dec 2024 00:04:57 +0100
Message-ID: <20241218230457.993007-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734563106;
 bh=9f95MHds20v0vzVOxwAqJnLNlTOEQLZB6Rh6mRAZ20M=;
 h=From:To:Cc:Subject:Date:From;
 b=ngEQsAIC8m/65nt3+TWA2GlxtTMUlGmDktUmHSEYGRPWsEhtYnyMoWyoTUu2B5spV
 zCvxpmEebSlPkPQD4IAvBbfpGBrB+gVwLm+7dKf5gUWCoWwK5aqIo77r2si5uI3Agg
 bXaExYOiBhCFv9nuiDpbuwKifV0DTOY6I4hpFP3Rs+LUe1oKkk/0eIb7kHzQoE8wKK
 nIVYkwfCi51Y2nST1rYJmXGxAZeXibJmp74UQgyAKDZ3Z7Wr1n0TeE8P3aTLn/kQjd
 JgjYisFv39ZeauR+cIxc8w/EeaCEAnSVJ5YgB0I+HRIY2354ge8rDIz5KFpYncY7YB
 wlITih3xFaefQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ngEQsAIC
Subject: [Buildroot] [PATCH 1/1] support/testing: new patch runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8681269389
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_patch.py   | 44 +++++++++++++++++++
 .../test_patch/rootfs-overlay/root/file.diff  |  8 ++++
 .../test_patch/rootfs-overlay/root/file.txt   |  3 ++
 4 files changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/test_patch.py
 create mode 100644 support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
 create mode 100644 support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index 492eb765e0..f409d22353 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1950,6 +1950,8 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_parted.py
+F:	support/testing/tests/package/test_patch.py
+F:	support/testing/tests/package/test_patch/
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
diff --git a/support/testing/tests/package/test_patch.py b/support/testing/tests/package/test_patch.py
new file mode 100644
index 0000000000..67ecb0497a
--- /dev/null
+++ b/support/testing/tests/package/test_patch.py
@@ -0,0 +1,44 @@
+import os
+
+import infra.basetest
+
+
+class TestPatch(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_patch/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_PATCH=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        # Check the program can execute. This also checks that we are
+        # not using the patch applet from BusyBox (as it does not
+        # recognize the --version option).
+        self.assertRunOk("patch --version")
+
+        # We check the test file contains our expected string before
+        # the patch.
+        sed_cmd = "sed -n '2p' file.txt"
+        out, ret = self.emulator.run(sed_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello World!")
+
+        # We apply our test patch...
+        self.assertRunOk("patch -p1 < file.diff")
+
+        # We check the test file contains our expected string after
+        # applying the patch.
+        out, ret = self.emulator.run(sed_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello Buildroot!")
diff --git a/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
new file mode 100644
index 0000000000..d53324d84b
--- /dev/null
+++ b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
@@ -0,0 +1,8 @@
+diff -Naur a/file.txt b/file.txt
+--- a/file.txt	2024-12-18 23:11:50.863359248 +0100
++++ b/file.txt	2024-12-18 23:12:26.464561146 +0100
+@@ -1,3 +1,3 @@
+ This is some context...
+-Hello World!
++Hello Buildroot!
+ ...and this is some more context.
diff --git a/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt
new file mode 100644
index 0000000000..b506c73d9f
--- /dev/null
+++ b/support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt
@@ -0,0 +1,3 @@
+This is some context...
+Hello World!
+...and this is some more context.
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
