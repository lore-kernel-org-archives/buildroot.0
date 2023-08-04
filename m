Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD60CC001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 08:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB164202D;
	Fri,  4 Aug 2023 08:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB164202D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CetCr7NmTVMt; Fri,  4 Aug 2023 08:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C864191A;
	Fri,  4 Aug 2023 08:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C864191A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2580C1BF315
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 08:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCCC183BC9
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 08:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCC183BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gc2r4NJRsRty for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 08:25:16 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46D580CB3
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46D580CB3
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so1626715e9.2
 for <buildroot@buildroot.org>; Fri, 04 Aug 2023 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691137513; x=1691742313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h+FqgsiPZdvh3cDxb5o6aPIxfGhflxOsG98D1JsGxoU=;
 b=SyTPWZBhn2lbHm0Fs2SwZ0lJVUsY2/a3WvtfQnD48ZCW85gbkGOxp9aMw6oqAOVRVN
 aGceJJGRPPwFcI2xdrV4uAps/ekeDk/BU4+ZQD16Pt/S9Y0A1+zccdlXoKiUcYJwjOD9
 wFw6tcgSk03m6D4Z9AZrLDkMFiUCFOE/Objg/VSitPYXf/sfuhhpTRL4o+UiWhMPIx1c
 juBhBNIZH/4QsiM+2wKDX27Fc9v0KCUSqxTUEQ4ZBVIh8pAQC1MlPxliK6wgMXb1aMPg
 RQJInUbHjjxixI+HxeiJUCBKapbP0g6X2HVHw5wNFxBClAmuHbu+PZLwr+3+EMJTGxz0
 uGjg==
X-Gm-Message-State: AOJu0YzNaMZKVXdHtHLW80eL9h6T01CBdVMtoF/HjisSc2VLgis9Z/hN
 9odnrwdAzN6wROWfEmXjt8NLVfGlTBw=
X-Google-Smtp-Source: AGHT+IHHII7HAF+vMViOtm/7IfzLyzASg9mCWHP138oD7k9lAFelPXpKSwz9aNxXkFpGW9Ngj0u1iw==
X-Received: by 2002:a05:600c:21ce:b0:3f7:3991:e12e with SMTP id
 x14-20020a05600c21ce00b003f73991e12emr1057350wmj.1.1691137513281; 
 Fri, 04 Aug 2023 01:25:13 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm1739579wma.36.2023.08.04.01.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 01:25:12 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 10:24:35 +0200
Message-Id: <20230804082434.288173-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691137513; x=1691742313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h+FqgsiPZdvh3cDxb5o6aPIxfGhflxOsG98D1JsGxoU=;
 b=axpXLw1IhgfvMAIrOt8tDnLf5ujTB+XrDaBCJ99aRS9nR0sC45I5S9WnWdhoqoUL/l
 2QMgJ6f69KIzCi8jO5jenuuplbOj9XmoXiAMX+WR65mBktFrETl7zAAAfYwkme3hPQru
 b1BAfpUUMlMzmYQrEiLnyvkg/DjMLJW7VlNnDtsoYgWg/QrHrnEfKgD7B9YsV32inqRF
 skL0BEXRuhMp/dpqruv5bm/mvjVayGOfiHv56uaDODCXUpPjlugHbPdHq4X0Mky515r+
 gWhzd38r7N5Jw1Gw1yvXaf4hYYYGwBrnkxh9c5+A5V/nxZg4IKXql7nVYLrGI2jTNFSZ
 wrdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=axpXLw1I
Subject: [Buildroot] [PATCH] boot/uboot: add option to install custom
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot has the capability to set the environment variables via a text file.
The text file has to be located in the U-Boot board source directory and
selected via the CONFIG_ENV_SOURCE_FILE option. The value of
CONFIG_ENV_SOURCE_FILE must only contain the filename without the
'.env' suffix.

Thus the buildroot option BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE is added
that needs the information about the target of the file in the buildroot
environment.

Since the environment file must be located in the U-Boot board source
directory <SRC>/board/<VENDOR>/<BOARDNAME>.

These information about vendor name and board name are available in the
U-Boot .config file and can be extracted from there to determine the
destination directoy.

Cc: Michael Walle <michael@walle.cc>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..cbbf629ba6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -607,6 +607,16 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE
+	string "Custom environment file"
+	help
+	  Provide a custom u-boot environment file. This will be
+	  copied to the U-Boot source directory in the corresponding
+	  boardspecific folder and enabled via the U-Boot config
+	  option CONFIG_ENV_SOURCE_FILE. The target path will be
+	  determined based on the U-Boot configuration using
+	  CONFIG_SYS_VENDOR and CONFIG_SYS_BOARD.
+
 config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
 	string "Custom make options"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3d26b16fe..847cc7648a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -181,6 +181,24 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
+#
+# Prepare for custom environment
+#
+UBOOT_CUSTOM_ENVIRONMENT_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE))
+UBOOT_ENV_FILE_NAME=$(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_FILE)))
+ifneq ($(UBOOT_CUSTOM_ENVIRONMENT_FILE),)
+define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+	sys_vendor=$(shell BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_VENDOR); \
+	sys_board=$(shell BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_BOARD); \
+	cp -f $(UBOOT_CUSTOM_ENVIRONMENT_FILE) $(@D)/board/$${sys_vendor}/$${sys_board}
+endef
+UBOOT_POST_CONFIGURE_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
+
+define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
+endef
+endif  # UBOOT_CUSTOM_ENVIRONMENT_FILE != ""
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
@@ -497,6 +515,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
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
