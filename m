Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772E7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54E26101E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C54E26101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4254068E;
	Tue, 28 Sep 2021 05:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nm2RezcE0BYM; Tue, 28 Sep 2021 05:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7AFA4056D;
	Tue, 28 Sep 2021 05:33:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D3A1BF847
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FE024056D
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXOCMeaR6O4z for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 05:33:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB259404D7
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 05:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F356D884BD; Tue, 28 Sep 2021 05:30:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 07:24:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 179ae068eb7035e3a3da0e4a936bc4e0be8acbb1
X-Git-Newrev: f8b17f74392bda34e55ad2202ebabc2cac06278d
X-Patchwork-Hint: ignore
Message-Id: <20210928053055.F356D884BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/iso9660: fix non-reproducible builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8b17f74392bda34e55ad2202ebabc2cac06278d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 179ae068eb70 (fs/iso9660: add support to Grub EFI bootloader
in the image), we did a last-minute change when applying the patch, on
the flawed assumption that the commands were run in a standard Makefile
rule.

However, for filesystems, most commands are run in a script (so they run
under fakeroot). As such, we can't silence the commands with the usual
Makefile '@' construct.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 27319b024b..faa15833c2 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -61,7 +61,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 ROOTFS_ISO9660_VFAT_OPTS = --invariant
 ROOTFS_ISO9660_FIX_TIME = touch -d @$(SOURCE_DATE_EPOCH)
 else
-ROOTFS_ISO9660_FIX_TIME = @:
+ROOTFS_ISO9660_FIX_TIME = :
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
