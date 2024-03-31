Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811ACD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 20:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20BD81407;
	Sun, 31 Mar 2024 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogaSNi_55L-0; Sun, 31 Mar 2024 20:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2FC58141F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2FC58141F;
	Sun, 31 Mar 2024 20:15:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEFEC1BF422
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB874605D7
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvIdwooFo-Ch for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 20:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA62C605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA62C605D2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA62C605D2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 20:14:59 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3F1CB00592;
 Sun, 31 Mar 2024 22:14:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 22:14:23 +0200
Message-ID: <20240331201423.174954-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711916096;
 bh=1XIDUE1KGI/uJvyOHv8yspZ7024x18PTsU9UkgsqZnw=;
 h=From:To:Cc:Subject:Date:From;
 b=EEEK5hARZJAkKqCTc/cKLseO7SZz2W3AodNEju+k+0/XM9nCT01y04jrKuTyJ0Xrs
 PkUIV8GMJ/pbqo8dIbGMQh/LR4yY+Te0G6erms+XF11BSfZLhYKlTGIAAjNEddIG4S
 fREKAldzw6yS2e6QUkzwIaQX4cJhJewgqOCXDbiiyq5UnemOM63H0O3I+4JLrCdRxF
 zeGoCQBdyQnUtGOFm82J84oqY3CENt5Exa5uoeme73xGg2fA48yYPsVonBYIsst9jX
 kaYJtxEC4ojr1Eu3SZKqWLezexIEM/7YitcNFtU5Q0EXISRexh8qfXYHFXg8OmLRoi
 nrt4UAO7VV8Lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EEEK5hAR
Subject: [Buildroot] [PATCH 1/1] support/testing: add ed runtime test
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
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_ed.py | 98 ++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 support/testing/tests/package/test_ed.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 313fc16b9d7..288a3ce0e68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1780,6 +1780,7 @@ F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_ed.py b/support/testing/tests/package/test_ed.py
new file mode 100644
index 00000000000..eee5f8c4fc6
--- /dev/null
+++ b/support/testing/tests/package/test_ed.py
@@ -0,0 +1,98 @@
+import os
+
+import infra.basetest
+
+
+class TestEd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ED=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def run_ed_cmds(self, ed_cmds):
+        cmd = "ed <<EOF\n"
+        cmd += "\n".join(ed_cmds)
+        cmd += "\nEOF"
+        self.assertRunOk(cmd)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can run. This also check we have the
+        # actual GNU ed, rather than the Busybox ed, which does not
+        # recognize the --version option.
+        self.assertRunOk("ed --version")
+
+        test_fname = "test.txt"
+        input_text_lines = [
+            "Hello World",
+            "Embedded Linux is Hard."
+        ]
+        output_expected_text = [
+            "Hello Buildroot",
+            "---------------",
+            "Making Embedded Linux Easy."
+        ]
+
+        # We define few "ed" command sequences, creating and editing a
+        # text file. The final output of this sequence is expected to
+        # match the expected text previously defined.
+        create_file = ["a"]
+        create_file += input_text_lines
+        create_file += [
+            ".",
+            f"w {test_fname}",
+            "q"
+        ]
+
+        edit_file = [
+            f"r {test_fname}",
+            "1",
+            "s/World/Buildroot/",
+            "2",
+            "s/is Hard/Easy/",
+            "s/^/Making /",
+            "w",
+            "q"
+        ]
+
+        insert_txt = [
+            f"r {test_fname}",
+            "2",
+            "i",
+            "This is a new line",
+            ".",
+            "w",
+            "q"
+        ]
+
+        change_txt = [
+            f"r {test_fname}",
+            "2",
+            "c",
+            "---------------",
+            ".",
+            "w"
+            "q"
+        ]
+
+        # We execute all "ed" command batches.
+        ed_cmd_batches = [
+            create_file,
+            edit_file,
+            insert_txt,
+            change_txt
+        ]
+        for ed_cmd_batch in ed_cmd_batches:
+            self.run_ed_cmds(ed_cmd_batch)
+
+        # The final test file should contain the expected text.
+        out, ret = self.emulator.run(f"cat {test_fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out, output_expected_text)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
