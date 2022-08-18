Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B18ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8677D61037;
	Sun, 11 Sep 2022 08:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8677D61037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfa8dfvusmvy; Sun, 11 Sep 2022 08:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F0960B8F;
	Sun, 11 Sep 2022 08:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F0960B8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46F131BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0169F41524
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0169F41524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2oajydWM4u5 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA4CA40A02
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA4CA40A02
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BA64B835E4; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 22:49:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8f0ec7a468c30d401b2e51e4bbfe985997f8e0c
X-Git-Newrev: bd0b2db23154f700fbb94aa3a0a0752a52b5ea7b
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.BA64B835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_cpio.py: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd0b2db23154f700fbb94aa3a0a0752a52b5ea7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It includes a simple test for the full cpio image, and a test of the
dracut image. To validate that the dracut image is a subset of the full
image, 'pv' is added to the image, and the test verifies that pv is not
part of the image. Note that the real rootfs is not mounted at the
moment, so pv is never available in the running image.

Systemd and other init systems are currently untested.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_cpio.py | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
new file mode 100644
index 0000000000..3f661e370c
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio.py
@@ -0,0 +1,125 @@
+import os
+import infra.basetest
+import subprocess
+
+CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
+
+
+def boot_img(emulator, builddir):
+    img = os.path.join(builddir, "images", "rootfs.cpio")
+    emulator.boot(arch="armv7",
+                  kernel="builtin",
+                  options=["-initrd", "{}".format(img)])
+    emulator.login()
+    _, exit_code = emulator.run(CHECK_FS_CMD)
+    return exit_code
+
+
+class TestCpioFull(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_INIT_BUSYBOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+
+class TestCpioDracutBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_BUSYBOX=y
+        BR2_PACKAGE_PV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_dracut(self):
+        out = subprocess.check_output(["cpio", "--list"],
+                                      stdin=open(os.path.join(self.builddir, "images/rootfs.cpio")),
+                                      stderr=open(os.devnull, "w"),
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"},
+                                      universal_newlines=True)
+        # pv should *not* be included in cpio image
+        self.assertEqual(out.find("bin/pv"), -1)
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+        # No pivot_root is done, so pv shouldn't be there
+        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
+        self.assertNotEqual(exit_code, 0)
+
+
+class TestCpioDracutUclibc(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutGlibc(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutMusl(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutUclibcMergedUsr(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutGlibcMergedUsr(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
+
+
+class TestCpioDracutMuslMergedUsr(TestCpioDracutBase):
+    config = TestCpioDracutBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_dracut()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
