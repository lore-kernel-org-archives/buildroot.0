Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78164C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D96E600EF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D96E600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 098E740539;
	Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nARGtkeepC6K; Tue,  3 Aug 2021 23:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B521B405A8;
	Tue,  3 Aug 2021 23:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99C551BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D3C40670
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2welKHqDCykB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99BEB40608
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F0D09860D3; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Jun 2021 11:50:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11fffded3c575839504d19d14803840901985b67
X-Git-Newrev: e7f0408f496fbbfac8663c76d308b9f691e19e4a
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.F0D09860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/tests: fix squashfs
 test
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e7f0408f496fbbfac8663c76d308b9f691e19e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 3cf2782906d5 (support/testing/infra/emulator.py: update pre-built
kernels) bumped the default kernels used by the testing infra.

However, the newer armv7 kernel (at least) no longer has support for
lz4-compressed squashfs filesystems.

This breaks the squashfs test:

    Filesystem uses "lz4" compression. This is not supported
    List of all partitions:
    1f00          131072 mtdblock0
     (driver?)
    1f01           32768 mtdblock1
     (driver?)
    b300            2048 mmcblk0
     driver: mmcblk
    No filesystem could mount root, tried:
     squashfs

    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)

Updating the kernel again is a little bit cumbersome, while fixing the
actual test is relatively trivial, so this is what we do: we switch
over to lzo, which is supported by the new kernel:

    # zcat /proc/config.gz |grep SQUA
    CONFIG_SQUASHFS=y
    CONFIG_SQUASHFS_ZLIB=y
    # CONFIG_SQUASHFS_LZ4 is not set
    CONFIG_SQUASHFS_LZO=y
    # CONFIG_SQUASHFS_XZ is not set

While at it, also drop the superfluous line disabling gzip compression:
it is part of a choice, so enabling one (lzo here) forcibly disables the
others (of which gzip).

Fixes: 3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_squashfs.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 745f93ee55..a914f5aac7 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -7,8 +7,7 @@ class TestSquashfs(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_SQUASHFS=y
-        # BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
-        BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -18,7 +17,7 @@ class TestSquashfs(infra.basetest.BRTest):
         out = out.splitlines()
         self.assertEqual(out[0],
                          "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
-        self.assertEqual(out[3], "Compression lz4")
+        self.assertEqual(out[3], "Compression lzo")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
         infra.img_round_power2(img)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
