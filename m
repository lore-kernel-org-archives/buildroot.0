Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4BCC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5119F84355;
	Sat, 17 Sep 2022 13:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5119F84355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JA3Cc5VGMdKZ; Sat, 17 Sep 2022 13:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C11784329;
	Sat, 17 Sep 2022 13:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C11784329
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE36A1BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E52D41D81
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E52D41D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU24jQcXGt7r for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:12:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9D741CC2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C9D741CC2
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:12:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g3so19254346wrq.13
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 06:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=uDfLyDsYYJY2GaNUYUB+cbObkGuL7YgPanQoLtuFGkQ=;
 b=rX9ctt0OMOu1URxeuC+UYLyFz0+DIJftlgt7uRT8pgD6FNhnGO1VIkY2JyJ6HhRFE9
 zKHYCyDl7ypT9vjoVYvqzz+I2CPc5oyxZwZgjj/fQxtJgH3b+xiYWjzLGMswg0YV4HTE
 xTb2Y8kwwl3BQicD7RtZETqkS032hyNfayFg+Tw+FHmQBZMoa/peH44EVAupR0BDId2d
 D6Lp+JocQ3E07OKZ7MSy2FCZBuRocOOz2fb6x9yxD4jkaaU2WJC8zfoGt6mAAgFnrNI9
 SjzUIo5hlX3FGqL9uUx9K0MBlAe5wUnT3j9PUsfBILL3Tz+UcK9yqqQuaELSXzaOdhg4
 Lg1A==
X-Gm-Message-State: ACrzQf2kJ/NTKZpkLx7CnQ0oUF6SD5QisuF3zOckLB0uGMDEpIumJaps
 RCrG7f1Y3azkFnfe8X7bT4mWAsKk3sQ=
X-Google-Smtp-Source: AMsMyM6jweolsWScmtnxs6dC6DOX6xJc48waDpBnc+whsRkteDWRv7mPzaVS0Ht8VPO7BglwMeJmSg==
X-Received: by 2002:adf:ed81:0:b0:226:a509:14b6 with SMTP id
 c1-20020adfed81000000b00226a50914b6mr5623834wro.150.1663420318996; 
 Sat, 17 Sep 2022 06:11:58 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8762:7a18:1c41:2137])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003a62052053csm7834452wmg.18.2022.09.17.06.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 06:11:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:11:56 +0200
Message-Id: <20220917131156.2692162-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=uDfLyDsYYJY2GaNUYUB+cbObkGuL7YgPanQoLtuFGkQ=;
 b=db/3lPxJBj8urAknkEWiCkJUp57jYuZWeyMC+0JGtPgAJyIU4WA3+GVC7ddIJp8Qxv
 W/bR8sReoMijjCHazRX5I4CLHe0VfCh8rO6xSnUiB5DcYFJY9FNy0bPvC0DpwBTvzR/4
 BrLaMYABYtb95brcFsDoJxPuzjF4rTfmzATBpy51aKBEalDxxGp/8XB8wfnhSRxKfgl4
 kW0soDZoRudKyhh/H9KDKomD+yyitCctHqf42RTJDNGayokmg0MziWvi0bXhU5qaHSxO
 NG2//RMhsC9Q7Vd177yWMx+/maJNmUozzl3rQyGBV18/mdQ/BtD/cHMFv4NZmjGQMPH+
 dF6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=db/3lPxJ
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
(which we do document in our manual), we need to memorise what defconfig
file we already created a rule for, and only create a rule for the
first-seen-in-reverse-order (aka the last one) defconfig.

Since some people appear to be bold enough (or insane enough?) to use
defconfig files that start with a dot, also handle those explictly.

Fixes: #14996

Reported-by: David Lawson <david.lawson1@tx.rr.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - keep comment
  - fix typo
---
 Makefile | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..12955f4151 100644
--- a/Makefile
+++ b/Makefile
@@ -1010,13 +1010,27 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
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
+# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the actual defconfig
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
