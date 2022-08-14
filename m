Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A8AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DB1417CC;
	Sun, 14 Aug 2022 12:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DB1417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mewp4w8Egfpk; Sun, 14 Aug 2022 12:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C2741680;
	Sun, 14 Aug 2022 12:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C2741680
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 973541BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7230881985
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7230881985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWrdxUbxY0bE for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:57:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA4E8188A
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EA4E8188A
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:57:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qn6so9390639ejc.11
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hTM8c7qILaLPUnHOuM6VN4uf7LJhEhQH/0oz1xdWEtM=;
 b=0gSfB8vr+tiSGgtD82kJPbF9+7SSZbBXlSwwJDSIg9DFOdQp+adMb+URD2AbSXEGIN
 WMMXVvWGErOohZaTuU0SYUiVedOIjvzPYRBfSFnBKx33bavOIFKs1xBTJQXbglIRuG/s
 GNDeyYjjUmPePmB6m2bkjdcNOtO1EiKoNRrwfddgfPzCvRFxmL3wmR27R2GQvkYTBkpM
 /LNpZM+5Y0v5+AWTudwWfCjOZRV7ljkQVGP/xPVreytSEZVvpw0uMuU6SAKmlasTANuv
 6WnSLvH9+NDiWq1EDCB8vD9gGupUjTXSbV6ff2jtcH9lBwLYToowHjJ7DADfjfwO6TYS
 cCQQ==
X-Gm-Message-State: ACgBeo0R4+no0GQuyPg5T7TJOKnauj64kxrm5W8q547V4ewrjXEZ0tsA
 ZmB88oUFCUzySiYSZk5oXotCHxGE9n4=
X-Google-Smtp-Source: AA6agR63SO3EsroohSU70QPlJSTynhI+UgfC62mkC8GQxYsexXlqqcdiUbs5T1O8dWnDF0z5x/k2mg==
X-Received: by 2002:a17:907:6818:b0:730:d99f:7b91 with SMTP id
 qz24-20020a170907681800b00730d99f7b91mr7693445ejc.496.1660481824649; 
 Sun, 14 Aug 2022 05:57:04 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 vf18-20020a170907239200b00715a02874acsm2951306ejb.35.2022.08.14.05.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:57:04 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:56:56 +0200
Message-Id: <20220814125656.1227977-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hTM8c7qILaLPUnHOuM6VN4uf7LJhEhQH/0oz1xdWEtM=;
 b=jUUUnZD8JDeNDRlrGZA2k6Ck8wYAqa/nZdmWQ2wFLoRq5oORmDLV05humtcs+FiEDX
 9T0WZJN52rjqnJjO61n1Dr9VhCpjXQZ53SOLZcK/CjbqEYOK4+D0R6AyKBkofIuNq47j
 Rle3wm1NeI4CHhcLTpKLkQbM0a5bAgcz+/ipl56sqVqNtB/AvTCmLahkouVhLiRYTRy2
 Bg+Kb5ja/ldVU7paTh1nkR2nHcevwERAphGgnc6W7sDfiWIXs17YAmHYOCg1CwO4NhRm
 EhUGIQpQ5VEYOHMPCocepMuBK33XbBwrUmkaTV59SG1LevVLjxHQOP+JKg35WnkVtcFZ
 2+Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jUUUnZD8
Subject: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: refactor
 with FREESCALE_IMX_EXTRACT_HELPER
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

avoid code duplication

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qoriq-cadence-dp-firmware.mk              | 27 +------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 23643d24e..1a97c5803 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -13,33 +13,8 @@ QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
 
-# Helper for self-extracting binaries distributed by NXP.
-#
-# The --force option makes sure it doesn't fail if the source
-# directory already exists. The --auto-accept skips the license check,
-# as it is not needed in Buildroot because we have legal-info. Since
-# there's a EULA in the binary file, we extract it in this macro, and
-# it should therefore be added to the LICENSE_FILES variable of
-# packages using this macro. Also, remember to set REDISTRIBUTE to
-# "NO". Indeed, this is a legal minefield: the EULA specifies that the
-# Board Support Package includes software and hardware (sic!) for
-# which a separate license is needed...
-#
-# $(1): full path to the archive file
-#
-define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER
-	awk 'BEGIN      { start = 0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start = 1; }' \
-	    $(1) > $(@D)/EULA
-	cd $(@D) && sh $(1) --force --auto-accept
-	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
-	rmdir $(@D)/$(basename $(notdir $(1)))
-endef
-
 define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
-	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
