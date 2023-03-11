Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE98C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 12:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62E7605A6;
	Sat, 11 Mar 2023 12:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62E7605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rD_bilHbVkth; Sat, 11 Mar 2023 12:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E8360E44;
	Sat, 11 Mar 2023 12:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E8360E44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 279B41BF3DD
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0154A60B74
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0154A60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkaVC8npkBSu for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 12:46:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9775B605A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9775B605A6
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 12:46:18 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.13.46])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7646313F8AF;
 Sat, 11 Mar 2023 13:46:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 13:46:07 +0100
Message-Id: <20230311124607.464110-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311124607.464110-1-ju.o@free.fr>
References: <20230311124607.464110-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678538777;
 bh=z4G2qbxe+jYxWzu2XvmNP2CDgkTiwuZyt/P4btqTAS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ou0ghvUIrkH6oBujMjSE1OeOEAqU3BtQGrwRc7TwDpZymk+apF7ECe0m2VKL9rNWQ
 WQQ8h1UrajbhQCEwqOFA51gBMZNfj/BXxRYHMYcfJVaCuqX0xUxhwhikoijSFebm9A
 ZudeJhgfzCzppM7WiOj6V77xhikpd3t3IUja0Xe9kuYpmzVjWmNzyLJQeSVbeDz1NE
 NH0vhztkcy78prGFxjC9FwERJ8cUpXSdgD3YtF/CeNnU4+S/qN/82hfCvRhlQTMKqS
 su/Rm1+0LLyvWrAMSTF/yJJdZ3bypihlzNgFMImc0WkOAB7akF1bp2dHZb8WgK48P8
 lMExR5DAJcB4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ou0ghvUI
Subject: [Buildroot] [PATCH next 2/2]
 support/testing/tests/package/test_lsof.py: new runtime test
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

    python3 -m flake8 support/testing/tests/package/test_lsof.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_lsof
    ...
    OK
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lsof.py | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_lsof.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..7733d5a04e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1719,6 +1719,7 @@ F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
new file mode 100644
index 0000000000..b0478dfbb7
--- /dev/null
+++ b/support/testing/tests/package/test_lsof.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestLsof(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_LSOF=y
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
+        test_file = "/tmp/this-is-a-test-file"
+
+        # Check the program can execute
+        self.assertRunOk("lsof -v")
+
+        # Check a normal program invocation
+        self.assertRunOk("lsof")
+
+        # Check lsof fails if requested file is not opened
+        _, exit_code = self.emulator.run("lsof {}".format(test_file))
+        self.assertNotEqual(exit_code, 0)
+
+        # Open the test file from the shell on descriptor 10
+        self.assertRunOk("exec 10> {}".format(test_file))
+
+        # Check that lsof now show the file
+        output, exit_code = self.emulator.run("lsof {}".format(test_file))
+        self.assertEqual(exit_code, 0)
+        # output[0] is the lsof header line
+        self.assertIn(test_file, output[1])
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
