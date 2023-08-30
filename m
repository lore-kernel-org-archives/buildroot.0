Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF3C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B15F941B88;
	Wed, 30 Aug 2023 19:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B15F941B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3D9ReCZxYZm; Wed, 30 Aug 2023 19:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7913241B99;
	Wed, 30 Aug 2023 19:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7913241B99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9D691BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B05AE82081
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05AE82081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcJbMAstek_m for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 798B781DE3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 798B781DE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667F1865C0; Wed, 30 Aug 2023 19:20:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 21:15:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 324e16e8b68acccf3ff88cfc5c44f8635036eeed
X-Git-Newrev: 5e2d890b5d0dd901ad99f1ea3eb49f1dd6a51662
X-Patchwork-Hint: ignore
Message-Id: <20230830192015.667F1865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libubootenv:
 backport fix for NOR flashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e2d890b5d0dd901ad99f1ea3eb49f1dd6a51662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes a bug present since v0.3.3 that causes extremely slow writes to
NOR flashes.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit be57403d04c20e5c870b9fff0e650587de493739)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
