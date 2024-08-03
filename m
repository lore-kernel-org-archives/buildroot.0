Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0889AC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435A6403DC;
	Sat,  3 Aug 2024 10:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe2brIFclMCa; Sat,  3 Aug 2024 10:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F38403E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F38403E3;
	Sat,  3 Aug 2024 10:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACB7D1BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 969DC40198
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHRuqrFEEB_f for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4581040118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4581040118
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:34:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D83B83B29; Sat,  3 Aug 2024 10:34:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 12:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92d652df4869d073e383d9d44b5c43e338d83c29
X-Git-Newrev: 3e1e49069d5fc67b434de94637409c6ced915dea
X-Patchwork-Hint: ignore
Message-Id: <20240803103435.2D83B83B29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add make runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e1e49069d5fc67b434de94637409c6ced915dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_make.py         | 82 ++++++++++++++++++++++
 .../package/test_make/rootfs-overlay/root/Makefile | 23 ++++++
 3 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c1fc7fc8e..aede8197e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1909,6 +1909,8 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_make.py
+F:	support/testing/tests/package/test_make/
 F:	support/testing/tests/package/test_mawk.py
 F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
diff --git a/support/testing/tests/package/test_make.py b/support/testing/tests/package/test_make.py
new file mode 100644
index 0000000000..2ec62826be
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
+        return "".join(map(lambda x: str(x), range(1, count+1)))
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
index 0000000000..7ac86945a5
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
