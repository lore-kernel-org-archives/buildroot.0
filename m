Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E696C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37CEE41754;
	Mon,  5 Feb 2024 11:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CEE41754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bk8PY4Ewuo69; Mon,  5 Feb 2024 11:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F9C4174F;
	Mon,  5 Feb 2024 11:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F9C4174F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 418CE1BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D1260FE1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D1260FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ficePn70YDVl for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7ED60FD1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7ED60FD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 246EB86B8E; Mon,  5 Feb 2024 11:10:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:10:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c8ba31a722affbbfade9e5c9411ef0bc7b461bd
X-Git-Newrev: 094fb84320ab99ab508879b4f1230ea81bf00da8
X-Patchwork-Hint: ignore
Message-Id: <20240205111025.246EB86B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: micropython: add
 micropython-lib test
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

commit: https://git.buildroot.net/buildroot/commit/?id=094fb84320ab99ab508879b4f1230ea81bf00da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f403f0 "package/micropython-lib: merge with, and install
as part of micropython" brought micropython library within the
package.

This commit improves the micropython runtime test by enabling the
micropython-lib and by also adding a runtime test using one of its
module. We choose to use the gzip module, and check whther decodign q
simple gziped file works; the micropython-lib gzip can only decompress,
so we need to prepare it from the shell.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_micropython.py         | 13 ++++++++++++-
 .../package/test_micropython/rootfs-overlay/root/zcat.py  | 15 +++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
index 0ecd4790bd..371deb2978 100644
--- a/support/testing/tests/package/test_micropython.py
+++ b/support/testing/tests/package/test_micropython.py
@@ -7,6 +7,7 @@ class TestMicroPython(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
         BR2_PACKAGE_MICROPYTHON=y
+        BR2_PACKAGE_MICROPYTHON_LIB=y
         BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -64,5 +65,15 @@ class TestMicroPython(infra.basetest.BRTest):
         output = self.run_upy_code(py_code)
         self.assertEqual(output[0], expected_output)
 
-        # Finally, Check a small script can execute.
+        # Check a small script can execute.
         self.assertRunOk("/root/mandel.py", timeout=10)
+
+        # Check we can use a micropython-lib module.
+        msg = "Hello Buildroot!"
+        filename = "file.txt"
+        gz_filename = f"{filename}.gz"
+        self.assertRunOk(f"echo '{msg}' > {filename}")
+        self.assertRunOk(f"gzip {filename}")
+        out, ret = self.emulator.run(f"/root/zcat.py {gz_filename}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
new file mode 100755
index 0000000000..3b8c60bdd1
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
@@ -0,0 +1,15 @@
+#! /usr/bin/env micropython
+
+import gzip
+import sys
+
+
+def main(fname):
+    with open(fname, "rb") as f:
+        with gzip.GzipFile(fileobj=f) as g:
+            s = g.read()
+            print(s.decode("UTF-8"), end="")
+
+
+if __name__ == "__main__":
+    main(sys.argv[1])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
