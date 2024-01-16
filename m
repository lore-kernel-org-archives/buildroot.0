Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ADCC47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E81D8366E;
	Tue, 16 Jan 2024 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E81D8366E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuYt6iqOdt7g; Tue, 16 Jan 2024 21:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA3383638;
	Tue, 16 Jan 2024 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA3383638
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6EAC1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 21:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C0B160B06
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 21:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C0B160B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZexfwKzjHWH for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 21:06:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59B52605D5
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 21:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B52605D5
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D83E913F880;
 Tue, 16 Jan 2024 22:06:03 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 22:05:56 +0100
Message-ID: <20240116210556.589407-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705439165;
 bh=z8pxZtzCBEjaRC3QLMQbifDRAOvKlGPt0kbch0bOjHg=;
 h=From:To:Cc:Subject:Date:From;
 b=HOjXWNJoYVrjF3HYMKUPT/kdZ3r74dB6/+LFjI2zU+RD+GiXatYVxravhAxWN+O/+
 9XXcmQvR0prItfW/Rr7jSohkDvIDBqncXPvm1lD8YnT8w4E+2UGyZdxyQzzlUyk45K
 mKt+ogAaZopq2jb8vEdVpnvdk+1dmBHs7AFC9Ihk6S+v7FBqE5b+q9jwlYbW4jUO7M
 tc8rYByL0LZFfiJIzOPTpqfCZ8C9P2Knmq7nqBjN7Xy3Y6Xsr1HaDOEtDBmyZxW4l/
 szP5yWT/uSR5a4MMxYpi8n/geEFIJcBM1GUhfBZX6GWIR7MpjYQvo3dpvOESwvrdGW
 +a1drtSmVB78A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HOjXWNJo
Subject: [Buildroot] [PATCH 1/1] support/testing: add micropython runtime
 test
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
Test is working on tag 2023.11, but fails on tag 2023.11.1 and branch
master at commit e07402a (micropython fail to compile, maybe due to
the bump to version 1.22.0?).

This is unrelated to this test, since the failure can be reproduced
with:

    cat > .config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_MICROPYTHON=y
    EOF
    make olddefconfig
    make

Build fail with:

    /buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.2.1/../../../../aarch64-none-linux-gnu/bin/ld: build-standard/modffi.o: in function 'char2ffi_type':
    /buildroot/output/build/micropython-1.22.0/ports/unix/modffi.c:119:(.text.char2ffi_type+0x28): undefined reference to 'ffi_type_sint8'
    [...and many others...]

The test is also working when patch [1] is applied, because libffi is
no longer compiled.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240116183629.365115-1-fontaine.fabrice@gmail.com/
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_micropython.py | 66 +++++++++++++++++++
 .../rootfs-overlay/root/mandel.py             | 25 +++++++
 3 files changed, 93 insertions(+)
 create mode 100644 support/testing/tests/package/test_micropython.py
 create mode 100755 support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..0f961ea486 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1789,6 +1789,8 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_micropython.py
+F:	support/testing/tests/package/test_micropython/
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_nftables.py
diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
new file mode 100644
index 0000000000..6d213c7ea5
--- /dev/null
+++ b/support/testing/tests/package/test_micropython.py
@@ -0,0 +1,66 @@
+import os
+
+import infra.basetest
+
+
+class TestMicroPython(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_MICROPYTHON=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def run_upy_code(self, python_code):
+        cmd = f'micropython -c "{python_code}"'
+        self.assertRunOk(cmd)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # The micropython binary can execute.
+        self.assertRunOk("micropython -h")
+
+        # Check implementation is 'micropython'.
+        py_code = "import sys ; assert sys.implementation.name == 'micropython'"
+        self.run_upy_code(py_code)
+
+        # Query interpreter version and implementation.
+        py_code = "import sys ; "
+        py_code += "print('Version:', sys.version) ; "
+        py_code += "print('Implementation:', sys.implementation)"
+        self.run_upy_code(py_code)
+
+        # Check micropython optimization are correctly reported.
+        for opt_level in range(4):
+            py_code = "import micropython ; "
+            py_code += "opt = micropython.opt_level() ; "
+            py_code += "print(opt) ; "
+            py_code += f"assert opt == {opt_level}"
+            cmd = f"micropython -O{opt_level} -c '{py_code}'"
+            self.assertRunOk(cmd)
+
+        # Check micropython can return a non-zero exit code.
+        expected_code = 123
+        py_code = "import sys ; "
+        py_code += f"sys.exit({expected_code})"
+        cmd = f'micropython -c "{py_code}"'
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, expected_code)
+
+        # We check micropython computes correctly.
+        input_value = 1234
+        expected_output = str(sum(range(input_value)))
+        py_code = f"print(sum(range(({input_value}))))"
+        cmd = f'micropython -c "{py_code}"'
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], expected_output)
+
+        # Finally, we check check a small script can execute.
+        self.assertRunOk("/root/mandel.py", timeout=10)
diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
new file mode 100755
index 0000000000..0552f6894c
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
@@ -0,0 +1,25 @@
+#! /usr/bin/env micropython
+
+from micropython import mem_info
+
+POINTS = list(",.:-;!/>)|&IH%*Z")
+
+
+def mandel():
+    for y in range(-15, 16):
+        for x in range(1, 85):
+            i = 0
+            r = 0
+            for k in range(112):
+                j = (r*r) - (i*i) - 2 + (x/25)
+                i = 2 * r * i + (y/10)
+                if j*j + i*i >= 11:
+                    break
+                r = j
+            print(POINTS[k & 0xF], end='')
+        print()
+
+
+if __name__ == '__main__':
+    mandel()
+    mem_info()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
