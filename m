Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F0BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C095740967;
	Mon,  5 Feb 2024 22:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C095740967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obFtr2BE42BB; Mon,  5 Feb 2024 22:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB8C410A6;
	Mon,  5 Feb 2024 22:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB8C410A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A350A1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D9F5814B7
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D9F5814B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMnmita61g6x for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F143814A9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F143814A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B3E786E83; Mon,  5 Feb 2024 22:29:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:27:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ce02d84ada4fdf6fbf45a60a7934a5edae05c8f
X-Git-Newrev: e03513c773a4b58b87abbe906d9ca29b0c50ae5c
X-Patchwork-Hint: ignore
Message-Id: <20240205222916.7B3E786E83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add a "file" package
 runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e03513c773a4b58b87abbe906d9ca29b0c50ae5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_file.py         |  48 +++++++++++++++++++++
 .../package/test_file/rootfs-overlay/root/code.c   |   9 ++++
 .../test_file/rootfs-overlay/root/plain-text.txt   |   1 +
 .../rootfs-overlay/root/plain-text.txt.gz          | Bin 0 -> 62 bytes
 .../test_file/rootfs-overlay/root/random-data.bin  | Bin 0 -> 512 bytes
 .../test_file/rootfs-overlay/root/script.py        |   3 ++
 .../test_file/rootfs-overlay/root/script.sh        |   3 ++
 .../rootfs-overlay/root/symlink-to-plain-text.txt  |   1 +
 9 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7a10c364d..5467e465d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,6 +1769,8 @@ F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_file.py
+F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
diff --git a/support/testing/tests/package/test_file.py b/support/testing/tests/package/test_file.py
new file mode 100644
index 0000000000..84eadc5ead
--- /dev/null
+++ b/support/testing/tests/package/test_file.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestFile(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_FILE=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_file/rootfs-overlay")}"
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
+        self.assertRunOk("file --version")
+
+        tests = [
+            ("", "plain-text.txt", "ASCII text"),
+            ("-i", "plain-text.txt", "text/plain"),
+            ("", "plain-text.txt.gz", "gzip compressed data"),
+            ("-i", "plain-text.txt.gz", "application/gzip"),
+            ("-z", "plain-text.txt.gz", "ASCII text"),
+            ("", "random-data.bin", "data"),
+            ("-i", "random-data.bin", "application/octet-stream"),
+            ("", "code.c", "C source"),
+            ("-i", "code.c", "text/x-c"),
+            ("", "script.sh", "POSIX shell script"),
+            ("-i", "script.sh", "text/x-shellscript"),
+            ("", "script.py", "Python script"),
+            ("", "/usr/share/misc/magic.mgc", "magic binary file for file"),
+            ("", "/usr/bin/file", "ELF"),
+            ("", "/dev/zero", "character special"),
+            ("", "/", "directory"),
+            ("-h", "symlink-to-plain-text.txt", "symbolic link"),
+            ("-L", "symlink-to-plain-text.txt", "ASCII text")
+        ]
+        for opt_str, path, pattern in tests:
+            cmd = f"file {opt_str} '{path}'"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0, f"Failed to run '{cmd}'")
+            self.assertIn(pattern, "\n".join(out))
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/code.c b/support/testing/tests/package/test_file/rootfs-overlay/root/code.c
new file mode 100644
index 0000000000..7095eaca31
--- /dev/null
+++ b/support/testing/tests/package/test_file/rootfs-overlay/root/code.c
@@ -0,0 +1,9 @@
+#include <stdlib.h>
+#include <stdio.h>
+
+int
+main(void)
+{
+    printf("Hello Buildroot!\n");
+    exit(EXIT_SUCCESS);
+}
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt b/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt
new file mode 100644
index 0000000000..1c5aa36037
--- /dev/null
+++ b/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt
@@ -0,0 +1 @@
+This is a plain text file...
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt.gz b/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt.gz
new file mode 100644
index 0000000000..95d398f8d1
Binary files /dev/null and b/support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt.gz differ
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin b/support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin
new file mode 100644
index 0000000000..eea0ae8b76
Binary files /dev/null and b/support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin differ
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/script.py b/support/testing/tests/package/test_file/rootfs-overlay/root/script.py
new file mode 100755
index 0000000000..79191b3048
--- /dev/null
+++ b/support/testing/tests/package/test_file/rootfs-overlay/root/script.py
@@ -0,0 +1,3 @@
+#! /usr/bin/env python3
+
+print("Hello Buildroot!")
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/script.sh b/support/testing/tests/package/test_file/rootfs-overlay/root/script.sh
new file mode 100755
index 0000000000..75b2d5e017
--- /dev/null
+++ b/support/testing/tests/package/test_file/rootfs-overlay/root/script.sh
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+echo "Hello Buildroot!"
diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/symlink-to-plain-text.txt b/support/testing/tests/package/test_file/rootfs-overlay/root/symlink-to-plain-text.txt
new file mode 120000
index 0000000000..a3ae3c0058
--- /dev/null
+++ b/support/testing/tests/package/test_file/rootfs-overlay/root/symlink-to-plain-text.txt
@@ -0,0 +1 @@
+plain-text.txt
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
