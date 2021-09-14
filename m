Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C9DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F17361163
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F17361163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01293403F5;
	Tue, 14 Sep 2021 09:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfMaqh5q7fjw; Tue, 14 Sep 2021 09:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0765340222;
	Tue, 14 Sep 2021 09:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B37E1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 870B340345
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fB8gdr_3Up48 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97B3340344
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2D863FF80D;
 Tue, 14 Sep 2021 09:34:59 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:52 +0200
Message-Id: <20210914093457.1389174-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914093457.1389174-1-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] fs/iso9660: switch from cdrkit to xorriso
 to build ISO9660 images
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

In order to add support for EFI-compatible ISO9660 images in future
patches, this commit switch the ISO9660 logic to use xorriso instead of
cdrkit. Indeed the genimageiso tool from cdrkit doesn't have the
--efi-boot option needed to generate an image compatible with EFI BIOS.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 fs/iso9660/iso9660.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a129655ce3..f80b735858 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -24,7 +24,7 @@
 
 ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit linux
+ROOTFS_ISO9660_DEPENDENCIES = host-xorriso linux
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 ROOTFS_ISO9660_USE_INITRD = YES
@@ -52,7 +52,7 @@ define ROOTFS_ISO9660_MKZFTREE
 		$(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_MKZFTREE
-ROOTFS_ISO9660_GENISOIMAGE_OPTS += -z
+ROOTFS_ISO9660_XORRISO_OPTS += -z
 else
 ROOTFS_ISO9660_TMP_TARGET_DIR = $(TARGET_DIR)
 endif
@@ -129,9 +129,9 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 endif # ROOTFS_ISO9660_USE_INITRD
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	$(HOST_DIR)/bin/xorriso -as mkisofs -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
-		$(ROOTFS_ISO9660_GENISOIMAGE_OPTS) \
+		$(ROOTFS_ISO9660_XORRISO_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
