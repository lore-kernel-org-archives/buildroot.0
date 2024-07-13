Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A46C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29D09408AC;
	Sat, 13 Jul 2024 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1OcLn7uz2zn; Sat, 13 Jul 2024 19:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4EC404C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB4EC404C6;
	Sat, 13 Jul 2024 19:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90B8F1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A499813ED
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xs8Ui2_xrEg for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57B7813F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A57B7813F3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FAAF8660D; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:54:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edfa6f29785e618b75739b702fc863ee2410908d
X-Git-Newrev: 115e9493b8e3b50cd56b93c47d669319d02698a7
X-Patchwork-Hint: ignore
Message-Id: <20240713195553.9FAAF8660D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-pymupdf
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
Content-Type: multipart/mixed; boundary="===============1324464166089984356=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1324464166089984356==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=115e9493b8e3b50cd56b93c47d669319d02698a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 DEVELOPERS                                         |  2 ++
 .../testing/tests/package/sample_python_pymupdf.py | 17 ++++++++++++++++
 .../testing/tests/package/test_python_pymupdf.py   | 23 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c070379ced..7fbefa3302 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2690,9 +2690,11 @@ F:	package/python-pymupdf/
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

--===============1324464166089984356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1324464166089984356==--
