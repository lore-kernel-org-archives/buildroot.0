Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56FAC001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 08:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7D640334;
	Fri,  4 Aug 2023 08:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7D640334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADJfrdQbIeDG; Fri,  4 Aug 2023 08:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9BB40360;
	Fri,  4 Aug 2023 08:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B9BB40360
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1772E1BF315
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 08:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9633B40541
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 08:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9633B40541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1f2kSC7YA1q for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 08:51:41 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C63240227
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 08:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C63240227
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3177163aa97so1599546f8f.0
 for <buildroot@buildroot.org>; Fri, 04 Aug 2023 01:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691139099; x=1691743899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVVq0A2dsg92vtBJmADG5QeraIhLQd6hAuB7BBbOt1U=;
 b=MvxiBxqGRAws0hC8/uPLRRpuInbhXEBWe7df9SRAiIwfTECTr9cUDZYKoyKlwgk1gt
 tAN0IRjlTjFevjlcRhosHH1xx8YQdn0r8XsmHctdtxfs1zt6Vsmjt8kErsVxLp7RDPny
 zonvebvLQmy7PfSMMvoh+iu+8njLvJaTnJLwd1K/z9JCJbQPh8ch8g5HlIp1kPECZqQg
 jG8Fe5VwVjmdJQO39buCrwQJb4Vg4cAmlBOikyWCdjkKIYBX/Zqy3iKw7lfKMeTMmD8p
 bEWp61A+zZ4OulwfBhQHOpQ8FRQ4zqb5PBTq0ppbUcwEzW01VniCrPTTyRuybiMBjblK
 RMsg==
X-Gm-Message-State: AOJu0YwgrmA08zNNLpOs+xgslwM69zW8h8sa/wcVAjr35lu8eTJUfNp6
 FVkuPqXR15DTnMqXBCa4N1dmiwphCt8=
X-Google-Smtp-Source: AGHT+IEyQ5FEd/g2pTq5qk9gF2200iHK4rcuhWnm/T6HrSc5oHUHPHyuy6CMHg07HP953/ZOSpfpkA==
X-Received: by 2002:a5d:514c:0:b0:317:5b3f:1998 with SMTP id
 u12-20020a5d514c000000b003175b3f1998mr876662wrt.58.1691139099113; 
 Fri, 04 Aug 2023 01:51:39 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b0030fa3567541sm1953706wru.48.2023.08.04.01.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 01:51:38 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 10:51:19 +0200
Message-Id: <20230804085118.315117-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691139099; x=1691743899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVVq0A2dsg92vtBJmADG5QeraIhLQd6hAuB7BBbOt1U=;
 b=Qk0UPkGBYRdHL+rAK6CRcjpuZPvvA9GOUcWPIVl2GUaDzuvM4CjOMcus9qjCahsCcH
 tuSo80VbY/KaKn9UWKYpiyIujViyAq4sjs2m305dHDQHotejAwJBprDfCxzt4GMvQvbS
 yCZ0tV0q4ny/me7wl1Xg82dIcCAc/Y4CRSRECv+pIKjDLr849J/09B9FM7oTXBx4XTAA
 TJiPm2fuxA+UJ/JGZZPTItyv4pfGtSDUnge4zsfXqzNG+JTt3sbF0cOibnagDdWxN8Tr
 LBDyMO/lY7bCyf+QIxEBXcr+Ayydl4tHH7Y5taEU1aYZFNVRIEKwuTgAqso+I4BryJi5
 NgNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Qk0UPkGB
Subject: [Buildroot] [PATCH v2] boot/uboot: add option to install custom
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
v2: change to shell expansion instead of make shell expansion. With that
    we make sure it is expanded right at the time the command is called.


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
index b3d26b16fe..2007647e3b 100644
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
+	sys_vendor=`BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_VENDOR`; \
+	sys_board=`BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_BOARD`; \
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
