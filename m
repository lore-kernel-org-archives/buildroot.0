Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E166FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600E560EE9
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 600E560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F16F4034E;
	Sat, 23 Oct 2021 22:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYyFL0HJROU0; Sat, 23 Oct 2021 22:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9C640368;
	Sat, 23 Oct 2021 22:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 442BF1BF963
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38C8140164
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bF9n9r2XqGJ7 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CCCC40113
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4CEDE88519; Sat, 23 Oct 2021 21:57:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 22:41:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60b798e000bc8fe2f67f9266b44022c1b363829a
X-Git-Newrev: 1fc095ec75434286458ced384a63acd07c82c447
X-Patchwork-Hint: ignore
Message-Id: <20211023215739.4CEDE88519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix the cdboot.img source from
 host to target
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fc095ec75434286458ced384a63acd07c82c447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the location of cdboot.img used, to select the one
from the target directory and not from the host.
The host-grub2 is built only to have access to the Grub tools binaries.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 19047d02f7..270f289cfd 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -192,7 +192,7 @@ define GRUB2_INSTALL_IMAGES_CMDS
 			$(GRUB2_BUILTIN_MODULES_$(tuple))
 		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple))
 		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
-			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
+			cat $(@D)/build-$(tuple)/grub-core/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
 				$(BINARIES_DIR)/grub-eltorito.img
 		) \
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
