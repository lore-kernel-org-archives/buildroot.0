Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F8C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB2E1812F8;
	Wed, 10 Jul 2024 15:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfygOwnlbAzc; Wed, 10 Jul 2024 15:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0176581281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0176581281;
	Wed, 10 Jul 2024 15:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB6AC1BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B56D741560
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9ipormYF5Jk for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FEB34155C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FEB34155C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FEB34155C
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:29:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05E3440002;
 Wed, 10 Jul 2024 15:29:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 17:29:41 +0200
Message-Id: <20240710152941.334195-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720625385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6ew9+/JzeTRSPN4JOSf8fsasv+GWSwbWfN4GChxn3eU=;
 b=MEy3DuE72g5omX7Gamnfn+pVtg4iX/HT0/tnLUxtKKRMsO52ng3DttvfihpTRhUY7ma10W
 +UCkWcmu8fmKQjmuLYGlB1xK8mQqaF4J+u7ex4gK568hvtGBgKTxT+oTgjWwEDm331AjdY
 zXvykWz7pKHUs3dG79pIQob9hnOhJRfcDy7Q/eAagf7Iy0u3Mv9rzvAn+ALWbPKH0yLmxe
 kgOZO653stCutVqzUpPaCRqI1BH8EhXEW30w8KzYUsRSt/uuNiojNMqwKpp2dyFsk1l9In
 maT1pailHznbZZ4pnl4QhZeWY5QgtBgtMIZjxvoNtqV7pZaSv8QINgEXznXSwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MEy3DuE7
Subject: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux organizes devicetree files under vendor subdirectories for arm and
arm64 architectures, such as arch/<arch>/boot/dts/<vendor>/. The
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was only copying devicetree files to
arch/<arch>/boot/dts/, which is incompatible with the vendor
subdirectory structure.

This patch adds support for using a directory in
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH that matches the vendor subdirectory name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 linux/Config.in |  4 +++-
 linux/linux.mk  | 14 +++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 34057a4893..6ca615cae3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -423,7 +423,9 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
 	  Source Include (.dtsi) files, separated by spaces. These files
 	  will be copied to the kernel sources and the .dts files will
-	  be compiled from there.
+	  be compiled from there. You can also use a directory which
+	  name match the vendor name as in
+	  arch/<arch>/boot/dts/<vendor>/
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
 	bool "Keep the directory name of the Device Tree"
diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f19470..07d4ddf7f3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,7 +198,15 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+# In case we are copying a vendor dts subdirectory as in
+# arch/<arch>/boot/dts/<vendor>/ we have to append the wildcard to the
+# folder to list the devicetree.
+LINUX_KERNEL_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+ifneq ($(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/.*),)
+LINUX_DTS_NAME += $(addprefix $(notdir $(LINUX_KERNEL_CUSTOM_DTS_PATH))/,$(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/*)))))
+else
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+endif
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
 
@@ -505,8 +513,8 @@ endif
 #   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
 define LINUX_BUILD_CMDS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
-	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
-		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+	$(foreach dts,$(LINUX_KERNEL_CUSTOM_DTS_PATH), \
+		cp -rf $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
