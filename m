Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F7EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046E2610CF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 046E2610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DC8B40257;
	Fri, 22 Oct 2021 11:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enS_0QraSDlO; Fri, 22 Oct 2021 11:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C87C3401B7;
	Fri, 22 Oct 2021 11:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 592151BF57B
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D2B83A9F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sr2YWyHv-kYx for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 11:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86C3483A9E
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 11:51:38 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 649C224000D;
 Fri, 22 Oct 2021 11:51:36 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 13:51:33 +0200
Message-Id: <20211022115134.345595-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022115134.345595-1-kory.maincent@bootlin.com>
References: <20211022115134.345595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] boot/grub2/grub2.mk: fix the cdboot.img
 source from host to target
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
Cc: aduskett@gmail.com, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates the location of cdboot.img used, to select the one from
the target directory and not from the host.
The host-grub2 is built only to have access to the Grub tools binaries.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
