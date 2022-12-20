Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AF6C46467
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 13:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6317C40204;
	Tue, 20 Dec 2022 13:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6317C40204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2Cm6lqe-ikh; Tue, 20 Dec 2022 13:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CE540298;
	Tue, 20 Dec 2022 13:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97CE540298
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8951BF3AE
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 13:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10DD84034A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 13:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DD84034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COQUgyhQgto0 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 13:35:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E36B40339
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E36B40339
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 13:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id E339B1653D;
 Tue, 20 Dec 2022 14:34:59 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id 7Qy9c5IdNAFw; Tue, 20 Dec 2022 14:34:59 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 9F50A16539;
 Tue, 20 Dec 2022 14:34:59 +0100 (CET)
From: Christian Hitz <christian@klarinett.li>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 14:34:53 +0100
Message-Id: <20221220133454.1931855-1-christian@klarinett.li>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received; s=sel2011a;
 t=1671543299; bh=VntJWmprqMM6MNh/oGeWoQGZMd9hYst8Qk2Vv4K0f5I=; b=
 XWRkavdSyr62g+oIgWE2doX88nv2tg3CS5i3NpTXI+aD3Sq0HijOEqdPnSw0bKRG
 9i1bprJ7xK1eUCs5u0qDlgpewY11xEd21uDMgT9t8dTsV9KDmx9JzttMfIBO5B/a
 NMTXBUnpsQ4q03Bfp2GIEnQjrU+l+ly7gUMquZUDEMg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=XWRkavdS
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 installation with merged usr dirs
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Christian Hitz <christian.hitz@bbv.ch>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Currently, the firmware files are installed to /lib/firmware/imx. With
BR2_ROOTFS_MERGED_USR=y /lib is replaced with a symlink to /usr/lib
effectively deleting the installed firmware files.

Install the firmware files into the /usr/lib/firmware/imx prefix instead.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Backport to: 2022.02.x, 2022.11.x
---
 .../firmware-imx/firmware-imx.mk              | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 99fe71a91c..2171ce592e 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -128,14 +128,21 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
 endef
 endif
 
+# /lib is really /usr/lib with merged /usr, so adjust path
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+FIRMWARE_IMX_TARGET_LIBRARY_PATH = $(TARGET_DIR)/usr/lib/firmware
+else
+FIRMWARE_IMX_TARGET_LIBRARY_PATH = $(TARGET_DIR)/lib/firmware
+endif
+
 #
 # EASRC firmware
 #
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
 define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
+	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
+	cp -r $(@D)/firmware/easrc $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
 endef
 endif
 
@@ -145,10 +152,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW),y)
 define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
-	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
-		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
+	cp -r $(@D)/firmware/epdc $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
+	mv $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
+		$(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/epdc/epdc_ED060XH2C1.fw
 endef
 endif
 
@@ -159,9 +166,9 @@ endif
 FIRMWARE_IMX_SDMA_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME))
 ifneq ($(FIRMWARE_IMX_SDMA_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma
+	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/sdma
 	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_SDMA_FW_NAME)*.bin \
-	       $(TARGET_DIR)/lib/firmware/imx/sdma/
+	       $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/sdma/
 endef
 endif
 
@@ -172,10 +179,10 @@ endif
 FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
 ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
+	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/vpu
 	for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
-		cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
-		ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
+		cp $$i $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/vpu/ ; \
+		ln -sf vpu/$$(basename $$i) $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/$$(basename $$i) ; \
 	done
 endef
 endif
-- 
2.38.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
