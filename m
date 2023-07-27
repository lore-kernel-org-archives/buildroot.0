Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33199C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 13:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74F5D81EDA;
	Thu, 27 Jul 2023 13:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74F5D81EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5spMfeVlUDIh; Thu, 27 Jul 2023 13:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AC281B52;
	Thu, 27 Jul 2023 13:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AC281B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 747291BF429
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 13:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54C134031F
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 13:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C134031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFNY4tSqv7EH for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 13:40:13 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8617540217
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 13:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8617540217
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so135274966b.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690465211; x=1691070011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2PaOgmKZPjKg7UBJHu6NA6SrIFFujrYUGayjATDkEYk=;
 b=B1L9l/OJFrkWCSw2PNn8dc/ZzRL3CAg4BiGs/534XwJK5bEHJOOOA9aYsGqAkcm9/D
 NyKJ3N6dvJkKuSx/larne2gP+YGMBgrt80xjiHjq0b40pIekc3SrKyi8oH+tDd4MZKzc
 u7SBesDJ9a9Js01tHarjzJOwopdIf2ZO7cux9MwgLBB59YCJdd8Dmyk1tXUXbkMPkGKj
 fmGolA1yP7w6hf2+aik8Ew41qBN/TwlIAI5V2DCJ/Xs2iLcG8xZ+Z7S31Cpr4uwgv4cl
 dOBfWh8fctJeVKXHp5O8IYwkE/Ro89IHUCMciGba1JI8YFiJbcC84w5Zlw9ERnxQhA5c
 T1UQ==
X-Gm-Message-State: ABy/qLbK/XF8eTWfavgmmKBN2KXIfT0R3r3LfkC2ZLazvgBEDiask7Z5
 U25nsKih/cspXmozLbBBZzSn66Ryua8=
X-Google-Smtp-Source: APBJJlFVFbIUhv/hhDQqBC3nTUx6GnQOOucAWhk2q0xYcRTNmquPIvTCWvtMSZQn/haIwPwhVsPLRg==
X-Received: by 2002:a17:907:2bde:b0:99b:d599:5085 with SMTP id
 gv30-20020a1709072bde00b0099bd5995085mr2144065ejc.64.1690465210998; 
 Thu, 27 Jul 2023 06:40:10 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a17090686cd00b0098884f86e41sm786940ejy.123.2023.07.27.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:40:09 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 15:40:01 +0200
Message-Id: <20230727134000.429651-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690465211; x=1691070011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2PaOgmKZPjKg7UBJHu6NA6SrIFFujrYUGayjATDkEYk=;
 b=OCwjwj4KaUd+nqsFbYa0x/2hGmGS4wtoAgAz1IzL0Ui7zGBVYPbXazrw7dFD18f05Z
 YR/3yBjesZlTQBHDN/9OymMZDGzLL4CJgXt2f5DmQFY2gEf0ITs8oTKkMgp4r5mcyYR1
 cKjZb76ykWpuIyvx3hw3oTI+XA3GJ2umZe5l1s3nzkgIonfOtqB4gKMkIjzlXEqMvqjP
 dpMiSADQmwc+fKgPwuDYTxs2zwCkKfyjO87Z4hTQAenNpR1ZvR13k+w+gONYI+Fvrj+U
 OlHJVfyMsuEZ9Kw7HSS0fXLJGWNogAReBxBaiWJ+kk8TP5NPSD9VEo931/qs31ruw3Y9
 U3KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OCwjwj4K
Subject: [Buildroot] [RFC] boot/uboot: add option to install custom
 environment file
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot has the capability to set the environment variables via a text file.
The text file has to be located in the U-Boot board source directory and
selected via the CONFIG_ENV_SOURCE_FILE option. The CONFIG_ENV_SOURCE_FILE
must only contain the filename without the '.env' suffix.

Thus the buildroot option BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT is added
that needs the information about the source of the file in the buildroot
environment (BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE) and the target
directory (BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET) where to copy the
file in the U-Boot source environment.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/Config.in | 21 +++++++++++++++++++++
 boot/uboot/uboot.mk  | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..ff58ef3062 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -607,6 +607,27 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
+	bool "custom environment"
+	help
+	  Provide a custom u-boot environment file. This will be copied
+	  to the BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET path and
+	  enable via the U-Boot config option CONFIG_ENV_SOURCE_FILE.
+
+if BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE
+	string "Custom environment source file"
+	help
+	  Path to U-Boot custom environment file.
+
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET
+	string "Custom environment target path"
+	help
+	  Path to the U-Boot target directory where the file will be
+	  copied to. The path is relative to the U-Boot source directory.
+
+endif
+
 config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
 	string "Custom make options"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3d26b16fe..f5f17dbd8f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -181,6 +181,26 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
+#
+# Prepare for custom environment
+#
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE)),)
+$(error No custom environment source file specified, check your BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE setting)
+endif
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET)),)
+$(error No custom environment target path specified, check your BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET setting)
+endif
+define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+	cp -f $(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+UBOOT_ENV_FILE_NAME=$(subst .env,,$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE))))
+define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
+endef
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
@@ -497,6 +517,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_KCONFIG_CUSTOM_ENV_SOURCE)
 endef
 
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
