Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622FDC47422
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 22:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB12940119;
	Wed, 24 Jan 2024 22:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB12940119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbWZ6SImtPkP; Wed, 24 Jan 2024 22:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EBB0405CF;
	Wed, 24 Jan 2024 22:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EBB0405CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34C151BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD7D41B80
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD7D41B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU5TSQN5DMKP for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 22:20:00 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6353C418F0
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6353C418F0
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C8CC713F846;
 Wed, 24 Jan 2024 23:19:55 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 23:19:50 +0100
Message-ID: <20240124221950.14714-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706134797;
 bh=pjyuiNYwnb2xT+BNkMiPXz/QeNF5hPHb8rAZ4is+uqA=;
 h=From:To:Cc:Subject:Date:From;
 b=Tm/TwiKx9G0O1f1Y6lfmPmWA2L91Qwe2jjcbEOsmh12YrQX11lrx/LSZuAJs8vxdp
 ewwS1ceVIAO+UhDLb/XwcXEY3TRqUmfCNKFxT1tfrAT121i1twFUZUBkqK/mQfNSdp
 4MVtrF3gJ2VO4Mgazkiz9fCnUW+oXFLXrW35hLxMCVgtf5wXTY3e7ZN1CMZ/fcse9a
 CSjKX/SB+M/XxAyqePBNU5poM/MteBuuQGdzhiuoolLZihbiYWaTI+zMSArSR75NNT
 JH9Fv7d6j/CKLq07Hp/19wAQRRsPggH0wMabYBCvdVCmsCVbB3FNmo4MkoB3u+5Swr
 zrtomB+YHHb6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tm/TwiKx
Subject: [Buildroot] [PATCH v2 1/1] support/testing: add a "file" package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
Included Yann's comments:
- Moved test data in rootfs-overlay,
- Merged all test cases in a single loop,
- Do the output pattern check in Python,
Other change:
- Added 2 cases (C and shellscript MIME)

Patch tested on branch master at commit fb007c9 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_file
    ...
    OK
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_file.py    |  48 ++++++++++++++++++
 .../test_file/rootfs-overlay/root/code.c      |   9 ++++
 .../rootfs-overlay/root/plain-text.txt        |   1 +
 .../rootfs-overlay/root/plain-text.txt.gz     | Bin 0 -> 62 bytes
 .../rootfs-overlay/root/random-data.bin       | Bin 0 -> 512 bytes
 .../test_file/rootfs-overlay/root/script.py   |   3 ++
 .../test_file/rootfs-overlay/root/script.sh   |   3 ++
 .../root/symlink-to-plain-text.txt            |   1 +
 9 files changed, 67 insertions(+)
 create mode 100644 support/testing/tests/package/test_file.py
 create mode 100644 support/testing/tests/package/test_file/rootfs-overlay/root/code.c
 create mode 100644 support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt
 create mode 100644 support/testing/tests/package/test_file/rootfs-overlay/root/plain-text.txt.gz
 create mode 100644 support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin
 create mode 100755 support/testing/tests/package/test_file/rootfs-overlay/root/script.py
 create mode 100755 support/testing/tests/package/test_file/rootfs-overlay/root/script.sh
 create mode 120000 support/testing/tests/package/test_file/rootfs-overlay/root/symlink-to-plain-text.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index a6e4b7cdb7..5088554c96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1767,6 +1767,8 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_file.py
+F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_gawk.py
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
index 0000000000000000000000000000000000000000..95d398f8d17819f6f54c19556a0ede85d87b5f01
GIT binary patch
literal 62
zcmb2|=HPJnzb2J|xgaMoGf%f9wW36?q@sj@`{W6oFos1gtxa=|oUv)0bfrtEb<3GK
SA-1-*dJOq`Zii(V7#INQ6&E=G

literal 0
HcmV?d00001

diff --git a/support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin b/support/testing/tests/package/test_file/rootfs-overlay/root/random-data.bin
new file mode 100644
index 0000000000000000000000000000000000000000..eea0ae8b76732c222dabd1f41a0a3078684e36d0
GIT binary patch
literal 512
zcmV+b0{{KpR9Y!f%LlZBWnY!TWRP(B%0`7N4ZcPM4l~SX-q*er9xaj-b$K+42>O~J
z%NEm6i_0Ew>}uF2WS*4xAKu2%4)XBLR|M}bEMS<7MP>eGR^%&3@2^?lRzn`}bm9>x
z_(e`gX$&$Amx{84&euTLLPyWpOIKgSFopSYA*{q?tH+i@WrnTBuMGp4oDGzd&xO?t
zVKBxuXzI9nC|ff|lst`s;;(PFc;9#0A0`gH<k*m9Z4Ijy9@(?$=P5k34WU{LaR3kq
zGoG+n7iAQoFtA@-Z;~RL5_j`@uvlF+>5qCVbmkz4v<&z5?bXko!I`##33%!zmHZz$
z=A(e+c>Ad4Kg7T2(0auWV?t6SqMNe2JdfzWx59a*Lxh+|u>7CW4P6Uzm}!=U1AOYW
zL}{X=-Qx>X$gdtUGKtTzb3?CS7VLAH%|?9UHj7z5rMY%Bz^^nBmDw450px1I6J9E)
z%jY+!DHbvn7(NdB#-7;Z%k<&7*hIx!W-c}k3Dj`IK&z(B2yC@37KTprOVwG7sDbhv
zMegzVjj^r&OHlsGp2;ekV?C}u;KdKhVBWMZx-rUhAIesO`nXO4t3?W`yx$YhLn|RG
z##8L(0ryrm(hz5cwm#~3?Cv5c*-t&=ZT7@aHVmS{LPMK(ylJtVZ7W;M`yqg=n}4>Q
CEdYW5

literal 0
HcmV?d00001

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
