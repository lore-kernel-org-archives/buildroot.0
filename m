Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BFFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA8760F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAA8760F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA87E40526;
	Tue,  3 Aug 2021 23:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKlROHw1YVDW; Tue,  3 Aug 2021 23:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83F140515;
	Tue,  3 Aug 2021 23:20:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33C5E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB48406A7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xrkc4qYXgTQV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0F140653
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C34E88827E; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 21:26:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: afc1ed4d5152e0f6e724e6986a1d12c8001b94fe
X-Git-Newrev: 78c42cdca2679a9237003c27e7018b56e5e8e568
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.C34E88827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/fs/test_ext: specify 16 MB as ext filesystem size
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

commit: https://git.buildroot.net/buildroot/commit/?id=78c42cdca2679a9237003c27e7018b56e5e8e568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since Qemu 5.1, the SD card size must be a power of two, so the
default size for ext2/3/4 filesystem images of 60 MB is not
suitable. Since 16 MB is used for the Ext4 test, let's use the same
value for the other tests as well (ext2, ext2r1, ext3). Without this
change, the ext2, ext2r1 and ext3 simply fail to run under Qemu >=
5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ext.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 16b308cf6d..0fe8af7e6d 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -43,6 +43,7 @@ class TestExt2(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_2r0=y
         BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -62,6 +63,7 @@ class TestExt2r1(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_2r1=y
         BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -81,6 +83,7 @@ class TestExt3(infra.basetest.BRTest):
         """
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_3=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
