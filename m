Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA12AC433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418696069E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 418696069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11213607D0;
	Mon,  6 Sep 2021 09:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aKRM4146dkQ; Mon,  6 Sep 2021 09:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F148607A7;
	Mon,  6 Sep 2021 09:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9292A1BF3BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80709402A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2TxNakxRG2k for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 09:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 752C740142
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 09:42:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3504104wme.0
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRKFcQKE2rOMXO3i7YDoQKVuck9to//4OADqa0/+BZc=;
 b=VQuQ1BFz+hC47xpJG6YH/qZoJid9K1Uy6eKkw9ch3z5k+ErNOn896Rzr02t8N2I9e0
 UazO3kR6CLBF3789eCafXDAJ8IVx5nWDXdjTADgOJgusrtaiTSIE8KS3DWaQ0YsXYAlx
 vJqjRwlZAnXiguoKqtwutt0vuPnX06747TmKnjcQUqRlUjZ+r9Qz4oKO/5P8/mtTyXDD
 rTrk8yEZvGYjfRGk+wn8hVEh2asB6LFBsw2FvUu7vOXwCUn7k5N0f5zSaGOru8VtEWL2
 dYXfvr/QAXX9T3Hj6BzkhfjnOmOtTLnejLpjMpGcnR6dMhvxH3CTss/7thSm9xvk3Yyf
 jS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRKFcQKE2rOMXO3i7YDoQKVuck9to//4OADqa0/+BZc=;
 b=iOtsCFYb9xCvIwz8OAo2K6KZZFAIxIaVIUoNx2GTS62qp019YMkfmGhQZRNR9gAikk
 hZMM0kQ2DjTQv3UGYfawN+rwmtnMXjHSj1e97GpM26yt41/XUZsVJORQa/FZDRrR8xnz
 EpNWjVG8T6c9AHCJBG2MHT/bSfzK2+V1NiMwCKgtekoyGt00hUBzlWWtYOfE0MWj08Yk
 lRERGJUjgoOcFqiOZyDXxhKPH/97nnkzE5gy/O2iiNirPJUq9RwvxuY53WbOrzdYfSY6
 gKjcs2xI0Qzv+HFZ5b3WxdAEpDgJFWEhv9eX6DzoS63UTg6N+LkczEh3SnLhsJ4KvmgJ
 uPQg==
X-Gm-Message-State: AOAM533Uhzz4oeYZF0nMshHvi8OCQTP5YiFaxsT86V8flsHcQpnDfQNg
 sQUOg+Ti2OQhOxKMsmfeZCPiFyAaLBo=
X-Google-Smtp-Source: ABdhPJz7jMGirdfgeXlmvFl27cVFFBwIGOcJz9+KIUV4AS2JbJJtmnU5Su9ly5/avexAi9wneu/ICA==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr10251073wmc.129.1630921359077; 
 Mon, 06 Sep 2021 02:42:39 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id l26sm6727653wmi.13.2021.09.06.02.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:42:38 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 11:42:14 +0200
Message-Id: <20210906094214.6142-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210906094214.6142-1-heiko.thiery@gmail.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx: copy
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
 Refik Tuzakli <tuzakli.refik@gmail.com>,
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
---
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
