Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDE6C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 18:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5169C60AA7;
	Thu, 21 Jul 2022 18:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5169C60AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfvs3R29aXNX; Thu, 21 Jul 2022 18:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524DE60AAC;
	Thu, 21 Jul 2022 18:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 524DE60AAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCF81BF368
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D0A41940
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 18:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D0A41940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLyIv2X2hZss for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 18:35:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D67041503
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D67041503
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 18:35:17 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 19:35:03 +0100
Message-Id: <20220721183503.369200-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1658428513; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=2QWZT3nJgP5wEboeo25W6k42/0K93wS4BWpj9Suw3V4=;
 b=U98yTmPD96k+C3VoGDzJmSboyVzuE1qN76TSNvosi2FPyOaKOoHv7UsK0KAjFefH9+eY4A
 bEDTiVwekyEIlL/4E587vjaTzYbQkfPK+PyB660uRoLoosnbTvb8PdXntczmL+pxjD4+6e
 pEaencmdZPKlmRAUCiR4B7oC29n8LtA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=U98yTmPD
Subject: [Buildroot] [PATCH 1/1] linux: allow modules install path to be
 overriden
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On my system the modules are not installed in the root filesystem
directly, but in a separate squashfs image that is then shipped
alongside the kernel.

Support this setup by allowing board files to override the install path
for the kernel modules.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 linux/linux.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..36896a3b4d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -145,6 +145,8 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
 LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
+INSTALL_MOD_PATH = $(TARGET_DIR)
+
 # We don't want to run depmod after installing the kernel. It's done in a
 # target-finalize hook, to encompass modules installed by packages.
 # Disable building host tools with -Werror: newer gcc versions can be
@@ -152,7 +154,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
-	INSTALL_MOD_PATH=$(TARGET_DIR) \
+	INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
@@ -519,8 +521,8 @@ define LINUX_INSTALL_TARGET_CMDS
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
 		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
+		rm -f $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
+		rm -f $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
 	fi
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
@@ -528,9 +530,9 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
+	if test -d $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED) \
 		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
-		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
+		$(HOST_DIR)/sbin/depmod -a -b $(INSTALL_MOD_PATH) $(LINUX_VERSION_PROBED); \
 	fi
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
