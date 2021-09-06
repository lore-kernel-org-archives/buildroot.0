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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7236DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1753D60F3A
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1753D60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF00C80F43;
	Mon,  6 Sep 2021 09:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F63SObt-HFW2; Mon,  6 Sep 2021 09:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F8A281947;
	Mon,  6 Sep 2021 09:43:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A60D1BF3BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D534044D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bvS9jw9_c-a for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 09:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 339BC400CF
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 09:42:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1197179wms.5
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IawvKW90xOJme/VsAj2Lb4B1wYVX4H0mJ51CQpcrpaA=;
 b=J1qU12tFekqXM3LRcR5iMt/sb0/HHxjNiNJVRbqfTwzsmhe7GyL/3elqnGsjfhHZLB
 JUch0JuhpyLi5I00ss9gEyOuSTOXVSb4H5oWHyXaTgLnJkebI4ac2iDG2LcazALl+NIH
 xjFVDSrbBbX4VMlKFGTBI2crgu7JLv3SdfnDq/qr4QrE836wzR/bkJl7xo9PzlsZtA4H
 eXkFgoZX3z0fXVg3v33OVO7YkAHZ7HbWgLb/kxia0TBY+2CYJqNAlvTfrpQ5fcU23YmE
 oAvb8Cr+zbsmBOrysCUEnPhhmQQxY7QaXVC+WNtM62SIjuTUYk5TccbtbWfKqTcshib/
 3NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IawvKW90xOJme/VsAj2Lb4B1wYVX4H0mJ51CQpcrpaA=;
 b=PqGYuOkB7feqgCb0uwbJdyDApUPEti1GWLNcpp+GxbVkmM7cVDcqv20bms1ty8EBaO
 h7Ajt6MlWPYxnZOHc16QDIY1FUUj4TOKaOx3gdm/7sePmxopUKi5jIXAUs/+PnHE2ZXm
 w+z5IzAk7s4VMcNDbSm19/3fNb1ciouLzE97n88zu5+8ZX1SKgI1JiTTCRHawYnub/l9
 6AkDdinz+5JBalpzD649cHQ99+6hpv/KjGCTn4Hxpo6QS9/Q0Im/eWnRUfgTc/nkWZNJ
 oBDyn2hj6F9fdioQjswYyXD87csGZbOZs8Sbh0neKnrgYbeWqXvMiuIXrOKrcDLCmznx
 1xoA==
X-Gm-Message-State: AOAM53031qTBsZI1cCeiWIJ4gZXbwihlKmI3HeJ835YKyo3l79JDLkp+
 AVgiD+m70LMf/56wklLpZRXJaMsz6lY=
X-Google-Smtp-Source: ABdhPJzWeQ73wO9cPv+vcgWzFM07YSKC7ZDOt9+e+IVC2B8kn1lBLSa0A7Uo8m4XMzCsaxOBW5jfhw==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr10533186wme.146.1630921371207; 
 Mon, 06 Sep 2021 02:42:51 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id l26sm6727653wmi.13.2021.09.06.02.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:42:50 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 11:42:18 +0200
Message-Id: <20210906094214.6142-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210906094214.6142-1-heiko.thiery@gmail.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] boot/uboot: copy IMX firmware files to
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
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

If the U-Boot image is to be build with binman and one of the IMX
firmware files (ddr, hdmi) is used, the files are expected in the
toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
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
