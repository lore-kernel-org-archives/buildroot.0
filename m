Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFE7C47DB7
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00147402BC;
	Thu, 18 Jan 2024 21:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00147402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lE335zkgTjf9; Thu, 18 Jan 2024 21:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0575A40477;
	Thu, 18 Jan 2024 21:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0575A40477
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 492561BF37B
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 213724288A
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 21:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 213724288A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3iDtu9KZ8sI for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 21:11:58 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2E7842886
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 21:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E7842886
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B62B213F88D;
 Thu, 18 Jan 2024 22:11:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 22:11:48 +0100
Message-ID: <20240118211148.70993-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705612315;
 bh=J0co/W3E6kmGkrIczx7DE673PDGwrXmId5Bl5+yKmqY=;
 h=From:To:Cc:Subject:Date:From;
 b=r3ayFIli2cr5wEWX1FrqmQDI5Oai71TJmiLDP9PM/7J84RW0959yQKwibqCBeo8oN
 1xLYwndMLxgLYhsqe93bYEINQxxeu4AvP/pVb/mbnGX3Bs8kri6N9FGa+IWwcjPGKH
 vGhSjvLvg5rGgsP0QK2uBQze6zZbY2WFsEAw1aedfEzry8e4Aw0+GleVdw2WSUTFew
 5E8rlPuo/gfOKsrOV7oPndpU3foRutTKtVFZBZSEdh9cxbrinGocpvRcW4qqJRekOZ
 dH0SQLKExZ3qyIwaAEguwT29k1b0NlOZuzZiUO31pLFalntkE/rxwSPRU+fw6hO3Zm
 PmmD9qfptaRhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r3ayFIli
Subject: [Buildroot] [PATCH 1/1] support/testing: add strace runtime test
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
Patch tested on branch master at commit b200632 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_strace
    ...
    OK
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_strace.py | 37 ++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 support/testing/tests/package/test_strace.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..9b14b4a495 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1811,6 +1811,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
+F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
diff --git a/support/testing/tests/package/test_strace.py b/support/testing/tests/package/test_strace.py
new file mode 100644
index 0000000000..c1cba2173f
--- /dev/null
+++ b/support/testing/tests/package/test_strace.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestStrace(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_STRACE=y
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
+        self.assertRunOk("strace --version")
+
+        test_file = "buildroot-strace-test.txt"
+        test_file_mode = "0600"
+        strace_log = "strace.log"
+
+        # Create a test file.
+        self.assertRunOk(f"touch {test_file}")
+
+        # Run strace on a chmod
+        cmd = f"strace -o {strace_log} chmod {test_file_mode} {test_file}"
+        self.assertRunOk(cmd)
+
+        # Check the strace log contain a call to chmod()
+        expected_str = f"chmod(\"{test_file}\", {test_file_mode}) = 0"
+        self.assertRunOk(f"grep -F '{expected_str}' {strace_log}")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
