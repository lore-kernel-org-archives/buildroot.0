Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E61C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:51:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BA9610CF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13BA9610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B008F83AA5;
	Fri, 22 Oct 2021 11:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOdAV_oInyRp; Fri, 22 Oct 2021 11:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143EF83A9F;
	Fri, 22 Oct 2021 11:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1F61C1127
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48D2B6070A
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2T9wJuYFtDQW for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 11:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 408C160675
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 11:51:37 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F2349240012;
 Fri, 22 Oct 2021 11:51:35 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 13:51:32 +0200
Message-Id: <20211022115134.345595-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022115134.345595-1-kory.maincent@bootlin.com>
References: <20211022115134.345595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/5] boot/grub2/grub2.mk: add more explicit
 build messages
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

This patch adds the calls to MESSAGE, to explicit the different step of the
parallel build, following the current tuple loop.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e72a91d21a..19047d02f7 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -149,6 +149,7 @@ HOST_GRUB2_CONF_OPTS = \
 
 define GRUB2_CONFIGURE_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Configuring $(tuple))
 		mkdir -p $(@D)/build-$(tuple)
 		cd $(@D)/build-$(tuple) && \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -172,12 +173,14 @@ endef
 
 define GRUB2_BUILD_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Building $(tuple))
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple)
 	)
 endef
 
 define GRUB2_INSTALL_IMAGES_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Installing $(tuple) to images directory)
 		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple)))
 		$(HOST_DIR)/usr/bin/grub-mkimage \
 			-d $(@D)/build-$(tuple)/grub-core/ \
@@ -198,6 +201,7 @@ endef
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 define GRUB2_INSTALL_TARGET_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Installing $(tuple) to target directory)
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple) DESTDIR=$(TARGET_DIR) install
 	)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
