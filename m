Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E6C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:27:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30AD60F42
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B30AD60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F78560A55;
	Thu,  5 Aug 2021 21:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-9a3loVBVC9; Thu,  5 Aug 2021 21:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B391D60A46;
	Thu,  5 Aug 2021 21:27:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B13461BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FF62839CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpEAsPNx2tlr for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAD788382D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:27:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 300571C0008;
 Thu,  5 Aug 2021 21:27:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 23:27:32 +0200
Message-Id: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/freescale-imx/imx-gpu-viv: move
 pkg-config files fixup to the build step
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The fixup of the pkg-config files modifies files in the build
directory (@D) but is done in the staging installation step, which
doesn't make much sense, especially since the build step already has
some fixup logic. So we move the fixup logic of the pkg-config files
into the build step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 103c0341e3..51b04f82d4 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -42,16 +42,6 @@ define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-# Instead of building, we fix up the inconsistencies that exist
-# in the upstream archive here. We also remove unused backend files.
-# Make sure these commands are idempotent.
-define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
-	for backend in fb x11 wayland; do \
-		$(RM) -r $(@D)/gpu-core/usr/lib/$$backend ; \
-	done
-endef
-
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
@@ -72,9 +62,19 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 endif
 
+# Instead of building, we fix up the inconsistencies that exist
+# in the upstream archive here. We also remove unused backend files.
+# Make sure these commands are idempotent.
+define IMX_GPU_VIV_BUILD_CMDS
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	for backend in fb x11 wayland; do \
+		$(RM) -r $(@D)/gpu-core/usr/lib/$$backend ; \
+	done
+	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
+endef
+
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
-	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
