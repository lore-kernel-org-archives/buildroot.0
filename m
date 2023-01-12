Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785A7C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 227F260BD3;
	Thu, 12 Jan 2023 11:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227F260BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SujomeDsTN7D; Thu, 12 Jan 2023 11:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683CC60B77;
	Thu, 12 Jan 2023 11:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683CC60B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC5261BF35F
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97985405AE
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97985405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBAGzHHtpmwN for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 11:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2388440522
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2388440522
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 11:47:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d30so23133414lfv.8
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 03:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wx/6oWjEZlZ4SgLT+AQbEtia2t3lOPcBKDtfWeUtTP0=;
 b=0boOpmiiJHAbmD76e7c3rltuR2leqSgiek+PFrDwP2cX/3n+v/O8NlkJ0P+JQfJ8cp
 8j+KZRGDYfos+dyT8Rk0lMss89yK6pa9uHdA6SvXIdt7oBYS0kZxUpZGBqwNACClMVaf
 3kqG0r0RY08zrDkkiNfDS4FWB2gmcHtx1dDS4H98Yp3bUHQsaIlfCxRbI1Sr9Lxwgnxl
 cEmUKl8E8BPaU9TWTW4DRKkLk2YW/f4o8ex0EOCuLEJQezoW1Ztodv/FHwVEXn/TYsiY
 GFhd4jKBEofjbWpzVKWZ6JtNZqKeOaZGuObszZRjHik9hsme5emOj6cXGBcFpLNZoUCC
 lYUA==
X-Gm-Message-State: AFqh2kpzgdZGUyBMA7tFYM5jXQzoq2BQf0NmDT9mLH/Civ4+naNXYknW
 SNNYh3+AcgognUxn1KofsWSdXKuFZAM=
X-Google-Smtp-Source: AMrXdXs0HtH6Z5ZijWHp88I74HzAKfJJ3cveuN+KbmgHZBDdJO50EXIaNWTLCZi9oABwR+9H/UPYdw==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e64c:aec6 with SMTP id
 k3-20020a05651210c300b004b6e64caec6mr25939210lfg.63.1673524018640; 
 Thu, 12 Jan 2023 03:46:58 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 f19-20020ac25333000000b004cb2e3089a7sm3220844lfh.38.2023.01.12.03.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 03:46:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 12:47:54 +0100
Message-Id: <20230112114754.82405-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wx/6oWjEZlZ4SgLT+AQbEtia2t3lOPcBKDtfWeUtTP0=;
 b=O07GzM9IybWHghuv4sVUEe5DM+eVq/HdX1HGHG4sl3MJDvNfzpZNKxliicrfz9dmMP
 VIbNbB1D3Puata8Tn5R+m+iIKrLac3Fd40ZP1RRsBRfRtB7u3G10ld5b7Jcik3Itfd8W
 zxcBmAdJGW5gr8Wbrua2tM3QL9qHILGLapa540IzQldpumR8ORxZDiWIC7VkOG/UwkSG
 stwAiYLhSKdJ+gCSw/NURw0sdAuYv/Ut8vofHAUsZw57CVjm0CUFf0k6xiSRZk82dbmb
 7bkTjv5w5UDCQwXKr75WGKYzBNxBkRopjz+Mj8JJsXOClQw5mepo740Pq9ob+FCV3Y/5
 ycIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O07GzM9I
Subject: [Buildroot] [PATCH] package/pkg-kconfig.mk new <pkg>-show-fragment
 target
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
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
