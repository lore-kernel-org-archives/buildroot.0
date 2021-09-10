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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A6BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DE261026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82DE261026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55FF860B9A;
	Fri, 10 Sep 2021 14:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bzF8oGMK0NG; Fri, 10 Sep 2021 14:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6EF60B42;
	Fri, 10 Sep 2021 14:10:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 718851BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B00D40594
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ihjhfda9O0P for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:10:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 764CB4029B
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:10:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id am9so1237271ejc.7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7l+MWrJAAXgG3WAEhv8VFQw8O1QOZXSw2aLcdLecnc=;
 b=hNFF4Z76kl9bhafKvVa9vGKn/sSIKJkOQbwwhPb+gyTyea45rKDdWPjsAwKpmKz5du
 TWPjxYa3/uE1sJzOY5t2OO1sG6HJ8C+VCXx0/NKM7LEoQ2VBqSnWDZwKRpe0yzvgdAAl
 L1Pp0I4JIOLl38A53RZiwnjGlMqSbmnxlgewirZpHVryGNtb/4nRSN08YQqsxzX8nTCW
 bbKShqr5JC4tM+Gyx1S532+M498i9BPxhe5y/at+Y87ihlgix7Gq5f1Hr+h83kk1vCO8
 rKrPZyS6G5oH2m2a3jrg484lVeF7T+hSwP7uq5tiMj55vhRzabD+EEx5OWQTLyb2PjVm
 +96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7l+MWrJAAXgG3WAEhv8VFQw8O1QOZXSw2aLcdLecnc=;
 b=jfawCB1rqtB+705VG/V2tNzfcq99ewaSP2sMwL0Yi8IUVEcOzTs/aDPdKX2ZTpk6Ps
 DQmkIxK7nNa/1FIRD691ZLuyC3wLutFCEY25NoTA9HDHpaqvfjcz53FmvEqo8Kss7BRy
 02x6xqBXs5bz36lKw4b8HU9Z/cSYBmEbNMs86IUKVFC3KodkHnWw+ZJ0Kc5/y6rzVWNY
 X5qRdlVbaixrduJaxxPUqvJXRB17yX6dICov83UIJ/D8p5jkde4yj1ZF+4cEB1pzDIkQ
 dgKkHyi7Ku+OG7l9fLUn4srFOUdSg3IKGJl2dVCrmzRq770CST8+vK3IvunfRi8F/xym
 XYMQ==
X-Gm-Message-State: AOAM530SQWXYitnpWF66/unJKUcq5DLSyfPBFuMgTASxzT4leXgZOgEV
 NSbwCM/mQT1FRWtrTYJWk15I1+ApaUw=
X-Google-Smtp-Source: ABdhPJz9FuMPEoB8XQIwKfdUgOPq0neUUKeAHvcWmidzOM2b8VzWvcXQ4VWSC626oE0ozbLm7PsNbA==
X-Received: by 2002:a17:906:3012:: with SMTP id
 18mr9915043ejz.136.1631283021557; 
 Fri, 10 Sep 2021 07:10:21 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id c10sm2536754eje.37.2021.09.10.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:10:21 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 16:09:29 +0200
Message-Id: <20210910140925.28138-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210910140925.28138-1-heiko.thiery@gmail.com>
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] boot/uboot: copy IMX firmware files to
 uboot package dir
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
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

If the U-Boot image is to be built with binman and one of the i.MX
firmware files (ddr, hdmi) is used, the files are expected in the
toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
 - small changes in commit messages (thanks Stephane)
 - use "i.MX 8M" for consistency (thanks Stephane)

 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  | 27 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0854fb13cc..da518db118 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -239,6 +239,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	  and that the OpenSBI variable pointing to OpenSBI binary,
 	  is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
+	bool "U-Boot needs firmware-imx"
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
+	help
+	  Some IMX platforms (such as iMX8m, iMX8mq, iIMX8mm, iIMX8mn)
+	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
+	  This option makes sure the imx firmware gets built prior to
+	  U-Boot and copies the files from the buildroot binary dir
+	  into the U-Boot source dir.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a840d9cc1..cf8d6b1f39 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
 endif
 
+# New U-Boot versions can create the IMX specific boot images
+# and needs the some NXP firmware blobs.
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
+UBOOT_DEPENDENCIES += firmware-imx
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),y)
+define UBOOT_COPY_IMX_DDR_FIRMWARE
+	cp $(BINARIES_DIR)/signed_hdmi_imx8m.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
+endif
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
+define UBOOT_COPY_IMX_LPDDR4_FIRMWARE
+	cp $(BINARIES_DIR)/lpddr4*.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_LPDDR4_FIRMWARE
+endif
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
+define UBOOT_COPY_IMX_DDR4_FIRMWARE
+	cp $(BINARIES_DIR)/ddr4*.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR4_FIRMWARE
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
2.30.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
