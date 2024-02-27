Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE80C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66474156F;
	Tue, 27 Feb 2024 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5MqTTzLT1B9; Tue, 27 Feb 2024 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAF841553
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DAF841553;
	Tue, 27 Feb 2024 16:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3A741BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA2A38145D
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nv_AMxZ3nuHQ for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EBCF81438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBCF81438
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBCF81438
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:44 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so7315408a12.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051442; x=1709656242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22LoPDWYEr8qpw9klGDqezi6sNR382c/bQpgL0iGnXU=;
 b=oR+VeDisLVxKaS+Xs4wIEkfOZdQrzObAaW5HTu3mvzlCGa2bBw1M17lstn9tTNkYCs
 IVriasoud3Mok8fNNufYC3yl8XpDiQ/u7Hgl87F45D6dpvz/WGhFR/q0zpkRmf90gKED
 VdECHhH8SSni9/3O4Fwn7uL9S2i/LVi4vr3pkv4KTsvZxudX1CS5SfHxy6mwjuYqFIRL
 UyzGm6Vga5rbmKMIK+mFRNrjuWTp/30VRWH22iygNuM47O/nXeYD1zDENILrZ+8ZUAv0
 AZT9F+bZpGSrq5AqsKfwxoMJqtLrZEzbPkSnKgG0tiXPSj1vo/iO64bUkz2U9OwFCaAj
 LeJQ==
X-Gm-Message-State: AOJu0YxGG/kAxV/NhixntrjWWdrb8sZOjPrrZZ1jfWHvvY0ouPkPKdrn
 RZHdJzfkSCoIlxr6cGyki7uGTLEbqmIdQyRqr8G2Q8S6Zb5VdpQuAghKz+GK2w3G1Aoi1dsWwL6
 IuE0=
X-Google-Smtp-Source: AGHT+IGDOG75gHmHmoyFynim8zgEQkEJlC6tyKynsURbgLck1S/t0RctHnO2+jHPF+bhsBRLH56nzA==
X-Received: by 2002:aa7:ccd4:0:b0:565:f077:d872 with SMTP id
 y20-20020aa7ccd4000000b00565f077d872mr4984533edt.15.1709051442538; 
 Tue, 27 Feb 2024 08:30:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:14 +0100
Message-ID: <20240227163019.2876942-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051442; x=1709656242;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22LoPDWYEr8qpw9klGDqezi6sNR382c/bQpgL0iGnXU=;
 b=dRag2U1NkJJYzTqPyJzoDvg/Ka8SdRnMA7vdjoldaQ0mKr1BgtSWSEz2HuhcJjTBmF
 VY7/+Bq2E5OvOB/CsqJF+InQPw7xezI/Gu5Bc8u5fedM8sLAbXCE9rCHfXDUbxL5WLLi
 pKB61qZL/j6g1rqVg/OHRPUBIEtnihYarMNK0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dRag2U1N
Subject: [Buildroot] [PATCH v7 12/17] boot/uboot: add
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
