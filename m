Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3676FC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 014A282145;
	Fri,  1 Mar 2024 13:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8XZXr7cPfaq; Fri,  1 Mar 2024 13:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FF8835D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FF8835D9;
	Fri,  1 Mar 2024 13:37:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA93A1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4CC240644
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rClM0I67qmLC for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 487844193C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 487844193C
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 487844193C
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-565a2c4cc1aso3205541a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300199; x=1709904999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3DKRsXYcsns+F4U65BoXMWUf/LGtswSoHOBptQQKuMA=;
 b=kXCSPe3d/vwAIW8GKTBVq5B47+24HADhCv8k+Ei/mKcs3HIul1Xez39TcqBlgNU6IJ
 JI8ptH+pmFOs1HBxLZ5nqdn9/Mdb2CuAZRyf3p7Getza5AtmxQ0gN6o3UTF6aLHEAum5
 pcpzh9644vAqmU+tdjNtGMETlVtd0B4IbCQjfUgeubPWjfr8Z6QxhbF1Q6CMDh7EPrfy
 0AyL7bEauDvRnE+/ZVKYJI0+Vf03Gk2+fsL4maFG+N+2d0g5/ohYSBw28DIvR3UBDIeZ
 TqKPmEPTr3tBz5vOVD0vZAiwh1Qjavi1zdlk6yuT344meIwIppmoqanGj2MyLnm0qZdm
 Gu7A==
X-Gm-Message-State: AOJu0YytDSQgbxCruGznEdEZlncxBVD8JO7EwowJD8EyyemxTGUH2LL+
 3C2m2Lf4gBeoEYPTvCBoPf/ZY3PsR0d0ld9qI5Q74GtX4WWBVz6/gZsm7g3pl8CvSTxaGGNkTOi
 Wr8I=
X-Google-Smtp-Source: AGHT+IEF9ISfUkY2jKt9Q6veKK/6m/BGCYP2Lm5CHV/OdCcqROz8i/JztdHIP1+qNqFZCi+JY9iE6g==
X-Received: by 2002:a05:6402:17d2:b0:565:bbc4:9c88 with SMTP id
 s18-20020a05640217d200b00565bbc49c88mr1168504edy.20.1709300198953; 
 Fri, 01 Mar 2024 05:36:38 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:09 +0100
Message-ID: <20240301133620.3547430-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300199; x=1709904999;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3DKRsXYcsns+F4U65BoXMWUf/LGtswSoHOBptQQKuMA=;
 b=H6yFmW2GOwIla+UhQJ1LLvuIK5RCP2IRxCEi+5CE68q46shJlxIK8VL9eSWdO/j4kG
 lmP33IE3cumls4KZSvSLhJ73Rc+7oNt43LiNHNqStTveuU6NB8pvwhIp4mvIfdMT0hW/
 n2xGkWzqs1f/knp5mDCvPrXflTrgs8+MwcCH4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=H6yFmW2G
Subject: [Buildroot] [PATCH v8 12/23] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option BR2_TARGET_UBOOT_USE_BINMAN to
add additional host packages in U-Boot build dependency to use binman.

The binman requirement is directly included in buildman dependency
(tools/buildman/requirements.txt) since within U-Boot, binman is
invoked by the build system, here buildman [1].

Furthermore, the use of Binman no longer makes it necessary to set
`UBOOT_MAKE_OPTS += DM=...'. We had the explanation from [2]:

BINMAN_INDIRS is used to fetch the DM binary from <path to
ti-linux-firmware>/ti-dm/ and SYSFW binaries from <path to
ti-linux-firmware>/ti-sysfw/.

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot
[2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- Replace ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y) with
  ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),).
- Update the commit message

Changes in v6:
- BR2_TARGET_UBOOT_USE_BINMAN
- Binman tool is not specific to TI K3 platform, so add an option to specify
  the use of Binman in U-Boot.
- Add runtime dependencies
- Update commit message
- Add SOB and COB tags of Romain Naour

Changes in v5:
- Drop "DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f"
  from UBOOT_MAKE_OPTS.

no changes since v1:

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930db..e6e7956adccb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -290,6 +290,17 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	  This option makes sure that the needed binary blobs are copied
 	  into the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_USE_BINMAN
+	bool "U-Boot use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
+	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
+	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a88059..35a41d96a12d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -187,10 +187,12 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),)
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
@@ -269,6 +271,14 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
 UBOOT_DEPENDENCIES += host-vim
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+UBOOT_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml
+UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
