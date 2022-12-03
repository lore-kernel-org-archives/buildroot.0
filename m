Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56387C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3B160777;
	Sat,  3 Dec 2022 17:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3B160777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSsPe9Xxc1un; Sat,  3 Dec 2022 17:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D538D606E6;
	Sat,  3 Dec 2022 17:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D538D606E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE901BF32E
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1729B606E6
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1729B606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeOl1FJuj-5l for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 17:24:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF0F60655
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AF0F60655
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 17:24:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u12so11574777wrr.11
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 09:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IBvSQoLVZA/FB/sjNvsHMy69shYISuwg7Pzu5OwSE9o=;
 b=RN7bAnRoslEu7jl8vO5Z0yPs4AsBh75K7ez5/Jf2dw1ky9B88Vze7vkCgtU7NmgP8/
 wVjtatBs+dRKFL4ITxHKGUY/4y9wdDKSM6qtV8+Cpz3/IML8KzUO7URgt5z7aTLvW3xk
 EZKIiW6bm20PoXTHT86cv7TokE7NySiV0AcLMNcpJZNj1yQbpTRuWQS+8JgBfCHCl1ex
 fI9G3jE/nMTdS5nf93NbcEVH5pfTFUYQFfluGK4slc3N968KILQivuwaE5wI0k5iYvRH
 vXSydH6maWk2ANtdHgwrxYnxwSNx461sknN6H4/yB+YybozKKXqQsdGS3fpM5VC/cUer
 a1Mg==
X-Gm-Message-State: ANoB5pmAi6zvEek3+5kgq1CrrpEi+hXt9CY04vZL3qbafA6Cyo/82rth
 09v+pbe15E7B3OAGcvQmfPJ6jPNzIaQ=
X-Google-Smtp-Source: AA0mqf6WKsbrNfTsBrdKaCvSePZ7CszMB8YFphSsraFyVJ/I0gs5xgXtROJL8Z8m0HFWEOQ8jCZBwQ==
X-Received: by 2002:adf:de86:0:b0:242:442c:8ea3 with SMTP id
 w6-20020adfde86000000b00242442c8ea3mr5009618wrl.380.1670088254794; 
 Sat, 03 Dec 2022 09:24:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003cf4eac8e80sm15097679wmq.23.2022.12.03.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 09:24:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 18:23:47 +0100
Message-Id: <20221203172347.331603-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IBvSQoLVZA/FB/sjNvsHMy69shYISuwg7Pzu5OwSE9o=;
 b=GaMbN3Y7z9l/fHciM8YA4MSGeJjCWVt4I1ICuzARlTqvIUJ62U8gsgyidMD5FFDkwo
 LIpb8L04ZJjzNX6TtiWaLpQt8xAOrlrQ99y0WJGEVtTOHjddYcaA6DtrE+C+ikOGM3y/
 QciJKBHrD38747wFuauImdmt8JNa/dYEsoL6IerFy/ntOXV5w6cQHO+NauCJKhw7aJsb
 F1bFp/sgRk4yXwm6waf6LsnItmLrYbJ2EGisVfdW1VEdM9q/ee7tfkINYZS7yE3qbNFn
 Hr9Xs0y1dgs/Crf5UwpqEocVHVe01w9ZP90+eoBp0sGAYnBjlj1ToffwE8neaMe/igUQ
 8/ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GaMbN3Y7
Subject: [Buildroot] [PATCH 1/1] package/rtl8723bu: add
 RTL8723BU_LINUX_CONFIG_FIXUPS
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failures raised since the addition of the
package in commit 80d22997334b0ad76f488913e1159b922804c579:

ERROR: modpost: "usb_alloc_urb" [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
ERROR: modpost: "usb_free_urb" [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!

[...]

ERROR: modpost: ".wiphy_apply_custom_regulatory" [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
ERROR: modpost: ".cfg80211_remain_on_channel_expired" [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/ab6482975befba0ad74bb7d91b37373b9b0f300e
 - http://autobuild.buildroot.org/results/7f3637760ad88d314e6812865f3667d1de091957

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl8723bu/rtl8723bu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 3da8d9cecf..9113a3ef0a 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -16,5 +16,13 @@ define RTL8723BU_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
 endef
 
+define RTL8723BU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
