Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D3ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 07:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E250842C0;
	Sat, 17 Sep 2022 07:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E250842C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0yHCJeTTXPV; Sat, 17 Sep 2022 07:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ABBD83F23;
	Sat, 17 Sep 2022 07:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABBD83F23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F68B1BF841
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 07:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6803D41C92
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 07:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6803D41C92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GumjN92Xcdqs for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 07:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF5A41C8F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AF5A41C8F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 07:34:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h8so32394488wrf.3
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 00:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=FKQ709ZJ5pdFHg+UeYaz7ME/ObLzuJsyTBAATTfx/ks=;
 b=v8Yc+SkPR+rHZowjvxSpnWhFsAVOikb06KrN5oNuLnC+nZvQo90omGz0Wr+cnnQKLR
 b/LAeZygbj0vXEyUGsdo5+ibwgA2R8qewgjUdPpRWntwPIugxu6Gf1ojFHqH2jVf6XHc
 iN3Q/LIetj4r4wmciDlCoepvuG3RPOZuPCETBaqERYW8SeitiZJiMHw9cfWB1yN1Muar
 iNexpeLMD0ro6khjX6jlVGBp/Y9zaGFZgumtADoreyywCjuzcMZJEV0xbF5McjnW97DZ
 Np6hMCw9Dm5snHS94n3zBFpqaSAM5Fq46OWGU3owWUD+OGFJQcyV5HrnJ7q851Kl+Lnj
 mQGw==
X-Gm-Message-State: ACrzQf1zqdIuFm81KiKEbQ/VpjiqUyZHDHs2dxQI92EgyaKEbntSM/6H
 ZN49I8bwzkBYhA9H8JJuDCMhEb/rllQ=
X-Google-Smtp-Source: AMsMyM5lveDO+seWuREOoSO2suMsBwAXsMratsZ+Z4VY1yYfMdPYJQp3cGxIWhJHmEKzU62ZJJeKlg==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr5022943wrz.690.1663400087067; 
 Sat, 17 Sep 2022 00:34:47 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8762:7a18:1c41:2137])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b00228db6b9406sm8622125wrs.45.2022.09.17.00.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 00:34:46 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 09:34:45 +0200
Message-Id: <20220917073445.2536513-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=FKQ709ZJ5pdFHg+UeYaz7ME/ObLzuJsyTBAATTfx/ks=;
 b=mvRvf2gwL7T7U2X8CTQNFCV3Kx2CFFEycduJSX69CKLxajb3w/fvkOJzjNWO9KWrtt
 rnW0CeTEnBKzaDHh4yGQHsnIRzPiM48kjXQo5wiva8xFPG8B33gJmNx1SifwnH4R3Xik
 nOhPkPKA70xQGNJDpCstpa13ozqGZRPE36Z9IcSwQn0GU7HvU4/iJzsDC5qWRQ3YCuNM
 vQN4V4WqYLHfV2/bwKLksLrQPMAw/ymyy4cY9ds5yFxwyGVlOSQgHIjZglqcwPPZZmGF
 tM96NGhsO44WpYGXwJp86eKvHqLZ+PAFyxNZLk2kbsKPC5BhTw+4LmiYccJ7B5xHmlMG
 YO5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mvRvf2gw
Subject: [Buildroot] [PATCH] Makefile: fix use of many br2-external trees
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
Cc: David Lawson <david.lawson1@tx.rr.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The top level Makefile in buildroot has a recursive rule which causes
the appearance of a hang as the number of directories in BR2_EXTERNAL
increases. When the number of directories in BR2_EXTERNAL is small, the
recursion occurs, but make detects the recursion and determines the
target does not have to be remade. This allows make to progress.

This is the failing rule:

    define percent_defconfig
    # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
    %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
        @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
                $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
    endef
    $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))

The rule for %defconfig is created for each directory in BR2_EXTERNAL.
When the rule is matched, the stem is 'defconfig_name'. The second
prerequisite is expanded to $(1)/configs/defconfig_name_defconfig. The
rule, and all of the other rules defined by this macro, are invoked
again, but the stem is now $(1)/configs/defconfig_name_defconfig. The
second prerequisite is now expanded to
$(1)/configs/($1)/configs/defconfig_name_defconfig. This expansion
continues until make detects the infinite recursion.

With up to 5 br2-external trees, the time is very small, so that it is
not noticeable. But starting with 6 br2-external trees, the time is
insanely big (so much so that we did not even let it finish after it ran
for hours).

One of the rationale behind this code, is that we want the defconfig
files from br2-external trees further down the list, to override
defconfig files from those earlier in the list, even overriding the
defconfig files from Buildroot itself.

We fix that by only creating explicit rules for defconfig files.

To keep the promise that later defconfig files override previous ones
(which we do doucment in our manual), we need to memorise what defconfig
file we already created a rule for, and only create a rule for the
first-seen-in-reverse-order (aka the last one) defconfig.

Since some people appear to be bold enough (or insane enough?) to use
defconfig files that start with a dot, also handle those explictly.

Fixes: #14996

Reported-by: David Lawson <david.lawson1@tx.rr.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..d3b9aab00e 100644
--- a/Makefile
+++ b/Makefile
@@ -1010,13 +1010,26 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-define percent_defconfig
-# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
+ALL_DEFCONFIGS :=
+# $1: defconfig name with trailing _defconfig
+# $2: br2-external directory, without traiing /configs/
+define defconfig_rule
+ifeq ($$(filter $(2),$$(ALL_DEFCONFIGS)),)
+$(2): $$(BUILD_DIR)/buildroot-config/conf outputmakefile
+	$$(Q)$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
+ALL_DEFCONFIGS += $(2)
+endif
 endef
-$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
+$(eval \
+	$(foreach d, \
+		$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)), \
+		$(foreach c, \
+			$(wildcard $(d)/configs/*_defconfig $(d)/configs/.*_defconfig), \
+			$(call defconfig_rule,$(d),$(notdir $(c)))$(sep) \
+		) \
+	) \
+)
 
 update-defconfig: savedefconfig
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
