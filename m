Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CE2C27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 16:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7962940675;
	Mon, 17 Jun 2024 16:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UD93Hvht7M1w; Mon, 17 Jun 2024 16:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 067D54067E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067D54067E;
	Mon, 17 Jun 2024 16:01:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEC611BF2AA
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 16:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCCD3607B2
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 16:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBgbENRY0Mdo for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 16:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B36956079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36956079A
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B36956079A
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 16:01:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AEA25C658E
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 16:01:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D4EA240007;
 Mon, 17 Jun 2024 16:01:03 +0000 (UTC)
Date: Mon, 17 Jun 2024 18:00:50 +0200
MIME-Version: 1.0
Message-Id: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALFdcGYC/x3MQQqAIBBA0avErBtIKYuuEi0sxxoIDS0JpLsnL
 d/i/wyRAlOEscoQKHFk7wpEXcG6a7cRsikG2ci2UaLHe/H+QkNW38eF5BK2Sg1DJ4VdNEHpzkC
 Wn/85ze/7ATyThMJjAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718640063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TWJDpMCrR8mcZ8Rwt7jV3cARWnn2q6+CfB9FDRvud24=;
 b=RkgU2nfRP5skhty4StG8CaMsQ0G5c0aJWCGuv02ak+Pu0NzDfPxNz7pcJaZjkuNEsh7fWk
 +c/AuRRFk9gs2dL7+h2/OdcS4fe5+hOkcaPDH99Qlcd8tIpnQGEG7ikJdXAYb2hM6PPlf2
 kI6+vNgiRREbXj9z3ZJGEGMyxyCBqVlqi7cs50lfgxdUKynpUsDomZkh2pGAE0qcebriKW
 Vmjnu9hBJuG2ILwn5uOOgX9kgZKFQELhMYV6s9UiiFiqrkB0Xs5iU0wvaPhh6g33Eg1UIT
 Av7xu/p0YEqTyTp+jqcIL6J2sQ12GniO9/+Zl9pd97QEorlQ4/nZGNGZpeKJyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RkgU2nfR
Subject: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default U-Boot builds a default environment from its own configuration
and a board-specific set of variables. However it also allows to bypass
this entirely and define the entire default environment from a text file.

Expose this feature to Buildroot. This allows to have a file e.g. in
board/.../uboot.env which contains an easy to maintain text file with the
wanted default environment, without patching the U-Boot source code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 boot/uboot/Config.in | 29 +++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  9 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a97..a3bf3e009c52 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,6 +136,35 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
+	bool "Generate default environment from text file"
+	select BR2_TARGET_UBOOT_NEEDS_XXD
+	help
+	  Define the entire U-Boot default environment from a file,
+	  disabling all the logic to generate it from the U-Boot source
+	  code and other configuration values.
+
+	  Based on the USE_DEFAULT_ENV_FILE and DEFAULT_ENV_FILE U-Boot
+	  configuration variables.
+
+	  Requires U-Boot >= v2018.05.
+
+config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
+	string "Text file with default environment"
+	depends on BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
+	help
+	  Text file containing the variables to be used as the default
+	  environment in U-Boot.
+
+	  From the U-Boot documentation:
+
+	    The format is the same as accepted by the mkenvimage tool, with
+	    lines containing key=value pairs. Blank lines and lines
+	    beginning with '#' are ignored.
+
+	  For more info see:
+	  https://docs.u-boot.org/en/latest/usage/environment.html#external-environment-file
+
 config BR2_TARGET_UBOOT_NEEDS_DTC
 	bool "U-Boot needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 19f4cdb557e6..3b3d3a13e711 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -390,6 +390,14 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # override again. In addition, host-ccache is not ready at kconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
+
+ifeq ($(BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE),y)
+UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
+define UBOOT_KCONFIG_DEFAULT_ENV_FILE
+	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
+	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
+endef
+endif
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
@@ -530,6 +538,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_KCONFIG_DEFAULT_ENV_FILE)
 endef
 
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)

---
base-commit: 7bfea9372f1842279a8f57b5fc4428bbae822e91
change-id: 20240617-uboot-default-env-46688521fbae

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
