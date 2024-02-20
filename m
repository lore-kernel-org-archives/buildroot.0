Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E9C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 22:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29F6606CF;
	Tue, 20 Feb 2024 22:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hl5xzuULngbo; Tue, 20 Feb 2024 22:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D2A606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D2A606F5;
	Tue, 20 Feb 2024 22:07:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE3741BF29D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA89E40424
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiIg0AairWya for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 22:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7718640162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7718640162
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7718640162
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 22:07:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:48ec:5da2:e30:94b9])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 88F7519F59C;
 Tue, 20 Feb 2024 23:07:25 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 23:07:20 +0100
Message-ID: <20240220220720.166829-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708466846;
 bh=pnzS3N1NY0udaVEtTv6pMS2nK1Mpl61TDX/iDL574k8=;
 h=From:To:Cc:Subject:Date:From;
 b=X/B82pnvOLkQm5tihWnxNVff/51vEm3v/tmIvcVACQx1ZIMiHVP/nP21EQ//56Tej
 L6SjV5qSfEomPWV6YI2eOkwip6fTTTCl3CHVAgBJEq0qX7TdvhaRCdAyUXorj7a7xu
 5ccKvMXC5v+ni2RAuPdg+7q3TdUaMh4XUaqRcfRICdtlH7Zw94RgM0UD9l9wLsfkXQ
 U84WSHpAniXXorvDmYd/IZg65aUvdKoqV9EYsHL6tmhNpTOVSaS7CQ2bzOY1wYGGL0
 OETwFi9s9KbtRjBSibRYG34gxof5FvNOz+H8X5ijXWjOiPrbMsby8n6wZoqmdAfua8
 Pq7Q03RxsrmfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X/B82pnv
Subject: [Buildroot] [PATCH 1/1] support/testing: add make runtime test
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
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_make.py    | 82 +++++++++++++++++++
 .../test_make/rootfs-overlay/root/Makefile    | 23 ++++++
 3 files changed, 107 insertions(+)
 create mode 100644 support/testing/tests/package/test_make.py
 create mode 100644 support/testing/tests/package/test_make/rootfs-overlay/root/Makefile

diff --git a/DEVELOPERS b/DEVELOPERS
index f0e16af1623..6c8d07d4761 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1815,6 +1815,8 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_make.py
+F:	support/testing/tests/package/test_make/
 F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
diff --git a/support/testing/tests/package/test_make.py b/support/testing/tests/package/test_make.py
new file mode 100644
index 00000000000..d549cca37d8
--- /dev/null
+++ b/support/testing/tests/package/test_make.py
@@ -0,0 +1,82 @@
+import os
+
+import infra.basetest
+
+
+class TestMake(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_make/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_MAKE=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def gen_expected_str(self, count):
+        """Return the expected string generated by the test Makefile"""
+        return "".join(map(lambda x: str(x), range(1,count+1)))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("make --version")
+
+        # We touch the Makefile to set its modification time to the
+        # current system time. This is to avoid warnings from Make
+        # about having files with timestamps in the future. This is
+        # because the minimal system running in the emulator might not
+        # set the clock to the real time, and the Makefile has a
+        # correct timestamp from the build host (which is likely at
+        # the correct time).
+        self.assertRunOk("touch Makefile")
+
+        # We test the "message" target and check we get the expected
+        # string.
+        out, ret = self.emulator.run("make message")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello Buildroot!")
+
+        # We redo the same test, this time by passing a new message
+        # with a variable.
+        msg = "This is Another Message..."
+        out, ret = self.emulator.run(f"make message MESSAGE='{msg}'")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We run a simple "make" invocation, using the defaults.
+        self.assertRunOk("make")
+
+        # We check the generated output contains the expected string.
+        expected_str = self.gen_expected_str(10)
+        out, ret = self.emulator.run("cat output.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], expected_str)
+
+        # Clean the previous invocation.
+        self.assertRunOk("make clean")
+
+        # We check a output generated file is no longer present.
+        self.assertRunOk("test ! -e output.txt")
+
+        # We run an invocation with a larger COUNT value. GNU Make
+        # version 4.4 introduced the --shuffle option, which shuffle
+        # rules. We use it with a constant seed, in order to have a
+        # stable reshuffling in all test runs. We also include in this
+        # execution a request for parallel jobs.
+        count = 50
+        seed = 123456
+        self.assertRunOk(f"make -j10 --shuffle={seed} COUNT={count}")
+
+        # Despite the pseudo-randomization in the previous invocation,
+        # the expected output should be correctly ordered.
+        expected_str = self.gen_expected_str(count)
+        out, ret = self.emulator.run("cat output.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], expected_str)
diff --git a/support/testing/tests/package/test_make/rootfs-overlay/root/Makefile b/support/testing/tests/package/test_make/rootfs-overlay/root/Makefile
new file mode 100644
index 00000000000..7ac86945a5e
--- /dev/null
+++ b/support/testing/tests/package/test_make/rootfs-overlay/root/Makefile
@@ -0,0 +1,23 @@
+MESSAGE ?= "Hello Buildroot!"
+COUNT ?= 10
+
+LIST = $(shell seq $(COUNT))
+INPUTS = $(addsuffix .in.txt,$(LIST))
+OUTPUT = output.txt
+
+.PHONY: all
+all: $(OUTPUT)
+
+.PHONY: clean
+clean:
+	$(RM) $(OUTPUT) *.in.txt
+
+.PHONY: message
+message:
+	@echo $(MESSAGE)
+
+%.in.txt:
+	echo $(subst .in.txt,,$@) > $@
+
+$(OUTPUT): $(INPUTS)
+	(cat $? | tr -d '\n' ; echo) > $@
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
