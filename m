Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4713C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B716611BF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B716611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A60D40694;
	Fri, 10 Sep 2021 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFdMg_k4H47T; Fri, 10 Sep 2021 14:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66AF04068C;
	Fri, 10 Sep 2021 14:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3521BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BDFC40594
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azuJl8AoalUS for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 416604029B
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:10:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id am9so1235583ejc.7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHC17ePkl+qioqlCVgkrGTt2vpbLj5OF788kSoS0YqM=;
 b=L/zjL3Ouep7UCFUwDU5hu6qtmYHTR2NRLDGcXz8wX4+XYsizGdLETsIODE//dnHb/C
 A0LEWwt7i0lPLvz5gd2fFAdipJf8qU89feGgKbQ/CU1mU4fSGAdn9JeZBhCaDcHvbsXD
 pAykh0EJaX9L2qsZAE3kjlSI/R9Wp7SfLF7Hhj1mlTc+a2ks7A0NfBca6WbzXAuhpPZJ
 P+jzm+4ODOnI47BTM2H5jTIkNUwMHPkCiqslK5WY8VAWQlfVxsGueyDzJ9AyABYzykP+
 LtfnnDjI52naHUi1UQdAZzmY5m2RSPKu3qFGR6mykaxYZxsiWxW1hP9Gut4TtRtVomqX
 7kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHC17ePkl+qioqlCVgkrGTt2vpbLj5OF788kSoS0YqM=;
 b=1tpoRtFoctn9db6FGnOaStodXgBJ/KieHqxNj24maLFRlBcCo+utMg5eq7AD6rcxg8
 tNfnWKi0QPiT5gFqHJqxT8ht3mhdSJFpp50LvHojypuxns7568eOwf3Rqu2BQcCLJDEB
 tBM9b32to1SCndhB6P3LeCkGeJMhOMMs70syjkQTBHZrgHzQ9kMxCMHMiGvQl4Lwnaft
 AZjBJh4YuxC/ulpvYVe5QDZQrOV3Gm9+fo2ibVtIpI4Wczj05p87e97/ywtqVyZdY1Sy
 HEz217e5jVfB5F2IgJYNsLsb1xnU/r0j//r1tjrwKkWrGA2fxi3tHZOhe7J+3kT5ktSg
 wsHA==
X-Gm-Message-State: AOAM533zwectZrdExf2G6m7HbLOVFKgHH0gbWWJfQvOw6vJxWKVkDgpM
 +MH3AkKIVA39KjxsKKNaoL9G70EK2D4=
X-Google-Smtp-Source: ABdhPJwWFxAQzZBMgc6Vl1DzeZ5kbUpturKIbHGtgpfzzh7ht/HuuNJtCnJoZOCBhrGOGk1W+ifCsg==
X-Received: by 2002:a17:906:3159:: with SMTP id
 e25mr9435081eje.549.1631283005764; 
 Fri, 10 Sep 2021 07:10:05 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id c10sm2536754eje.37.2021.09.10.07.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:10:05 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 16:09:25 +0200
Message-Id: <20210910140925.28138-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210910140925.28138-1-heiko.thiery@gmail.com>
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/freescale-imx/firmware-imx: copy
 all (lp)ddr files unconditionaly
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

In mainline u-boot more and more imx8 boards are switched to binman
to create the imx specific image (flash.bin). To support this the
(lp)ddr firmware training files are needed. For this to work all files
should be made available to the U-Boot build.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

v2:
 - add reviewed-by (thanks Gary)

 package/freescale-imx/firmware-imx/firmware-imx.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 1076cf85f1..29241342be 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -51,6 +51,11 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
 	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+
+	# U-Boot supports creation of the combined flash.bin image. To make
+	# sure that U-Boot can access all available files copy them to
+	# the binary dir.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin $(BINARIES_DIR)/
 endef
 endif
 
@@ -69,6 +74,11 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
 		$(BINARIES_DIR)/ddr4_201810_fw.bin
 	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+
+	# U-Boot supports creation of the combined flash.bin image. To make
+	# sure that U-Boot can access all available files copy them to
+	# the binary dir.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/ddr4*.bin $(BINARIES_DIR)/
 endef
 endif
 
-- 
2.30.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
