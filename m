Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA22C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 11:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06751403E7;
	Tue, 13 Dec 2022 11:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06751403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iW-bdG1YNmTJ; Tue, 13 Dec 2022 11:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE50409D9;
	Tue, 13 Dec 2022 11:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE50409D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0EF11BF2BC
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 11:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7847416FD
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 11:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7847416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ovhB47V7B5r for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 11:11:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A833416F6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A833416F6
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 11:11:58 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B49F60008;
 Tue, 13 Dec 2022 11:11:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 12:11:54 +0100
Message-Id: <20221213111154.2491203-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670929915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2LLwE6E2ldfYy//dtAWPlCqlYpIbnyi0udEho24AO0Y=;
 b=bmL0E4j10/bMxsjDvSQUCFhnBOQZnbZLDOPZZJi82ZGbINySPV60U5d2NxFsxpamWdY2yz
 o5De+YmG+mWas4iCr4jIhOyzHSnl8PoSxQgRKDlv7pBRVKMBJR2bVr7edLl8GFfP0SdegZ
 dWPBAUUTGS0MH8FngkiI/RPADc/lOCffu24uDKm+C8C6LWUMHX2ZY/Z6g3af5tQObNh3I4
 3zRAEo9Br9eBq99WnLw3p1aG/rE+UISWv08wfNSFcAB0YzlXv2RFKkl9LQg+7xIwdF0mmd
 NCt9U+KgE492l/1PY3fYOEmO2OBHHs6LhAuvLAu1Fkk1VABvI0vhEN4Iewc05A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bmL0E4j1
Subject: [Buildroot] [PATCH] boot/optee-os: Add out-of-source OPTEE-OS
 device tree support
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Similarly to Uboot, this patch adds the ability to copy in and build
out-of-source device tree sources during an OPTEE-OS build.
To build the external device tree source file, the OP-TEE OS configuration
must refer to it with the CFG_EMBED_DTB_SOURCE_FILE option and no platform
flavor need to be specified.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/optee-os/Config.in   | 11 +++++++++++
 boot/optee-os/optee-os.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 8bcce22306..10bbee45f8 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -130,6 +130,17 @@ config BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR
 	  Value for the optional PLATFORM_FLAVOR build directive
 	  provided to OP-TEE OS.
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to core/arch/arm/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the OP-TEE OS configuration
+	  must refer to it with the CFG_EMBED_DTB_SOURCE_FILE option and
+	  no platform flavor need to be specified.
+
 config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 	string "Additional build variables"
 	help
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 38b0d367ef..33b4e2e1ab 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -84,6 +84,8 @@ endif
 
 OPTEE_OS_IMAGE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CORE_IMAGES))
 
+OPTEE_OS_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_DTS_PATH))
+
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
 define OPTEE_OS_BUILD_CORE
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
@@ -120,6 +122,9 @@ endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
 define OPTEE_OS_BUILD_CMDS
+	$(if $(OPTEE_OS_CUSTOM_DTS_PATH),
+		cp -f $(OPTEE_OS_CUSTOM_DTS_PATH) $(@D)/core/arch/arm/dts/
+	)
 	$(OPTEE_OS_BUILD_CORE)
 	$(OPTEE_OS_BUILD_SDK)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
