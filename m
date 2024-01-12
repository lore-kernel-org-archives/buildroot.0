Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D69C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5288040399;
	Fri, 12 Jan 2024 20:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5288040399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkjfadEGaKpv; Fri, 12 Jan 2024 20:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 387BD4044F;
	Fri, 12 Jan 2024 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 387BD4044F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6D9B1BF2A7
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F75E42C4F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F75E42C4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raVp0J3Bq7DD for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 20:50:03 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58D18416C0
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 20:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D18416C0
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1F26313F89A;
 Fri, 12 Jan 2024 21:49:58 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 21:49:52 +0100
Message-ID: <20240112204952.229925-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705092600;
 bh=iS06Yi8/31AdDrk0ltc/wGDj0i44CrG2rQIfR2Ia12I=;
 h=From:To:Cc:Subject:Date:From;
 b=vCXotOwurZ3EZjjQcf+Xj5TsXJMTUKxpEomx20QkKQ8TOShgx8rZkg5uhJ7s8u5fC
 ouv+jjeLch5gsNpLRXFdQqRg1Vp88Gi7Lc+1JAiB7lFju28Bw1Zxura68MTOUSm0Xy
 eAhkvsWFgox37WgsRI40CJp8CY0+iPzgrd9vQOgEOSJ00AGhVZ+V8ffZmXAEgBXXvL
 r4M4HBgLad2uAkUReebFkasJTUciCmAmbS/MA48ox+cX5xB1EGthpaePBx4HbigoaZ
 ItAiPmXeFCyUuq2tfTIBw5PW3i7K26UeWWNl88Bmhl08EeLXF2ny6X0vG7dknwfk69
 9SySAXfAeXyPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCXotOwu
Subject: [Buildroot] [PATCH 1/1] support/testing: add a "file" package
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
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_file.py | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 support/testing/tests/package/test_file.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..8179974097 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1765,6 +1765,7 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_gawk.py
diff --git a/support/testing/tests/package/test_file.py b/support/testing/tests/package/test_file.py
new file mode 100644
index 0000000000..686fa52d72
--- /dev/null
+++ b/support/testing/tests/package/test_file.py
@@ -0,0 +1,81 @@
+import os
+
+import infra.basetest
+
+
+class TestFile(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_FILE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def generate_test_data(self):
+        cmd = "echo 'Hello Buildroot!' > file.txt"
+        self.assertRunOk(cmd)
+
+        cmd = "gzip -k file.txt"
+        self.assertRunOk(cmd)
+
+        cmd = "ln -s file.txt link.txt"
+        self.assertRunOk(cmd)
+
+        cmd = "echo 'void main(void) { printf(\"hello\\nBuildroot!\"); }' > file.c"
+        self.assertRunOk(cmd)
+
+        cmd = "echo -e '#!/bin/sh\necho Hello Buildroot' > file.sh"
+        self.assertRunOk(cmd)
+
+        cmd = "echo -e '"
+        cmd += "#!/usr/bin/env python3\nprint(\"Hello Buildroot!\")'"
+        cmd += " > file.py"
+        self.assertRunOk(cmd)
+
+        cmd = "dd if=/dev/urandom of=file.bin bs=1k count=4"
+        self.assertRunOk(cmd)
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
+        self.generate_test_data()
+
+        tests = [
+            ["file.txt", "ASCII text"],
+            ["file.txt.gz", "gzip compressed data"],
+            ["file.c", "C source"],
+            ["file.sh", "POSIX shell script"],
+            ["file.py", "Python script"],
+            ["file.bin", "data"],
+            ["/usr/share/misc/magic.mgc", "magic binary file for file"],
+            ["/usr/bin/file", "ELF"],
+            ["/dev/zero", "character special"],
+            ["/", "directory"]
+        ]
+        for test_file, expected_type in tests:
+            cmd = f"file '{test_file}' | grep -F '{expected_type}'"
+            self.assertRunOk(cmd)
+
+        tests = [
+            ["file.txt", "text/plain"],
+            ["file.txt.gz", "application/gzip"],
+            ["file.bin", "application/octet-stream"],
+        ]
+        for test_file, expected_type in tests:
+            cmd = f"file -i '{test_file}' | grep -F '{expected_type}'"
+            self.assertRunOk(cmd)
+
+        cmd = "file -h link.txt | grep -F 'symbolic link'"
+        self.assertRunOk(cmd)
+
+        cmd = "file -L link.txt | grep -F 'ASCII text'"
+        self.assertRunOk(cmd)
+
+        cmd = "file -z file.txt.gz | grep -F 'ASCII text'"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
