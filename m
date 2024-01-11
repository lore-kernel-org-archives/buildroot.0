Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D45BC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 11:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0840542897;
	Thu, 11 Jan 2024 11:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0840542897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jf9IKEU9lFH9; Thu, 11 Jan 2024 11:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1DE4288B;
	Thu, 11 Jan 2024 11:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1DE4288B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF6F61BF97F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C640E60B1F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C640E60B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrbhY7I5E8PN for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0791960B19
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0791960B19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8EC085E8F; Thu, 11 Jan 2024 11:40:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 12:13:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 529b62f261ce01b347759d9516bf0852d968f751
X-Git-Newrev: 24b2ef0c6799c4d8fb1a9de78590c4e48b5470e7
X-Patchwork-Hint: ignore
Message-Id: <20240111114057.E8EC085E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_rust.py: Add test to
 check correct vendoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=24b2ef0c6799c4d8fb1a9de78590c4e48b5470e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the tests TestRust and TestRustBin do check for vendoring by
requiring package ripgrep to be built but only if the download
directory is already empty, otherwise the existing contents of the download
directory will be reused and therefore not be redownloaded.

This new test will only verify that the required packages are downloaded
and vendored correctly without doing a runtime test. It does so by setting a
path to a folder "dl" inside the build directory (output-directory/testname/)
and then setting the environment variable BR2_DL_DIR to this path before the
build starts. BR2_DL_DIR is not set in the config options because it would be
overridden by the user's own environment variable if defined. This code was
essentially copied from the file test_gitforge.py which was added in commit
1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5

We want the package ripgrep to be built since it requires vendoring
directly. Additionally we want the package python-cryptography to be
built because it has rust dependencies and therefore indirectly also requires
vendoring.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_rust.py | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index fb9dd2d916..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -1,4 +1,5 @@
 import os
+import shutil
 
 import infra.basetest
 
@@ -54,3 +55,44 @@ class TestRust(TestRustBase):
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+
+
+class TestRustVendoring(infra.basetest.BRConfigTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_BACKUP_SITE=""
+        """
+
+    def setUp(self):
+        super(TestRustVendoring, self).setUp()
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        # enforce we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
+    def test_run(self):
+        self.check_download("ripgrep")
+        self.check_download("python-cryptography")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
