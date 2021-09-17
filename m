Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1C460EFF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA1C460EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B077761BEE;
	Fri, 17 Sep 2021 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6zvjH69Qbth; Fri, 17 Sep 2021 20:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F8C61BEA;
	Fri, 17 Sep 2021 20:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 760491BF48D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A7B61BEA
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNdf1kuPCjWG for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 20:13:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD9AB60B91
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 20:13:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3CA988B52A; Fri, 17 Sep 2021 20:11:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 22:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f71ff5257d63cf306ce3177a89bbaa79984ba10
X-Git-Newrev: 7f303516f69a143c2ecc317948ec1934a195235c
X-Patchwork-Hint: ignore
Message-Id: <20210917201112.3CA988B52A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/iso9660: switch from cdrkit to xorriso
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f303516f69a143c2ecc317948ec1934a195235c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add support for EFI-compatible ISO9660 images in future
patches, this commit switch the ISO9660 logic to use xorriso instead of
cdrkit. Indeed the genimageiso tool from cdrkit doesn't have the
--efi-boot option needed to generate an image compatible with EFI BIOS.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr: drop superfluous tool name from variable]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a129655ce3..23421a9a5c 100644
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
+ROOTFS_ISO9660_OPTS += -z
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
+		$(ROOTFS_ISO9660_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
