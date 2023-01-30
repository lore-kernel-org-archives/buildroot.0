Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D80C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 10:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0DE4174C;
	Mon, 30 Jan 2023 10:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0DE4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaDSbTODuF_J; Mon, 30 Jan 2023 10:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A68641744;
	Mon, 30 Jan 2023 10:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A68641744
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB261BF30D
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 10:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341C760EE4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 10:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341C760EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFQVgLnuV2IG for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 10:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8E260E09
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F8E260E09
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 10:43:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so7817124wms.2
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 02:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wx/6oWjEZlZ4SgLT+AQbEtia2t3lOPcBKDtfWeUtTP0=;
 b=Sv0IUjiz9Rn7HyK35J40Oi+MyOpTNMh8H9EblzzWGB68DQ1y4PTbTaH8FSKEIunZYR
 ozfHdTF6E1zgshaICppyW80V1DvNiG1n51xevO4V1MviwdwhMGyUry3dQ5VWvDIkdIZb
 szUTHAtCe7vrcF3pjs7Oo1V2Xw15rC9Kua9fsY1nAbBLvQlzGs43yzqb59GBOAy4p18y
 Ja1Z0AtzYfCLhsbmj1bfmZEwIYG+X+Xx2oyDeeU6ljW+3F8CjVKlOX6LPUo+B7pnpoFV
 TRnKB962EGM6+mZ9LHxzmX3T3ImgsPWGQv44aEAGwGT+iUsmBiGF+5pRDHsdhbHUUDcX
 ApYA==
X-Gm-Message-State: AO0yUKVujPzlsqte3I8WYbtRe6RE9fJo1fNqVCTSmKrj6ZHFiY6KSzVX
 jTa4TL2lRCrVfh6XEEP7MhqX6voh8rRT8Q==
X-Google-Smtp-Source: AK7set+f/PAywNLAMz5KBG1e1dzQjTLqQ6UjuBwa6jSQh2/SI6A56MhoEybl+fceYl25LcAzOuB5fA==
X-Received: by 2002:a7b:c3c9:0:b0:3da:2032:6c0f with SMTP id
 t9-20020a7bc3c9000000b003da20326c0fmr5231759wmj.31.1675075402813; 
 Mon, 30 Jan 2023 02:43:22 -0800 (PST)
Received: from goliat.wr25.org (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b003dc530186e1sm5573064wmo.45.2023.01.30.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 02:43:22 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 11:43:07 +0100
Message-Id: <20230130104308.483243-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wx/6oWjEZlZ4SgLT+AQbEtia2t3lOPcBKDtfWeUtTP0=;
 b=qbZwgWf+pVsfR2T+MtYa4k90oPkBfI+efLcCB3uoPvSk+9/e8nyRKmUwvcpcNGhg48
 fN048dDW7pnRPiiN0tB2ZG2wSk6UyNy9bnQYW4soKx0eKmxrA0VOVAmrWORFuShtfAxB
 A0LqfeRNQ3ZqHQYuS4TvSOugWCT9YGsJiEgUnuxYIRDSCA35esJnw7nAeKi5dhGrykec
 nLN6sIxwwtaKqLfrhOrj7v/bJBxVy/v5IsbTFLAHseRVqNx4KPnPjdDoW4ANMzAyqMJh
 NZDJ8Y2Mi72u7EwqoGDAq7f0monMx+LomDnKwZVmT2UfcZkneU1jzcqwQy/mhF9ZB5K2
 HiKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qbZwgWf+
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-kconfig.mk new
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
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
