Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D5BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5362A61151
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5362A61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2096040160;
	Sun, 17 Oct 2021 19:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 141IJ5aBiGey; Sun, 17 Oct 2021 19:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4291A4017C;
	Sun, 17 Oct 2021 19:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC911BF976
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9033814A1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfY2gjKaRVCv for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2141814BA
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E742E95DA6; Sun, 17 Oct 2021 19:49:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 21:47:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8447c38f53f98e1df4a209e9f70e54f8b60f36e
X-Git-Newrev: e11c3cbe26a945497524aba7dade42bd1efbadd0
X-Patchwork-Hint: ignore
Message-Id: <20211017194926.E742E95DA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_ubi: allow to boot
 several times using the same ubi image.
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

commit: https://git.buildroot.net/buildroot/commit/?id=e11c3cbe26a945497524aba7dade42bd1efbadd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the ubi/ubifs test has been introduced, it's not possible to
boot the same ubi image twice [1]:

"TODO: if you boot Qemu twice on the same UBI image, it fails to
attach the image the second time, with "ubi0 error:
ubi_read_volume_table: the layout volume was not found"."

For some reason, the kernel corrupt the ubi image if the ubifs
rootfs is mounted with write access. Use a custom config file
to mount the rootfs readonly (vol_type=static). Doing so requires
to add the flash size (vol_size=64MiB).

At least it allows to boot several times the same ubi image.

[1] bf4a6490e4ee70f0a46e588602995ba34e6c872a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ubi.py                            | 9 ++++-----
 support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg | 8 ++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 7c687c1982..564a436d42 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -13,12 +13,11 @@ class TestUbi(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_UBI=y
         BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
         BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
-        """
+        BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y
+        BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE="{}"
+        """.format(
+              infra.filepath("tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg"))
 
-    # TODO: if you boot Qemu twice on the same UBI image, it fails to
-    # attach the image the second time, with "ubi0 error:
-    # ubi_read_volume_table: the layout volume was not found".
-    # To be investigated.
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.ubi")
         out = infra.run_cmd_on_host(self.builddir, ["file", img])
diff --git a/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
new file mode 100644
index 0000000000..52dd5f0007
--- /dev/null
+++ b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
@@ -0,0 +1,8 @@
+[ubifs]
+mode=ubi
+vol_id=0
+vol_type=static
+vol_name=rootfs
+vol_alignment=1
+vol_size=64MiB
+image=BR2_ROOTFS_UBIFS_PATH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
