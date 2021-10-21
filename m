Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C760C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD148611CE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD148611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4913A60F14;
	Thu, 21 Oct 2021 16:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1SWELA4P7pK; Thu, 21 Oct 2021 16:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A2360F11;
	Thu, 21 Oct 2021 16:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52DB91BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4118340875
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtRlDe25sICG for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 16:06:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B83340874
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 16:06:16 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B585C2000E;
 Thu, 21 Oct 2021 16:06:13 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 18:06:12 +0200
Message-Id: <20211021160612.475456-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/grub2/grub2.mk: Fix the installation of
 target tools
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

The tools was not installed anymore since we move from autotools to
generic-package. This patch fixes their installation.

We have decided to implement the install tool process by running the "make
install" command for each tuples. This allows to have all different
platforms Grub modules installed in the target. The drawback is the
overwrite of Grub2 binaries tools during each "make install" command. This
drawback is not really important as it happens in the same package. This is
the best option to avoid unnecessary and more complexity to this package.

Yann adds also mixes fixes, like no semi-colons but separate lines, or
using && not sime-colon, and the calls to MESSAGE to explicit the different
step of the parallel build.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Adam Duskett <aduskett@gmail.com>
---
 boot/grub2/grub2.mk | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e01ebb2edb..19047d02f7 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -149,8 +149,9 @@ HOST_GRUB2_CONF_OPTS = \
 
 define GRUB2_CONFIGURE_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
-		mkdir -p $(@D)/build-$(tuple) ; \
-		cd $(@D)/build-$(tuple) ; \
+		@$(call MESSAGE,Configuring $(tuple))
+		mkdir -p $(@D)/build-$(tuple)
+		cd $(@D)/build-$(tuple) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(GRUB2_CONF_ENV) \
@@ -172,13 +173,15 @@ endef
 
 define GRUB2_BUILD_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Building $(tuple))
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple)
 	)
 endef
 
 define GRUB2_INSTALL_IMAGES_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
-		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple))) ; \
+		@$(call MESSAGE,Installing $(tuple) to images directory)
+		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple)))
 		$(HOST_DIR)/usr/bin/grub-mkimage \
 			-d $(@D)/build-$(tuple)/grub-core/ \
 			-O $(tuple) \
@@ -186,14 +189,23 @@ define GRUB2_INSTALL_IMAGES_CMDS
 			-p "$(GRUB2_PREFIX_$(tuple))" \
 			$(if $(GRUB2_BUILTIN_CONFIG_$(tuple)), \
 				-c $(GRUB2_BUILTIN_CONFIG_$(tuple))) \
-			$(GRUB2_BUILTIN_MODULES_$(tuple)) ; \
-		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple)) ; \
+			$(GRUB2_BUILTIN_MODULES_$(tuple))
+		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple))
 		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
 			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
-				$(BINARIES_DIR)/grub-eltorito.img ; \
+				$(BINARIES_DIR)/grub-eltorito.img
 		) \
 	)
 endef
 
+ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
+define GRUB2_INSTALL_TARGET_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		@$(call MESSAGE,Installing $(tuple) to target directory)
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple) DESTDIR=$(TARGET_DIR) install
+	)
+endef
+endif
+
 $(eval $(generic-package))
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
