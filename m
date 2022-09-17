Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2211C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEAB6113D;
	Sat, 17 Sep 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEAB6113D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4jIqD36K6ZX; Sat, 17 Sep 2022 20:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD2D607F7;
	Sat, 17 Sep 2022 20:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD2D607F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9A61BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E59415E5
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E59415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGwneo71IFrI for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFCB841965
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFCB841965
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9624A84690; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:13:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fd5d80e9dc0d9f2c281d2d955e4d6c1220440cf
X-Git-Newrev: c25b4454881c8cd49ea725fed44db00d12fd1811
X-Patchwork-Hint: ignore
Message-Id: <20220917201818.9624A84690@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/tests/cpio: extend runtime tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=c25b4454881c8cd49ea725fed44db00d12fd1811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check that dependencies that are DT_NEEDED by a program are
automatically copied by dracut. We use cramfs, the package,
as it is small and just depends on libz.

Test more than one dracut config file.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
[Arnout: remove test for features that haven't been merged yet]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/fs/test_cpio.py                 | 8 +++++++-
 support/testing/tests/fs/test_cpio/dracut-cramfs.conf | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 9a529f1edd..8c0d357994 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -37,11 +37,14 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_INIT_BUSYBOX=y
+        BR2_PACKAGE_CRAMFS=y
         BR2_PACKAGE_PV=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        """.format(" ".join(["fs/cpio/dracut.conf",
+                             "support/testing/tests/fs/test_cpio/dracut-cramfs.conf"]))
 
     def check_dracut(self):
         out = subprocess.check_output(["cpio", "--list"],
@@ -52,6 +55,9 @@ class TestCpioDracutBase(infra.basetest.BRTest):
                                       universal_newlines=True)
         # pv should *not* be included in cpio image
         self.assertEqual(out.find("bin/pv"), -1)
+        # libz should be, because of cramfs
+        self.assertNotEqual(out.find("usr/bin/mkcramfs"), -1)
+        self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
 
         exit_code = boot_img(self.emulator,
                              self.builddir)
diff --git a/support/testing/tests/fs/test_cpio/dracut-cramfs.conf b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
new file mode 100644
index 0000000000..69e49239fc
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
@@ -0,0 +1,7 @@
+install_items+="
+/usr/bin/mkcramfs
+"
+
+add_dracutmodules+="
+cramfs
+"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
