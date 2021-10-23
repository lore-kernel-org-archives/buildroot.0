Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B94C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4DD860EE2
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4DD860EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB37081A95;
	Sat, 23 Oct 2021 22:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHsdDdttpzRr; Sat, 23 Oct 2021 22:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164E281A8E;
	Sat, 23 Oct 2021 22:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 594F21BF5E0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1A740197
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4t1meRHAGK6 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6490E40003
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 414408851B; Sat, 23 Oct 2021 21:57:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 22:41:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7edf28468d0299e685e13c95d00b26e1a4ab5791
X-Git-Newrev: 60b798e000bc8fe2f67f9266b44022c1b363829a
X-Patchwork-Hint: ignore
Message-Id: <20211023215739.414408851B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: add more explicit build
 messages
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

commit: https://git.buildroot.net/buildroot/commit/?id=60b798e000bc8fe2f67f9266b44022c1b363829a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the calls to MESSAGE, to explicit the different step of
the per-platform builds, following the current tuple loop. Besides a
nicer output to the user, this can also help debug what step actualy
failed.

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
