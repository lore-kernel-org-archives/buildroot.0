Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74EB8515E;
	Sat, 11 Dec 2021 18:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QldvyPS54tsn; Sat, 11 Dec 2021 18:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389BF85158;
	Sat, 11 Dec 2021 18:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC1321BF3D4
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A961685152
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdP8bJlXaPOd for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:34:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E9FB8514E
 for <buildroot@busybox.net>; Sat, 11 Dec 2021 18:34:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q3so20231170wru.5
 for <buildroot@busybox.net>; Sat, 11 Dec 2021 10:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh9W/mi2S8ey3hW8QHGMGDVqsxv+T+rUqh3Q3FZdsms=;
 b=OsOFmAa+1bpOuguvMGgx+7IydelXDCvZ3hf9oOWLKnaBdsXcjAkB2XYy2GSmJ0lk3J
 z+xOz2rOWzk9/yEK+ZbQMoSzoSiEDNAOnFSQSbaxUNI59lTf3cBZquMeRwkXHZAAt/Uh
 rgm61z2/N3fFpU6gh9ltZkCjmCxnbIUrK4zh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh9W/mi2S8ey3hW8QHGMGDVqsxv+T+rUqh3Q3FZdsms=;
 b=55U4JeulNJQXoHf8csZXaTE780Ic64m31ghNU0wIiO0mUPA6ImLcI/Xtf8moOW5QUS
 X926x1y1krbyfk0n8+6gnlT+5Ih5MpWjyfWocBt8djUYcP7ByxvqIhxn5zIgsLlBBHbY
 Lyfx5UheahEsUQSG6d/hV3OA5YmTjx9Q9Z0GSQxqjpsICUIXTcG8ChX/kdH2UpAcrQjR
 +9f2/NTiSZr5D7/pQ2IpdD6gADe6GvRSw0V8g0MNRa+ovjzrYNw2yd5echcG+esUw8cI
 HH5NjLyixQPKOwEpvsutgluUAfeRkg5PR4QDe3hLaydWVyoXW5OOCvNtPgh+ulvgyH/Q
 MRoQ==
X-Gm-Message-State: AOAM533AGtujk6LNB1Ar+QZmNeLnc0Nv2bl/ZiHYjjf+zR2gskxi71Rp
 rw1z07SYIvKjM25bGwAx+Q264ULieobZ0g==
X-Google-Smtp-Source: ABdhPJxknQspt7N3JCIhuLX/1XgM5euBZBS6HztpT8V+a1se+q9TtnWibPThK10Qb45+6jvcE1hAnA==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr22158091wrc.130.1639247656020; 
 Sat, 11 Dec 2021 10:34:16 -0800 (PST)
Received: from localhost.localdomain ([2.196.208.11])
 by smtp.gmail.com with ESMTPSA id w22sm2095129wmi.27.2021.12.11.10.34.14
 for <buildroot@busybox.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 10:34:15 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@busybox.net
Date: Sat, 11 Dec 2021 19:34:12 +0100
Message-Id: <20211211183412.658131-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: Add ddr3 IMX firmware files to
 uboot package dir
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

The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
For this the i.MX firmware files must be in the toplevel directory.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 boot/uboot/uboot.mk                           |  3 ++-
 package/freescale-imx/firmware-imx/Config.in  |  5 +++++
 .../firmware-imx/firmware-imx.mk              | 20 +++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9661f901ea..c89216fac4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -187,7 +187,8 @@ UBOOT_DEPENDENCIES += firmware-imx
 UBOOT_IMX_FW_FILES = \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
-	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin)
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
 
 define UBOOT_COPY_IMX_FW_FILES
 	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0bd8000b50..df266fb28e 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -71,6 +71,11 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 	help
 	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
 
+config BR2_PACKAGE_FIRMWARE_IMX_DDR3
+	bool "DDR3"
+	help
+	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
+
 endchoice # DDR training FW
 
 config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 60c97fd2b8..3acd053d0f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -82,6 +82,26 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR3),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
+	# Create padded versions of ddr3_* and generate ddr3_fw.bin.
+	# ddr3_fw.bin is needed when generating imx8-boot-sd.bin
+	# which is done in post-image script.
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		ddr3_imem_1d_201810,ddr3_dmem_1d_201810,ddr3_1d_201810_fw)
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr3_1d_201810_fw.bin > \
+		$(BINARIES_DIR)/ddr3_201810_fw.bin
+	ln -sf $(BINARIES_DIR)/ddr3_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+
+	# U-Boot supports creation of the combined flash.bin image. To make
+	# sure that U-Boot can access all available files copy them to
+	# the binary dir.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/ddr3*.bin $(BINARIES_DIR)/
+endef
+endif
+
 #
 # HDMI firmware
 #
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
