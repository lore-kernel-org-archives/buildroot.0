Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A063BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 05:09:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0236061209
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 05:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0236061209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9213180DF8;
	Sun, 12 Sep 2021 05:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5OlB6JAVr7Y; Sun, 12 Sep 2021 05:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028F880DA0;
	Sun, 12 Sep 2021 05:09:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6FFD1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 05:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D5D6081E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 05:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lI7kSb5SW0t5 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 05:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F29EE60744
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:09:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w29so8323188wra.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 22:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2oXIx+b+xymlD3bu+jjZQ4Y5pJfHAb5daOPl04XtUM=;
 b=kS8PgOT9j2u3DJSxQwQRzhvT1va2bSnSy9QJcHtN5iutHK49RzFEkzTQ7omOAQkd1v
 FiG5Pv7pQCa5uyEwplIZ944LzD2xX/QONDxsZSFkUH3ZklHcbJw9+87PA9b61S02AZMi
 MlKrokcZqyN9V5p2ZsfPp8GAFnUENlMFmcDKqS7R8ZhSJXPLHIWSCboSLWLYS7FUqd6x
 EnPmbB3NHdiFQi5x3XjcecXHH25fzc7eW9MjivrKWQvF89wjBiSX87y/NE5q84V8tiZ+
 0kwbcmB3C744a9XmspHtoRjzfRFbjG1hg2i/4PRm2TIlb/GRJtqM8o8GqV6igUFaWupg
 HoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2oXIx+b+xymlD3bu+jjZQ4Y5pJfHAb5daOPl04XtUM=;
 b=B8wzHev/mj2+h2PP76o67w01A+mNTWeOf7v6D0rfOxaaQ6kautace4ln6IijNVPrFq
 nznant9KpQF0ZFce1Xu75kNnc1zwM1bJ69S8rGVnTLNqHwg9Ph01ikubJ4E3p6g7FBjk
 +aNa50RK4aStKgBbCGYOMbCzR73PMbtqf4Re6aJJhS6Vl4R+JONeoBTPCKsFI+6qAzu4
 tfRzKVN5bev4B3VOhJ6brh3mMYHwW08Q5zNkwFPqNppCcd1nicHrFx1iflOqcOha98ZO
 THNrx0tlcPGDhdqqlUjI63Hfk/+jXuLUDFCnKntWwpLn9X8eB5igcRORqbj1VzzCcvCe
 FjRQ==
X-Gm-Message-State: AOAM532j7BE2sXgCiabvu7wPhihQd2crjgqpKzt06JjfWs1Uxy9+OHya
 n5mNpM48wy9Kcclawj4vFVKRLQ0eeI+tsw==
X-Google-Smtp-Source: ABdhPJzc8PUJmhllW2rS3RPykCxlVsmnreHc4SlHz8eQsdsNH4axA5IcVGiWZheAO2EotvCzoyjBJg==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr5796871wrb.100.1631423381943; 
 Sat, 11 Sep 2021 22:09:41 -0700 (PDT)
Received: from t450s.fritz.box (ip5f5bdc1b.dynamic.kabel-deutschland.de.
 [95.91.220.27])
 by smtp.gmail.com with ESMTPSA id o13sm718436wri.53.2021.09.11.22.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 22:09:41 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 07:09:06 +0200
Message-Id: <20210912050905.21355-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] boot/uboot: copy IMX firmware files to uboot
 package dir
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

The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
For this the i.MX firmware files (DDR, HDMI) must be in the toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---

v3:
 - included the comments from Fabio
 - add Fabio's SOB

v2:
 - small changes in commit messages (thanks Stephane)
 - use "i.MX 8M" for consistency (thanks Stephane)

 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0854fb13cc..8cc40cd9c5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -239,6 +239,17 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	  and that the OpenSBI variable pointing to OpenSBI binary,
 	  is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
+	bool "U-Boot needs firmware-imx"
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
+	help
+	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M Nano)
+	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
+	  This option makes sure that the i.MX firmwares are copied into
+	  the U-Boot source directory.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a840d9cc1..a446830c6f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
 endif
 
+# Mainline U-Boot versions can create the i.MX specific boot images
+# and need some NXP firmware blobs.
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
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
