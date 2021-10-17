Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9726BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D26610C7
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34D26610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4F34021F;
	Sun, 17 Oct 2021 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrvUZziVcNFR; Sun, 17 Oct 2021 19:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F945401FC;
	Sun, 17 Oct 2021 19:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42DD1BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC8640160
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqthbG6eyhDM for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7CAF4017C
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DE20995DA5; Sun, 17 Oct 2021 19:49:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 21:47:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ab2dd6aa5cf5170aee0bc761d05c387b8c69040
X-Git-Newrev: d8447c38f53f98e1df4a209e9f70e54f8b60f36e
X-Patchwork-Hint: ignore
Message-Id: <20211017194926.DE20995DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: update logical eraseblock
 and physical eraseblock size for qemu >= 2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8447c38f53f98e1df4a209e9f70e54f8b60f36e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current ubi/ubifs test (test_ubi.py) rely on a Qemu bug present in
2.8.0 that was fixed in Qemu 2.9.0 [1]. The ubi/ubifs settings is
updated to run with Qemu >= 2.9.0 using the new multiple chip handling.

If needed, the old behavior can be enabled using the pflash01 property
"old-multiple-chip-handling" [2].

The issue was not detected until now since we are sill using an old
qemu (2.8 from Debian stretch) for testing in gitlab (using the
Buildroot Docker image used by gitlab-ci.yml).

First the logical eraseblock size (LEB) must be updated to the value
0x3ff80 reported by the kernel when using qemu >= 2.9.0.

  UBIFS (ubi0:0): Mounting in unauthenticated mode
  UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: LEB size mismatch: 524160 in superblock, 262016 real
  UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: bad superblock, error 1

But the system is still failing to boot:

 UBIFS error (ubi0:0 pid 1): ubifs_scan: garbage
 UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node: failed to recover master node

ubifs is reading garbage since Qemu >= 2.9.0 report a sector
length per device divided by the number of devices (see commit [1]).

The kernel detect two flash devices (dmesg):

  Concatenating MTD devices:
  (0): "40000000.flash"
  (1): "40000000.flash"
  into device "40000000.flash"

Divide the physical eraseblock (PEB) size by two.

Tested with qemu 2.9.0, 5.1.0.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1543100932

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=feb0b1aa11f14ee71660aba46b46387d1f923c9e
[2] http://lists.busybox.net/pipermail/buildroot/2021-September/622069.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ubi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index eeb55b1d59..7c687c1982 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -8,10 +8,10 @@ class TestUbi(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_UBIFS=y
-        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
+        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3ff80
         BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
         BR2_TARGET_ROOTFS_UBI=y
-        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
+        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
         BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
         """
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
