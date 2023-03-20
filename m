Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C0C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 11:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F795414C8;
	Mon, 20 Mar 2023 11:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F795414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X66B7vcMmMiV; Mon, 20 Mar 2023 11:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D231414C5;
	Mon, 20 Mar 2023 11:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D231414C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5BB01BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF46F813D6
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF46F813D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXHVNGTzQzrX for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 11:10:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F985813AE
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F985813AE
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 11:10:02 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x17so14390749lfu.5
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 04:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679310599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVCqY+Grqk2JVxEWW5iM41LqbbYGYwjhcips3LKhQoE=;
 b=FMve5Ij9r7ZDmDFDiSVxBOTpTJaXbv17Q+KMeRDJ+rolAHnO6C8a2kV4m1J+U4M229
 M4XcK9R47qsbXfa3PPIi2s3H0w91K6G6Cihf3wja8NoUwPblJXT75uLk991GpO/55Eg5
 hjodPm+TFVfzjhxuaeo9puu0r5/z4HjqM0P3YmPMC8KyQg+pUK4F+CdZp7d2zGTICB+d
 st1K7+WpiypMtc2xw55MGb1FlEMe0rQx4VajXdi7ZhGwUOyLmhqzir+lr5qiKXXdXK27
 FQXXaKOf2oGLOzrSJ7OiPxlblA+fS71Vl/Qed9BWpkJ4Y+CJ24zqgpcFp/Gtsvtty7vn
 xAMA==
X-Gm-Message-State: AO0yUKW0xlBJaK8ZgJINiZ0qq9a3qyotJuv1+z8xGcMq3pqumuKngs3y
 4KA/MlrrSjgMaDUWiXgMolBHjQv/sKs=
X-Google-Smtp-Source: AK7set+eVXv4Yx0UuNBa1hT2afW+ER893RJeXBtRhevfOr8RUBBps9tqqC0kJBfYo773b5jdowaDeQ==
X-Received: by 2002:a05:6512:972:b0:4dd:cef0:c27c with SMTP id
 v18-20020a056512097200b004ddcef0c27cmr6046636lft.33.1679310599351; 
 Mon, 20 Mar 2023 04:09:59 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004caf992bba9sm1632814lfl.268.2023.03.20.04.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 04:09:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 12:09:42 +0100
Message-Id: <20230320110943.1606631-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679310599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RVCqY+Grqk2JVxEWW5iM41LqbbYGYwjhcips3LKhQoE=;
 b=EU7YUc3+bjvkbjeDFvhDT2MAIVZKEiIEU8IHL1zq4hcjV5umQ6XDRhkb/4237xYNDq
 drJl0+mtXiyLwIPi0GtqqmTEmLOSAfX5jPGedwGZwm2Wx64k+HSqE5x13DdPeIlOKxLW
 9txjZekpDjVFxl81C5MU05inHOygkaQpcUY1VIiAIu73xFpNLVM9wFHYJ25C/anTaS9X
 OyLoRw8S+SZ+EV3wmSWohDhlrRZyleiiC+JhXeNc+tvkRX1fhBuD75+wx5pbv6EXOnR6
 1TgLY3RdpbcW/TTXcALigUWe44pnTCfhgzJZrmCn4opMkuoNHm7BWDcVH8NLSxG2b2y2
 QY/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EU7YUc3+
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
