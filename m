Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D077C53210
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 01:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 125B340144;
	Thu,  5 Jan 2023 01:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 125B340144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs0TYRTxpZ52; Thu,  5 Jan 2023 01:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B4F40121;
	Thu,  5 Jan 2023 01:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B4F40121
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D0C91BF21A
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 01:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5490D4190B
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 01:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5490D4190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEQW6dHPfVuB for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 01:59:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F07341871
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F07341871
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 01:59:21 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id c7so28935535qtw.8
 for <buildroot@buildroot.org>; Wed, 04 Jan 2023 17:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Th+6T3I/17xkQsLi0Eah3BGYTYTpBUdSpSY4sXnX0tI=;
 b=0L1AzfrP1TboKnmRDhOHJYyWjZfeK9dvIzulNPqEC7KrnARpxlxjoptbWRsnUqkFdz
 msy3vI7ITTTEb9nQkF5s6rzsyNJ3YKbbvH7ALlKnaSEFPn6X+dUHj/wjXupgFmVrKAXE
 uujx6UBhCmRS6WAkUy0PqgvkARgzdaiU5TxwYY80r15sLn1iTHLiXdhi5O5raab/B6vY
 DcNsa4zmlP23rl1yemaApdBWtuxy7V6MiQX4ezjvafdSfWCDFF4wwhgOScDTGWLY8HbV
 w+uEhuXB9gEqjRMtdXNNFGJo1O5lBQwRE/6BLyKQdT3a8Dh8K0CXEKZw0mCv3CvPEGtQ
 7rMQ==
X-Gm-Message-State: AFqh2krtDoEUXUKnl21pN7EtNVKIkN2a0ZXos04zQWOQ/W0RBUzSzpPS
 9LUdOgZB3wYjAhIcY5U125Bdp7Fo0dFd2Jhm1a8=
X-Google-Smtp-Source: AMrXdXvBqDYV5CTFWI72uaDEtNeY79ocba3RWKfdg8BN8Uw95VOs4VYoJ602LnJl/Ek+PNcd1DYOPA==
X-Received: by 2002:ac8:470e:0:b0:3a7:ea9e:566d with SMTP id
 f14-20020ac8470e000000b003a7ea9e566dmr55784466qtp.65.1672883959591; 
 Wed, 04 Jan 2023 17:59:19 -0800 (PST)
Received: from starry.com (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a05620a470700b006b61b2cb1d2sm25320224qkb.46.2023.01.04.17.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:59:18 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 20:57:59 -0500
Message-Id: <20230105015759.63582-2-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105015759.63582-1-nhed+buildroot@starry.com>
References: <20230105015759.63582-1-nhed+buildroot@starry.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Th+6T3I/17xkQsLi0Eah3BGYTYTpBUdSpSY4sXnX0tI=;
 b=qh3RG8uIgUXzXzBQHV/aMq+qmEMqEVTZhl8PQNXmrVTnidpQGAzzUjRUhk5/kxqS7K
 sxopxeWrHCwIyA9/7DWzl3UAmVPiZ8O6MVrSlyA4PPTWVlqOwDxrLOtjWN1xwfpEJUdb
 0LFRtiKsGjs6zEvOj8zPek2bTFatV7ose6n3c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=qh3RG8uI
Subject: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig seems to
 impact performance
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Nevo Hed <nhed+buildroot@starry.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Noticed a significant slowdown with rise of number of external trees
in our env.  This slowdown seemed to be related to invocations if the
percent_defconfig function (GNU Make 4.3).

While I have not do a deep dive in analyzing the performance issue, it
felt like redefining the %_defconfig rule N times impact performance.

This patch makes %_defconfig a single rule which combines uses the
first return of a wildcard expression.

Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external
trees:

    #Trees    Before    After
         1      0.38     0.37
         2      0.32     0.31
         3      0.31     0.33
         4      0.36     0.32
         5      0.45     0.35
         6      1.26     0.36
         7      9.10     0.36
         8     85.93     0.42

Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
---
 Makefile | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 88f90cd2fa..ad866f1f24 100644
--- a/Makefile
+++ b/Makefile
@@ -1013,13 +1013,14 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-define percent_defconfig
-# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
-		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
-endef
-$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
+	@defconfig=$(or \
+		$(firstword $(foreach d, \
+			$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/configs/$@))), \
+		$(error "Can't find $@") \
+	); \
+	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
+		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
 
 update-defconfig: savedefconfig
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
