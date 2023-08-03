Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E9AC00528
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 12:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EADCF4024C;
	Thu,  3 Aug 2023 12:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EADCF4024C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tey0f9QgeNS9; Thu,  3 Aug 2023 12:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A802241EAC;
	Thu,  3 Aug 2023 12:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A802241EAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF441BF345
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 12:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB331833AF
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 12:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB331833AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wr7bIZ2BkYyM for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 12:10:30 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5F1F82040
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 12:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F1F82040
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe426b86a8so1913215e9.3
 for <buildroot@buildroot.org>; Thu, 03 Aug 2023 05:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691064627; x=1691669427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eRz6FLiETN1DA1xmXD5lvGuwrTDyEMq8dudeo4RSSPU=;
 b=PvWOdkRx201dn7S96+WL88kRDv29pWSAVB+G2KfC1Gqvvj47o0uBIYKUaCDRfBS4G+
 aPIzji7smWCK08TnhroqeaiyfLl3f7neJK7Zd6XkvvPTWMdufAcZJdf+ZvpGwCYwOiaJ
 wfVvdYMpzUqdpA3dGZ/qy+0REvHSjnKkWD6roP04NVDUEbTPYK/seLBLi0hOucRsK+69
 g0Tq/ebeaoM9bBd0+rndCG3Xu5uUkGnyzsFoiqEviti/W3nmB0vxW8tRGQjOvHRHC1OA
 6rwu9ZyVD8lJnBZRy1Rh3Yg8kFu+PUkJ67jTwOMfOByltw9QtECG0o9AdA34f4m055wc
 SjBw==
X-Gm-Message-State: ABy/qLYOzPVmFVFiy0fpOHTfLYGnqwah/GMPIqkq3xOajaXOst/kXglb
 RcyT2z5UkPC9O1EUg4h3nB0M0s9vtaE=
X-Google-Smtp-Source: APBJJlEfmBstK7xWiK6cckeRzbpoEMz9dtHHws6R7RGYw/jBBxFu1IygtVXcAjiwU74zK3uUgXf4UQ==
X-Received: by 2002:a7b:c848:0:b0:3fe:3521:d9e2 with SMTP id
 c8-20020a7bc848000000b003fe3521d9e2mr3013950wml.6.1691064627245; 
 Thu, 03 Aug 2023 05:10:27 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d6992000000b0031134bcdacdsm21675047wru.42.2023.08.03.05.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:10:26 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 14:10:04 +0200
Message-Id: <20230803121003.160501-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691064627; x=1691669427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eRz6FLiETN1DA1xmXD5lvGuwrTDyEMq8dudeo4RSSPU=;
 b=DU4qFXexpx3UvolxGRdc7JOVWqka4rjMaBSqM7IPgzd2biTXUPwZvH5oTPcgaX1Rfh
 +0TwVP5w4XsDxoMa6vyplP4ywmY3J9WkOFUZuCqNiGtse/5uSTVzy/gagAGXUHkUdknx
 iAmW7kbSqKMfGtM8EO8IUn3tEdodeToxesV0XNY+iRkrPg7bnjqRoII8iMO8zW1kdxc0
 e4yNZYLzByIVAUaXLFfIaE74EwGhDfsoKcr6t593bynArxqgC9zUsPt7MAHqI9zqNaak
 zBAalgA1qB6YLBZjijOegz1ba9dlHjmwbHyxSLiLVMpBKqio5ttYP8wmrk1agf8GCqRs
 QK8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DU4qFXex
Subject: [Buildroot] [RFC v2] boot/uboot: add option to install custom
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
environment (BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE).

Since the environment file must be located in the U-Boot board source
directory. This directory is <SRC>/board/<VENDOR>/<BOARDNAME>.

Thes information about vendor name and board name are available in the
U-Boot .config file and can be extracted from there to determine the
destination directoy.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: Drop the BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_TARGET option and
    determine the value from the applied u-boot defconfig (.config).
	Adopt the commit message according these changes.


 boot/uboot/Config.in | 16 ++++++++++++++++
 boot/uboot/uboot.mk  | 21 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..894a0bd3b2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -607,6 +607,22 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
+	bool "custom environment"
+	help
+	  Provide a custom u-boot environment file. This will be
+	  copied to the U-Boot source path and enabled via the
+	  U-Boot config option CONFIG_ENV_SOURCE_FILE. The target
+	  path will be determined based on the U-Boot configuration.
+
+if BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE
+	string "Custom environment source file"
+	help
+	  Path to U-Boot custom environment file.
+
+endif
+
 config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
 	string "Custom make options"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3d26b16fe..35e26ade2d 100644
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
+
+define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+	cp -f $(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/board/$(shell grep CONFIG_SYS_VENDOR $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/$(shell grep CONFIG_SYS_BOARD $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+
+
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
