Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C69FC282E7
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB806400A6;
	Mon, 15 Aug 2022 16:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB806400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zaSVJ1XN8-v; Mon, 15 Aug 2022 16:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C432540583;
	Mon, 15 Aug 2022 16:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C432540583
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 275AA1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 008C38175E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008C38175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIWnYXN8WL9h for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF3681760
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EF3681760
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 16:57:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p10so9733014wru.8
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BEMEtWl3nM3yJ1LtzeoAzBJHTPFS+Df9FR14Og/apAM=;
 b=rLnGbufERIFe8hARCnrAPDUzO2DUKpPITdSIDktK2bvqvUzBxj6tduobHOPwF0rWRS
 o/h3WDZFmEtWpYWPAdf4CaMBp2nqzbzV3oI4GxCggqR0VrY4Gyc+au6bSmx2nz7FOMAM
 UygSlodaKYUe2ApUv3NxkIWEoN6dAaHz5Lfssxe864H2vSsOUBu/oSaIrzNx5Apmb+8n
 jZaMHc4t/A4nQWkLhBmwY6EcbCmnKnqEyWPz0P4rmTnDXUGomxrdYObL8m1DLcpv4EKg
 BStbphAhUJXRACKvnd8nrSZo+NpSqZK6lAVudYMZMjHNtG4H+OXy9SH4TcjseR+LZhrL
 Zzig==
X-Gm-Message-State: ACgBeo15nTV4CevKacCHR/rH7aavf9YK+uRehwRIk+PRbYfmcEFxEQ5m
 HOWZ32FpWkjyPHDYlKCwPuIHAv1DOrQ=
X-Google-Smtp-Source: AA6agR7+VnWOl+dp8BEV2/chfjYnwd8Tio8Z8742T27TmJ1hG+viIzW/Admy8L1sNBmAvMyrztb3mw==
X-Received: by 2002:a05:6000:80b:b0:21e:d62e:b282 with SMTP id
 bt11-20020a056000080b00b0021ed62eb282mr9221367wrb.557.1660582642374; 
 Mon, 15 Aug 2022 09:57:22 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00222d512d96asm7905989wrs.75.2022.08.15.09.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:57:21 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Aug 2022 18:56:32 +0200
Message-Id: <20220815165632.1278597-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815165632.1278597-1-francois.perrad@gadz.org>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BEMEtWl3nM3yJ1LtzeoAzBJHTPFS+Df9FR14Og/apAM=;
 b=CW/IY/mUCrDCcNOGWZIVovt+QTJrL93t7cYaDPKyNFbrPU2xDDVABj70jVy08cLP3U
 F46ieSsf6GUkztt4350XKfoT0H990MEpkNmLEAGMIGMLaXUQV6+fIQNH0QbR6xnq+UOc
 3mY/ZlcFouOrS/OWznctsWtUc0qE6ps9opCybcRqifkTbDXh+CCb4e8oUMX5ivCIzvRR
 Nu7EuTvkZ0Jp6TL7TLqKTRJV+aX6FE6a0pUxispGCJkfOhGaIonmCOiO/0FPJZfsMuD5
 rsUyIVLsnuFM8eFmD6Cj7L3Vt1i/o9+Xyj0a1MJVd9E0dLWzztq/potra7g2rHK61xcy
 wk4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CW/IY/mU
Subject: [Buildroot] [PATCH 4/4] package/qoriq-cadence-dp-firmware: refactor
 with NXP_EXTRACT_HELPER
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qoriq-cadence-dp-firmware.mk              | 27 +------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 7d701c4ac..8cc2200a1 100644
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
+	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
