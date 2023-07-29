Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409CBC001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD26822FB;
	Sat, 29 Jul 2023 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD26822FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLpR1RdXKhuw; Sat, 29 Jul 2023 08:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37AB982281;
	Sat, 29 Jul 2023 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37AB982281
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36E851BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DF3740106
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DF3740106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1IikJ2tguyp for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40B19400C7
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40B19400C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D99582DDA; Sat, 29 Jul 2023 08:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 10:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9214f2872a9111340688d199e5b2fef9beb6b097
X-Git-Newrev: be57403d04c20e5c870b9fff0e650587de493739
X-Patchwork-Hint: ignore
Message-Id: <20230729085512.2D99582DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: backport fix for NOR
 flashes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be57403d04c20e5c870b9fff0e650587de493739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a bug present since v0.3.3 that causes extremely slow writes to
NOR flashes.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etenv-fix-bug-when-SPI-flash-write-size-s.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
new file mode 100644
index 0000000000..414cb3d205
--- /dev/null
+++ b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
@@ -0,0 +1,71 @@
+From 35bbc4d8155ed86ca7200e060dad98bdfbce684d Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Thu, 15 Jun 2023 16:54:46 +0200
+Subject: [PATCH] Revert "fw_setenv: fix bug when SPI flash write size !=
+ sector size"
+
+This reverts commit 44ecc1c216007272a6f99a104a71c9d410969d9e.
+
+mtd writesize was errouneously interpreted as maximum allowed size, but
+it is the minimum size. The patch raises performance issues because on
+NOR flashes single bytes are written.
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+Upstream: https://github.com/sbabic/libubootenv/commit/9f17a00ee56dc5cfb1d9b51e6639d67b64cb3309
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ src/uboot_env.c | 29 +++++++++--------------------
+ 1 file changed, 9 insertions(+), 20 deletions(-)
+
+diff --git a/src/uboot_env.c b/src/uboot_env.c
+index c5eefe7..76e2619 100644
+--- a/src/uboot_env.c
++++ b/src/uboot_env.c
+@@ -712,8 +712,6 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
+ 		sectors = dev->envsectors ? dev->envsectors : 1;
+ 		buf = data;
+ 		while (count > 0) {
+-			int blockcount;
+-
+ 			erase.start = start;
+ 
+ 			skip = is_nand_badblock(dev, start);
+@@ -744,26 +742,17 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
+ 				ret =-EIO;
+ 				goto devwrite_out;
+ 			}
+-
+-			blockcount = blocksize;
+-
+-			/* writesize can be different than the sector size. */
+-
+-			while (blockcount > 0) {
+-				if (lseek(dev->fd, start, SEEK_SET) < 0) {
+-					ret =-EIO;
+-					goto devwrite_out;
+-				}
+-				if (write(dev->fd, buf, dev->mtdinfo.writesize) != dev->mtdinfo.writesize) {
+-					ret =-EIO;
+-					goto devwrite_out;
+-				}
+-
+-				blockcount -= dev->mtdinfo.writesize;
+-				start += dev->mtdinfo.writesize;
+-				buf += dev->mtdinfo.writesize;
++			if (lseek(dev->fd, start, SEEK_SET) < 0) {
++				ret =-EIO;
++				goto devwrite_out;
++			}
++			if (write(dev->fd, buf, blocksize) != blocksize) {
++				ret =-EIO;
++				goto devwrite_out;
+ 			}
+ 			MTDLOCK(dev, &erase);
++			start += dev->sectorsize;
++			buf += blocksize;
+ 			count -= blocksize;
+ 			ret += blocksize;
+ 		}
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
