Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA22C52D7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2933540531;
	Mon, 12 Aug 2024 09:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDQ7mRFnbzHz; Mon, 12 Aug 2024 09:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468814050B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468814050B;
	Mon, 12 Aug 2024 09:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10F0D1BF951
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F37F18109A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeXnDhS3fJGf for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285A681095
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285A681095
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:54:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23E45847A6; Mon, 12 Aug 2024 09:54:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:21:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 553391da6c3f6afc07c044e8059411e4797f87dc
X-Git-Newrev: d9bddddd2341cd8dd841a09884c808b6e57af5de
X-Patchwork-Hint: ignore
Message-Id: <20240812095401.23E45847A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add new
 test for python-pymupdf
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
Content-Type: multipart/mixed; boundary="===============1737672771357623398=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1737672771357623398==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d9bddddd2341cd8dd841a09884c808b6e57af5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

To give us a chance to catch runtime issues (such as missing
dependencies) more easily, add a test that writes a sample PDF file,
read it back and verify the text that was read.

Like similar packages that lead to a big
rootfs (e.g. python-botocore), this test requires a separate ext2
rootfs to avoid filling the default amount of RAM available
entirely (which would cause missing files from the root filesystem and
in turn, test failures).

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 115e9493b8e3b50cd56b93c47d669319d02698a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 ++
 .../testing/tests/package/sample_python_pymupdf.py | 17 ++++++++++++++++
 .../testing/tests/package/test_python_pymupdf.py   | 23 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e06a1acfa..210c843613 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2671,9 +2671,11 @@ F:	package/python-pymupdf/
 F:	package/python-rsa/
 F:	package/python-s3transfer/
 F:	support/testing/tests/package/sample_python_jmespath.py
+F:	support/testing/tests/package/sample_python_pymupdf.py
 F:	support/testing/tests/package/sample_python_rsa.py
 F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/test_python_jmespath.py
+F:	support/testing/tests/package/test_python_pymupdf.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
diff --git a/support/testing/tests/package/sample_python_pymupdf.py b/support/testing/tests/package/sample_python_pymupdf.py
new file mode 100644
index 0000000000..574bd27965
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pymupdf.py
@@ -0,0 +1,17 @@
+import fitz
+
+# Write a test PDF file
+outfile = "python-pymupdf.pdf"
+sample_text = "This is a test page for python-pymupdf."
+doc = fitz.open()
+page = doc.new_page()
+p = fitz.Point(50, 72)
+page.insert_text(p, sample_text)
+doc.save(outfile)
+
+# Read back the file
+with fitz.open(outfile) as d:  # open document
+    read_text = chr(12).join([page.get_text() for page in d])
+
+print(read_text)
+assert(read_text == sample_text + "\n")
diff --git a/support/testing/tests/package/test_python_pymupdf.py b/support/testing/tests/package/test_python_pymupdf.py
new file mode 100644
index 0000000000..1af3efc8af
--- /dev/null
+++ b/support/testing/tests/package/test_python_pymupdf.py
@@ -0,0 +1,23 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyMuPDF(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYMUPDF=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        """
+    sample_scripts = ["tests/package/sample_python_pymupdf.py"]
+    timeout = 30
+
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()

--===============1737672771357623398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1737672771357623398==--
