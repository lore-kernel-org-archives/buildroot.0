Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6E0C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FE940963;
	Sun, 16 Apr 2023 15:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FE940963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDw00Pr7WcPS; Sun, 16 Apr 2023 15:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719B840319;
	Sun, 16 Apr 2023 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719B840319
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA6C61BF27C
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC2D860BCF
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC2D860BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nl2ELGIvURnZ for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 15:13:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C7F60A9D
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9C7F60A9D
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 15:13:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dx24so13805276ejb.11
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 08:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681657979; x=1684249979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVCqY+Grqk2JVxEWW5iM41LqbbYGYwjhcips3LKhQoE=;
 b=Djdl5ev+lY90o+ByNqT03SM4sX0+bvmtRLSS9Um1YztsGxDuwGiPsldcydU0r3d64u
 z+Eq9CJRUj97c2XwtDgcmEy/bXoufCu0AJcSFc6PhVsE0bQQ7tdXSrHbhPoawFTGgB6n
 NFCyxUBdooG/dzRsXWRIx8rQqm7e/3hq1upgYOCkp5vXBK7AAwLq9zkBjtxa/dYYWMC6
 ubHnyS2TGuEWyr6NVpAxXXDqnM20zCoyeS4ESOlgbP2ONJWhUBlg1FTT9QJM3zk5JC2f
 pr6gPN4BJ+pbb5NatqMhLhFAGdfjIgDc8zTUgRs2kdgt8Z0Rg2eeIpl/Us4YFzVsS1m/
 wSJQ==
X-Gm-Message-State: AAQBX9cQ+hfNZwcj3xdUpLLVJitnr2xfhdyBKaIf99pUYFLYSOQRXOHA
 pO2F9+6825pLcTNQlohSqBtsh0jOdg8=
X-Google-Smtp-Source: AKy350YPCrVW7xWvRj3Asp5SEEh+nVWbICuUBo0PPZeMeIcD/29s1yxBj1oaUYm8eC82ucKoPQ2/yg==
X-Received: by 2002:a17:907:a04c:b0:94e:f130:93f3 with SMTP id
 gz12-20020a170907a04c00b0094ef13093f3mr5750914ejc.41.1681657979383; 
 Sun, 16 Apr 2023 08:12:59 -0700 (PDT)
Received: from goliat.isc.local (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 m5-20020a1709062ac500b0094a84462e5fsm5154440eje.37.2023.04.16.08.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 08:12:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 17:13:09 +0200
Message-Id: <20230416151310.2698912-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681657979; x=1684249979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RVCqY+Grqk2JVxEWW5iM41LqbbYGYwjhcips3LKhQoE=;
 b=DN3TJWpo0n2UesMdJEmtQyg6bfigwiBJ46pr2m5P3ECOmZZB1UmxQIrWFQB85NV9oK
 P8S2OoQrhjfBLTItK8ZaWeZ/gefHllIX07uEq9Ho6QeRUlb27mCsVKxBeCUlfr2gM0Av
 bq/70kZcDXjE2e3DmQNWhO9XWg4I+/JMjOPRFcnv56AOheKl8gO8nmiYO1I+oSYyI4Vx
 JG0z9mzvVoufSVYubMBedFc7epRxZ954SH+d8q8ZXXXvYC/aJdlplCFkE+DOYnfW3dme
 wTmm7JiFcm9LbiMIGaFIODHyhqI9lNoM1N0u0PsGf0cDqqfUJTLvdnYHpbVYxLaRfoiI
 DI3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DN3TJWpo
Subject: [Buildroot] [RESEND PATCH v2 1/2] package/pkg-kconfig.mk new
 <pkg>-show-fragment target
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch introduce the new target to simplify the generation of
configuration fragments as the output could be directly copied into a
fragment file as-is.

It is *heavily* based on the <pkg>-diff-config target, but serves a
different purpose.

Output from linux-diff-config:
-CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y
-CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n
-CONFIG_GCC_PLUGIN_LATENT_ENTROPY n
-CONFIG_GCC_PLUGIN_RANDSTRUCT n
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n
-CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n
-CONFIG_STACKPROTECTOR_PER_TASK y
CONFIG_CRYPTO_DH n -> y
CONFIG_CRYPTO_KPP m -> y
CONFIG_GCC_PLUGINS y -> n
CONFIG_KEY_DH_OPERATIONS n -> y
CONFIG_PKCS8_PRIVATE_KEY_PARSER n -> y
CONFIG_VIDEO_IMX274 n -> m

Output from linux-show-fragment:
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_KPP=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_VIDEO_IMX274=m

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/pkg-kconfig.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index f4f35bf96a..ee96525c47 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done
 	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
 	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
 
+# Target to output differences between the configuration obtained via the
+# defconfig + fragments (if any) and the current configuration.
+# Output format is suitable to be used as-is in fragment files.
+# Note: it preserves the timestamp of the current configuration when moving it
+# around.
+$(1)-show-fragment: $(1)-check-configuration-done
+	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
+	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
+		$$($(2)_KCONFIG_FRAGMENT_FILES))
+	$$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
+		 $$($(2)_DIR)/.config.dc.bak
+	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
+	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
 
 endif # package enabled
 
 .PHONY: \
 	$(1)-diff-config \
 	$(1)-check-configuration-done \
+	$(1)-show-fragment \
 	$$($(2)_DIR)/.kconfig_editor_% \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
